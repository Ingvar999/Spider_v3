/**
  ******************************************************************************
  * File Name          : drv_servo.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/

#include "drv_sensors.h"
#include "stm32f4xx_hal.h"
#include "cmsis_os.h"
#include "main.h"
#include "log.h"

#define CHECK_ADC_DURATION				(0)

extern ADC_HandleTypeDef hadc1, hadc2;

static volatile uint16_t raw_adc[CHANNELS_NUMBER * SAMPLES_NUMBER];
static volatile uint16_t processed_adc[CHANNELS_NUMBER];

#if (CHECK_ADC_DURATION)
static volatile uint32_t adc_last, adc_duration;
#endif

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
  if(hadc->Instance == ADC1)
  {
#if (CHECK_ADC_DURATION)
		uint32_t time = HAL_GetTick();
		adc_duration =  time - adc_last;
		adc_last = time;
#endif
		
		uint32_t accum;
		for (int i = 0; i < CHANNELS_NUMBER; ++i)
		{
			accum = 0;
			for (int j = i; j < CHANNELS_NUMBER * SAMPLES_NUMBER; j += CHANNELS_NUMBER)
			{
				accum += raw_adc[j];
			}
			processed_adc[i] = accum / SAMPLES_NUMBER;
		}
  }
}

void drv_sensors_init(void)
{
	HAL_ADC_Start_DMA(&hadc1, (uint32_t*)&raw_adc, CHANNELS_NUMBER * SAMPLES_NUMBER);
}

static uint16_t get_vcc_adc()
{
	static uint32_t next_conversion = 0;
	static uint16_t vcc_adc;
	
	if (HAL_GetTick() >= next_conversion)
	{
		HAL_ADC_Start(&hadc2);
    HAL_ADC_PollForConversion(&hadc2, 2); 
    vcc_adc = HAL_ADC_GetValue(&hadc2); 
    HAL_ADC_Stop(&hadc2);
		
		next_conversion = HAL_GetTick() + VCC_CACHE_VALIDITY;
	}
	return vcc_adc;
}

int drv_sensors_get_vcc(void)
{
	return get_vcc_adc() * ADC_TO_VCC;
}

bool drv_sensors_is_low_vcc(void)
{
	return get_vcc_adc() < LOW_VCC;
}

bool drv_sensors_is_critical_vcc(void)
{
	return get_vcc_adc() < CRITICAL_VCC;
}

bool drv_sensors_is_leg_on_surface(uint8_t leg_id)
{
	return processed_adc[leg_id] >= MIN_LEG_WORKLOAD;
}

bool drv_sensors_is_spider_on_surface(void)
{
	int legs_on_surface = 0;
	
	for (int i = 0; i < LEGS_COUNT; ++i)
	{
		if (drv_sensors_is_leg_on_surface(i))
		{
			if (++legs_on_surface == MIN_LEGS_ON_SURFACE)
			{
				return true;
			}
		}
	}
	return false;
}

void drv_sensors_get_legs_workload(uint16_t workload[LEGS_COUNT])
{
	memcpy(workload, (const void *)processed_adc, sizeof(uint16_t) * LEGS_COUNT);
}

void drv_sensors_print_adc(void)
{
	PRINTF("%4u, %4u, %4u, %4u, %4u, %4u, %4u", processed_adc[0], processed_adc[1], processed_adc[2], processed_adc[3], processed_adc[4], processed_adc[5], processed_adc[6]);
#if (CHECK_ADC_DURATION)
	PRINTF("adc last - %u, adc duration - %u", adc_last, adc_duration);
#endif
	PRINTF("VCC %u", drv_sensors_get_vcc());
}
