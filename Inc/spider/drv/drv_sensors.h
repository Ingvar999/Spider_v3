/**
  ******************************************************************************
  * File Name          : drv_sensors.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once

#include "defines.h"

#define CHANNELS_NUMBER						(7)
#define SAMPLES_NUMBER						(16)

#define VCC_CACHE_VALIDITY				(100)
#define ADC_TO_VCC								(4.22)
#define WORKLOAD_TO_VCC_ADC				(0.06)
#define LOW_VCC										(1659)			// 7000 mV
#define CRITICAL_VCC							(1564)			// 6600 mV
#define CRITICAL_WORKLOAD					(5800)
#define CRITICAL_LEG_WORKLOAD			(1450)

#define SURFACE_LEG_WORKLOAD			(100)		
#define MIN_LEG_WORKLOAD					(18)
#define MIN_LEGS_ON_SURFACE				(2)

void drv_sensors_init(void);
void drv_sensors_deinit(void);

int drv_sensors_get_vcc(void);
bool drv_sensors_is_low_vcc(void);
bool drv_sensors_is_critical_vcc(void);

bool drv_sensors_is_leg_on_surface(uint8_t leg_id);
bool drv_sensors_is_spider_on_surface(void);
void drv_sensors_get_legs_workload(uint16_t workload[LEGS_COUNT]);
uint32_t drv_sensors_get_whole_workload(void);

void drv_sensors_print_adc(void);
