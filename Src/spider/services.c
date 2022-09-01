/**
  ******************************************************************************
  * File Name          : log.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <math.h>
#include "services.h"
#include "debug_utils.h"
#include "drv_sensors.h"
#include "drv_gyro.h"
#include "position_manager.h"
#include "config.h"
#include "event_handler.h"
#include "protocol_handler.h"

static bool position_control_allowed = false;

void allow_position_control(bool val)
{
	position_control_allowed = val;
}

static void vcc_control(uint32_t tick)
{
	static uint32_t next_notification = 0;
	
	if (drv_sensors_is_critical_vcc() && !is_spider_in_psm())
	{
		LOG_ERR("Critical Vcc");
		protocol_send_response(REQUEST_ID_ASYNC_EVENT, EXT_CRITICAL_VCC, 0);
		handle_enter_psm(true);  // will postpone heartbeat thread, no return
	}
	else if ((tick >= next_notification) && drv_sensors_is_low_vcc())
	{
		LOG_WARN("Low Vcc");
		protocol_send_response(REQUEST_ID_ASYNC_EVENT, EXT_LOW_VCC, 0);
		next_notification = tick + VCC_NOTIFICATION_TIMEOUT;
	}
}

static void workload_control(void)
{
	bool critical_workload = false;
	uint32_t whole_workload = drv_sensors_get_whole_workload(); 
	
	if (whole_workload > CRITICAL_WORKLOAD)
	{
		LOG_ERR("Critical workload: %d", whole_workload);
		critical_workload = true;
	}
	else
	{
		uint16_t workload[LEGS_COUNT];
		drv_sensors_get_legs_workload(workload);
		for (int i = 0; i < LEGS_COUNT; ++i)
		{
			if (workload[i] > CRITICAL_LEG_WORKLOAD)
			{
				LOG_ERR("Critical Leg workload: %d", workload[i]);
				critical_workload = true;
				break;
			}
		}
	}
	
	if (critical_workload)
	{
		protocol_send_response(REQUEST_ID_ASYNC_EVENT, EXT_CRITICAL_WORKLOAD, 0);
		handle_enter_psm(true); // will postpone heartbeat thread, no return
	}
}

static void surface_control(int height_delta[LEGS_COUNT])
{
	for (int i = 0; i < LEGS_COUNT; ++i) 
	{
		if (!drv_sensors_is_leg_on_surface(i))
		{
			height_delta[i] += LEG_FALLING_STEP;
		}
	}
}

static void workload_alignment(int height_delta[LEGS_COUNT])
{
	uint16_t workload[LEGS_COUNT];
	int avarage_workload = drv_sensors_get_whole_workload() / LEGS_COUNT;
	drv_sensors_get_legs_workload(workload);
	
	for (int i = 0; i < LEGS_COUNT; ++i) 
	{
		height_delta[i] += (int)((avarage_workload - workload[i]) / (MAX_WORKLOAD_DISPARITE_RATE * avarage_workload));
	}
}

static void gyro_control(int height_delta[LEGS_COUNT])
{
	double horizontal, vertical;
	
	if (drv_gyro_get_position(&horizontal, &vertical) == GYRO_STATUS_SUCCESS)
	{
		if ((fabs(vertical - global_config.position_v) > MAX_SKEW_ANGLE) ||
						 ((global_config.position_v != 0) && (fabs(horizontal - global_config.position_h) > 4 * MAX_SKEW_ANGLE))) 
		{
			//LOG_DBG("Gyro: %f %f", horizontal, vertical);
			double tanV = tan(vertical * ToRad);
			double tanPV = tan(global_config.position_v * ToRad);
			int leg_pos;
			
			for (int i = 0; i < LEGS_COUNT; ++i) 
			{
				leg_pos = pos_mgr_get_leg_layout(i);
				height_delta[i] += (int)round(((pos_mgr_get_global_r() + BODY_RADIUS) * (cos((leg_pos - horizontal) * ToRad) * 
														tanV - cos((leg_pos - global_config.position_h) * ToRad) * tanPV)) / 2);
			}
		}
	}
}

static void height_control(int height_delta[LEGS_COUNT])
{
	int real_height = pos_mgr_get_leg_h(0) + height_delta[0];
	int temp;
	
	for (int i = 1; i < LEGS_COUNT; ++i)
	{
		temp = pos_mgr_get_leg_h(i) + height_delta[i];
		if (temp < real_height)
		{
			real_height = temp;
		}
	}
	
	temp = pos_mgr_get_global_h() - real_height;
	for (int i = 0; i < LEGS_COUNT; ++i){
		height_delta[i] += temp;
	}		
}

static void position_control(uint32_t tick, bool *is_idle)
{
	static uint32_t next_position_control = 0;
	
	if ((tick >= next_position_control) && *is_idle && drv_sensors_is_spider_on_surface() && !pos_mgr_is_leg_fixed() && position_control_allowed)
	{
		int height_delta[LEGS_COUNT] = {0};
		
		surface_control(height_delta);
		if (global_config.workload_alignment_enable)
		{
			workload_alignment(height_delta);
		}
		if (global_config.gyro_control_enable)
		{
			gyro_control(height_delta);
		}
		height_control(height_delta);
		
		pos_mgr_status_t status = POS_MGR_SUCCESS;
	
		for (uint8_t leg_id = 0; leg_id < LEGS_COUNT && status == POS_MGR_SUCCESS; ++leg_id)
		{
			if (height_delta[leg_id] != 0)
			{
				status = pos_mgr_check_leg_position(pos_mgr_get_leg_h(leg_id) + height_delta[leg_id], pos_mgr_get_leg_r(leg_id));
			}
		}
		if (status == POS_MGR_SUCCESS){
			for (uint8_t leg_id = 0; leg_id < LEGS_COUNT; ++leg_id)
			{
				if (height_delta[leg_id] != 0)
				{
					pos_mgr_set_leg_position(leg_id, pos_mgr_get_leg_h(leg_id) + height_delta[leg_id], CMD_PARAM_OMITTED, CMD_PARAM_OMITTED);
					*is_idle = false;
				}
			}
		}
		next_position_control = tick + POSITION_CONTROL_TIMEOUT;
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
	
	workload_control();
	vcc_control(tick);
	
	if (!is_spider_in_psm())
	{
		if (tick >= next_gyro_update) 
		{
			drv_gyro_update(GYRO_UPDATE_TIMEOUT);
			next_gyro_update = tick + GYRO_UPDATE_TIMEOUT;
		}
		
		position_control(tick, is_idle);
	}
}
