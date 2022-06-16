/**
  ******************************************************************************
  * File Name          : config.h
  * Description        : 
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once

#include "defines.h"

typedef struct {
	int speed;
	int position_v;
	int position_h;
	bool workload_alignment_enable;
	bool gyro_control_enable;
} config_t;

extern config_t global_config;

void init_config(void);

