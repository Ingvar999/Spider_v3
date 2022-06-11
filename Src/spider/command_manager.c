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
			pos_mgr_set_global_height(BASIC_HEIGHT);
			task_ctx->task_stage = TASK_STAGE_2;
		break;
		case TASK_STAGE_2:
			pos_mgr_set_global_radius(BASIC_RADIUS, true);
			task_ctx->task_stage = TASK_STAGE_3;
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
			if ((h_delta > -(L1 + L2)) && (h_delta < L1 + L2))
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
				sub_status = pos_mgr_reach_surface(&reached);
				if (sub_status != POS_MGR_SUCCESS)
				{
					status = CMD_MGR_INVALID_POSITION;
				}
				
			}
			if (reached && (status == CMD_MGR_SUCCESS))
			{
				sub_status = pos_mgr_set_global_height(pos_mgr_get_global_h() + task_ctx->change_height.h_delta);
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
			if (drv_sensors_is_spider_on_surface())
			{
				if (pos_mgr_is_leg_fixed())
				{
					status = CMD_MGR_LEG_IS_FIXED;
				}
				else
				{
					TODO("Set Radius on surface");
					task_ctx->task_stage = TASK_STAGE_IDLE;
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
		break;
		default:
		status = CMD_MGR_INVALID_TASK_STAGE;
		break;
	}
	return status;
}
