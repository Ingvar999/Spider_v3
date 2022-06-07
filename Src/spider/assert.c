/**
  ******************************************************************************
  * File Name          : assert.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "assert.h"
#include "log.h"
#include "debug_utils.h"

void assert_impl(assert_code_t code)
{
	PRINTF("ASSERT: %02X !!!", code);
	LED_ON(RED);
	while(1);
}
