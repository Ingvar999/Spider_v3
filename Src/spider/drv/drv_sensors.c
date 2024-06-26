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
#include "event_handler.h"
#include "config.h"

#define CHECK_ADC_DURATION				(0)

extern ADC_HandleTypeDef hadc1, hadc2;

static volatile uint16_t raw_adc[CHANNELS_NUMBER * SAMPLES_NUMBER];
static volatile uint16_t processed_adc[CHANNELS_NUMBER];

static const struct {
	GPIO_TypeDef *port;
	uint16_t pin;
} leg_surface_detection_pins[LEGS_COUNT] = 
{
	{GPIOB, GPIO_PIN_11},
	{GPIOB, GPIO_PIN_14},
	{GPIOC, GPIO_PIN_11},
	{GPIOC, GPIO_PIN_12},
	{GPIOB, GPIO_PIN_10},
	{GPIOB, GPIO_PIN_12}
};
static uint16_t vcc_adc_cache;

#if (CHECK_ADC_DURATION)
static volatile uint32_t adc_last, adc_duration;
#endif

static uint16_t get_vcc_adc()
{
	uint16_t vcc_adc;
	
	HAL_ADC_Start(&hadc2);
  HAL_ADC_PollForConversion(&hadc2, 2); 
  vcc_adc = HAL_ADC_GetValue(&hadc2); 
  HAL_ADC_Stop(&hadc2);
	
	return vcc_adc;
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
  if(hadc->Instance == ADC1)
  {
#if (CHECK_ADC_DURATION)
		uint32_t time = HAL_GetTick();
		adc_duration =  time - adc_last;
		adc_last = time;
#endif
		vcc_adc_cache = get_vcc_adc();
		
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
	vcc_adc_cache = get_vcc_adc();
}

void drv_sensors_deinit(void)
{
	HAL_ADC_Stop(&hadc1);
	HAL_ADC_Stop_DMA(&hadc1);
	memset((void *)processed_adc, 0, sizeof(processed_adc));
}

static uint16_t get_vcc_adc_cache()
{
	static uint32_t next_conversion = 0;
	
	if (is_spider_in_psm() && (HAL_GetTick() >= next_conversion))
	{
		vcc_adc_cache = get_vcc_adc();
		
		next_conversion = HAL_GetTick() + VCC_CACHE_VALIDITY;
	}
	return vcc_adc_cache;
}

static uint16_t get_adjusted_vcc_adc()
{
	return get_vcc_adc_cache() + (drv_sensors_get_whole_workload() * WORKLOAD_TO_VCC_ADC); // Compensate VCC level fall due to workload current
}

int drv_sensors_get_vcc(void)
{
	return get_vcc_adc_cache() * ADC_TO_VCC;
}

bool drv_sensors_is_low_vcc(void)
{
	return get_adjusted_vcc_adc() < LOW_VCC;
}

bool drv_sensors_is_critical_vcc(void)
{
	return get_adjusted_vcc_adc() < CRITICAL_VCC;
}

bool drv_sensors_is_leg_on_surface(uint8_t leg_id)
{
	return (HAL_GPIO_ReadPin(leg_surface_detection_pins[leg_id].port, leg_surface_detection_pins[leg_id].pin) == GPIO_PIN_RESET) 
					|| (processed_adc[leg_id] > (SPEED_SURFACE_LEG_WORKLOAD * global_config.speed));
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

uint32_t drv_sensors_get_whole_workload()
{
	uint32_t res = 0;
	for (int i = 0; i < LEGS_COUNT; ++i)
	{
		res += processed_adc[i];
	}
	return res;
}

void drv_sensors_print_adc(void)
{
	PRINTF("%4u, %4u, %4u, %4u, %4u, %4u, %4u", processed_adc[0], processed_adc[1], processed_adc[2], processed_adc[3], processed_adc[4], processed_adc[5], processed_adc[6]);
#if (CHECK_ADC_DURATION)
	PRINTF("adc last - %u, adc duration - %u", adc_last, adc_duration);
#endif
	PRINTF("Input: %d, %d, %d, %d, %d, %d", drv_sensors_is_leg_on_surface(0), drv_sensors_is_leg_on_surface(1), drv_sensors_is_leg_on_surface(2),
																					drv_sensors_is_leg_on_surface(3), drv_sensors_is_leg_on_surface(4), drv_sensors_is_leg_on_surface(5));
	PRINTF("VCC %u", drv_sensors_get_vcc());
}
