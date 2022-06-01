/**
  ******************************************************************************
  * File Name          : debug_tils.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once

#include "defines.h"

typedef enum {
	SERVO_ID_FIRST = 0,
	SERVO_ID_CENTRAL_0 = SERVO_ID_FIRST,
	SERVO_ID_CENTRAL_1,
	SERVO_ID_CENTRAL_2,
	SERVO_ID_CENTRAL_3,
	SERVO_ID_CENTRAL_4,
	SERVO_ID_CENTRAL_5,
	SERVO_ID_RESERVED_0,
	SERVO_ID_RESERVED_1,
	SERVO_ID_MOVING_0,
	SERVO_ID_MOVING_1,
	SERVO_ID_MOVING_2,
	SERVO_ID_MOVING_3,
	SERVO_ID_MOVING_4,
	SERVO_ID_MOVING_5,
	SERVO_ID_RESERVED_2,
	SERVO_ID_RESERVED_3,
	SERVO_ID_ROTATION_0,
	SERVO_ID_ROTATION_1,
	SERVO_ID_ROTATION_2,
	SERVO_ID_ROTATION_3,
	SERVO_ID_ROTATION_4,
	SERVO_ID_ROTATION_5,
	SERVO_ID_MAX
} servo_id_t;

void drv_servo_init(void);
void drv_servo_set(servo_id_t port, uint16_t value, bool_t force);
void drv_servo_enable(void);
void drv_servo_disable(void);
bool_t drv_servo_update_servos_position(uint32_t time_passed);
