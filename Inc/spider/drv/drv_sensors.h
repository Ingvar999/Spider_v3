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

#define VCC_CHANNEL_IDX						(6)
#define ADC_TO_VCC								(4.22)
#define LOW_VCC										(1659)			// 7000 mV
#define CRITICAL_VCC							(1564)			// 6600 mV

void drv_sensors_init(void);
int drv_sensors_get_vcc(void);
bool drv_sensors_is_low_vcc(void);
bool drv_sensors_is_critical_vcc(void);

void drv_sensors_print_adc(void);
