/**
  ******************************************************************************
  * File Name          : spider_main.c
  * Description        : Main app specific body
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "spider_main.h"
#include "debug_utils.h"
#include "cmsis_os.h"
#include "drv_servo.h"

#define LED_SWITCH_TIMEOUT				(1000)

/* Private variables ---------------------------------------------------------*/
static osThreadId defaultTaskHandle, defaultTaskHandle1;
static char cli_string[RX_BUF_SIZE];
static volatile uint32_t cli_in_process = 0;

/* Private function prototypes -----------------------------------------------*/
void StartDefaultTask(void const * argument);
void StartDefaultTask1(void const * argument);

void cli_event_handler(const char *data, uint32_t len)
{
	if (!cli_in_process){
		memcpy(cli_string, data, len);
		cli_in_process = 1;
		if (osThreadResume(defaultTaskHandle) != osOK){
			PRINTF("Resume thread failed\n");
		}
	}
}

void post_init_handler(void)
{
	osThreadDef(defaultTask, StartDefaultTask, osPriorityNormal, 0, configMINIMAL_STACK_SIZE);
  defaultTaskHandle = osThreadCreate(osThread(defaultTask), NULL);
	osThreadDef(defaultTask1, StartDefaultTask1, osPriorityNormal, 0, configMINIMAL_STACK_SIZE);
  defaultTaskHandle1 = osThreadCreate(osThread(defaultTask1), NULL);
	start_cli_handling('\n', cli_event_handler);
	drv_servo_init();
	PRINTF("Init Done!\n");
}

static void StartDefaultTask(void const * argument)
{
	while (1)
	{
		if (cli_in_process)
		{
			int val = atoi(cli_string);
			if (val >= 0 && val <= 180)
			{
				drv_servo_set(0, val);
			}
			cli_in_process = 0;
		}
		if (osThreadSuspend(osThreadGetId()) != osOK){
			PRINTF("Suspend thread failed\n");
		}
	}
}

static void StartDefaultTask1(void const * argument)
{
	while (1)
	{
		LED_ON(BLUE);
		osDelay(2 * LED_SWITCH_TIMEOUT);
		LED_OFF(BLUE);
		//PRINTF("DBG: BLUE OFF\n");
		osDelay(2 * LED_SWITCH_TIMEOUT);
	}
}
