/**
  ******************************************************************************
  * File Name          : command_manager.h
  * Description        : This file contains the common defines of the target application
  ******************************************************************************
  **/

#pragma once


#include "defines.h"

typedef enum {
	CMD_MGR_SUCCESS,
	CMD_MGR_QUEUE_IS_FULL,
	CMD_MGR_INVALID_TASK_STAGE,
	CMD_MGR_INVALID_POSITION,
	CMD_MGR_INVALID_PARAMS,
	CMD_MGR_LEG_IS_FIXED,
	CMD_MGR_GENERIC_ERROR,
} cmd_mgr_status_t;

typedef enum {
	TASK_BASIC_POSITION,
	TASK_CHANGE_HEIGHT,
	TASK_SET_RADIUS,
	TASK_TEMPORAL_TURN,
	TASK_FIXED_TURN,
	TASK_SET_RADIUS_FIXED_LEG,
	TASK_CHANGE_HEIGHT_FIXED_LEG,
	TASK_TURN_FIXED_LEG,
	TASK_RETURN_FIXED_LEG,
	TASK_WALK,
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

void cmd_mgr_abort_command(bool all, bool force);

bool cmd_mgr_is_idle(void);

