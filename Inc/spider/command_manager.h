/**
  ******************************************************************************
  * File Name          : command_manager.h
  * Description        : This file contains the common defines of the target application
  ******************************************************************************
  **/

#pragma once

typedef enum {
	CMD_MGR_SUCCESS,
	CMD_MGR_QUEUE_IS_FULL,
	CMD_MGR_INVALID_TASK_STAGE,
	CMD_MGR_INVALID_POSITION,
	CMD_MGR_INVALID_PARAMS,
	CMD_MGR_GENERIC_ERROR,
} cmd_mgr_status_t;

typedef enum {
	TASK_CHANGE_HEIGHT,
	TASK_TYPE_LAST,
} task_type_t;

typedef struct {
	task_type_t task_type;
	int arg_1;
	int arg_2;
	char task_id;
} pending_task_ctx_t;

cmd_mgr_status_t cmd_mgr_init(void);

cmd_mgr_status_t cmd_mgr_add_task(pending_task_ctx_t *task_ctx);

cmd_mgr_status_t cmd_mgr_process(void);

