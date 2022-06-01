/**
  ******************************************************************************
  * File Name          : position_manager.h
  * Description        : This file contains the common defines of the target application
  ******************************************************************************
  **/

#pragma once

#include "defines.h"

#define LEGS_COUNT					(6)
#define DEFAULT_HEIGHT			(40)
#define DEFAULT_RADIUS			(50)
#define BASIC_HEIGHT				(0)
#define BASIC_RADIUS				(15)
#define MIN_RADIUS					(20)

typedef enum {
	POS_MGR_SUCCESS,
	POS_MGR_INVALID_LEG_POSITION,
	POS_MGR_GENERIC_ERROR,
} pos_mgr_status_t;

pos_mgr_status_t pos_mgr_set_init_state(bool_t force);

pos_mgr_status_t pos_mgr_change_global_height(int h_delta);
