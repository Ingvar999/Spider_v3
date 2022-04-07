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
	uint8_t servo_pos[LEG_SERVO_ID_LAST];
	uint8_t target_pos[LEG_SERVO_ID_LAST];
	double speed_accum[LEG_SERVO_ID_LAST];
} leg_ctx_t;

static uint8_t fixed_leg_id = LEGS_COUNT;
static leg_ctx_t legs_ctx[LEGS_COUNT];
static int global_h, global_r;
static const int legs_layout[LEGS_COUNT] = {0, 60, 120, 180, 240, 300};
static const servo_id_t leg_servo_map[LEG_SERVO_ID_LAST] = {SERVO_ID_CENTRAL_0, SERVO_ID_MOVING_0, SERVO_ID_ROTATION_0};

static void pos_mgr_update_leg_target_angles(uint8_t leg_id);

pos_mgr_status_t pos_mgr_set_init_state(void)
{
	global_h = BASIC_HEIGHT;
	global_r = BASIC_RADIUS;
	
	for (uint8_t leg_id = 0; leg_id < LEGS_COUNT; ++leg_id)
	{
		legs_ctx[leg_id].current_h = global_h;
		legs_ctx[leg_id].current_r = global_r;
		pos_mgr_update_leg_target_angles(leg_id);
		
		legs_ctx[leg_id].servo_pos[CENTRAL_SERVO_ID] = legs_ctx[leg_id].target_pos[CENTRAL_SERVO_ID];
		legs_ctx[leg_id].servo_pos[MOVING_SERVO_ID] = legs_ctx[leg_id].target_pos[MOVING_SERVO_ID];
		legs_ctx[leg_id].servo_pos[ROTATION_SERVO_ID] = legs_ctx[leg_id].target_pos[ROTATION_SERVO_ID] = 90;
		
		for (leg_servo_id_t servo_id = CENTRAL_SERVO_ID; servo_id < LEG_SERVO_ID_LAST; ++servo_id)
		{
			drv_servo_set(leg_servo_map[servo_id] + leg_id, legs_ctx[leg_id].servo_pos[servo_id]);
		}
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

void pos_mgr_set_leg_position(uint8_t leg_id, int height, int radius)
{
  legs_ctx[leg_id].current_h = height;
  legs_ctx[leg_id].current_r = radius;
  pos_mgr_update_leg_target_angles(leg_id);
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
		for (uint8_t leg_id = 0; leg_id < LEGS_COUNT && status == POS_MGR_SUCCESS; ++leg_id)
		{
			if (leg_id != fixed_leg_id)
			{
				pos_mgr_set_leg_position(leg_id, legs_ctx[leg_id].current_h + h_delta, legs_ctx[leg_id].current_r);
			}
		}
		global_h += h_delta;
	}
	return status;
}

static void pos_mgr_update_leg_target_angles(uint8_t leg_id)
{
	leg_ctx_t *p_leg = &legs_ctx[leg_id];
  int r2 = SQR(p_leg->current_h) + SQR(p_leg->current_r);
  p_leg->target_pos[MOVING_SERVO_ID] = 180 - (uint8_t)round(acos((double)(SQR(L2) + SQR(L1) - r2) / (2 * L1 * L2)) * ToGrad);
  p_leg->target_pos[CENTRAL_SERVO_ID] = (uint8_t)round((acos((double)(p_leg->current_h) / sqrt(r2)) + acos((double)(r2 + SQR(L1) - SQR(L2)) / (2 * sqrt(r2) * L1))) * ToGrad);
}

bool_t pos_mgr_update_legs_position(uint32_t time_passed)
{
  int diff, abs_diff, sign, d;
	bool_t target_reached = TRUE;
  double de, delta = ((double)(3 * time_passed) / 150);
	leg_ctx_t *p_leg;
	
	for (uint8_t leg_id = 0; leg_id < LEGS_COUNT; ++leg_id)
	{
		p_leg = &legs_ctx[leg_id];
		for (leg_servo_id_t servo_id = CENTRAL_SERVO_ID; servo_id < LEG_SERVO_ID_LAST; ++servo_id)
		{
			diff = p_leg->target_pos[servo_id] - p_leg->servo_pos[servo_id];
			if (diff) {
				sign = SIGN(diff);
				abs_diff = sign * diff;
				de = sqrt(abs_diff) * delta;
				if (de > 1){
					d = (int)de;
					if (d >= abs_diff){
						p_leg->servo_pos[servo_id] = p_leg->target_pos[servo_id];
					}
					else{
						p_leg->servo_pos[servo_id] += sign * d;
					}
					drv_servo_set(leg_servo_map[servo_id] + leg_id, p_leg->servo_pos[servo_id]);
				}
				else{
					p_leg->speed_accum[servo_id] += de;
					if (p_leg->speed_accum[servo_id] > 1){
						p_leg->servo_pos[servo_id] += sign;
						drv_servo_set(leg_servo_map[servo_id] + leg_id, p_leg->servo_pos[servo_id]);
						p_leg->speed_accum[servo_id] = 0;
					}
				}
				if (p_leg->target_pos[servo_id] != p_leg->servo_pos[servo_id]){
					target_reached = FALSE;
				}
			}
		}
	}

  return target_reached;
}
