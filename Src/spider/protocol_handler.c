/**
  ******************************************************************************
  * File Name          : protocol_handler.c
  * Description        : Main app specific body
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/

#include <stdlib.h>
#include "protocol_handler.h"
#include "debug_utils.h"
#include "defines.h"
#include "command_manager.h"
#include "position_manager.h"
#include "drv_uart.h"
#include "drv_esp.h"
#include "drv_gyro.h"
#include "drv_sensors.h"
#include "config.h"
#include "event_handler.h"

#define OUTPUT_BUFFER_SIZE				(128)
#define RESP_HEADER_SIZE					(4)
#define ADDITIONAL_BUFFER_SIZE		(OUTPUT_BUFFER_SIZE - RESP_HEADER_SIZE)

static char output_string[OUTPUT_BUFFER_SIZE];

static char *get_additional_info_buffer()
{
	return output_string + RESP_HEADER_SIZE;
}

static external_status_t process_action_request(char action, char request_id, int arg1, int arg2)
{
	external_status_t status = EXT_STATUS_OK;
	
	if (!is_spider_in_psm())
	{
		pending_task_ctx_t task;
		switch (action) 
		{
			case 'b':
				task.task_type = TASK_BASIC_POSITION;
			break;
			case 'h':
				task.task_type = TASK_CHANGE_HEIGHT;
			break;
			case 'r':
				task.task_type = TASK_SET_RADIUS;
			break;
			case 't':
				task.task_type = TASK_TEMPORAL_TURN;
			break;
			case 'f':
				task.task_type = TASK_FIXED_TURN;
			break;
			case '-':
				task.task_type = TASK_SET_RADIUS_FIXED_LEG;
			break;
			case '|':
				task.task_type = TASK_CHANGE_HEIGHT_FIXED_LEG;
			break;
			case ')':
				task.task_type = TASK_TURN_FIXED_LEG;
			break;
			case '+':
				task.task_type = TASK_RETURN_FIXED_LEG;
			break;
			case 'w':
				task.task_type = TASK_WALK;
			break;
			default:
				status = EXT_UNSUPPORTED_ACTION;
		}
		
		if (status == EXT_STATUS_OK)
		{
			task.arg_1 = arg1;
			task.arg_2 = arg2;
			task.task_id = request_id;
			if (cmd_mgr_add_task(&task) != CMD_MGR_SUCCESS)
			{
				status = EXT_QUEUE_IS_FULL;
			}
		}
	}
	else
	{
		status = EXT_SPIDER_IN_PSM;
	}
	
	return status;
}

static external_status_t set_bool(bool *dest, int val)
{
	if (val == CMD_PARAM_OMITTED)
	{
		*dest = !*dest;
	}
	else if ((val == 0) || (val == 1))
	{
		*dest = val ? true : false;
	}
	else
	{
		return EXT_INVALID_PARAMETERS;
	}
	return EXT_STATUS_OK;
}

static external_status_t process_set_request(char property, int arg1, int arg2)
{
	external_status_t status = EXT_STATUS_OK;

	switch (property) 
	{
		case 's':
			if ((arg1 != CMD_PARAM_OMITTED) && (arg1 >= 1) && (arg1 <= 10))
			{
				global_config.speed = arg1;
			}
			else
			{
				status = EXT_INVALID_PARAMETERS;
			}
		break;
		case 'w':
			status = set_bool(&global_config.workload_alignment_enable, arg1);
		break;
		case 'b':
			status = set_bool(&global_config.gyro_control_enable, arg1);
		break;
		case 'x':
			if (arg1 == CMD_PARAM_OMITTED)
			{
				pos_mgr_reset_fixed_leg();
			}
			else if ((arg1 >= 0) && (arg1 < 6))
			{
				pos_mgr_set_fixed_leg(arg1);
			}
			else
			{
				status = EXT_INVALID_PARAMETERS;
			}
		break;
		case 'p':
			if ((arg1 >= 0) && (arg1 < 30) && (arg2 >= -180) && (arg2 <= 180)) 
			{
      		global_config.position_v = arg1;
      		global_config.position_h = arg2;
      }
      else 
			{
      	status = EXT_INVALID_PARAMETERS;
      }
		break;
		case 'z':
			if ((arg1 == CMD_PARAM_OMITTED) || (arg1 == 0))
			{
				cmd_mgr_abort_command(false, false);
			}
			else if (arg1 == 1)
			{
				cmd_mgr_abort_command(true, false);
			}
			else
			{
				status = EXT_INVALID_PARAMETERS;
			}
		break;
		case 't':
			if (reset_config() != CFG_SUCCESS)
			{
				status = EXT_GENERIC_ERROR;
			}
		break;
		case 'y':
			if (persist_config() != CFG_SUCCESS)
			{
				status = EXT_GENERIC_ERROR;
			}
		break;
		case 'u':
			if (restore_config() != CFG_SUCCESS)
			{
				status = EXT_GENERIC_ERROR;
			}
		break;
		case 'i':
			if (arg1 == CMD_PARAM_OMITTED)
			{
				if (is_spider_in_psm())
				{
					if (!drv_sensors_is_critical_vcc())
					{
						handle_exit_psm();
					}
					else
					{
						status = EXT_CRITICAL_VCC;
					}
				}
				else
				{
					handle_enter_psm(false);
				}
			}
			else if (arg1 == 0)
			{
				handle_enter_psm(true);
			}
			else if (arg1 == 1)
			{
				if (!drv_sensors_is_critical_vcc())
				{
					handle_exit_psm();
				}
				else
				{
					status = EXT_CRITICAL_VCC;
				}
			}
			else
			{
				status = EXT_INVALID_PARAMETERS;
			}
		break;
		case 'f':
			if ((arg1 != CMD_PARAM_OMITTED) && (arg1 > 0) && (arg1 <= L1 + L2))
			{
				global_config.leg_lifting_height = arg1;
			}
			else
			{
				status = EXT_INVALID_PARAMETERS;
			}
		break;
		default:
			status = EXT_UNSUPPORTED_PROPERTY;
	}
	
	return status;
}

static external_status_t process_info_request(const char *property_list, int property_count, int *info_len)
{
	external_status_t status = EXT_STATUS_OK;
	char *buffer = get_additional_info_buffer();
	int len = 0;
	#define PUSH_INFO(...)			len += snprintf(buffer + len, ADDITIONAL_BUFFER_SIZE - len, __VA_ARGS__);
	
	for (int i = 0; (i < property_count) && (len < ADDITIONAL_BUFFER_SIZE); ++i)
	{
		switch (property_list[i]) 
		{
			case 's':
				PUSH_INFO("%d", global_config.speed);
			break;
			case 'p':
			{
				double horizontal, vertical;
				if (drv_gyro_get_position(&horizontal, &vertical) == GYRO_STATUS_SUCCESS)
				{
					PUSH_INFO("%f %f", horizontal, vertical);
				}
				else
				{
					PUSH_INFO("Unavailable");
				}
			}
			break;
			case 'w':
			{
				uint16_t workload[LEGS_COUNT];
				drv_sensors_get_legs_workload(workload);
				PUSH_INFO("%d %d %d %d %d %d", workload[0], workload[1], workload[2], workload[3], workload[4], workload[5]);
			}
			break;
			case 'h':
				PUSH_INFO("%d", pos_mgr_get_global_h());
			break;
			case 'r':
				PUSH_INFO("%d", pos_mgr_get_global_r());
			break;
			case 'v':
				PUSH_INFO("%d", drv_sensors_get_vcc());
			break;
			case 'i':
				PUSH_INFO("%d%d%d", global_config.gyro_control_enable, global_config.workload_alignment_enable, is_spider_in_psm());
			break;
			case 'q':
				PUSH_INFO("%d %d", global_config.position_v, global_config.position_h);
			break;
			case 'f':
				PUSH_INFO("%d", global_config.leg_lifting_height);
			break;
			default:
				PUSH_INFO("None");
		}
		buffer[len++] = '\n';
	}
	
	if (len >= ADDITIONAL_BUFFER_SIZE)
	{
		status = EXT_RESP_BUFFER_OVERFLOW;
	}
	*info_len = len;
	
	return status;
}

void protocol_handle(const char *input)
{
	int additional_info_len = 0;
	external_status_t status = EXT_GENERIC_ERROR;
  char request_type = REQUEST_TYPE_NONE;
  char request_id = REQUEST_ID_DEFAULT;
	uint32_t msg_len = strlen(input);
	
	ASSERT_IF(ASSERT_CODE_0F, input == NULL);

  if ((msg_len >= 3) && (msg_len <= 15)) {
    request_id = input[0];
    if (((request_id >= 'A') && (request_id <= 'Z')) ||
			  ((request_id >= '5') && (request_id <= '9'))){
      request_type = input[1];
      switch (request_type) {
        case REQUEST_TYPE_INFO:
          status = process_info_request(input + 2, msg_len - 2, &additional_info_len);
          break;
        case REQUEST_TYPE_ACTION: case REQUEST_TYPE_SET:
					{
          int arg1 = CMD_PARAM_OMITTED, arg2 = CMD_PARAM_OMITTED;
					status = EXT_STATUS_OK;
          if (msg_len > 3) 
					{
            char *space_pos = strchr(input, ' ');
						arg1 = atoi(input + 3);
						if ((input[3] != '0') && (arg1 == 0))
						{
							status = EXT_INVALID_PARAMETERS;
						}
						else if (space_pos != NULL) 
						{
              arg2 = atoi(space_pos + 1);
							if ((space_pos[1] != '0') && (arg2 == 0))
							{
								status = EXT_INVALID_PARAMETERS;
							}
            }
          }
					
					if (status == EXT_STATUS_OK)
					{
						if (request_type == REQUEST_TYPE_ACTION)
						{
							status = process_action_request(input[2], request_id, arg1, arg2);
						}
						else // request type SET
						{
							status = process_set_request(input[2], arg1, arg2);
						}
					}
          }
          break;
        default:
          status = EXT_UNSUPPORTED_REQUEST_TYPE;
          break;
      }
    }
    else 
		{
      request_id = REQUEST_ID_DEFAULT;
      status = EXT_BAD_REQUEST;
    }
  }
  else 
	{
    status = EXT_BAD_REQUEST;
  }
	
  protocol_send_response(request_id, status, additional_info_len);
}

void protocol_send_response(char response_id, external_status_t status, int additional_info_len)
{
	if (RESP_HEADER_SIZE + additional_info_len > OUTPUT_BUFFER_SIZE)
	{
		LOG_ERR("Protocol resp buffer overflow");
	}
	else
	{
		if (response_id != REQUEST_ID_INTERNAL)
		{
			output_string[0] = response_id;
			output_string[1] = '0' + (status / 10);
			output_string[2] = '0' + (status % 10);
			output_string[3] = '\n';
			
			if ((response_id >= '5') && (response_id <= '9'))
			{
				drv_uart_transfer(UART_ID_HOST, (uint8_t*)output_string, RESP_HEADER_SIZE + additional_info_len);
			}
			else
			{
				drv_esp_send(output_string, RESP_HEADER_SIZE + additional_info_len);
			}
		}
	}
}
