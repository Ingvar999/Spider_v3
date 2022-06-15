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
#include "drv_sensors.h"
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
static const int legs_layout[LEGS_COUNT] = {90, 30, -30, -90, -150, 150};
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

int pos_mgr_get_leg_layout(uint8_t leg_id)
{
	return legs_layout[leg_id];
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
  pos_mgr_status_t status = POS_MGR_SUCCESS;
	
  if ((radius >= MIN_RADIUS) && (SQR(L1 + L2) > (SQR(height) + SQR(radius))))
	{
    if (height < 0)
		{
			height += L2;
			double r = sqrt(SQR(radius) + SQR(height));
			if (r < L2)
			{
				status = POS_MGR_INVALID_LEG_POSITION;
			}
		}
  }
  else 
	{
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

static int get_min_legs_height()
{
	int res = legs_ctx[0].current_h;
	for (uint8_t leg_id = 1; leg_id < LEGS_COUNT; ++leg_id)
	{
		if (res > legs_ctx[leg_id].current_h)
		{
			res = legs_ctx[leg_id].current_h;
		}
	}
	return res;
}

static pos_mgr_status_t reach_surface(bool *reached, uint8_t start_leg, uint8_t inc)
{
	*reached = true;
	pos_mgr_status_t status = POS_MGR_SUCCESS;
	
	for (uint8_t leg_id = start_leg; leg_id < LEGS_COUNT && status == POS_MGR_SUCCESS; leg_id += inc)
	{
		if ((leg_id != fixed_leg_id) && !drv_sensors_is_leg_on_surface(leg_id))
		{
			status = pos_mgr_check_leg_position(legs_ctx[leg_id].current_h + LEG_FALLING_STEP, legs_ctx[leg_id].current_r);
			if (status == POS_MGR_SUCCESS)
			{
				pos_mgr_set_leg_position(leg_id, legs_ctx[leg_id].current_h + LEG_FALLING_STEP, CMD_PARAM_OMITTED, CMD_PARAM_OMITTED);
				*reached = false;
			}
		}
	}
	return status;
}

pos_mgr_status_t pos_mgr_reach_surface(bool *reached)
{
	pos_mgr_status_t status = reach_surface(reached, 0, 1);
	if (!*reached)
	{
		global_h = get_min_legs_height();
	}
	return status;
}

pos_mgr_status_t pos_mgr_fall_three_legs(uint8_t group, bool *reached)
{
	return reach_surface(reached, group % 2, 2);
}

pos_mgr_status_t pos_mgr_lift_three_legs(uint8_t group)
{
	pos_mgr_status_t status = POS_MGR_SUCCESS;
	
	group %= 2;
	
	for (uint8_t leg_id = group; leg_id < LEGS_COUNT && status == POS_MGR_SUCCESS; leg_id += 2)
	{
		if (leg_id != fixed_leg_id)
		{
			status = pos_mgr_check_leg_position(BASIC_HEIGHT, legs_ctx[leg_id].current_r);
		}
	}
	if (status == POS_MGR_SUCCESS){
		for (uint8_t leg_id = group; leg_id < LEGS_COUNT; leg_id += 2)
		{
			pos_mgr_set_leg_position(leg_id, BASIC_HEIGHT, CMD_PARAM_OMITTED, CMD_PARAM_OMITTED);
		}
	}
	return status;
}

pos_mgr_status_t pos_mgr_reset_global_height(void)
{
	pos_mgr_status_t status = POS_MGR_SUCCESS;
	
	for (uint8_t leg_id = 0; leg_id < LEGS_COUNT && status == POS_MGR_SUCCESS; ++leg_id)
	{
		if (leg_id != fixed_leg_id)
		{
			status = pos_mgr_check_leg_position(BASIC_HEIGHT, legs_ctx[leg_id].current_r);
		}
	}
	if (status == POS_MGR_SUCCESS){
		for (uint8_t leg_id = 0; leg_id < LEGS_COUNT; ++leg_id)
		{
			pos_mgr_set_leg_position(leg_id, BASIC_HEIGHT, CMD_PARAM_OMITTED, CMD_PARAM_OMITTED);
		}
		global_h = BASIC_HEIGHT;
	}

	return status;
}

pos_mgr_status_t pos_mgr_change_global_height(int h_delta)
{
	pos_mgr_status_t status = POS_MGR_SUCCESS;
	
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
		global_h += h_delta;
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
	double r = sqrt(r2);
	double f = acos((double)(p_leg->current_h) / r);
	uint8_t b = round((acos((double)(r2 + SQR(L1) - SQR(L2)) / (2 * r * L1)) + f) * ToGrad);
	uint8_t a = 180 - (uint8_t)round(acos((double)(SQR(L2) + SQR(L1) - r2) / (2 * L1 * L2)) * ToGrad);
		
	if ((a <= 180) && (b <= 180))
	{
		drv_servo_set((servo_id_t)(leg_servo_map[MOVING_SERVO_ID] + leg_id), a, force);
		drv_servo_set((servo_id_t)(leg_servo_map[CENTRAL_SERVO_ID] + leg_id), b, force);
		drv_servo_set((servo_id_t)(leg_servo_map[ROTATION_SERVO_ID] + leg_id), p_leg->rotation_angle, force);
	}
	else
	{
		LOG_ERR("Unreachable servo angle, leg: %d", leg_id);
	}
}
