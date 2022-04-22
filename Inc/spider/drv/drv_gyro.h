/**
  ******************************************************************************
  * File Name          : drv_gyro.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once
#include <stdint.h>

typedef enum 
{
	GYRO_STATUS_SUCCESS = 0,
	GYRO_NOT_AVAILABLE,
	GYRO_NOT_INITIALIZED,
	GYRO_TIMEOUT,
	GYRO_GENERIC_ERROR,
} drv_gyro_status_t;

drv_gyro_status_t drv_gyro_init(void);
drv_gyro_status_t drv_gyro_update(uint32_t time_passed);
drv_gyro_status_t drv_gyro_get_position(double *horizontal, double *vertical);
