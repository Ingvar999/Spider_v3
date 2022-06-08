/**
  ******************************************************************************
  * File Name          : services.h
  * Description        : 
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once

#include "defines.h"

#define HEART_BEAT_DELAY					(25)
#define LED_SWITCH_TIMEOUT				(3000)
#define VCC_NOTIFICATION_TIMEOUT	(5000)
#define GYRO_UPDATE_TIMEOUT				(150)

void process_services(bool *is_idle);

