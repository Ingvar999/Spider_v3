/**
  ******************************************************************************
  * File Name          : config.c
  * Description        : 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/

#include "config.h"
#include "debug_utils.h"

config_t global_config;
static const config_t default_config = {
	3, // speed
	0, // postion vertical
	0 // position horizontal
};

void init_config(void)
{
	memcpy(&global_config, &default_config, sizeof(config_t));
}
