/**
  ******************************************************************************
  * File Name          : event_handler.h
  * Description        : 
  ******************************************************************************
  **/

/* Define to prevent recursive inclusion -------------------------------------*/
#pragma once

#include "defines.h"

void handle_user_disconnect(void);

void handle_enter_psm(bool force);
void handle_exit_psm(void);
bool is_spider_in_psm(void);
