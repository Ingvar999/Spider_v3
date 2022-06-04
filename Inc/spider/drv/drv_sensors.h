/**
  ******************************************************************************
  * File Name          : drv_sensors.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once

#include "defines.h"

#define CHANNELS_NUMBER						(8)
#define SAMPLES_NUMBER						(16)

void drv_sensors_init(void);
void drv_sensors_print_adc(void);
