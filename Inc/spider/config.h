/**
  ******************************************************************************
  * File Name          : config.h
  * Description        : 
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once

#include "defines.h"

#define CONFIG_FLASH_ADDR						(0x08000000)
#define CONFIG_FLASH_MAGIC					(0xFAAC8CE1)

typedef enum {
	CFG_SUCCESS = 0,
	CFG_READ_ERROR,
	CFG_ERASE_ERROR,
	CFG_WRITE_ERROR,
	CFG_NOT_INITIALIZED,
} config_status_t;

typedef struct {
	int speed;
	int position_v;
	int position_h;
	bool workload_alignment_enable;
	bool gyro_control_enable;
} config_t;

extern config_t global_config;

void init_config(void);
config_status_t restore_config(void);
config_status_t persist_config(void);
config_status_t reset_config(void);
