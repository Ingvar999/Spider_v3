/**
  ******************************************************************************
  * File Name          : log.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/

#include "services.h"
#include "debug_utils.h"
#include "drv_sensors.h"
#include "drv_gyro.h"

static void vcc_control(uint32_t tick)
{
	static uint32_t next_notification = 0;
	
	if (drv_sensors_is_critical_vcc())
	{
		TODO("Enter PSM");
	}
	
	if ((tick >= next_notification) && (drv_sensors_is_critical_vcc() || drv_sensors_is_low_vcc()))
	{
		if (drv_sensors_is_critical_vcc())
		{
			LOG_ERR("Critical Vcc");
		}
		else
		{
			LOG_WARN("Low Vcc");
		}
		next_notification = tick + VCC_NOTIFICATION_TIMEOUT;
	}
}

void process_services(bool *is_idle)
{
	static int next_led_change = 0;
	static int next_gyro_update = 0;
	
	uint32_t tick = HAL_GetTick();
	if (tick >= next_led_change) 
	{
		LED_CHANGE(GREEN);
		next_led_change = tick + LED_SWITCH_TIMEOUT;
	}
	
	vcc_control(tick);
	
	if (tick >= next_gyro_update) 
	{
		drv_gyro_update(GYRO_UPDATE_TIMEOUT);
		next_gyro_update = tick + GYRO_UPDATE_TIMEOUT;
	}
}
