/**
  ******************************************************************************
  * File Name          : debug_tils.h
  * Description        : 
  ******************************************************************************
  **/

#pragma once
#include <stdint.h>

void drv_servo_init(void);
void drv_servo_set(uint8_t port, uint16_t value);
