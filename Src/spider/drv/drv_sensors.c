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

extern ADC_HandleTypeDef hadc1;

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

int drv_sensors_get_vcc(void)
{
	return processed_adc[VCC_CHANNEL_IDX] * ADC_TO_VCC;
}

bool drv_sensors_is_low_vcc(void)
{
	return processed_adc[VCC_CHANNEL_IDX] < LOW_VCC;
}

bool drv_sensors_is_critical_vcc(void)
{
	return processed_adc[VCC_CHANNEL_IDX] < CRITICAL_VCC;
}

void drv_sensors_print_adc(void)
{
	PRINTF("%4u, %4u, %4u, %4u, %4u, %4u, %4u, %4u\n", processed_adc[0], processed_adc[1], processed_adc[2], processed_adc[3], processed_adc[4], processed_adc[5], processed_adc[6], processed_adc[7]);
#if (CHECK_ADC_DURATION)
	PRINTF("adc last - %u, adc duration - %u\n", adc_last, adc_duration);
#endif
	PRINTF("VCC %4\n", drv_sensors_get_vcc());
}
