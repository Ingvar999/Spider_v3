/**
  ******************************************************************************
  * File Name          : command_manager.c
  * Description        : Main app specific body
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "command_manager.h"
#include "debug_utils.h"
#include "position_manager.h"
#include "defines.h"
#include "FreeRTOS.h"
#include "queue.h"
#include "protocol_handler.h"
#include "drv_sensors.h"
#include "drv_servo.h"
#include "services.h"

#pragma anon_unions

#define CMD_QUEUE_SIZE						(4)
#define MAX_TASK_NESTING					(3)

typedef enum {
	TASK_STAGE_IDLE = 0,
	TASK_STAGE_1,
	TASK_STAGE_2,
	TASK_STAGE_3,
	TASK_STAGE_4,
	TASK_STAGE_5,
	TASK_STAGE_6
} task_stage_t;

typedef struct {
	task_stage_t task_stage;
	task_type_t task_type;
	union {
		struct {
			int h_delta;
		} change_height;
		struct {
			int radius;
			uint8_t legs_group;
		} set_radius;
	};
} active_task_ctx_t;

typedef cmd_mgr_status_t (*task_handler_t)(int arg1, int arg2);

static xQueueHandle task_queue;
static active_task_ctx_t _tasks_ctx[MAX_TASK_NESTING];
static active_task_ctx_t *task_ctx;
static char active_task_id;

static cmd_mgr_status_t basic_position_handler(int h_delta, int arg_2);
static cmd_mgr_status_t change_height_handler(int h_delta, int arg_2);
static cmd_mgr_status_t set_radius_handler(int height, int arg_2);

static const task_handler_t task_handlers[TASK_TYPE_LAST] = {
	basic_position_handler,
	change_height_handler,
	set_radius_handler
};

cmd_mgr_status_t cmd_mgr_init(void)
{
	cmd_mgr_status_t status = CMD_MGR_SUCCESS;
	
	task_ctx = _tasks_ctx;
	task_ctx->task_stage = TASK_STAGE_IDLE;
	task_queue = xQueueCreate(CMD_QUEUE_SIZE, sizeof(pending_task_ctx_t));
	ASSERT_IF(ASSERT_CODE_08, task_queue == NULL);
	
	return status;
}

cmd_mgr_status_t cmd_mgr_add_task(pending_task_ctx_t *task_ctx)
{
	cmd_mgr_status_t status = CMD_MGR_GENERIC_ERROR;
	
	BaseType_t q_status = xQueueSend(task_queue, (void *)task_ctx, (TickType_t)0);
	if (q_status == pdPASS) {
		status = CMD_MGR_SUCCESS;
	}
	else if (q_status == errQUEUE_FULL){
		status = CMD_MGR_QUEUE_IS_FULL;
	}
	return status;
}

static void send_cmd_complition(cmd_mgr_status_t status)
{
	external_status_t ext_status;
	switch (status)
	{
		case CMD_MGR_SUCCESS:
			ext_status = EXT_STATUS_OK;
		break;
		case CMD_MGR_INVALID_PARAMS:
			ext_status = EXT_INVALID_PARAMETERS;
		break;
		case CMD_MGR_INVALID_POSITION:
			ext_status = EXT_INVALID_POSITION;
		break;
		default:
			LOG_ERR("Task completion status %d", status);
			ext_status = EXT_GENERIC_ERROR;
	}
	protocol_send_response(active_task_id, ext_status, 0);
}

cmd_mgr_status_t cmd_mgr_process(void)
{
	cmd_mgr_status_t status = CMD_MGR_SUCCESS;
	bool task_executed = false;
	
	ASSERT_IF(ASSERT_CODE_06, task_ctx < _tasks_ctx);
	ASSERT_IF(ASSERT_CODE_07, task_ctx > (_tasks_ctx + MAX_TASK_NESTING - 1));
	
	if (task_ctx->task_stage == TASK_STAGE_IDLE)
	{
		pending_task_ctx_t task;
		if (xQueueReceive(task_queue, (void *)&task, (TickType_t)0) == pdTRUE)
		{
			task_ctx->task_stage = TASK_STAGE_1;
			task_ctx->task_type = task.task_type;
			active_task_id = task.task_id;
			allow_position_control(false);
			status = task_handlers[task_ctx->task_type](task.arg_1, task.arg_2);
			task_executed = true;
		}
	}
	else
	{
		status = task_handlers[task_ctx->task_type](0, 0);
		task_executed = true;
	}
	
	if (task_executed)
	{
		if (status != CMD_MGR_SUCCESS){
		  task_ctx->task_stage = TASK_STAGE_IDLE;
		}
		if (task_ctx->task_stage == TASK_STAGE_IDLE)
		{
			allow_position_control(true);
			send_cmd_complition(status);
		}
	}
	return status;
}
static cmd_mgr_status_t basic_position_handler(int arg_1, int arg_2)
{
	cmd_mgr_status_t status = CMD_MGR_SUCCESS;
	
	ASSERT_IF(ASSERT_CODE_10, task_ctx->task_type != TASK_BASIC_POSITION);
	
	switch (task_ctx->task_stage){
		case TASK_STAGE_1:
			pos_mgr_reset_fixed_leg();
			if (pos_mgr_reset_global_height() == POS_MGR_SUCCESS)
			{
				task_ctx->task_stage = TASK_STAGE_2;
			}
			else
			{
				LOG_WARN("Force basic position");
				pos_mgr_set_init_state();
				task_ctx->task_stage = TASK_STAGE_IDLE;
			}
		break;
		case TASK_STAGE_2:
			if (pos_mgr_set_global_radius(BASIC_RADIUS, true) == POS_MGR_SUCCESS)
			{
				task_ctx->task_stage = TASK_STAGE_3;
			}
			else
			{
				LOG_WARN("Force basic position");
				pos_mgr_set_init_state();
				task_ctx->task_stage = TASK_STAGE_IDLE;
			}
		break;
		case TASK_STAGE_3:
		{
			for (int i = 0; i < LEGS_COUNT; ++i)
			{
				pos_mgr_set_leg_position(i, CMD_PARAM_OMITTED, CMD_PARAM_OMITTED, 90);
			}
			task_ctx->task_stage = TASK_STAGE_IDLE;
		}
		break;
		default:
		status = CMD_MGR_INVALID_TASK_STAGE;
		break;
	}
	return status;
}

static cmd_mgr_status_t change_height_handler(int h_delta, int arg_2)
{
	cmd_mgr_status_t status = CMD_MGR_SUCCESS;
	pos_mgr_status_t sub_status;
	
	ASSERT_IF(ASSERT_CODE_11, task_ctx->task_type != TASK_CHANGE_HEIGHT);

	switch (task_ctx->task_stage){
		case TASK_STAGE_1:
			if ((h_delta != CMD_PARAM_OMITTED) && (h_delta > -(L1 + L2)) && (h_delta < L1 + L2))
			{
				task_ctx->change_height.h_delta = h_delta;
				task_ctx->task_stage = TASK_STAGE_2;
			}
			else
			{
				status = CMD_MGR_INVALID_PARAMS;
				break;
			}
		case TASK_STAGE_2:
		{
			bool reached = true;
			if (task_ctx->change_height.h_delta > 0)
			{
				drv_servo_set_accel_mode(NO_ACCELERATION);
				sub_status = pos_mgr_reach_surface(&reached);
				if (sub_status != POS_MGR_SUCCESS)
				{
					status = CMD_MGR_INVALID_POSITION;
				}
				
			}
			if (reached && (status == CMD_MGR_SUCCESS))
			{
				drv_servo_set_accel_mode(FADING_SPEED);
				sub_status = pos_mgr_change_global_height(task_ctx->change_height.h_delta);
				if (sub_status == POS_MGR_SUCCESS)
				{
					task_ctx->task_stage = TASK_STAGE_IDLE;
				}
				else
				{
					status = CMD_MGR_INVALID_POSITION;
				}
			}			
		}			
		break;
		default:
		status = CMD_MGR_INVALID_TASK_STAGE;
		break;
	}
	return status;
}

static cmd_mgr_status_t set_radius_handler(int radius, int arg_2)
{
	cmd_mgr_status_t status = CMD_MGR_SUCCESS;
	
	ASSERT_IF(ASSERT_CODE_12, task_ctx->task_type != TASK_SET_RADIUS);
	
	switch (task_ctx->task_stage){
		case TASK_STAGE_1:
			if ((radius != CMD_PARAM_OMITTED) && (radius >= MIN_RADIUS) && (radius < L1 + L2))
			{
				if (drv_sensors_is_spider_on_surface())
				{
					if (pos_mgr_is_leg_fixed())
					{
						status = CMD_MGR_LEG_IS_FIXED;
					}
					else
					{
						task_ctx->set_radius.radius = radius;
						task_ctx->set_radius.legs_group = 0;
						pos_mgr_status_t sub_status = POS_MGR_SUCCESS;
						for (uint8_t leg_id = 0; leg_id < LEGS_COUNT && sub_status == POS_MGR_SUCCESS; ++leg_id)
						{
							sub_status = pos_mgr_check_leg_position(pos_mgr_get_leg_h(leg_id) - LEG_LIFTING_HEIGHT, pos_mgr_get_leg_r(leg_id));
						}
						if (sub_status == POS_MGR_SUCCESS)
						{
							task_ctx->task_stage = TASK_STAGE_3;
						}
						else
						{
							++task_ctx;
							task_ctx->task_type = TASK_CHANGE_HEIGHT;
							task_ctx->task_stage = TASK_STAGE_1;
							status = change_height_handler(LEG_LIFTING_HEIGHT - pos_mgr_get_global_h(), CMD_PARAM_OMITTED);
							bool done = task_ctx->task_stage == TASK_STAGE_IDLE;
							--task_ctx;
							
							task_ctx->task_stage = done ? TASK_STAGE_3 : TASK_STAGE_2;
						}
					}
				}
				else
				{
					pos_mgr_status_t sub_status = pos_mgr_set_global_radius(radius, true);
					if (sub_status == POS_MGR_SUCCESS)
					{
						task_ctx->task_stage = TASK_STAGE_IDLE;
					}
					else
					{
						status = CMD_MGR_INVALID_POSITION;
					}
				}
			}
			else
			{
				status = CMD_MGR_INVALID_PARAMS;
			}
		break;
		case TASK_STAGE_2: // Wait Change Height is done
		{
			++task_ctx;
			status = change_height_handler(0, 0);
			bool done = task_ctx->task_stage == TASK_STAGE_IDLE;
			--task_ctx;
			if (done)
			{
				task_ctx->task_stage = TASK_STAGE_3;
			}
		}
		break;
		case TASK_STAGE_3: // Lift three legs
			if (pos_mgr_lift_three_legs(task_ctx->set_radius.legs_group) == POS_MGR_SUCCESS)
			{
				task_ctx->task_stage = TASK_STAGE_4;
			}
			else
			{
				status = CMD_MGR_INVALID_POSITION;
			}
		break;
		case TASK_STAGE_4: // Set radius of three legs
			for (uint8_t leg_id = task_ctx->set_radius.legs_group; leg_id < LEGS_COUNT && status == CMD_MGR_SUCCESS; leg_id += 2)
			{
				if (pos_mgr_check_leg_position(pos_mgr_get_leg_h(leg_id), task_ctx->set_radius.radius) == POS_MGR_SUCCESS)
				{
					pos_mgr_set_leg_position(leg_id, CMD_PARAM_OMITTED, task_ctx->set_radius.radius, CMD_PARAM_OMITTED);
				}
				else
				{
					status = CMD_MGR_INVALID_POSITION;
				}
			}
			task_ctx->task_stage = TASK_STAGE_5;
		break;
		case TASK_STAGE_5: // Fall three legs
		{
			bool done;
			if (pos_mgr_fall_three_legs(task_ctx->set_radius.legs_group, &done) == POS_MGR_SUCCESS)
			{
				if (done)
				{
					if (task_ctx->set_radius.legs_group == 1)
					{
						pos_mgr_set_global_radius(task_ctx->set_radius.radius, false);
						task_ctx->task_stage = TASK_STAGE_IDLE;
					}
					else
					{
						task_ctx->set_radius.legs_group = 1;
						task_ctx->task_stage = TASK_STAGE_3;
					}
				}
			}
			else
			{
				status = CMD_MGR_INVALID_POSITION;
			}
		}
		break;
		default:
		status = CMD_MGR_INVALID_TASK_STAGE;
		break;
	}
	return status;
}
