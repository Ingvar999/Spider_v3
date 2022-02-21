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
} active_task_ctx_t;

typedef cmd_mgr_status_t (*task_handler_t)(int arg1, int arg2, int arg3);

static xQueueHandle task_queue;
static active_task_ctx_t _tasks_ctx[MAX_TASK_NESTING];
static active_task_ctx_t *task_ctx;

static cmd_mgr_status_t change_height_handler(int height, int arg_2, int arg_3);

static const task_handler_t task_handlers[TASK_TYPE_LAST] = {
	change_height_handler
};

cmd_mgr_status_t cmd_mgr_init(void)
{
	cmd_mgr_status_t status = CMD_MGR_GENERIC_ERROR;
	
	task_ctx = _tasks_ctx;
	task_ctx->task_stage = TASK_STAGE_IDLE;
	task_queue = xQueueCreate(CMD_QUEUE_SIZE, sizeof(pending_task_ctx_t));
	if (task_queue != NULL){
		status = CMD_MGR_SUCCESS;
	}
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

cmd_mgr_status_t cmd_mgr_process(void)
{
	cmd_mgr_status_t status = CMD_MGR_SUCCESS;
	
	if (task_ctx->task_stage == TASK_STAGE_IDLE)
	{
		pending_task_ctx_t task;
		if (xQueueReceive(task_queue, (void *)&task, (TickType_t)0) == pdTRUE)
		{
			task_ctx->task_stage = TASK_STAGE_1;
			task_ctx->task_type = task.task_type;
			status = task_handlers[task_ctx->task_type](task.arg_1, task.arg_2, task.arg_3);
			if (status != CMD_MGR_SUCCESS){
				task_ctx->task_stage = TASK_STAGE_IDLE;
			}
		}
	}
	else
	{
		status = task_handlers[task_ctx->task_type](0, 0, 0);
		if (status != CMD_MGR_SUCCESS){
		  task_ctx->task_stage = TASK_STAGE_IDLE;
		}
	}
	return status;
}

static cmd_mgr_status_t change_height_handler(int h_delta, int arg_2, int arg_3)
{
	cmd_mgr_status_t status = CMD_MGR_SUCCESS;

	switch (task_ctx->task_stage){
		case TASK_STAGE_1:{
			if ((h_delta > -(L1 + L2)) && (h_delta < L1 + L2)){
				/*bool reached = true;
				if (!on_surface) {
					status = ReachGround(&reached);
					Height = MinHeight();
				}
				else {
					status = STATUS_OK;
				}*/

				if (status == CMD_MGR_SUCCESS){
					pos_mgr_status_t sub_status = pos_mgr_change_global_height(h_delta);
					if (sub_status == POS_MGR_SUCCESS){
						task_ctx->task_stage = TASK_STAGE_IDLE;
					}
					else if (sub_status == POS_MGR_INVALID_LEG_POSITION){
						status = CMD_MGR_INVALID_POSITION;
					}
					else {
						status = CMD_MGR_GENERIC_ERROR;
					}
				}
			}
			else{
				status = CMD_MGR_INVALID_PARAMS;
			}
		}
		break;
		default:
		status = CMD_MGR_INVALID_TASK_STAGE;
		break;
	}
	return status;
}
