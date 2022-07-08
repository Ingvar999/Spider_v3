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

typedef enum {
	DRV_SERVO_SUCCESS = 0,
	DRV_SERVO_HW_ACCESS_ERROR,
	DRV_SERVO_NOT_INITIALIZED,
	DRV_SERVO_INVALID_PARAM,
	DRV_SERVO_GENERIC_ERROR
} drv_servo_status_t;

typedef enum {
	NO_ACCELERATION,
	FADING_SPEED,
} acceleration_mode_t;

#define ACCELERATION_DEFAULT			FADING_SPEED

drv_servo_status_t drv_servo_init(void);
drv_servo_status_t drv_servo_set(servo_id_t port, uint16_t value, bool force);

drv_servo_status_t drv_servo_enable(void);
void drv_servo_disable(void);

acceleration_mode_t drv_servo_get_accel_mode(void);
void drv_servo_set_accel_mode(acceleration_mode_t mode);

drv_servo_status_t drv_servo_update_servos_position(uint32_t time_passed, bool *is_idle);
