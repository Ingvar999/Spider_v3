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
} config_t;

extern config_t global_config;

void init_config(void);

