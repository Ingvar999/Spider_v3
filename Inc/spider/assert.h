/**
  ******************************************************************************
  * File Name          : assert.h
  * Description        : This file contains common constants/definitions
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once

typedef enum 
{
	ASSERT_CODE_NONE = 0x0,
	ASSERT_CODE_01,
	ASSERT_CODE_02,
	ASSERT_CODE_03,
	ASSERT_CODE_04,
	ASSERT_CODE_05,
	ASSERT_CODE_06,
	ASSERT_CODE_07,
	ASSERT_CODE_08,
	ASSERT_CODE_09,
	ASSERT_CODE_0A,
	ASSERT_CODE_0B,
	ASSERT_CODE_0C,
	ASSERT_CODE_0D,
} assert_code_t;

#define ASSERT(code)							assert_impl(code)
#define ASSERT_IF(code, cond) 		if (cond) assert_impl(code)
 
void assert_impl(assert_code_t code);

