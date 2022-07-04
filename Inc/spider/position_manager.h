/**
  ******************************************************************************
  * File Name          : position_manager.h
  * Description        : This file contains the common defines of the target application
  ******************************************************************************
  **/

#pragma once

#include "defines.h"

#define MIN_RADIUS							(15)
#define DEFAULT_HEIGHT					(35)
#define DEFAULT_RADIUS					(35)
#define BASIC_HEIGHT						(-3)
#define BASIC_RADIUS						(20)
#define LEG_FALLING_STEP				(4)
#define MAX_TEMP_TURN_ANGLE			(22)
#define MAX_TURN_ANGLE					(10)
#define STEP_LENGTH							(25)
#define REST_BETWEEN_STEPS			(300)

typedef enum {
	POS_MGR_SUCCESS,
	POS_MGR_INVALID_LEG_POSITION,
	POS_MGR_GENERIC_ERROR,
} pos_mgr_status_t;

int pos_mgr_get_global_h(void);
int pos_mgr_get_global_r(void);
int pos_mgr_get_leg_h(uint8_t leg_id);
int pos_mgr_get_leg_r(uint8_t leg_id);
int pos_mgr_get_max_legs_height(void);

void pos_mgr_set_fixed_leg(uint8_t leg_id);
void pos_mgr_reset_fixed_leg(void);
bool pos_mgr_is_leg_fixed(void);

int pos_mgr_get_leg_layout(uint8_t leg_id);

pos_mgr_status_t pos_mgr_set_init_state(void);

pos_mgr_status_t pos_mgr_check_leg_position(int height, int radius);
void pos_mgr_set_leg_position(uint8_t leg_id, int height, int radius, int rotation);
pos_mgr_status_t pos_mgr_set_fixed_leg_position(int h_delta, int radius, int rotation);
void pos_mgr_return_fixed_leg(void);
pos_mgr_status_t pos_mgr_fall_fixed_leg(bool *reached);

pos_mgr_status_t pos_mgr_reach_surface(bool *reached);
pos_mgr_status_t pos_mgr_set_global_radius(int radius, bool force);
pos_mgr_status_t pos_mgr_change_global_height(int h_delta);
pos_mgr_status_t pos_mgr_reset_global_height(void);

pos_mgr_status_t pos_mgr_fall_three_legs(uint8_t group, bool *reached);
pos_mgr_status_t pos_mgr_lift_three_legs(uint8_t group);

pos_mgr_status_t pos_mgr_prepare_leg_step(uint8_t leg_id, int direction, uint16_t* new_r, uint16_t* turn_angle);
