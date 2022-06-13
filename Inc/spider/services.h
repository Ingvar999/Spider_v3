/**
  ******************************************************************************
  * File Name          : services.h
  * Description        : 
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once

#include "defines.h"

#define HEART_BEAT_DELAY								(25)
#define LED_SWITCH_TIMEOUT							(3000)
#define VCC_NOTIFICATION_TIMEOUT				(5000)
#define GYRO_UPDATE_TIMEOUT							(50)
#define POSITION_CONTROL_TIMEOUT				(500)

#define MAX_WORKLOAD_DISPARITE_RATE			(0.5)
#define MAX_SKEW_ANGLE									(3.0)

void process_services(bool *is_idle);
void allow_position_control(bool val);

