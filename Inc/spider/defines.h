/**
  ******************************************************************************
  * File Name          : defines.h
  * Description        : This file contains common constants/definitions
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once

#include <stdint.h>
#include <stdbool.h>
#include <string.h>

#define Pi 3.1416
#define ToRad 0.01745
#define ToGrad 57.3

#define LEGS_COUNT												(6)
#define L1 																(62)
#define L2 																(62)
#define BODY_RADIUS												(75)

#define CMD_PARAM_OMITTED									(0xFFFF)
 
#define SQR(x)														((x) * (x))
#define SIGN(x)													  (((x) > 0) ? 1 : (((x) == 0) ? 0 : -1))

#define str_starts_with(str, substr)			(memcmp(str, substr, sizeof(substr) - 1) == 0)

