/**
  ******************************************************************************
  * File Name          : log.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "event_handler.h"
#include "debug_utils.h"
#include "command_manager.h"
#include "cmsis_os.h"
#include "drv_servo.h"
#include "drv_gyro.h"
#include "drv_sensors.h"
#include "position_manager.h"
#include "protocol_handler.h"

extern osThreadId HeartBeatTaskHandle;

static bool is_in_psm = false;

void handle_user_disconnect(void)
{
	if (!is_spider_in_psm())
	{
		pending_task_ctx_t task;
		
		cmd_mgr_abort_command(true, false);

		task.arg_1 = 0;
		task.arg_2 = 0;
		task.task_id = REQUEST_ID_INTERNAL;
		task.task_id = TASK_BASIC_POSITION;
		ASSERT_IF(ASSERT_CODE_1A, cmd_mgr_add_task(&task) != CMD_MGR_SUCCESS);
	}
}

void handle_enter_psm(bool force)
{
	if (!is_spider_in_psm())
	{
		LOG_INFO("Enter PSM!");
		if (force)
		{
			drv_servo_disable();
			osThreadSuspend(HeartBeatTaskHandle);
			cmd_mgr_abort_command(true, true);
			pos_mgr_set_init_state();
		}
		else
		{
			pending_task_ctx_t task;
			
			cmd_mgr_abort_command(true, false);
			task.arg_1 = 0;
			task.arg_2 = 0;
			task.task_id = REQUEST_ID_INTERNAL;
			task.task_id = TASK_BASIC_POSITION;
			ASSERT_IF(ASSERT_CODE_1B, cmd_mgr_add_task(&task) != CMD_MGR_SUCCESS);
		}	
		
		drv_sensors_deinit();
		LED_OFF(GREEN);
		
		is_in_psm = true;
	}
}

void handle_exit_psm(void)
{
	if (is_spider_in_psm())
	{
		LOG_INFO("Exit PSM");
		osThreadResume(HeartBeatTaskHandle);
		drv_gyro_init(1);
		drv_sensors_init();
		
		drv_servo_enable();
		
		is_in_psm = false;
	}
}

bool is_spider_in_psm(void)
{
	return is_in_psm;
}
