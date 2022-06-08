/**
  ******************************************************************************
  * File Name          : position_manager.c
  * Description        : Main app specific body
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <math.h>
#include "position_manager.h"
#include "debug_utils.h"
#include "drv_servo.h"
#include "defines.h"

typedef enum {
	CENTRAL_SERVO_ID,
	MOVING_SERVO_ID,
	ROTATION_SERVO_ID,
	LEG_SERVO_ID_LAST
} leg_servo_id_t;

typedef struct {

	int current_h;
	int current_r;
	int rotation_angle;
} leg_ctx_t;

static uint8_t fixed_leg_id = LEGS_COUNT;
static leg_ctx_t legs_ctx[LEGS_COUNT];
static int global_h, global_r;
static const int legs_layout[LEGS_COUNT] = {0, 60, 120, 180, -120, -60};
static const servo_id_t leg_servo_map[LEG_SERVO_ID_LAST] = {SERVO_ID_CENTRAL_0, SERVO_ID_MOVING_0, SERVO_ID_ROTATION_0};

static void pos_mgr_apply_leg_position(uint8_t leg_id, bool force);

int pos_mgr_get_global_h(void)
{
	return global_h;
}
int pos_mgr_get_global_r(void)
{
	return global_r;
}
int pos_mgr_get_leg_h(uint8_t leg_id)
{
	return legs_ctx[leg_id].current_h;
}
int pos_mgr_get_leg_r(uint8_t leg_id)
{
	return legs_ctx[leg_id].current_r;
}

void pos_mgr_set_fixed_leg(uint8_t leg_id)
{
	fixed_leg_id = leg_id;
}
void pos_mgr_reset_fixed_leg(void)
{
	fixed_leg_id = LEGS_COUNT;
}

bool pos_mgr_is_leg_fixed(void)
{
	return fixed_leg_id != LEGS_COUNT;
}

pos_mgr_status_t pos_mgr_set_init_state()
{
	global_h = BASIC_HEIGHT;
	global_r = BASIC_RADIUS;
	
	for (uint8_t leg_id = 0; leg_id < LEGS_COUNT; ++leg_id)
	{
		legs_ctx[leg_id].current_h = global_h;
		legs_ctx[leg_id].current_r = global_r;
		legs_ctx[leg_id].rotation_angle = 90;
		
		pos_mgr_apply_leg_position(leg_id, true);
	}
	return POS_MGR_SUCCESS;
}

pos_mgr_status_t pos_mgr_check_leg_position(int height, int radius)
{
  pos_mgr_status_t status;
	
  if ((height >= 0) && (radius >= MIN_RADIUS) && (SQR(L1 + L2) > (SQR(height) + SQR(radius)))){
    status = POS_MGR_SUCCESS;
  }
  else {
    status = POS_MGR_INVALID_LEG_POSITION;
  }

  return status;
}

void pos_mgr_set_leg_position(uint8_t leg_id, int height, int radius, int rotation)
{
	if (leg_id != fixed_leg_id)
	{
		if (height != CMD_PARAM_OMITTED)
		{
			legs_ctx[leg_id].current_h = height;
		}
		if (radius != CMD_PARAM_OMITTED)
		{
			legs_ctx[leg_id].current_r = radius;
		}
		if (rotation != CMD_PARAM_OMITTED)
		{
			legs_ctx[leg_id].rotation_angle = rotation;
		}
		pos_mgr_apply_leg_position(leg_id, false);
	}
}

pos_mgr_status_t pos_mgr_set_global_height(int height)
{
	pos_mgr_status_t status = POS_MGR_SUCCESS;
	
	if (height != BASIC_HEIGHT)
	{
		int h_delta = height - global_h;
		for (uint8_t leg_id = 0; leg_id < LEGS_COUNT && status == POS_MGR_SUCCESS; ++leg_id)
		{
			if (leg_id != fixed_leg_id)
			{
				status = pos_mgr_check_leg_position(legs_ctx[leg_id].current_h + h_delta, legs_ctx[leg_id].current_r);
			}
		}
		if (status == POS_MGR_SUCCESS){
			for (uint8_t leg_id = 0; leg_id < LEGS_COUNT; ++leg_id)
			{
				pos_mgr_set_leg_position(leg_id, legs_ctx[leg_id].current_h + h_delta, CMD_PARAM_OMITTED, CMD_PARAM_OMITTED);
			}
			global_h = height;
		}
	}
	else
	{
		for (uint8_t leg_id = 0; leg_id < LEGS_COUNT; ++leg_id)
		{
			pos_mgr_set_leg_position(leg_id, height, CMD_PARAM_OMITTED, CMD_PARAM_OMITTED);
		}
		global_h = height;
	}
	return status;
}

pos_mgr_status_t pos_mgr_set_global_radius(int radius, bool force)
{
	pos_mgr_status_t status = POS_MGR_SUCCESS;
	
	if (force)
	{
		for (uint8_t leg_id = 0; leg_id < LEGS_COUNT && status == POS_MGR_SUCCESS; ++leg_id)
		{
			if (leg_id != fixed_leg_id)
			{
				status = pos_mgr_check_leg_position(legs_ctx[leg_id].current_h, radius);
			}
		}
		if (status == POS_MGR_SUCCESS){
			for (uint8_t leg_id = 0; leg_id < LEGS_COUNT; ++leg_id)
			{
				pos_mgr_set_leg_position(leg_id, CMD_PARAM_OMITTED, radius, CMD_PARAM_OMITTED);
			}
			global_r = radius;
		}
	}
	else
	{
		global_r = radius;
	}
	return status;
}

static void pos_mgr_apply_leg_position(uint8_t leg_id, bool force)
{
	leg_ctx_t *p_leg = &legs_ctx[leg_id];
  int r2 = SQR(p_leg->current_h) + SQR(p_leg->current_r);
	drv_servo_set((servo_id_t)(leg_servo_map[MOVING_SERVO_ID] + leg_id), 
								180 - (uint8_t)round(acos((double)(SQR(L2) + SQR(L1) - r2) / (2 * L1 * L2)) * ToGrad), force);
	drv_servo_set((servo_id_t)(leg_servo_map[CENTRAL_SERVO_ID] + leg_id), 
								(uint8_t)round((acos((double)(p_leg->current_h) / sqrt(r2)) + acos((double)(r2 + SQR(L1) - SQR(L2)) / (2 * sqrt(r2) * L1))) * ToGrad), force);
	drv_servo_set((servo_id_t)(leg_servo_map[ROTATION_SERVO_ID] + leg_id), p_leg->rotation_angle, force);
}
