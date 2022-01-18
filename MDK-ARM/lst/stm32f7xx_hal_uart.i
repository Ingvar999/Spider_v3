#line 1 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart.c"























































































































































 

 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal.h"


































  

 







 
#line 1 "../Inc/stm32f7xx_hal_conf.h"
































  

 







#line 1 "../Inc/main.h"














































 
 


   

 
 

 

 

#line 66 "../Inc/main.h"

 



 
 

 

 




void _Error_Handler(char *, int);








  



  


 
#line 44 "../Inc/stm32f7xx_hal_conf.h"
 
 

 


 


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


 
 
 
 
 
 
 
 
 
 
 
 
#line 101 "../Inc/stm32f7xx_hal_conf.h"

 




 












 






 







 












 





 

 


      






 



 
 

 

 

 
#line 184 "../Inc/stm32f7xx_hal_conf.h"

    





 

  

  

 





 



 
#line 218 "../Inc/stm32f7xx_hal_conf.h"




  
 





 




 



 


 

#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"

































 

 







 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"


































 

 







 
#line 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f7xx.h"











































 



 



 










 



 






 
#line 97 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f7xx.h"



 

#line 110 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f7xx.h"



 
#line 122 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f7xx.h"


 



 
#line 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







































 



 



 










 




 
typedef enum
{
 
  NonMaskableInt_IRQn         = -14,     
  MemoryManagement_IRQn       = -12,     
  BusFault_IRQn               = -11,     
  UsageFault_IRQn             = -10,     
  SVCall_IRQn                 = -5,      
  DebugMonitor_IRQn           = -4,      
  PendSV_IRQn                 = -2,      
  SysTick_IRQn                = -1,      
 
  WWDG_IRQn                   = 0,       
  PVD_IRQn                    = 1,       
  TAMP_STAMP_IRQn             = 2,       
  RTC_WKUP_IRQn               = 3,       
  FLASH_IRQn                  = 4,       
  RCC_IRQn                    = 5,       
  EXTI0_IRQn                  = 6,       
  EXTI1_IRQn                  = 7,       
  EXTI2_IRQn                  = 8,       
  EXTI3_IRQn                  = 9,       
  EXTI4_IRQn                  = 10,      
  DMA1_Stream0_IRQn           = 11,      
  DMA1_Stream1_IRQn           = 12,      
  DMA1_Stream2_IRQn           = 13,      
  DMA1_Stream3_IRQn           = 14,      
  DMA1_Stream4_IRQn           = 15,      
  DMA1_Stream5_IRQn           = 16,      
  DMA1_Stream6_IRQn           = 17,      
  ADC_IRQn                    = 18,      
  CAN1_TX_IRQn                = 19,      
  CAN1_RX0_IRQn               = 20,      
  CAN1_RX1_IRQn               = 21,      
  CAN1_SCE_IRQn               = 22,      
  EXTI9_5_IRQn                = 23,      
  TIM1_BRK_TIM9_IRQn          = 24,      
  TIM1_UP_TIM10_IRQn          = 25,      
  TIM1_TRG_COM_TIM11_IRQn     = 26,      
  TIM1_CC_IRQn                = 27,      
  TIM2_IRQn                   = 28,      
  TIM3_IRQn                   = 29,      
  TIM4_IRQn                   = 30,      
  I2C1_EV_IRQn                = 31,      
  I2C1_ER_IRQn                = 32,      
  I2C2_EV_IRQn                = 33,      
  I2C2_ER_IRQn                = 34,      
  SPI1_IRQn                   = 35,      
  SPI2_IRQn                   = 36,      
  USART1_IRQn                 = 37,      
  USART2_IRQn                 = 38,      
  USART3_IRQn                 = 39,      
  EXTI15_10_IRQn              = 40,      
  RTC_Alarm_IRQn              = 41,      
  OTG_FS_WKUP_IRQn            = 42,      
  TIM8_BRK_TIM12_IRQn         = 43,      
  TIM8_UP_TIM13_IRQn          = 44,      
  TIM8_TRG_COM_TIM14_IRQn     = 45,      
  TIM8_CC_IRQn                = 46,      
  DMA1_Stream7_IRQn           = 47,      
  FMC_IRQn                    = 48,      
  SDMMC1_IRQn                 = 49,      
  TIM5_IRQn                   = 50,      
  SPI3_IRQn                   = 51,      
  UART4_IRQn                  = 52,      
  UART5_IRQn                  = 53,      
  TIM6_DAC_IRQn               = 54,      
  TIM7_IRQn                   = 55,      
  DMA2_Stream0_IRQn           = 56,      
  DMA2_Stream1_IRQn           = 57,      
  DMA2_Stream2_IRQn           = 58,      
  DMA2_Stream3_IRQn           = 59,      
  DMA2_Stream4_IRQn           = 60,      
  ETH_IRQn                    = 61,      
  ETH_WKUP_IRQn               = 62,      
  CAN2_TX_IRQn                = 63,      
  CAN2_RX0_IRQn               = 64,      
  CAN2_RX1_IRQn               = 65,      
  CAN2_SCE_IRQn               = 66,      
  OTG_FS_IRQn                 = 67,      
  DMA2_Stream5_IRQn           = 68,      
  DMA2_Stream6_IRQn           = 69,      
  DMA2_Stream7_IRQn           = 70,      
  USART6_IRQn                 = 71,      
  I2C3_EV_IRQn                = 72,      
  I2C3_ER_IRQn                = 73,      
  OTG_HS_EP1_OUT_IRQn         = 74,      
  OTG_HS_EP1_IN_IRQn          = 75,      
  OTG_HS_WKUP_IRQn            = 76,      
  OTG_HS_IRQn                 = 77,      
  DCMI_IRQn                   = 78,      
  RNG_IRQn                    = 80,      
  FPU_IRQn                    = 81,      
  UART7_IRQn                  = 82,      
  UART8_IRQn                  = 83,      
  SPI4_IRQn                   = 84,      
  SPI5_IRQn                   = 85,      
  SPI6_IRQn                   = 86,      
  SAI1_IRQn                   = 87,      
  LTDC_IRQn                   = 88,      
  LTDC_ER_IRQn                = 89,      
  DMA2D_IRQn                  = 90,      
  SAI2_IRQn                   = 91,      
  QUADSPI_IRQn                = 92,      
  LPTIM1_IRQn                 = 93,      
  CEC_IRQn                    = 94,      
  I2C4_EV_IRQn                = 95,      
  I2C4_ER_IRQn                = 96,      
  SPDIF_RX_IRQn               = 97,      
  DFSDM1_FLT0_IRQn	          = 99,      
  DFSDM1_FLT1_IRQn	          = 100,     
  DFSDM1_FLT2_IRQn	          = 101,     
  DFSDM1_FLT3_IRQn	          = 102,     
  SDMMC2_IRQn                 = 103,     
  CAN3_TX_IRQn                = 104,     
  CAN3_RX0_IRQn               = 105,     
  CAN3_RX1_IRQn               = 106,     
  CAN3_SCE_IRQn               = 107,     
  JPEG_IRQn                   = 108,     
  MDIOS_IRQn                  = 109      
} IRQn_Type;



 



 
#line 1 "../Drivers/CMSIS/Include/core_cm7.h"
 




 

























 











#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
 
 





 









     
#line 27 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"
     











#line 46 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"





 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     




typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;


     
typedef   signed     long long intmax_t;
typedef unsigned     long long uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     






     






     






     

     


     


     


     

     
#line 216 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     



     






     
    
 



#line 241 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"

     







     










     











#line 305 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdint.h"






 
#line 45 "../Drivers/CMSIS/Include/core_cm7.h"

















 




 



 

 













#line 120 "../Drivers/CMSIS/Include/core_cm7.h"



 
#line 135 "../Drivers/CMSIS/Include/core_cm7.h"

#line 209 "../Drivers/CMSIS/Include/core_cm7.h"

#line 1 "../Drivers/CMSIS/Include/core_cmInstr.h"
 




 

























 












 



 

 
#line 1 "../Drivers/CMSIS/Include/cmsis_armcc.h"
 




 

























 










 



 

 
 





 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}






 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}






 
static __inline uint32_t __get_IPSR(void)
{
  register uint32_t __regIPSR          __asm("ipsr");
  return(__regIPSR);
}






 
static __inline uint32_t __get_APSR(void)
{
  register uint32_t __regAPSR          __asm("apsr");
  return(__regAPSR);
}






 
static __inline uint32_t __get_xPSR(void)
{
  register uint32_t __regXPSR          __asm("xpsr");
  return(__regXPSR);
}






 
static __inline uint32_t __get_PSP(void)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  return(__regProcessStackPointer);
}






 
static __inline void __set_PSP(uint32_t topOfProcStack)
{
  register uint32_t __regProcessStackPointer  __asm("psp");
  __regProcessStackPointer = topOfProcStack;
}






 
static __inline uint32_t __get_MSP(void)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  return(__regMainStackPointer);
}






 
static __inline void __set_MSP(uint32_t topOfMainStack)
{
  register uint32_t __regMainStackPointer     __asm("msp");
  __regMainStackPointer = topOfMainStack;
}






 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}






 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}








 







 







 
static __inline uint32_t  __get_BASEPRI(void)
{
  register uint32_t __regBasePri         __asm("basepri");
  return(__regBasePri);
}






 
static __inline void __set_BASEPRI(uint32_t basePri)
{
  register uint32_t __regBasePri         __asm("basepri");
  __regBasePri = (basePri & 0xFFU);
}







 
static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  register uint32_t __regBasePriMax      __asm("basepri_max");
  __regBasePriMax = (basePri & 0xFFU);
}






 
static __inline uint32_t __get_FAULTMASK(void)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  return(__regFaultMask);
}






 
static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  register uint32_t __regFaultMask       __asm("faultmask");
  __regFaultMask = (faultMask & (uint32_t)1);
}










 
static __inline uint32_t __get_FPSCR(void)
{

  register uint32_t __regfpscr         __asm("fpscr");
  return(__regfpscr);



}






 
static __inline void __set_FPSCR(uint32_t fpscr)
{

  register uint32_t __regfpscr         __asm("fpscr");
  __regfpscr = (fpscr);

}





 


 



 




 






 







 






 








 










 










 











 








 

__attribute__((section(".rev16_text"))) static __inline __asm uint32_t __REV16(uint32_t value)
{
  rev16 r0, r0
  bx lr
}







 

__attribute__((section(".revsh_text"))) static __inline __asm int32_t __REVSH(int32_t value)
{
  revsh r0, r0
  bx lr
}









 









 








 
#line 455 "../Drivers/CMSIS/Include/cmsis_armcc.h"







 










 












 












 














 














 














 










 









 









 









 

__attribute__((section(".rrx_text"))) static __inline __asm uint32_t __RRX(uint32_t value)
{
  rrx r0, r0
  bx lr
}








 








 








 








 








 








 




   


 



 



#line 720 "../Drivers/CMSIS/Include/cmsis_armcc.h"











 


#line 54 "../Drivers/CMSIS/Include/core_cmInstr.h"

 
#line 84 "../Drivers/CMSIS/Include/core_cmInstr.h"

   

#line 211 "../Drivers/CMSIS/Include/core_cm7.h"
#line 1 "../Drivers/CMSIS/Include/core_cmFunc.h"
 




 

























 












 



 

 
#line 54 "../Drivers/CMSIS/Include/core_cmFunc.h"

 
#line 84 "../Drivers/CMSIS/Include/core_cmFunc.h"

 

#line 212 "../Drivers/CMSIS/Include/core_cm7.h"
#line 1 "../Drivers/CMSIS/Include/core_cmSimd.h"
 




 

























 
















 



 

 
#line 58 "../Drivers/CMSIS/Include/core_cmSimd.h"

 
#line 88 "../Drivers/CMSIS/Include/core_cmSimd.h"

 






#line 213 "../Drivers/CMSIS/Include/core_cm7.h"
















 
#line 271 "../Drivers/CMSIS/Include/core_cm7.h"

 






 
#line 287 "../Drivers/CMSIS/Include/core_cm7.h"

 




 













 



 






 



 
typedef union
{
  struct
  {
    uint32_t _reserved0:16;               
    uint32_t GE:4;                        
    uint32_t _reserved1:7;                
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} APSR_Type;

 





















 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:23;               
  } b;                                    
  uint32_t w;                             
} IPSR_Type;

 






 
typedef union
{
  struct
  {
    uint32_t ISR:9;                       
    uint32_t _reserved0:7;                
    uint32_t GE:4;                        
    uint32_t _reserved1:4;                
    uint32_t T:1;                         
    uint32_t IT:2;                        
    uint32_t Q:1;                         
    uint32_t V:1;                         
    uint32_t C:1;                         
    uint32_t Z:1;                         
    uint32_t N:1;                         
  } b;                                    
  uint32_t w;                             
} xPSR_Type;

 






























 
typedef union
{
  struct
  {
    uint32_t nPRIV:1;                     
    uint32_t SPSEL:1;                     
    uint32_t FPCA:1;                      
    uint32_t _reserved0:29;               
  } b;                                    
  uint32_t w;                             
} CONTROL_Type;

 









 







 



 
typedef struct
{
  volatile uint32_t ISER[8U];                
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];                
        uint32_t RSERVED1[24U];
  volatile uint32_t ISPR[8U];                
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];                
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];                
        uint32_t RESERVED4[56U];
  volatile uint8_t  IP[240U];                
        uint32_t RESERVED5[644U];
  volatile  uint32_t STIR;                    
}  NVIC_Type;

 



 







 



 
typedef struct
{
  volatile const  uint32_t CPUID;                   
  volatile uint32_t ICSR;                    
  volatile uint32_t VTOR;                    
  volatile uint32_t AIRCR;                   
  volatile uint32_t SCR;                     
  volatile uint32_t CCR;                     
  volatile uint8_t  SHPR[12U];               
  volatile uint32_t SHCSR;                   
  volatile uint32_t CFSR;                    
  volatile uint32_t HFSR;                    
  volatile uint32_t DFSR;                    
  volatile uint32_t MMFAR;                   
  volatile uint32_t BFAR;                    
  volatile uint32_t AFSR;                    
  volatile const  uint32_t ID_PFR[2U];              
  volatile const  uint32_t ID_DFR;                  
  volatile const  uint32_t ID_AFR;                  
  volatile const  uint32_t ID_MFR[4U];              
  volatile const  uint32_t ID_ISAR[5U];             
        uint32_t RESERVED0[1U];
  volatile const  uint32_t CLIDR;                   
  volatile const  uint32_t CTR;                     
  volatile const  uint32_t CCSIDR;                  
  volatile uint32_t CSSELR;                  
  volatile uint32_t CPACR;                   
        uint32_t RESERVED3[93U];
  volatile  uint32_t STIR;                    
        uint32_t RESERVED4[15U];
  volatile const  uint32_t MVFR0;                   
  volatile const  uint32_t MVFR1;                   
  volatile const  uint32_t MVFR2;                   
        uint32_t RESERVED5[1U];
  volatile  uint32_t ICIALLU;                 
        uint32_t RESERVED6[1U];
  volatile  uint32_t ICIMVAU;                 
  volatile  uint32_t DCIMVAC;                 
  volatile  uint32_t DCISW;                   
  volatile  uint32_t DCCMVAU;                 
  volatile  uint32_t DCCMVAC;                 
  volatile  uint32_t DCCSW;                   
  volatile  uint32_t DCCIMVAC;                
  volatile  uint32_t DCCISW;                  
        uint32_t RESERVED7[6U];
  volatile uint32_t ITCMCR;                  
  volatile uint32_t DTCMCR;                  
  volatile uint32_t AHBPCR;                  
  volatile uint32_t CACR;                    
  volatile uint32_t AHBSCR;                  
        uint32_t RESERVED8[1U];
  volatile uint32_t ABFSR;                   
} SCB_Type;

 















 






























 



 





















 









 



























 










































 









 









 















 






 















 





















 






 



 






 






 






 












 












 






 









 









 


















 







 



 
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const  uint32_t ICTR;                    
  volatile uint32_t ACTLR;                   
} SCnSCB_Type;

 



 















 







 



 
typedef struct
{
  volatile uint32_t CTRL;                    
  volatile uint32_t LOAD;                    
  volatile uint32_t VAL;                     
  volatile const  uint32_t CALIB;                   
} SysTick_Type;

 












 



 



 









 







 



 
typedef struct
{
  volatile  union
  {
    volatile  uint8_t    u8;                  
    volatile  uint16_t   u16;                 
    volatile  uint32_t   u32;                 
  }  PORT [32U];                          
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;                     
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;                     
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;                     
        uint32_t RESERVED3[29U];
  volatile  uint32_t IWR;                     
  volatile const  uint32_t IRR;                     
  volatile uint32_t IMCR;                    
        uint32_t RESERVED4[43U];
  volatile  uint32_t LAR;                     
  volatile const  uint32_t LSR;                     
        uint32_t RESERVED5[6U];
  volatile const  uint32_t PID4;                    
  volatile const  uint32_t PID5;                    
  volatile const  uint32_t PID6;                    
  volatile const  uint32_t PID7;                    
  volatile const  uint32_t PID0;                    
  volatile const  uint32_t PID1;                    
  volatile const  uint32_t PID2;                    
  volatile const  uint32_t PID3;                    
  volatile const  uint32_t CID0;                    
  volatile const  uint32_t CID1;                    
  volatile const  uint32_t CID2;                    
  volatile const  uint32_t CID3;                    
} ITM_Type;

 



 



























 



 



 



 









   







 



 
typedef struct
{
  volatile uint32_t CTRL;                    
  volatile uint32_t CYCCNT;                  
  volatile uint32_t CPICNT;                  
  volatile uint32_t EXCCNT;                  
  volatile uint32_t SLEEPCNT;                
  volatile uint32_t LSUCNT;                  
  volatile uint32_t FOLDCNT;                 
  volatile const  uint32_t PCSR;                    
  volatile uint32_t COMP0;                   
  volatile uint32_t MASK0;                   
  volatile uint32_t FUNCTION0;               
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;                   
  volatile uint32_t MASK1;                   
  volatile uint32_t FUNCTION1;               
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;                   
  volatile uint32_t MASK2;                   
  volatile uint32_t FUNCTION2;               
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;                   
  volatile uint32_t MASK3;                   
  volatile uint32_t FUNCTION3;               
        uint32_t RESERVED3[981U];
  volatile  uint32_t LAR;                     
  volatile const  uint32_t LSR;                     
} DWT_Type;

 






















































 



 



 



 



 



 



 



























   







 



 
typedef struct
{
  volatile uint32_t SSPSR;                   
  volatile uint32_t CSPSR;                   
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;                    
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;                    
        uint32_t RESERVED2[131U];
  volatile const  uint32_t FFSR;                    
  volatile uint32_t FFCR;                    
  volatile const  uint32_t FSCR;                    
        uint32_t RESERVED3[759U];
  volatile const  uint32_t TRIGGER;                 
  volatile const  uint32_t FIFO0;                   
  volatile const  uint32_t ITATBCTR2;               
        uint32_t RESERVED4[1U];
  volatile const  uint32_t ITATBCTR0;               
  volatile const  uint32_t FIFO1;                   
  volatile uint32_t ITCTRL;                  
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;                
  volatile uint32_t CLAIMCLR;                
        uint32_t RESERVED7[8U];
  volatile const  uint32_t DEVID;                   
  volatile const  uint32_t DEVTYPE;                 
} TPI_Type;

 



 



 












 






 



 





















 



 





















 



 



 


















 






   








 



 
typedef struct
{
  volatile const  uint32_t TYPE;                    
  volatile uint32_t CTRL;                    
  volatile uint32_t RNR;                     
  volatile uint32_t RBAR;                    
  volatile uint32_t RASR;                    
  volatile uint32_t RBAR_A1;                 
  volatile uint32_t RASR_A1;                 
  volatile uint32_t RBAR_A2;                 
  volatile uint32_t RASR_A2;                 
  volatile uint32_t RBAR_A3;                 
  volatile uint32_t RASR_A3;                 
} MPU_Type;

 









 









 



 









 






























 









 



 
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile uint32_t FPCCR;                   
  volatile uint32_t FPCAR;                   
  volatile uint32_t FPDSCR;                  
  volatile const  uint32_t MVFR0;                   
  volatile const  uint32_t MVFR1;                   
  volatile const  uint32_t MVFR2;                   
} FPU_Type;

 



























 



 












 
























 












 

 








 



 
typedef struct
{
  volatile uint32_t DHCSR;                   
  volatile  uint32_t DCRSR;                   
  volatile uint32_t DCRDR;                   
  volatile uint32_t DEMCR;                   
} CoreDebug_Type;

 




































 






 







































 







 






 







 


 







 

 
#line 1749 "../Drivers/CMSIS/Include/core_cm7.h"

#line 1758 "../Drivers/CMSIS/Include/core_cm7.h"











 










 


 



 





 









 
static __inline void NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);              

  reg_value  =  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;                                                    
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));  
  reg_value  =  (reg_value                                   |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U)                      );               
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR =  reg_value;
}






 
static __inline uint32_t NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}






 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}






 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}








 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
}






 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}






 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)(int32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
}








 
static __inline uint32_t NVIC_GetActive(IRQn_Type IRQn)
{
  return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)(int32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
}








 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) < 0)
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)(int32_t)IRQn)]                = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
}










 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) < 0)
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[(((uint32_t)(int32_t)IRQn) & 0xFUL)-4UL] >> (8U - 4)));
  }
  else
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)(int32_t)IRQn)]                >> (8U - 4)));
  }
}












 
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);    
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority     & (uint32_t)((1UL << (SubPriorityBits    )) - 1UL)))
         );
}












 
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);    
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits     = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority     = (Priority                   ) & (uint32_t)((1UL << (SubPriorityBits    )) - 1UL);
}





 
static __inline void NVIC_SystemReset(void)
{
  do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);                                                          
 
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR  = (uint32_t)((0x5FAUL << 16U)    |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U)    );          
  do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);                                                           

  for(;;)                                                            
  {
    __nop();
  }
}

 


 





 








 
static __inline uint32_t SCB_GetFPUType(void)
{
  uint32_t mvfr0;

  mvfr0 = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->MVFR0;
  if        ((mvfr0 & 0x00000FF0UL) == 0x220UL)
  {
    return 2UL;            
  }
  else if ((mvfr0 & 0x00000FF0UL) == 0x020UL)
  {
    return 1UL;            
  }
  else
  {
    return 0UL;            
  }
}


 



 





 

 







 
static __inline void SCB_EnableICache (void)
{

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;                      
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR |=  (uint32_t)(1UL << 17U);   
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}





 
static __inline void SCB_DisableICache (void)
{

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR &= ~(uint32_t)(1UL << 17U);   
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;                      
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}





 
static __inline void SCB_InvalidateICache (void)
{

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}





 
static __inline void SCB_EnableDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = (0U << 1U) | 0U;           
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;

                                             
    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U))  );

          __schedule_barrier();

      } while (ways--);
    } while(sets--);
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR |=  (uint32_t)(1UL << 16U);   

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}





 
static __inline void SCB_DisableDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = (0U << 1U) | 0U;           
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR &= ~(uint32_t)(1UL << 16U);   

                                             
    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                       ((ways << 30U) & (3UL << 30U))  );

          __schedule_barrier();

      } while (ways--);
    } while(sets--);

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}





 
static __inline void SCB_InvalidateDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = (0U << 1U) | 0U;           
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;

                                             
    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U))  );

          __schedule_barrier();

      } while (ways--);
    } while(sets--);

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}





 
static __inline void SCB_CleanDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = (0U << 1U) | 0U;           
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;

                                             
    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCSW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U))  );

          __schedule_barrier();

      } while (ways--);
    } while(sets--);

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}





 
static __inline void SCB_CleanInvalidateDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = (0U << 1U) | 0U;           
    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;

                                             
    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                       ((ways << 30U) & (3UL << 30U))  );

          __schedule_barrier();

      } while (ways--);
    } while(sets--);

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}







 
static __inline void SCB_InvalidateDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t)addr;
     int32_t linesize = 32U;                 

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCIMVAC = op_addr;
      op_addr += linesize;
      op_size -= linesize;
    }

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}







 
static __inline void SCB_CleanDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t) addr;
     int32_t linesize = 32U;                 

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCMVAC = op_addr;
      op_addr += linesize;
      op_size -= linesize;
    }

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}







 
static __inline void SCB_CleanInvalidateDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

     int32_t op_size = dsize;
    uint32_t op_addr = (uint32_t) addr;
     int32_t linesize = 32U;                 

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);

    while (op_size > 0) {
      ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCIMVAC = op_addr;
      op_addr += linesize;
      op_size -= linesize;
    }

    do { __schedule_barrier(); __dsb(0xF); __schedule_barrier(); } while (0U);
    do { __schedule_barrier(); __isb(0xF); __schedule_barrier(); } while (0U);

}


 



 





 













 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);                                                    
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD  = (uint32_t)(ticks - 1UL);                          
  NVIC_SetPriority (SysTick_IRQn, (1UL << 4) - 1UL);  
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL   = 0UL;                                              
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL  = (1UL << 2U) |
                   (1UL << 1U)   |
                   (1UL );                          
  return (0UL);                                                      
}



 



 





 

extern volatile int32_t ITM_RxBuffer;                     










 
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&       
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL               ) != 0UL)   )      
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}







 
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;                            

  if (ITM_RxBuffer != 0x5AA55AA5U)
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = 0x5AA55AA5U;        
  }

  return (ch);
}







 
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == 0x5AA55AA5U)
  {
    return (0);                               
  }
  else
  {
    return (1);                               
  }
}

 










#line 202 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


#line 1 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/system_stm32f7xx.h"

































 



 



   
  


 









 



 




 
  






 
extern uint32_t SystemCoreClock;           

extern const uint8_t  AHBPrescTable[16];     
extern const uint8_t  APBPrescTable[8];      




 



 



 



 



 



 
  
extern void SystemInit(void);
extern void SystemCoreClockUpdate(void);


 









 
  


   
 
#line 205 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
#line 206 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 



 

typedef struct
{
  volatile uint32_t SR;      
  volatile uint32_t CR1;     
  volatile uint32_t CR2;     
  volatile uint32_t SMPR1;   
  volatile uint32_t SMPR2;   
  volatile uint32_t JOFR1;   
  volatile uint32_t JOFR2;   
  volatile uint32_t JOFR3;   
  volatile uint32_t JOFR4;   
  volatile uint32_t HTR;     
  volatile uint32_t LTR;     
  volatile uint32_t SQR1;    
  volatile uint32_t SQR2;    
  volatile uint32_t SQR3;    
  volatile uint32_t JSQR;    
  volatile uint32_t JDR1;    
  volatile uint32_t JDR2;    
  volatile uint32_t JDR3;    
  volatile uint32_t JDR4;    
  volatile uint32_t DR;      
} ADC_TypeDef;

typedef struct
{
  volatile uint32_t CSR;     
  volatile uint32_t CCR;     
  volatile uint32_t CDR;    
 
} ADC_Common_TypeDef;




 

typedef struct
{
  volatile uint32_t TIR;   
  volatile uint32_t TDTR;  
  volatile uint32_t TDLR;  
  volatile uint32_t TDHR;  
} CAN_TxMailBox_TypeDef;



 

typedef struct
{
  volatile uint32_t RIR;   
  volatile uint32_t RDTR;  
  volatile uint32_t RDLR;  
  volatile uint32_t RDHR;  
} CAN_FIFOMailBox_TypeDef;



 

typedef struct
{
  volatile uint32_t FR1;  
  volatile uint32_t FR2;  
} CAN_FilterRegister_TypeDef;



 

typedef struct
{
  volatile uint32_t              MCR;                  
  volatile uint32_t              MSR;                  
  volatile uint32_t              TSR;                  
  volatile uint32_t              RF0R;                 
  volatile uint32_t              RF1R;                 
  volatile uint32_t              IER;                  
  volatile uint32_t              ESR;                  
  volatile uint32_t              BTR;                  
  uint32_t                   RESERVED0[88];        
  CAN_TxMailBox_TypeDef      sTxMailBox[3];        
  CAN_FIFOMailBox_TypeDef    sFIFOMailBox[2];      
  uint32_t                   RESERVED1[12];        
  volatile uint32_t              FMR;                  
  volatile uint32_t              FM1R;                 
  uint32_t                   RESERVED2;            
  volatile uint32_t              FS1R;                 
  uint32_t                   RESERVED3;            
  volatile uint32_t              FFA1R;                
  uint32_t                   RESERVED4;            
  volatile uint32_t              FA1R;                 
  uint32_t                   RESERVED5[8];         
  CAN_FilterRegister_TypeDef sFilterRegister[28];  
} CAN_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;            
  volatile uint32_t CFGR;          
  volatile uint32_t TXDR;          
  volatile uint32_t RXDR;          
  volatile uint32_t ISR;           
  volatile uint32_t IER;           
}CEC_TypeDef;



 

typedef struct
{
  volatile uint32_t  DR;           
  volatile uint8_t   IDR;          
  uint8_t        RESERVED0;    
  uint16_t       RESERVED1;    
  volatile uint32_t  CR;           
  uint32_t       RESERVED2;    
  volatile uint32_t  INIT;         
  volatile uint32_t  POL;          
} CRC_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;        
  volatile uint32_t SWTRIGR;   
  volatile uint32_t DHR12R1;   
  volatile uint32_t DHR12L1;   
  volatile uint32_t DHR8R1;    
  volatile uint32_t DHR12R2;   
  volatile uint32_t DHR12L2;   
  volatile uint32_t DHR8R2;    
  volatile uint32_t DHR12RD;   
  volatile uint32_t DHR12LD;   
  volatile uint32_t DHR8RD;    
  volatile uint32_t DOR1;      
  volatile uint32_t DOR2;      
  volatile uint32_t SR;        
} DAC_TypeDef;



 
typedef struct
{
  volatile uint32_t FLTCR1;          
  volatile uint32_t FLTCR2;          
  volatile uint32_t FLTISR;          
  volatile uint32_t FLTICR;          
  volatile uint32_t FLTJCHGR;        
  volatile uint32_t FLTFCR;          
  volatile uint32_t FLTJDATAR;       
  volatile uint32_t FLTRDATAR;       
  volatile uint32_t FLTAWHTR;        
  volatile uint32_t FLTAWLTR;        
  volatile uint32_t FLTAWSR;         
  volatile uint32_t FLTAWCFR;        
  volatile uint32_t FLTEXMAX;        
  volatile uint32_t FLTEXMIN;        
  volatile uint32_t FLTCNVTIMR;      
} DFSDM_Filter_TypeDef;



 
typedef struct
{
  volatile uint32_t CHCFGR1;      
  volatile uint32_t CHCFGR2;      
  volatile uint32_t CHAWSCDR;    
 
  volatile uint32_t CHWDATAR;     
  volatile uint32_t CHDATINR;     
} DFSDM_Channel_TypeDef;



 

typedef struct
{
  volatile uint32_t IDCODE;   
  volatile uint32_t CR;       
  volatile uint32_t APB1FZ;   
  volatile uint32_t APB2FZ;   
}DBGMCU_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;        
  volatile uint32_t SR;        
  volatile uint32_t RISR;      
  volatile uint32_t IER;       
  volatile uint32_t MISR;      
  volatile uint32_t ICR;       
  volatile uint32_t ESCR;      
  volatile uint32_t ESUR;      
  volatile uint32_t CWSTRTR;   
  volatile uint32_t CWSIZER;   
  volatile uint32_t DR;        
} DCMI_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;      
  volatile uint32_t NDTR;    
  volatile uint32_t PAR;     
  volatile uint32_t M0AR;    
  volatile uint32_t M1AR;    
  volatile uint32_t FCR;     
} DMA_Stream_TypeDef;

typedef struct
{
  volatile uint32_t LISR;    
  volatile uint32_t HISR;    
  volatile uint32_t LIFCR;   
  volatile uint32_t HIFCR;   
} DMA_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;             
  volatile uint32_t ISR;            
  volatile uint32_t IFCR;           
  volatile uint32_t FGMAR;          
  volatile uint32_t FGOR;           
  volatile uint32_t BGMAR;          
  volatile uint32_t BGOR;           
  volatile uint32_t FGPFCCR;        
  volatile uint32_t FGCOLR;         
  volatile uint32_t BGPFCCR;        
  volatile uint32_t BGCOLR;         
  volatile uint32_t FGCMAR;         
  volatile uint32_t BGCMAR;         
  volatile uint32_t OPFCCR;         
  volatile uint32_t OCOLR;          
  volatile uint32_t OMAR;           
  volatile uint32_t OOR;            
  volatile uint32_t NLR;            
  volatile uint32_t LWR;            
  volatile uint32_t AMTCR;          
  uint32_t      RESERVED[236];  
  volatile uint32_t FGCLUT[256];    
  volatile uint32_t BGCLUT[256];    
} DMA2D_TypeDef;




 

typedef struct
{
  volatile uint32_t MACCR;
  volatile uint32_t MACFFR;
  volatile uint32_t MACHTHR;
  volatile uint32_t MACHTLR;
  volatile uint32_t MACMIIAR;
  volatile uint32_t MACMIIDR;
  volatile uint32_t MACFCR;
  volatile uint32_t MACVLANTR;              
  uint32_t      RESERVED0[2];
  volatile uint32_t MACRWUFFR;              
  volatile uint32_t MACPMTCSR;
  uint32_t      RESERVED1;
  volatile uint32_t MACDBGR;
  volatile uint32_t MACSR;                  
  volatile uint32_t MACIMR;
  volatile uint32_t MACA0HR;
  volatile uint32_t MACA0LR;
  volatile uint32_t MACA1HR;
  volatile uint32_t MACA1LR;
  volatile uint32_t MACA2HR;
  volatile uint32_t MACA2LR;
  volatile uint32_t MACA3HR;
  volatile uint32_t MACA3LR;                
  uint32_t      RESERVED2[40];
  volatile uint32_t MMCCR;                  
  volatile uint32_t MMCRIR;
  volatile uint32_t MMCTIR;
  volatile uint32_t MMCRIMR;
  volatile uint32_t MMCTIMR;                
  uint32_t      RESERVED3[14];
  volatile uint32_t MMCTGFSCCR;             
  volatile uint32_t MMCTGFMSCCR;
  uint32_t      RESERVED4[5];
  volatile uint32_t MMCTGFCR;
  uint32_t      RESERVED5[10];
  volatile uint32_t MMCRFCECR;
  volatile uint32_t MMCRFAECR;
  uint32_t      RESERVED6[10];
  volatile uint32_t MMCRGUFCR;
  uint32_t      RESERVED7[334];
  volatile uint32_t PTPTSCR;
  volatile uint32_t PTPSSIR;
  volatile uint32_t PTPTSHR;
  volatile uint32_t PTPTSLR;
  volatile uint32_t PTPTSHUR;
  volatile uint32_t PTPTSLUR;
  volatile uint32_t PTPTSAR;
  volatile uint32_t PTPTTHR;
  volatile uint32_t PTPTTLR;
  volatile uint32_t RESERVED8;
  volatile uint32_t PTPTSSR;
  uint32_t      RESERVED9[565];
  volatile uint32_t DMABMR;
  volatile uint32_t DMATPDR;
  volatile uint32_t DMARPDR;
  volatile uint32_t DMARDLAR;
  volatile uint32_t DMATDLAR;
  volatile uint32_t DMASR;
  volatile uint32_t DMAOMR;
  volatile uint32_t DMAIER;
  volatile uint32_t DMAMFBOCR;
  volatile uint32_t DMARSWTR;
  uint32_t      RESERVED10[8];
  volatile uint32_t DMACHTDR;
  volatile uint32_t DMACHRDR;
  volatile uint32_t DMACHTBAR;
  volatile uint32_t DMACHRBAR;
} ETH_TypeDef;



 

typedef struct
{
  volatile uint32_t IMR;     
  volatile uint32_t EMR;     
  volatile uint32_t RTSR;    
  volatile uint32_t FTSR;    
  volatile uint32_t SWIER;   
  volatile uint32_t PR;      
} EXTI_TypeDef;



 

typedef struct
{
  volatile uint32_t ACR;       
  volatile uint32_t KEYR;      
  volatile uint32_t OPTKEYR;   
  volatile uint32_t SR;        
  volatile uint32_t CR;        
  volatile uint32_t OPTCR;     
  volatile uint32_t OPTCR1;    
} FLASH_TypeDef;





 

typedef struct
{
  volatile uint32_t BTCR[8];     
} FMC_Bank1_TypeDef;



 

typedef struct
{
  volatile uint32_t BWTR[7];     
} FMC_Bank1E_TypeDef;



 

typedef struct
{
  volatile uint32_t PCR;         
  volatile uint32_t SR;          
  volatile uint32_t PMEM;        
  volatile uint32_t PATT;        
  uint32_t      RESERVED0;   
  volatile uint32_t ECCR;        
} FMC_Bank3_TypeDef;



 

typedef struct
{
  volatile uint32_t SDCR[2];         
  volatile uint32_t SDTR[2];         
  volatile uint32_t SDCMR;        
  volatile uint32_t SDRTR;        
  volatile uint32_t SDSR;         
} FMC_Bank5_6_TypeDef;




 

typedef struct
{
  volatile uint32_t MODER;     
  volatile uint32_t OTYPER;    
  volatile uint32_t OSPEEDR;   
  volatile uint32_t PUPDR;     
  volatile uint32_t IDR;       
  volatile uint32_t ODR;       
  volatile uint32_t BSRR;      
  volatile uint32_t LCKR;      
  volatile uint32_t AFR[2];    
} GPIO_TypeDef;



 

typedef struct
{
  volatile uint32_t MEMRMP;        
  volatile uint32_t PMC;           
  volatile uint32_t EXTICR[4];     
  uint32_t      RESERVED;      
  volatile uint32_t CBR;           
  volatile uint32_t CMPCR;         
} SYSCFG_TypeDef;



 

typedef struct
{
  volatile uint32_t CR1;       
  volatile uint32_t CR2;       
  volatile uint32_t OAR1;      
  volatile uint32_t OAR2;      
  volatile uint32_t TIMINGR;   
  volatile uint32_t TIMEOUTR;  
  volatile uint32_t ISR;       
  volatile uint32_t ICR;       
  volatile uint32_t PECR;      
  volatile uint32_t RXDR;      
  volatile uint32_t TXDR;      
} I2C_TypeDef;



 

typedef struct
{
  volatile uint32_t KR;    
  volatile uint32_t PR;    
  volatile uint32_t RLR;   
  volatile uint32_t SR;    
  volatile uint32_t WINR;  
} IWDG_TypeDef;




 

typedef struct
{
  uint32_t      RESERVED0[2];   
  volatile uint32_t SSCR;           
  volatile uint32_t BPCR;           
  volatile uint32_t AWCR;           
  volatile uint32_t TWCR;           
  volatile uint32_t GCR;            
  uint32_t      RESERVED1[2];   
  volatile uint32_t SRCR;           
  uint32_t      RESERVED2[1];   
  volatile uint32_t BCCR;           
  uint32_t      RESERVED3[1];   
  volatile uint32_t IER;            
  volatile uint32_t ISR;            
  volatile uint32_t ICR;            
  volatile uint32_t LIPCR;          
  volatile uint32_t CPSR;           
  volatile uint32_t CDSR;          
} LTDC_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;             
  volatile uint32_t WHPCR;          
  volatile uint32_t WVPCR;          
  volatile uint32_t CKCR;           
  volatile uint32_t PFCR;           
  volatile uint32_t CACR;           
  volatile uint32_t DCCR;           
  volatile uint32_t BFCR;           
  uint32_t      RESERVED0[2];   
  volatile uint32_t CFBAR;          
  volatile uint32_t CFBLR;          
  volatile uint32_t CFBLNR;         
  uint32_t      RESERVED1[3];   
  volatile uint32_t CLUTWR;         

} LTDC_Layer_TypeDef;



 

typedef struct
{
  volatile uint32_t CR1;    
  volatile uint32_t CSR1;   
  volatile uint32_t CR2;    
  volatile uint32_t CSR2;   
} PWR_TypeDef;




 

typedef struct
{
  volatile uint32_t CR;             
  volatile uint32_t PLLCFGR;        
  volatile uint32_t CFGR;           
  volatile uint32_t CIR;            
  volatile uint32_t AHB1RSTR;       
  volatile uint32_t AHB2RSTR;       
  volatile uint32_t AHB3RSTR;       
  uint32_t      RESERVED0;      
  volatile uint32_t APB1RSTR;       
  volatile uint32_t APB2RSTR;       
  uint32_t      RESERVED1[2];   
  volatile uint32_t AHB1ENR;        
  volatile uint32_t AHB2ENR;        
  volatile uint32_t AHB3ENR;        
  uint32_t      RESERVED2;      
  volatile uint32_t APB1ENR;        
  volatile uint32_t APB2ENR;        
  uint32_t      RESERVED3[2];   
  volatile uint32_t AHB1LPENR;      
  volatile uint32_t AHB2LPENR;      
  volatile uint32_t AHB3LPENR;      
  uint32_t      RESERVED4;      
  volatile uint32_t APB1LPENR;      
  volatile uint32_t APB2LPENR;      
  uint32_t      RESERVED5[2];   
  volatile uint32_t BDCR;           
  volatile uint32_t CSR;            
  uint32_t      RESERVED6[2];   
  volatile uint32_t SSCGR;          
  volatile uint32_t PLLI2SCFGR;     
  volatile uint32_t PLLSAICFGR;     
  volatile uint32_t DCKCFGR1;       
  volatile uint32_t DCKCFGR2;       

} RCC_TypeDef;



 

typedef struct
{
  volatile uint32_t TR;          
  volatile uint32_t DR;          
  volatile uint32_t CR;          
  volatile uint32_t ISR;         
  volatile uint32_t PRER;        
  volatile uint32_t WUTR;        
       uint32_t reserved;    
  volatile uint32_t ALRMAR;      
  volatile uint32_t ALRMBR;      
  volatile uint32_t WPR;         
  volatile uint32_t SSR;         
  volatile uint32_t SHIFTR;      
  volatile uint32_t TSTR;        
  volatile uint32_t TSDR;        
  volatile uint32_t TSSSR;       
  volatile uint32_t CALR;        
  volatile uint32_t TAMPCR;      
  volatile uint32_t ALRMASSR;    
  volatile uint32_t ALRMBSSR;    
  volatile uint32_t OR;          
  volatile uint32_t BKP0R;       
  volatile uint32_t BKP1R;       
  volatile uint32_t BKP2R;       
  volatile uint32_t BKP3R;       
  volatile uint32_t BKP4R;       
  volatile uint32_t BKP5R;       
  volatile uint32_t BKP6R;       
  volatile uint32_t BKP7R;       
  volatile uint32_t BKP8R;       
  volatile uint32_t BKP9R;       
  volatile uint32_t BKP10R;      
  volatile uint32_t BKP11R;      
  volatile uint32_t BKP12R;      
  volatile uint32_t BKP13R;      
  volatile uint32_t BKP14R;      
  volatile uint32_t BKP15R;      
  volatile uint32_t BKP16R;      
  volatile uint32_t BKP17R;      
  volatile uint32_t BKP18R;      
  volatile uint32_t BKP19R;      
  volatile uint32_t BKP20R;      
  volatile uint32_t BKP21R;      
  volatile uint32_t BKP22R;      
  volatile uint32_t BKP23R;      
  volatile uint32_t BKP24R;      
  volatile uint32_t BKP25R;      
  volatile uint32_t BKP26R;      
  volatile uint32_t BKP27R;      
  volatile uint32_t BKP28R;      
  volatile uint32_t BKP29R;      
  volatile uint32_t BKP30R;      
  volatile uint32_t BKP31R;      
} RTC_TypeDef;




 

typedef struct
{
  volatile uint32_t GCR;       
} SAI_TypeDef;

typedef struct
{
  volatile uint32_t CR1;       
  volatile uint32_t CR2;       
  volatile uint32_t FRCR;      
  volatile uint32_t SLOTR;     
  volatile uint32_t IMR;       
  volatile uint32_t SR;        
  volatile uint32_t CLRFR;     
  volatile uint32_t DR;        
} SAI_Block_TypeDef;



 

typedef struct
{
  volatile uint32_t   CR;            
  volatile uint32_t   IMR;           
  volatile uint32_t   SR;            
  volatile uint32_t   IFCR;          
  volatile uint32_t   DR;            
  volatile uint32_t   CSR;           
  volatile uint32_t   DIR;           
} SPDIFRX_TypeDef;



 

typedef struct
{
  volatile uint32_t POWER;           
  volatile uint32_t CLKCR;           
  volatile uint32_t ARG;             
  volatile uint32_t CMD;             
  volatile const uint32_t  RESPCMD;         
  volatile const uint32_t  RESP1;           
  volatile const uint32_t  RESP2;           
  volatile const uint32_t  RESP3;           
  volatile const uint32_t  RESP4;           
  volatile uint32_t DTIMER;          
  volatile uint32_t DLEN;            
  volatile uint32_t DCTRL;           
  volatile const uint32_t  DCOUNT;          
  volatile const uint32_t  STA;             
  volatile uint32_t ICR;             
  volatile uint32_t MASK;            
  uint32_t      RESERVED0[2];    
  volatile const uint32_t  FIFOCNT;         
  uint32_t      RESERVED1[13];   
  volatile uint32_t FIFO;            
} SDMMC_TypeDef;



 

typedef struct
{
  volatile uint32_t CR1;         
  volatile uint32_t CR2;         
  volatile uint32_t SR;          
  volatile uint32_t DR;          
  volatile uint32_t CRCPR;       
  volatile uint32_t RXCRCR;      
  volatile uint32_t TXCRCR;      
  volatile uint32_t I2SCFGR;     
  volatile uint32_t I2SPR;       
} SPI_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;        
  volatile uint32_t DCR;       
  volatile uint32_t SR;        
  volatile uint32_t FCR;       
  volatile uint32_t DLR;       
  volatile uint32_t CCR;       
  volatile uint32_t AR;        
  volatile uint32_t ABR;       
  volatile uint32_t DR;        
  volatile uint32_t PSMKR;     
  volatile uint32_t PSMAR;     
  volatile uint32_t PIR;       
  volatile uint32_t LPTR;      
} QUADSPI_TypeDef;



 

typedef struct
{
  volatile uint32_t CR1;          
  volatile uint32_t CR2;          
  volatile uint32_t SMCR;         
  volatile uint32_t DIER;         
  volatile uint32_t SR;           
  volatile uint32_t EGR;          
  volatile uint32_t CCMR1;        
  volatile uint32_t CCMR2;        
  volatile uint32_t CCER;         
  volatile uint32_t CNT;          
  volatile uint32_t PSC;          
  volatile uint32_t ARR;          
  volatile uint32_t RCR;          
  volatile uint32_t CCR1;         
  volatile uint32_t CCR2;         
  volatile uint32_t CCR3;         
  volatile uint32_t CCR4;         
  volatile uint32_t BDTR;         
  volatile uint32_t DCR;          
  volatile uint32_t DMAR;         
  volatile uint32_t OR;           
  volatile uint32_t CCMR3;        
  volatile uint32_t CCR5;         
  volatile uint32_t CCR6;         
  volatile uint32_t AF1;          
  volatile uint32_t AF2;          

} TIM_TypeDef;



 
typedef struct
{
  volatile uint32_t ISR;       
  volatile uint32_t ICR;       
  volatile uint32_t IER;       
  volatile uint32_t CFGR;      
  volatile uint32_t CR;        
  volatile uint32_t CMP;       
  volatile uint32_t ARR;       
  volatile uint32_t CNT;       
} LPTIM_TypeDef;




 

typedef struct
{
  volatile uint32_t CR1;     
  volatile uint32_t CR2;     
  volatile uint32_t CR3;     
  volatile uint32_t BRR;     
  volatile uint32_t GTPR;    
  volatile uint32_t RTOR;    
  volatile uint32_t RQR;     
  volatile uint32_t ISR;     
  volatile uint32_t ICR;     
  volatile uint32_t RDR;     
  volatile uint32_t TDR;     
} USART_TypeDef;




 

typedef struct
{
  volatile uint32_t CR;    
  volatile uint32_t CFR;   
  volatile uint32_t SR;    
} WWDG_TypeDef;




 

typedef struct
{
  volatile uint32_t CR;   
  volatile uint32_t SR;   
  volatile uint32_t DR;   
} RNG_TypeDef;



 



 
typedef struct
{
 volatile uint32_t GOTGCTL;                
  volatile uint32_t GOTGINT;               
  volatile uint32_t GAHBCFG;               
  volatile uint32_t GUSBCFG;               
  volatile uint32_t GRSTCTL;               
  volatile uint32_t GINTSTS;               
  volatile uint32_t GINTMSK;               
  volatile uint32_t GRXSTSR;               
  volatile uint32_t GRXSTSP;               
  volatile uint32_t GRXFSIZ;               
  volatile uint32_t DIEPTXF0_HNPTXFSIZ;    
  volatile uint32_t HNPTXSTS;              
  uint32_t Reserved30[2];              
  volatile uint32_t GCCFG;                 
  volatile uint32_t CID;                   
  uint32_t  Reserved5[3];              
  volatile uint32_t GHWCFG3;               
  uint32_t  Reserved6;                 
  volatile uint32_t GLPMCFG;               
  volatile uint32_t GPWRDN;                
  volatile uint32_t GDFIFOCFG;             
   volatile uint32_t GADPCTL;              
    uint32_t  Reserved43[39];          
  volatile uint32_t HPTXFSIZ;              
  volatile uint32_t DIEPTXF[0x0F];         
} USB_OTG_GlobalTypeDef;




 
typedef struct
{
  volatile uint32_t DCFG;             
  volatile uint32_t DCTL;             
  volatile uint32_t DSTS;             
  uint32_t Reserved0C;            
  volatile uint32_t DIEPMSK;          
  volatile uint32_t DOEPMSK;          
  volatile uint32_t DAINT;            
  volatile uint32_t DAINTMSK;         
  uint32_t  Reserved20;           
  uint32_t Reserved9;             
  volatile uint32_t DVBUSDIS;         
  volatile uint32_t DVBUSPULSE;       
  volatile uint32_t DTHRCTL;          
  volatile uint32_t DIEPEMPMSK;       
  volatile uint32_t DEACHINT;         
  volatile uint32_t DEACHMSK;         
  uint32_t Reserved40;            
  volatile uint32_t DINEP1MSK;        
  uint32_t  Reserved44[15];       
  volatile uint32_t DOUTEP1MSK;       
} USB_OTG_DeviceTypeDef;




 
typedef struct
{
  volatile uint32_t DIEPCTL;            
  uint32_t Reserved04;              
  volatile uint32_t DIEPINT;            
  uint32_t Reserved0C;              
  volatile uint32_t DIEPTSIZ;           
  volatile uint32_t DIEPDMA;            
  volatile uint32_t DTXFSTS;            
  uint32_t Reserved18;              
} USB_OTG_INEndpointTypeDef;




 
typedef struct
{
  volatile uint32_t DOEPCTL;        
  uint32_t Reserved04;          
  volatile uint32_t DOEPINT;        
  uint32_t Reserved0C;          
  volatile uint32_t DOEPTSIZ;       
  volatile uint32_t DOEPDMA;        
  uint32_t Reserved18[2];       
} USB_OTG_OUTEndpointTypeDef;




 
typedef struct
{
  volatile uint32_t HCFG;              
  volatile uint32_t HFIR;              
  volatile uint32_t HFNUM;             
  uint32_t Reserved40C;            
  volatile uint32_t HPTXSTS;           
  volatile uint32_t HAINT;             
  volatile uint32_t HAINTMSK;          
} USB_OTG_HostTypeDef;



 
typedef struct
{
  volatile uint32_t HCCHAR;            
  volatile uint32_t HCSPLT;            
  volatile uint32_t HCINT;             
  volatile uint32_t HCINTMSK;          
  volatile uint32_t HCTSIZ;            
  volatile uint32_t HCDMA;             
  uint32_t Reserved[2];            
} USB_OTG_HostChannelTypeDef;


 



 
typedef struct
{
  volatile uint32_t CONFR0;           
  volatile uint32_t CONFR1;           
  volatile uint32_t CONFR2;           
  volatile uint32_t CONFR3;           
  volatile uint32_t CONFR4;           
  volatile uint32_t CONFR5;           
  volatile uint32_t CONFR6;           
  volatile uint32_t CONFR7;           
  uint32_t  Reserved20[4];        
  volatile uint32_t CR;               
  volatile uint32_t SR;               
  volatile uint32_t CFR;              
  uint32_t  Reserved3c;           
  volatile uint32_t DIR;              
  volatile uint32_t DOR;              
  uint32_t  Reserved48[2];        
  volatile uint32_t QMEM0[16];        
  volatile uint32_t QMEM1[16];        
  volatile uint32_t QMEM2[16];        
  volatile uint32_t QMEM3[16];        
  volatile uint32_t HUFFMIN[16];      
  volatile uint32_t HUFFBASE[32];     
  volatile uint32_t HUFFSYMB[84];     
  volatile uint32_t DHTMEM[103];      
  uint32_t  Reserved4FC;          
  volatile uint32_t HUFFENC_AC0[88];  
  volatile uint32_t HUFFENC_AC1[88];  
  volatile uint32_t HUFFENC_DC0[8];   
  volatile uint32_t HUFFENC_DC1[8];   

} JPEG_TypeDef;



 

typedef struct
{
  volatile uint32_t CR;                
  volatile uint32_t WRFR;              
  volatile uint32_t CWRFR;             
  volatile uint32_t RDFR;              
  volatile uint32_t CRDFR;             
  volatile uint32_t SR;                
  volatile uint32_t CLRFR;             
  uint32_t RESERVED0[57];          
  volatile uint32_t DINR0;             
  volatile uint32_t DINR1;             
  volatile uint32_t DINR2;             
  volatile uint32_t DINR3;             
  volatile uint32_t DINR4;             
  volatile uint32_t DINR5;             
  volatile uint32_t DINR6;             
  volatile uint32_t DINR7;             
  volatile uint32_t DINR8;             
  volatile uint32_t DINR9;             
  volatile uint32_t DINR10;            
  volatile uint32_t DINR11;            
  volatile uint32_t DINR12;            
  volatile uint32_t DINR13;            
  volatile uint32_t DINR14;            
  volatile uint32_t DINR15;            
  volatile uint32_t DINR16;            
  volatile uint32_t DINR17;            
  volatile uint32_t DINR18;            
  volatile uint32_t DINR19;            
  volatile uint32_t DINR20;            
  volatile uint32_t DINR21;            
  volatile uint32_t DINR22;            
  volatile uint32_t DINR23;            
  volatile uint32_t DINR24;            
  volatile uint32_t DINR25;            
  volatile uint32_t DINR26;            
  volatile uint32_t DINR27;            
  volatile uint32_t DINR28;            
  volatile uint32_t DINR29;            
  volatile uint32_t DINR30;            
  volatile uint32_t DINR31;            
  volatile uint32_t DOUTR0;            
  volatile uint32_t DOUTR1;            
  volatile uint32_t DOUTR2;            
  volatile uint32_t DOUTR3;            
  volatile uint32_t DOUTR4;            
  volatile uint32_t DOUTR5;            
  volatile uint32_t DOUTR6;            
  volatile uint32_t DOUTR7;            
  volatile uint32_t DOUTR8;            
  volatile uint32_t DOUTR9;            
  volatile uint32_t DOUTR10;           
  volatile uint32_t DOUTR11;           
  volatile uint32_t DOUTR12;           
  volatile uint32_t DOUTR13;           
  volatile uint32_t DOUTR14;           
  volatile uint32_t DOUTR15;           
  volatile uint32_t DOUTR16;           
  volatile uint32_t DOUTR17;           
  volatile uint32_t DOUTR18;           
  volatile uint32_t DOUTR19;           
  volatile uint32_t DOUTR20;           
  volatile uint32_t DOUTR21;           
  volatile uint32_t DOUTR22;           
  volatile uint32_t DOUTR23;           
  volatile uint32_t DOUTR24;           
  volatile uint32_t DOUTR25;           
  volatile uint32_t DOUTR26;           
  volatile uint32_t DOUTR27;           
  volatile uint32_t DOUTR28;           
  volatile uint32_t DOUTR29;           
  volatile uint32_t DOUTR30;           
  volatile uint32_t DOUTR31;           
} MDIOS_TypeDef;




 
#line 1322 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 


 





 
#line 1365 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 1409 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
 
#line 1427 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
 


#line 1454 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
 



 





 


 



#line 1483 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 



 
#line 1611 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 



 

  

 

 
 
 

 
 
 
 
 
 
#line 1652 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 1706 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 1756 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 1812 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 1874 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 




 




 
#line 1945 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 1995 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2045 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2084 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 


 


 


 


 
#line 2104 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2160 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 
#line 2202 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2210 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 



 
 
 
 
 
 
 
#line 2249 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2278 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2328 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 2341 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 2354 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2368 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2382 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2426 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2437 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 2444 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 2451 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2480 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
#line 2498 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2509 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2523 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2537 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2554 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2565 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2579 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2593 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2610 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2621 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2635 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2649 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2663 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2674 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2688 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2702 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2716 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2727 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2741 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2755 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 





 
#line 2809 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2856 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2903 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 2950 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3048 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3146 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3244 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3342 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3440 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3538 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3636 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3734 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3832 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 3930 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4028 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4126 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4224 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4322 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4420 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4518 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4616 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4714 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4812 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 4910 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5008 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5106 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5204 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5302 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5400 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5498 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5596 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5694 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 

 
#line 5711 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5740 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
#line 5791 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5832 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 




 




 
#line 5865 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 





 
 
 
 
 
 
#line 5949 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 5957 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 




 




 
#line 5995 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6003 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6011 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
#line 6029 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 

 

 
#line 6080 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6088 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6104 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 6117 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

 
#line 6170 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6199 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6228 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6242 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 6261 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6269 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6280 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6288 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6296 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6304 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6312 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6320 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6328 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
 
 
 
 

 
 
 
 
 
 
#line 6394 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6405 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6422 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 






 
#line 6446 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 6464 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 6482 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 6497 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6511 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6519 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6527 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6541 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 
#line 6621 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6642 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6661 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6723 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6785 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6847 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 6909 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 
 
 
 
 


 

 

#line 6968 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 6989 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 7010 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7018 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 





 





 





 

#line 7075 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 7087 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 7120 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 7132 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 





 

#line 7159 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

 






 




 





 





 





 





 

#line 7206 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 

#line 7221 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 

 

 
 
 
 
 
 
#line 7308 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7335 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"





 
#line 7416 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7443 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 7521 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7598 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7675 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7752 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 


 


 
#line 7792 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7815 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7855 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7918 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 7926 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
 
 
 
 
 
#line 7992 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8046 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8100 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8154 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8207 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8260 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8313 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8366 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8405 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8444 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8483 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8522 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8561 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8584 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8630 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8676 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 8722 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8763 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8810 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8857 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8881 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8892 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 8910 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 
#line 8997 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9015 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9097 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9179 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9197 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9215 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9249 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9302 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9360 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9418 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
 
 
 
 
 
#line 9483 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 9519 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9530 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9563 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9580 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9597 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9650 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 9679 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 





 
 
 
 
 
 




 
#line 9713 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 9729 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
 
 
 
 

 

#line 9749 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9758 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9767 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9776 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9806 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 

#line 9816 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9828 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9843 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9858 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9873 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 

#line 9888 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9903 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9915 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9924 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9933 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9945 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 





 

#line 9972 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 9981 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 

#line 9996 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 

#line 10017 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 
#line 10042 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10097 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10129 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 10168 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10206 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 
#line 10274 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10293 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10321 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10335 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 10405 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
 




 




 




 




 




 




 




 
 
 
 
 
 
#line 10501 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10543 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 10550 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
#line 10561 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10571 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10580 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 10590 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10598 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







 
#line 10612 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







 
#line 10628 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 










#line 10646 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 10653 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







 
#line 10730 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10783 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10797 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 10806 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10898 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 10960 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11031 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11045 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11053 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11148 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11216 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11299 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11313 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11321 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
 
#line 11415 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11483 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11510 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11542 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11556 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11588 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11620 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11630 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 11639 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"









 
#line 11655 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 11665 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 11675 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11754 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 
#line 11767 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11784 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 
#line 11832 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11876 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 11946 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 


 
#line 12005 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12013 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 12088 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12158 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
#line 12176 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12219 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12249 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 12277 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12349 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 12362 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12374 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12384 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
                     


 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 


 
 
 
 
 
 












 












#line 12587 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 12594 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 12616 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 12624 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12632 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 12645 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 12655 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"











 
#line 12678 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 12689 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 12699 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 


 
#line 12712 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 12726 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"





 
#line 12753 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12776 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 12783 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12806 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
 
 
 
 
 
#line 12857 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12880 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12912 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12926 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12946 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12966 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12974 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12985 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 12993 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 






 
#line 13019 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 13032 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 










#line 13061 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 




 




 




 




 
#line 13115 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 13123 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 13136 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 13209 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13244 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13312 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
 
 
 
 
 
#line 13374 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13416 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13455 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 
#line 13510 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13521 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
 
 
 
 
 














 
#line 13568 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 13581 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"





 
#line 13599 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 13613 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13628 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13643 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13658 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13672 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 13686 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13701 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13716 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13731 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13745 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13759 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13773 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13787 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13801 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 13816 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 13829 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13843 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13857 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 
#line 13871 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13879 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13887 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 


 

 
#line 13913 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"











#line 13932 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13943 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 13950 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 13957 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 13965 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 13990 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 13999 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14006 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"





#line 14018 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 14031 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14078 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14128 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14157 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 






#line 14171 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14179 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"











#line 14196 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14204 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"





 







#line 14224 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 14238 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 






#line 14252 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14260 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"













#line 14279 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14287 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"





 







#line 14307 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 14321 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14380 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 14389 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 




 




 




 
#line 14437 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 14474 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14484 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14493 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 14510 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 






 






 






 
#line 14539 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14547 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"





#line 14558 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14566 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"





 
#line 14584 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 


 
#line 14598 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14609 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14620 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14631 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
 
 
 
 
 
#line 14660 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14683 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14706 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 






















#line 14736 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 14743 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 14768 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14779 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 



 
 
 
 
 
 
#line 14869 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 



 
#line 14933 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14989 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 14997 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15005 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
#line 15014 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15031 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15093 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15128 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
 
 
 
 
 
#line 15155 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"






 
#line 15172 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"













 




 
 
 
 
 
 
#line 15202 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15216 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







 
#line 15284 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15301 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 
 
 
 
#line 15366 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15410 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
#line 15450 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 15488 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15496 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 








 

 
#line 15535 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15615 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15632 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15640 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
#line 15670 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 15695 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 15720 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
 
 

 
#line 15749 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15760 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15771 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15782 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 15793 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 




 




 
 
 

 
#line 15856 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 15875 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
#line 15893 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 15906 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 
#line 15929 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
 
 

 
#line 15996 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 
#line 16030 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
   
#line 16123 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16173 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16220 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16234 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 
 
 
 
 
 
#line 16315 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16325 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16335 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 16346 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"













 
#line 16369 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16392 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16406 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 16428 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 16441 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




#line 16458 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16480 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16543 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16574 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16600 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16616 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 16628 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 16659 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16745 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16831 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16839 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 16858 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 16866 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 16879 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 16893 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 16901 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 16909 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 16922 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







#line 16936 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 16944 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 16952 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
#line 16976 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




#line 16998 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17009 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17017 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17033 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17049 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 17062 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17070 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17078 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17086 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 17138 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17167 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17196 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17205 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17213 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







 
#line 17254 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17262 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17276 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17285 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17311 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




#line 17330 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"













#line 17362 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 17375 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17386 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 17398 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17433 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17468 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17503 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 

#line 17515 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
 
#line 17530 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 
#line 17553 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17593 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17616 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17624 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"







 
#line 17641 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"


 
 
 
 
 
 




 
#line 17681 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 17694 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17728 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17762 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17796 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17830 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17865 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17888 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17896 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 
 
 
 
 
 
#line 17936 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 




 




 




 
#line 17967 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 17978 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"



 



 



 

 







 



 


 


 


 





#line 18026 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 


 
#line 18047 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18060 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

#line 18072 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 


 



 





 






 




 


 


 


 



 


 


 




 


 



 


 
#line 18139 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18155 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 



 



 



 



 
#line 18185 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18195 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18203 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18211 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 



 



 



 
#line 18233 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18241 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18249 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 18262 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
                                                        
 
#line 18270 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
                                                        
 






 
#line 18286 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18295 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 



 
#line 18307 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18317 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18327 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18335 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 18402 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18414 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 




 
#line 18430 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
	 
 
#line 18444 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
                                                        
 


                                                        
 
#line 18458 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
                                                        
 
#line 18466 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
                                                        
 
#line 18474 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"
                                                         
 



 





 
#line 18494 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 
#line 18510 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18520 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18530 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 
#line 18540 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 





 
#line 18556 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f767xx.h"

 


 



 
 
 
 
 
 
 

 


 




 



 



 








 
#line 147 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f7xx.h"
#line 156 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f7xx.h"



 



 
typedef enum
{
  RESET = 0U,
  SET = !RESET
} FlagStatus, ITStatus;

typedef enum
{
  DISABLE = 0U,
  ENABLE = !DISABLE
} FunctionalState;


typedef enum
{
  ERROR = 0U,
  SUCCESS = !ERROR
} ErrorStatus;



 



 


















 

#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal.h"


































  

 
#line 253 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal.h"

 
#line 212 "../Drivers/CMSIS/Device/ST/STM32F7xx/Include/stm32f7xx.h"










 



 

 
#line 47 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


































 

 







 
 
 



 








 
  


 
#line 105 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 113 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 
  


  
  




    
   


 
#line 145 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 212 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 



 



 



 
  





 



 

#line 248 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 



 
#line 271 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"
  



  
  
  


 



 
  
#line 357 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 
  


 
  
#line 375 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 
  



 
#line 394 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 



 
  




 



 






















#line 439 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 446 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"










 



 
#line 470 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"
   
#line 479 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 



 
#line 502 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 



 





 



 






 



 















 
 






 



 














 
   


 










 



 





                                              















                                                                      



                                                        


 



 






 



 

 
#line 647 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

 












 
  


 
  









#line 684 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"
















 

  


 















 

  


 
#line 738 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 
  


 











 
  


 


  
#line 791 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 801 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 820 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 



 




 



 

























 

  


 








 



 




 



 
#line 900 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 
  


 

#line 917 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 929 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"
 
#line 957 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 
  


 











   
  




 






#line 1000 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


     




 
  


 

 



 



   



  
#line 1032 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

 













 
  


 
#line 1067 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 



 
#line 1081 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

 

 



 






 

 



 
#line 1118 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 1126 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"




#line 1140 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 
 

   
  


 





 



 



   



 






 
   


  



 
  


  



   
   
  


 
  


 

 



 





   
  


 
#line 1229 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"









 

   


 
#line 1257 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 1278 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 1289 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 1298 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 1312 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 1321 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 



 







 
   


 
#line 1357 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 1372 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


#line 1398 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 



 
#line 1565 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



#line 1575 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 

#line 1589 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 




  


 



 

#line 1612 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 
  


 
  
#line 1636 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 
  


 
  





 



 
  













 




 




 




 







 
  
  


 
#line 1710 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 




 
#line 1754 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 1768 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


   
  
  


 
  






#line 2283 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2432 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

 



#line 2459 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2482 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2599 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2616 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2631 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"






















#line 2662 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"





#line 2689 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



#line 2700 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2733 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2751 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"












#line 2769 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2790 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 



 




 
  


 
  




#line 2838 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2853 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"






 



 




#line 2893 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 2915 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"
 




#line 2926 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"



 



 

#line 2941 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"








 



 
#line 2962 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 



 







 
  


 













 




 











 



 












#line 3035 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 3044 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"

#line 3053 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"








 



 








#line 3086 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"




 



 
  
#line 3103 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"






 



 



 



 
#line 3136 "../Drivers/STM32F7xx_HAL_Driver/Inc/Legacy/stm32_hal_legacy.h"


 




 
  


 







 

#line 48 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"
#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
 
 
 





 






 







 




  
 








#line 47 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


  



    typedef unsigned int size_t;    









 
 

 



    typedef struct __va_list __va_list;






   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

#line 136 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"


extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 166 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int __ARM_vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int __ARM_vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));

#pragma __printf_args
extern __declspec(__nothrow) int __ARM_asprintf(char **  , const char * __restrict  , ...) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) int __ARM_vasprintf(char **  , const char * __restrict  , __va_list  ) __attribute__((__nonnull__(2)));
   








 

extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 1021 "C:\\Keil_v5\\ARM\\ARMCC\\Bin\\..\\include\\stdio.h"



 

#line 49 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"
 



   
typedef enum 
{
  HAL_OK       = 0x00U,
  HAL_ERROR    = 0x01U,
  HAL_BUSY     = 0x02U,
  HAL_TIMEOUT  = 0x03U
} HAL_StatusTypeDef;



 
typedef enum 
{
  HAL_UNLOCKED = 0x00,
  HAL_LOCKED   = 0x01  
} HAL_LockTypeDef;

 



























 


#line 117 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"







#line 132 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"


 
#line 154 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"




  









 


#line 187 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"



  



 


#line 204 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_def.h"







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"
   
 
 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"



 



  

 


 
   


 
typedef struct
{
  uint32_t PLLState;   
 

  uint32_t PLLSource;  
            

  uint32_t PLLM;       
         

  uint32_t PLLN;       
 

  uint32_t PLLP;       
 

  uint32_t PLLQ;       
 

  uint32_t PLLR;       
 


}RCC_PLLInitTypeDef;   



 
typedef struct
{
  uint32_t PLLI2SN;    

 

  uint32_t PLLI2SR;    

 

  uint32_t PLLI2SQ;    

 



  uint32_t PLLI2SP;    

 

}RCC_PLLI2SInitTypeDef;



 
typedef struct
{
  uint32_t PLLSAIN;    

  
                                 
  uint32_t PLLSAIQ;    

 
  


  uint32_t PLLSAIR;    

 

  
  uint32_t PLLSAIP;    

 
}RCC_PLLSAIInitTypeDef;



 
typedef struct
{
  uint32_t PeriphClockSelection; 
 

  RCC_PLLI2SInitTypeDef PLLI2S;  
 

  RCC_PLLSAIInitTypeDef PLLSAI;  
 

  uint32_t PLLI2SDivQ;           

 

  uint32_t PLLSAIDivQ;           

 

  uint32_t PLLSAIDivR;           
 

  uint32_t RTCClockSelection;      
 
                                        
  uint32_t I2sClockSelection;      
 

  uint32_t TIMPresSelection;      
 
  
  uint32_t Sai1ClockSelection;     
 

  uint32_t Sai2ClockSelection;     
 
  
  uint32_t Usart1ClockSelection; 
 
  
  uint32_t Usart2ClockSelection; 
 

  uint32_t Usart3ClockSelection; 
                                 
  
  uint32_t Uart4ClockSelection;  
 
  
  uint32_t Uart5ClockSelection;  
 
  
  uint32_t Usart6ClockSelection;  
 
  
  uint32_t Uart7ClockSelection;  
 
  
  uint32_t Uart8ClockSelection;  
 
  
  uint32_t I2c1ClockSelection;   
 

  uint32_t I2c2ClockSelection;   
 

  uint32_t I2c3ClockSelection;   
 
  
  uint32_t I2c4ClockSelection;   
 
  
  uint32_t Lptim1ClockSelection;   
 
  
  uint32_t CecClockSelection;      
 
  
  uint32_t Clk48ClockSelection;    
 
  
  uint32_t Sdmmc1ClockSelection;     
 
                                          


  uint32_t Sdmmc2ClockSelection;     
 

  

  uint32_t Dfsdm1ClockSelection;     
 
                                          
  uint32_t Dfsdm1AudioClockSelection; 
 

}RCC_PeriphCLKInitTypeDef;


 

 


 



 
#line 287 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
    


 





 






 

  


 






 



 






 



 





  
  
  


 
#line 348 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"


  



 
#line 361 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"


  



 




 



 






 



 






 



 






 



 






 



 






 



 






 



 






 



 






 



 





 



 






 



 





 



 





 



 







 



 




 



 




 



 




 





 




 





 




 



 




 


#line 584 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"



 
     
 


 






 
 




 
#line 613 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                      
#line 621 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                      
#line 629 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 637 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 645 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 653 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 661 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 669 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 677 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 685 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 693 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 701 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 709 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 717 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 727 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 735 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        
#line 744 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 765 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        




 
#line 778 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 786 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 794 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 802 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                      







 
#line 821 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                     




 
#line 838 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 849 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 857 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 866 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"



#line 890 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        
#line 902 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        




 
#line 915 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 923 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"








 
#line 939 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 947 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 955 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 963 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 971 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 979 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 987 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 995 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1003 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1011 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1024 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1034 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        
#line 1042 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1050 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1058 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1066 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1074 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1082 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1090 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1098 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1106 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        
#line 1114 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1122 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1130 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1138 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        
#line 1148 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1156 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1164 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1173 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1213 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"





 
#line 1226 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1234 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1242 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1250 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1261 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1269 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1277 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1285 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1293 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1301 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1309 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1317 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1325 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1333 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1341 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1349 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1357 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1365 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1375 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        
#line 1385 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        
#line 1394 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1412 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        
#line 1447 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                                        


 








 
 




 
#line 1486 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1507 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"





 
#line 1520 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"



 
#line 1532 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"





 


                                   



#line 1550 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"





















   










 
#line 1609 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1642 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"






      
#line 1656 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"





 
#line 1696 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1731 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"



   




 
  

   
#line 1754 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1766 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1773 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"








 













#line 1801 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
      












  







 

  
#line 1851 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1878 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1885 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
      







 
#line 1915 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 1937 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"












#line 1955 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"


  








  
  

  
#line 1988 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2007 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2017 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2026 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"






 

















#line 2057 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
      










 











   
#line 2107 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2134 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2142 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2149 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"












  
#line 2181 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2216 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"








 








 
  





 
#line 2259 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2278 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2288 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2297 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"






 










                                         






#line 2328 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
      










 











   
#line 2384 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2417 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2424 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
      











  
#line 2467 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 2498 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"








 

 





























 
#line 2579 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
 












      






 



#line 2642 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"














    






















 
#line 2686 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
    





 







 









    


















 














 

















 















 




 



 



 




 




 






 









 








 









 








 









 








 









 








 










 









 










 









 










 









 


 







 









 


 







 









 


 







 









 


 







 









 










 









 










 









 








 







 








 







 








 







 









 







 


                    






 







 







 







 



#line 3196 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"


 

 


 
HAL_StatusTypeDef HAL_RCCEx_PeriphCLKConfig(RCC_PeriphCLKInitTypeDef  *PeriphClkInit);
void HAL_RCCEx_GetPeriphCLKConfig(RCC_PeriphCLKInitTypeDef  *PeriphClkInit);
uint32_t HAL_RCCEx_GetPeriphCLKFreq(uint32_t PeriphClk);



  
 


 


 
#line 3355 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 3363 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"





#line 3374 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"




#line 3385 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 3396 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

























#line 3434 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 3454 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"

#line 3464 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc_ex.h"
                 


                 



























                 


  



 



  



   






 
#line 50 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"



 



 

  



 



 
typedef struct
{
  uint32_t OscillatorType;       
 

  uint32_t HSEState;             
 

  uint32_t LSEState;             
 
                                          
  uint32_t HSIState;             
 

  uint32_t HSICalibrationValue;   
 
                               
  uint32_t LSIState;             
 

  RCC_PLLInitTypeDef PLL;               

}RCC_OscInitTypeDef;



 
typedef struct
{
  uint32_t ClockType;             
 
  
  uint32_t SYSCLKSource;          
 

  uint32_t AHBCLKDivider;         
 

  uint32_t APB1CLKDivider;        
 

  uint32_t APB2CLKDivider;        
 

}RCC_ClkInitTypeDef;



 

 


 



 







 



 





 



 





 



 






 



 




 



 





 



 






 



 




 



 






 
  


 





 




 





 



 
#line 249 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"


  
  


 







  



 
#line 300 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"


 





 




 



 






 



 






 



 







 



 
#line 360 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"


 
  








 
 






 


 
#line 392 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"


  



 






 
  


 
   
 


 







 
#line 430 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"
									  
#line 438 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"






 







 
#line 460 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"
									  
#line 468 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"





 







 
#line 489 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"
									  




 
  






 







 
  






 







   







 




   
  



   









 




 









 




 








 







 











 











 





 
  







 







 








 







 








 




   



  
                                      













 








 




 



  








 




 



  





















 
#line 769 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"


 



 


















 
#line 817 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"


 



 



 























 


                                                   








 




 



 







 


                            







 










 



 



 








 






 




 



 







 








 















 








 



 
  


  
  














 



                














 





 
  



 











 












 













 













 




 



















 





 
     


 

 
#line 1123 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"

 
 

 



                              
 
void HAL_RCC_DeInit(void);
HAL_StatusTypeDef HAL_RCC_OscConfig(RCC_OscInitTypeDef *RCC_OscInitStruct);
HAL_StatusTypeDef HAL_RCC_ClockConfig(RCC_ClkInitTypeDef *RCC_ClkInitStruct, uint32_t FLatency);


 



 
 
void     HAL_RCC_MCOConfig(uint32_t RCC_MCOx, uint32_t RCC_MCOSource, uint32_t RCC_MCODiv);
void     HAL_RCC_EnableCSS(void);
void     HAL_RCC_DisableCSS(void);
uint32_t HAL_RCC_GetSysClockFreq(void);
uint32_t HAL_RCC_GetHCLKFreq(void);
uint32_t HAL_RCC_GetPCLK1Freq(void);
uint32_t HAL_RCC_GetPCLK2Freq(void);
void     HAL_RCC_GetOscConfig(RCC_OscInitTypeDef *RCC_OscInitStruct);
void     HAL_RCC_GetClockConfig(RCC_ClkInitTypeDef *RCC_ClkInitStruct, uint32_t *pFLatency);

 
void HAL_RCC_NMI_IRQHandler(void);

  
void HAL_RCC_CSSCallback(void);


 



 

 
 
 


 









 
 


 






 


 

 


 
    


   






















































#line 1276 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_rcc.h"








 



 



  



 







 
#line 245 "../Inc/stm32f7xx_hal_conf.h"


#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio.h"



 



  

 


 



  
typedef struct
{
  uint32_t Pin;       
 

  uint32_t Mode;      
 

  uint32_t Pull;      
 

  uint32_t Speed;     
 

  uint32_t Alternate;  
 
}GPIO_InitTypeDef;



 
typedef enum
{
  GPIO_PIN_RESET = 0,
  GPIO_PIN_SET
}GPIO_PinState;


 

 



  



 
#line 119 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio.h"




 










  







    



 





 




   






 

 


   





 
  


 

 


 






 







 







 







 







 



 

 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"



 



  

 

 


 
  


   
 




  







  
#line 85 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"



  






  
#line 105 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"


  
#line 116 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"



  
#line 126 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"



  
#line 136 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"



  
#line 151 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"



  
#line 165 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"




  
#line 182 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"


  
#line 194 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"



  
#line 204 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"
   


  
#line 215 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"
   


  
#line 225 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"
   


 




  


 

       
#line 352 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"
 



  



 

 


 


 

  


 


 
 
 
 


 



 
 
#line 400 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"



 

 


 


 
#line 425 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"

#line 436 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"


 

#line 452 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"


 
#line 642 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio_ex.h"


  



 

 


 



 



  



  
  






 
#line 231 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio.h"

 


 



 
 
void  HAL_GPIO_Init(GPIO_TypeDef  *GPIOx, GPIO_InitTypeDef *GPIO_Init);
void  HAL_GPIO_DeInit(GPIO_TypeDef  *GPIOx, uint32_t GPIO_Pin);


 



 
 
GPIO_PinState HAL_GPIO_ReadPin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void HAL_GPIO_WritePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, GPIO_PinState PinState);
void HAL_GPIO_TogglePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
HAL_StatusTypeDef HAL_GPIO_LockPin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin);
void HAL_GPIO_EXTI_IRQHandler(uint16_t GPIO_Pin);
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin);



  



  
 
 
 


 



 

 


 
#line 298 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_gpio.h"


 

 


 



 



  



 







 
#line 249 "../Inc/stm32f7xx_hal_conf.h"


#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"



 



  

 




 
   


 
typedef struct
{
  uint32_t Channel;              
 

  uint32_t Direction;            

 

  uint32_t PeriphInc;            
 

  uint32_t MemInc;               
 

  uint32_t PeriphDataAlignment;  
 

  uint32_t MemDataAlignment;     
 

  uint32_t Mode;                 


 

  uint32_t Priority;             
 

  uint32_t FIFOMode;             


 

  uint32_t FIFOThreshold;        
 

  uint32_t MemBurst;             



 

  uint32_t PeriphBurst;          



 
}DMA_InitTypeDef;



 
typedef enum
{
  HAL_DMA_STATE_RESET             = 0x00U,   
  HAL_DMA_STATE_READY             = 0x01U,   
  HAL_DMA_STATE_BUSY              = 0x02U,   
  HAL_DMA_STATE_TIMEOUT           = 0x03U,   
  HAL_DMA_STATE_ERROR             = 0x04U,   
  HAL_DMA_STATE_ABORT             = 0x05U,   
}HAL_DMA_StateTypeDef;



 
typedef enum
{
  HAL_DMA_FULL_TRANSFER      = 0x00U,     
  HAL_DMA_HALF_TRANSFER      = 0x01U,     
}HAL_DMA_LevelCompleteTypeDef;



 
typedef enum
{
  HAL_DMA_XFER_CPLT_CB_ID          = 0x00U,     
  HAL_DMA_XFER_HALFCPLT_CB_ID      = 0x01U,     
  HAL_DMA_XFER_M1CPLT_CB_ID        = 0x02U,     
  HAL_DMA_XFER_M1HALFCPLT_CB_ID    = 0x03U,     
  HAL_DMA_XFER_ERROR_CB_ID         = 0x04U,     
  HAL_DMA_XFER_ABORT_CB_ID         = 0x05U,     
  HAL_DMA_XFER_ALL_CB_ID           = 0x06U      
}HAL_DMA_CallbackIDTypeDef;



 
typedef struct __DMA_HandleTypeDef
{
  DMA_Stream_TypeDef         *Instance;                                                     

  DMA_InitTypeDef            Init;                                                           

  HAL_LockTypeDef            Lock;                                                            

  volatile HAL_DMA_StateTypeDef  State;                                                         

  void                       *Parent;                                                        

  void                       (* XferCpltCallback)( struct __DMA_HandleTypeDef * hdma);      

  void                       (* XferHalfCpltCallback)( struct __DMA_HandleTypeDef * hdma);  

  void                       (* XferM1CpltCallback)( struct __DMA_HandleTypeDef * hdma);    
  
  void                       (* XferM1HalfCpltCallback)( struct __DMA_HandleTypeDef * hdma);    
  
  void                       (* XferErrorCallback)( struct __DMA_HandleTypeDef * hdma);     
  
  void                       (* XferAbortCallback)( struct __DMA_HandleTypeDef * hdma);       

 volatile uint32_t               ErrorCode;                                                     
  
 uint32_t                    StreamBaseAddress;                                             

 uint32_t                    StreamIndex;                                                   
 
}DMA_HandleTypeDef;



 


 




 




  
#line 210 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"


 




  





 
        



  




  




  




 




  





  




 





 




  





 




 






  




 




  




 






  




  






  




  






 




 







 




  
#line 373 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"


 



 
 
 




 













 






 






 


 





 
#line 438 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"





       
#line 458 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"





 
#line 478 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"





 
#line 498 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"





 
#line 518 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"













 

















 
















 














 














 




















 







 



 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h"

































 

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h"



 



  

 



 
   


  
typedef enum
{
  MEMORY0      = 0x00U,     
  MEMORY1      = 0x01U,     

}HAL_DMA_MemoryTypeDef;



 
  
 




 




  
#line 107 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h"



 
  


   

 



 




 

 
HAL_StatusTypeDef HAL_DMAEx_MultiBufferStart(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t SecondMemAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMAEx_MultiBufferStart_IT(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t SecondMemAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMAEx_ChangeMemory(DMA_HandleTypeDef *hdma, uint32_t Address, HAL_DMA_MemoryTypeDef memory);



 


 
  
 



 
#line 174 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma_ex.h"


   
         
 



 


 



 



 







 
#line 631 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_dma.h"

 




 




 
HAL_StatusTypeDef HAL_DMA_Init(DMA_HandleTypeDef *hdma); 
HAL_StatusTypeDef HAL_DMA_DeInit(DMA_HandleTypeDef *hdma);


 




 
HAL_StatusTypeDef HAL_DMA_Start (DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMA_Start_IT(DMA_HandleTypeDef *hdma, uint32_t SrcAddress, uint32_t DstAddress, uint32_t DataLength);
HAL_StatusTypeDef HAL_DMA_Abort(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_Abort_IT(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_PollForTransfer(DMA_HandleTypeDef *hdma, HAL_DMA_LevelCompleteTypeDef CompleteLevel, uint32_t Timeout);
void              HAL_DMA_IRQHandler(DMA_HandleTypeDef *hdma);
HAL_StatusTypeDef HAL_DMA_RegisterCallback(DMA_HandleTypeDef *hdma, HAL_DMA_CallbackIDTypeDef CallbackID, void (* pCallback)(DMA_HandleTypeDef *_hdma));
HAL_StatusTypeDef HAL_DMA_UnRegisterCallback(DMA_HandleTypeDef *hdma, HAL_DMA_CallbackIDTypeDef CallbackID);



  




 
HAL_DMA_StateTypeDef HAL_DMA_GetState(DMA_HandleTypeDef *hdma);
uint32_t             HAL_DMA_GetError(DMA_HandleTypeDef *hdma);


  


  
 



 


  

 



 
















































  

 



 


 



  



 







 
#line 253 "../Inc/stm32f7xx_hal_conf.h"

   
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"



 



  
 


 





 
typedef struct
{
  uint8_t                Enable;                
 
  uint8_t                Number;                
 
  uint32_t               BaseAddress;            
  uint8_t                Size;                  
 
  uint8_t                SubRegionDisable;      
          
  uint8_t                TypeExtField;          
                  
  uint8_t                AccessPermission;      
 
  uint8_t                DisableExec;           
 
  uint8_t                IsShareable;           
 
  uint8_t                IsCacheable;           
 
  uint8_t                IsBufferable;          
 
}MPU_Region_InitTypeDef;


 




 

 



 



 
#line 116 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"


 



 





 




 






 



 




 



 




 



 




 



 




 



 




 



 





 



 
#line 228 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"


 
   


 
#line 241 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"


 



 
#line 256 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"


 




 


 

 


 
  


 
 
void HAL_NVIC_SetPriorityGrouping(uint32_t PriorityGroup);
void HAL_NVIC_SetPriority(IRQn_Type IRQn, uint32_t PreemptPriority, uint32_t SubPriority);
void HAL_NVIC_EnableIRQ(IRQn_Type IRQn);
void HAL_NVIC_DisableIRQ(IRQn_Type IRQn);
void HAL_NVIC_SystemReset(void);
uint32_t HAL_SYSTICK_Config(uint32_t TicksNumb);


 



 
 

void HAL_MPU_Enable(uint32_t MPU_Control);
void HAL_MPU_Disable(void);
void HAL_MPU_ConfigRegion(MPU_Region_InitTypeDef *MPU_Init);

uint32_t HAL_NVIC_GetPriorityGrouping(void);
void HAL_NVIC_GetPriority(IRQn_Type IRQn, uint32_t PriorityGroup, uint32_t* pPreemptPriority, uint32_t* pSubPriority);
uint32_t HAL_NVIC_GetPendingIRQ(IRQn_Type IRQn);
void HAL_NVIC_SetPendingIRQ(IRQn_Type IRQn);
void HAL_NVIC_ClearPendingIRQ(IRQn_Type IRQn);
uint32_t HAL_NVIC_GetActive(IRQn_Type IRQn);
void HAL_SYSTICK_CLKSourceConfig(uint32_t CLKSource);
void HAL_SYSTICK_IRQHandler(void);
void HAL_SYSTICK_Callback(void);


 



 

  
 
 
 


 



































#line 361 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"

#line 370 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"

#line 399 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_cortex.h"






                                                                             



  



 
  





 

 
#line 257 "../Inc/stm32f7xx_hal_conf.h"






































#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash.h"



 



  

  


 
 


 
typedef enum 
{
  FLASH_PROC_NONE = 0U, 
  FLASH_PROC_SECTERASE,
  FLASH_PROC_MASSERASE,
  FLASH_PROC_PROGRAM
} FLASH_ProcedureTypeDef;




 
typedef struct
{
  volatile FLASH_ProcedureTypeDef ProcedureOnGoing;    
  
  volatile uint32_t               NbSectorsToErase;    
  
  volatile uint8_t                VoltageForErase;     
  
  volatile uint32_t               Sector;              

  volatile uint32_t               Address;             
  
  HAL_LockTypeDef             Lock;                

  volatile uint32_t               ErrorCode;           

}FLASH_ProcessTypeDef;



 

 


   




  
#line 113 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash.h"


 
  


  






 




  
#line 139 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash.h"

#line 148 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash.h"


 




 




 



 







  



  






 



 
#line 196 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash.h"


  



  
  
 


 





 







  





  





  






  





  







 









   









   














 













 



 

 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"

































 

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"



 



 

  


 



 
typedef struct
{
  uint32_t TypeErase;   
 


  uint32_t Banks;       
 

  
  uint32_t Sector;      
 

  uint32_t NbSectors;   
 

  uint32_t VoltageRange;
 

} FLASH_EraseInitTypeDef;



 
typedef struct
{
  uint32_t OptionType;   
 

  uint32_t WRPState;     
 

  uint32_t WRPSector;    
 

  uint32_t RDPLevel;     
 

  uint32_t BORLevel;     
 

  uint32_t USERConfig;   

 
 
  uint32_t BootAddr0;    
 

  uint32_t BootAddr1;    
 

#line 121 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"

} FLASH_OBProgramInitTypeDef;



 
 



 



  




 
  


  






 
  


  




 
  


  
#line 175 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"


 
  


 






  
  


  




  
  



  




  



  




  



                                




 



 




 



 




 



 






 




                                





   





 




 




 
#line 293 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"


 
  


 
#line 316 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"


 




 





 




 







 



 
#line 365 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"


  










 
 
#line 393 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"

 
#line 420 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"


 

    
#line 442 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"

#line 469 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"



  
  
 


 





 

 

 
                    
 


 



 
 
HAL_StatusTypeDef HAL_FLASHEx_Erase(FLASH_EraseInitTypeDef *pEraseInit, uint32_t *SectorError);
HAL_StatusTypeDef HAL_FLASHEx_Erase_IT(FLASH_EraseInitTypeDef *pEraseInit);
HAL_StatusTypeDef HAL_FLASHEx_OBProgram(FLASH_OBProgramInitTypeDef *pOBInit);
void              HAL_FLASHEx_OBGetConfig(FLASH_OBProgramInitTypeDef *pOBInit);



 



 
 
 
 
 


 



 












#line 541 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"






















#line 579 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"





#line 592 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"

#line 606 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash_ex.h"


























 



 

 


 
void FLASH_Erase_Sector(uint32_t Sector, uint8_t VoltageRange);


  



  



 







 
#line 311 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_flash.h"

 


 


 
 
HAL_StatusTypeDef HAL_FLASH_Program(uint32_t TypeProgram, uint32_t Address, uint64_t Data);
HAL_StatusTypeDef HAL_FLASH_Program_IT(uint32_t TypeProgram, uint32_t Address, uint64_t Data);
 
void HAL_FLASH_IRQHandler(void);
  
void HAL_FLASH_EndOfOperationCallback(uint32_t ReturnValue);
void HAL_FLASH_OperationErrorCallback(uint32_t ReturnValue);


 



 
 
HAL_StatusTypeDef HAL_FLASH_Unlock(void);
HAL_StatusTypeDef HAL_FLASH_Lock(void);
HAL_StatusTypeDef HAL_FLASH_OB_Unlock(void);
HAL_StatusTypeDef HAL_FLASH_OB_Lock(void);
 
HAL_StatusTypeDef HAL_FLASH_OB_Launch(void);


 



 
 
uint32_t HAL_FLASH_GetError(void);
HAL_StatusTypeDef FLASH_WaitForLastOperation(uint32_t Timeout);


 



 
 
 


 



 
 


 



  




 

 


 



 






 



 

 


 



 



  



 







 
#line 297 "../Inc/stm32f7xx_hal_conf.h"

 




















#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c.h"

































 

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c.h"



 



  

 


 




 
typedef struct
{
  uint32_t Timing;              

 

  uint32_t OwnAddress1;         
 

  uint32_t AddressingMode;      
 

  uint32_t DualAddressMode;     
 

  uint32_t OwnAddress2;         
 

  uint32_t OwnAddress2Masks;    
 

  uint32_t GeneralCallMode;     
 

  uint32_t NoStretchMode;       
 

}I2C_InitTypeDef;



 



























  
typedef enum
{
  HAL_I2C_STATE_RESET             = 0x00U,    
  HAL_I2C_STATE_READY             = 0x20U,    
  HAL_I2C_STATE_BUSY              = 0x24U,    
  HAL_I2C_STATE_BUSY_TX           = 0x21U,    
  HAL_I2C_STATE_BUSY_RX           = 0x22U,    
  HAL_I2C_STATE_LISTEN            = 0x28U,    
  HAL_I2C_STATE_BUSY_TX_LISTEN    = 0x29U,   
 
  HAL_I2C_STATE_BUSY_RX_LISTEN    = 0x2AU,   
 
  HAL_I2C_STATE_ABORT             = 0x60U,    
  HAL_I2C_STATE_TIMEOUT           = 0xA0U,    
  HAL_I2C_STATE_ERROR             = 0xE0U     

}HAL_I2C_StateTypeDef;



 


















 
typedef enum
{
  HAL_I2C_MODE_NONE               = 0x00U,    
  HAL_I2C_MODE_MASTER             = 0x10U,    
  HAL_I2C_MODE_SLAVE              = 0x20U,    
  HAL_I2C_MODE_MEM                = 0x40U     

}HAL_I2C_ModeTypeDef;



 




 
#line 189 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c.h"


 




 
typedef struct __I2C_HandleTypeDef
{
  I2C_TypeDef                *Instance;       

  I2C_InitTypeDef            Init;            

  uint8_t                    *pBuffPtr;       

  uint16_t                   XferSize;        

  volatile uint16_t              XferCount;       

  volatile uint32_t              XferOptions;    
 

  volatile uint32_t              PreviousState;   

  HAL_StatusTypeDef (*XferISR)(struct __I2C_HandleTypeDef *hi2c, uint32_t ITFlags, uint32_t ITSources);  

  DMA_HandleTypeDef          *hdmatx;         

  DMA_HandleTypeDef          *hdmarx;         

  HAL_LockTypeDef            Lock;            

  volatile HAL_I2C_StateTypeDef  State;           

  volatile HAL_I2C_ModeTypeDef   Mode;            

  volatile uint32_t              ErrorCode;       

  volatile uint32_t              AddrEventCount;  
}I2C_HandleTypeDef;


 



 
 



 



 







 



 




 



 




 



 
#line 284 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c.h"


 



 




 



 




 



 




 
  


 




 



 





 



 






 






 
#line 358 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c.h"


 



 
#line 381 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c.h"


 



 

 



 




 















 















 

 













 
























 


















 






 





 





 



 

 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c_ex.h"

































 

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c_ex.h"



 



  

 
 



 



 




 



 
#line 109 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c_ex.h"


 



  

 
 



 




 

 
HAL_StatusTypeDef HAL_I2CEx_ConfigAnalogFilter(I2C_HandleTypeDef *hi2c, uint32_t AnalogFilter);
HAL_StatusTypeDef HAL_I2CEx_ConfigDigitalFilter(I2C_HandleTypeDef *hi2c, uint32_t DigitalFilter);

void HAL_I2CEx_EnableFastModePlus(uint32_t ConfigFastModePlus);
void HAL_I2CEx_DisableFastModePlus(uint32_t ConfigFastModePlus);


 


 



 

 


 





#line 186 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c_ex.h"


  

 


 
 


 



 



 



 



 







 
#line 517 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c.h"

 


 



 
 
HAL_StatusTypeDef HAL_I2C_Init(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_DeInit (I2C_HandleTypeDef *hi2c);
void HAL_I2C_MspInit(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MspDeInit(I2C_HandleTypeDef *hi2c);


 



 
 
  
HAL_StatusTypeDef HAL_I2C_Master_Transmit(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Master_Receive(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Slave_Receive(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Mem_Write(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_Mem_Read(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_I2C_IsDeviceReady(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint32_t Trials, uint32_t Timeout);

  
HAL_StatusTypeDef HAL_I2C_Master_Transmit_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Master_Receive_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Receive_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Write_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Read_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);

HAL_StatusTypeDef HAL_I2C_Master_Sequential_Transmit_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Master_Sequential_Receive_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Slave_Sequential_Transmit_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_Slave_Sequential_Receive_IT(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size, uint32_t XferOptions);
HAL_StatusTypeDef HAL_I2C_EnableListen_IT(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_DisableListen_IT(I2C_HandleTypeDef *hi2c);
HAL_StatusTypeDef HAL_I2C_Master_Abort_IT(I2C_HandleTypeDef *hi2c, uint16_t DevAddress);

  
HAL_StatusTypeDef HAL_I2C_Master_Transmit_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Master_Receive_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Transmit_DMA(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Slave_Receive_DMA(I2C_HandleTypeDef *hi2c, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Write_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_I2C_Mem_Read_DMA(I2C_HandleTypeDef *hi2c, uint16_t DevAddress, uint16_t MemAddress, uint16_t MemAddSize, uint8_t *pData, uint16_t Size);


 



 
 
void HAL_I2C_EV_IRQHandler(I2C_HandleTypeDef *hi2c);
void HAL_I2C_ER_IRQHandler(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MasterTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MasterRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_SlaveTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_SlaveRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_AddrCallback(I2C_HandleTypeDef *hi2c, uint8_t TransferDirection, uint16_t AddrMatchCode);
void HAL_I2C_ListenCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MemTxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_MemRxCpltCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_ErrorCallback(I2C_HandleTypeDef *hi2c);
void HAL_I2C_AbortCpltCallback(I2C_HandleTypeDef *hi2c);


 



 
 
HAL_I2C_StateTypeDef HAL_I2C_GetState(I2C_HandleTypeDef *hi2c);
HAL_I2C_ModeTypeDef  HAL_I2C_GetMode(I2C_HandleTypeDef *hi2c);
uint32_t             HAL_I2C_GetError(I2C_HandleTypeDef *hi2c);



  



  

 


 



  

 


 







#line 639 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_i2c.h"











































  

 


 
 


  



  



  








 
#line 321 "../Inc/stm32f7xx_hal_conf.h"


















#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr.h"



 



  

 



 
   


 
typedef struct
{
  uint32_t PVDLevel;   
 

  uint32_t Mode;      
 
}PWR_PVDTypeDef;



 

 


 



  
#line 94 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr.h"



    
 


 
#line 109 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr.h"


 



 




 
    


 




 



 




 



 





 



 







 



  
  
 


 










 
#line 188 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr.h"



















 






 





 





 





 





 





 





 





 






 






 





 





 





 





 




 

 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h"



 



  

  
 


 


 
#line 81 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h"



 
	


 




  
  


 





 
	


 
#line 114 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h"


 



  
  
 


 

 




 












 













 



 











 











 



 
 


 
 


 
uint32_t HAL_PWREx_GetVoltageRange(void);
HAL_StatusTypeDef HAL_PWREx_ControlVoltageScaling(uint32_t VoltageScaling);

void HAL_PWREx_EnableFlashPowerDown(void);
void HAL_PWREx_DisableFlashPowerDown(void); 
HAL_StatusTypeDef HAL_PWREx_EnableBkUpReg(void);
HAL_StatusTypeDef HAL_PWREx_DisableBkUpReg(void); 

void HAL_PWREx_EnableMainRegulatorLowVoltage(void);
void HAL_PWREx_DisableMainRegulatorLowVoltage(void);
void HAL_PWREx_EnableLowRegulatorLowVoltage(void);
void HAL_PWREx_DisableLowRegulatorLowVoltage(void);

HAL_StatusTypeDef HAL_PWREx_EnableOverDrive(void);
HAL_StatusTypeDef HAL_PWREx_DisableOverDrive(void);
HAL_StatusTypeDef HAL_PWREx_EnterUnderDriveSTOPMode(uint32_t Regulator, uint8_t STOPEntry);



 



 
 
 
 
 


 



 
#line 255 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr_ex.h"


 



 



  



 
  







 
#line 303 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr.h"

 


 
  


 
 
void HAL_PWR_DeInit(void);
void HAL_PWR_EnableBkUpAccess(void);
void HAL_PWR_DisableBkUpAccess(void);


 



 
 
 
void HAL_PWR_ConfigPVD(PWR_PVDTypeDef *sConfigPVD);
void HAL_PWR_EnablePVD(void);
void HAL_PWR_DisablePVD(void);

 
void HAL_PWR_EnableWakeUpPin(uint32_t WakeUpPinPolarity);
void HAL_PWR_DisableWakeUpPin(uint32_t WakeUpPinx);

 
void HAL_PWR_EnterSTOPMode(uint32_t Regulator, uint8_t STOPEntry);
void HAL_PWR_EnterSLEEPMode(uint32_t Regulator, uint8_t SLEEPEntry);
void HAL_PWR_EnterSTANDBYMode(void);

 
void HAL_PWR_PVD_IRQHandler(void);
void HAL_PWR_PVDCallback(void);

 
void HAL_PWR_EnableSleepOnExit(void);
void HAL_PWR_DisableSleepOnExit(void);
void HAL_PWR_EnableSEVOnPend(void);
void HAL_PWR_DisableSEVOnPend(void);


 



 

 
 
 


 



 



 



 
 


 



 
#line 396 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_pwr.h"



 



 



  



 
  







 
#line 341 "../Inc/stm32f7xx_hal_conf.h"


































#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"



 



 

 


 
  


 
typedef struct
{
  uint32_t Prescaler;         
 

  uint32_t CounterMode;       
 

  uint32_t Period;            

 

  uint32_t ClockDivision;     
 

  uint32_t RepetitionCounter;  






 

  uint32_t AutoReloadPreload;  
 

} TIM_Base_InitTypeDef;



 

typedef struct
{
  uint32_t OCMode;        
 

  uint32_t Pulse;         
 

  uint32_t OCPolarity;    
 

  uint32_t OCNPolarity;   

 
  
  uint32_t OCFastMode;   

 


  uint32_t OCIdleState;   

 

  uint32_t OCNIdleState;  

 
} TIM_OC_InitTypeDef;  



 
typedef struct
{
  uint32_t OCMode;        
 

  uint32_t Pulse;         
 

  uint32_t OCPolarity;    
 

  uint32_t OCNPolarity;   

 

  uint32_t OCIdleState;   

 

  uint32_t OCNIdleState;  

 

  uint32_t ICPolarity;    
 

  uint32_t ICSelection;   
 

  uint32_t ICFilter;      
   
} TIM_OnePulse_InitTypeDef;  




 

typedef struct
{
  uint32_t  ICPolarity;   
 

  uint32_t ICSelection;  
 

  uint32_t ICPrescaler;  
 

  uint32_t ICFilter;     
 
} TIM_IC_InitTypeDef;



 

typedef struct
{
  uint32_t EncoderMode;   
 
                                  
  uint32_t IC1Polarity;   
 

  uint32_t IC1Selection;  
 

  uint32_t IC1Prescaler;  
 

  uint32_t IC1Filter;     
 
                                  
  uint32_t IC2Polarity;   
 

  uint32_t IC2Selection;  
 

  uint32_t IC2Prescaler;  
 

  uint32_t IC2Filter;     
 
} TIM_Encoder_InitTypeDef;



  
typedef struct
{
  uint32_t ClockSource;     
  
  uint32_t ClockPolarity;   
 
  uint32_t ClockPrescaler;  
 
  uint32_t ClockFilter;    
 
}TIM_ClockConfigTypeDef;



  
typedef struct
{ 
  uint32_t ClearInputState;      
   
  uint32_t ClearInputSource;     
  
  uint32_t ClearInputPolarity;   
 
  uint32_t ClearInputPrescaler;  
 
  uint32_t ClearInputFilter;    
 
}TIM_ClearInputConfigTypeDef;



  
typedef struct {
  uint32_t  SlaveMode;         
  
  uint32_t  InputTrigger;      
 
  uint32_t  TriggerPolarity;   
 
  uint32_t  TriggerPrescaler;  
 
  uint32_t  TriggerFilter;     
   

}TIM_SlaveConfigTypeDef;



  
typedef enum
{
  HAL_TIM_STATE_RESET             = 0x00U,     
  HAL_TIM_STATE_READY             = 0x01U,     
  HAL_TIM_STATE_BUSY              = 0x02U,     
  HAL_TIM_STATE_TIMEOUT           = 0x03U,     
  HAL_TIM_STATE_ERROR             = 0x04U      
}HAL_TIM_StateTypeDef;



  
typedef enum
{
  HAL_TIM_ACTIVE_CHANNEL_1        = 0x01U,     
  HAL_TIM_ACTIVE_CHANNEL_2        = 0x02U,     
  HAL_TIM_ACTIVE_CHANNEL_3        = 0x04U,     
  HAL_TIM_ACTIVE_CHANNEL_4        = 0x08U,     
  HAL_TIM_ACTIVE_CHANNEL_CLEARED  = 0x00U      
}HAL_TIM_ActiveChannel;



  
typedef struct
{
  TIM_TypeDef                 *Instance;      
  TIM_Base_InitTypeDef        Init;           
  HAL_TIM_ActiveChannel       Channel;        
  DMA_HandleTypeDef           *hdma[7];      
 
  HAL_LockTypeDef             Lock;           
  volatile HAL_TIM_StateTypeDef   State;          
}TIM_HandleTypeDef;


 

 


 



 





 



 




 



 






 



 







 



 





 



 





 



 





 



 




 



 




  



 




 



 




 



 




  



 




  



 





 



 








 



 






  



 




 



 






 



  
#line 501 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


 
  


   




 



 
#line 524 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


 



 
#line 540 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


 



 
#line 560 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


 



 
#line 577 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


 



 







 



 






 



 




 



 






 



   




 
  


 




 
  


 






   


                          




 
  


 




 
  


 




   
  


   
#line 690 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


  



 




  
  


 
#line 715 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


   



 







 



 






 




 




  



 
#line 775 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


  



 
#line 800 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


 



 
#line 814 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"


  



 






  



    
  
 


 



 






 






 






 




 







 
#line 885 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"
                        




 




 




 
#line 911 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"

#line 918 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"






























 





 






 








 









 












 
#line 1000 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"




 



















 
















 





  















 





											 


 

 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"



 



  

  


 
  


 

typedef struct
{
                                  
  uint32_t IC1Polarity;            
 
                                                                   
  uint32_t IC1Prescaler;        
 
                                  
  uint32_t IC1Filter;           
   
  uint32_t Commutation_Delay;  
                               
} TIM_HallSensor_InitTypeDef;



  
typedef struct {
  uint32_t  MasterOutputTrigger;   
  
  uint32_t  MasterOutputTrigger2;  
 
  uint32_t  MasterSlaveMode;       
 
}TIM_MasterConfigTypeDef;





  
typedef struct
{
  uint32_t OffStateRunMode;	    
 
  uint32_t OffStateIDLEMode;	    
 
  uint32_t LockLevel;	 	        
                              
  uint32_t DeadTime;	 	        
 
  uint32_t BreakState;	 	        
 
  uint32_t BreakPolarity;           
 
  uint32_t BreakFilter;             
   
  uint32_t Break2State;	 	        
 
  uint32_t Break2Polarity;          
 
  uint32_t Break2Filter;            
   
  uint32_t AutomaticOutput;         
            
} TIM_BreakDeadTimeConfigTypeDef;




 
typedef struct {
  uint32_t Source;         
 
  uint32_t Enable;         
 
  uint32_t Polarity;       

 
} TIMEx_BreakInputConfigTypeDef;



   
 


 
  


 

#line 155 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"



  
    


 
#line 171 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"

#line 178 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"


 
      


 
#line 197 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"


 	



 




 
  


                          




 
    


 




 
 


 






 
	


   
#line 258 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"


  
    


 
#line 271 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"


 



 




 



 




  



 




  



 




 



  



 

 


   















 
#line 346 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"













 
#line 367 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"













 
#line 388 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"













 
#line 409 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"



  

 


 



 
 
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Init(TIM_HandleTypeDef* htim, TIM_HallSensor_InitTypeDef* sConfig);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_DeInit(TIM_HandleTypeDef* htim);

void HAL_TIMEx_HallSensor_MspInit(TIM_HandleTypeDef* htim);
void HAL_TIMEx_HallSensor_MspDeInit(TIM_HandleTypeDef* htim);

  
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start(TIM_HandleTypeDef* htim);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop(TIM_HandleTypeDef* htim);
 
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_IT(TIM_HandleTypeDef* htim);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_IT(TIM_HandleTypeDef* htim);
 
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Start_DMA(TIM_HandleTypeDef* htim, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_HallSensor_Stop_DMA(TIM_HandleTypeDef* htim);


 



 
 
 
HAL_StatusTypeDef HAL_TIMEx_OCN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);

 
HAL_StatusTypeDef HAL_TIMEx_OCN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);

 
HAL_StatusTypeDef HAL_TIMEx_OCN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_OCN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);


 



 
 
 
HAL_StatusTypeDef HAL_TIMEx_PWMN_Start(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop(TIM_HandleTypeDef* htim, uint32_t Channel);

 
HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIMEx_PWMN_Start_DMA(TIM_HandleTypeDef* htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIMEx_PWMN_Stop_DMA(TIM_HandleTypeDef* htim, uint32_t Channel);


 



 
 
 
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop(TIM_HandleTypeDef* htim, uint32_t OutputChannel);

 
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Start_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIMEx_OnePulseN_Stop_IT(TIM_HandleTypeDef* htim, uint32_t OutputChannel);


 



 
 
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent(TIM_HandleTypeDef* htim, uint32_t  InputTrigger, uint32_t  CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_IT(TIM_HandleTypeDef* htim, uint32_t  InputTrigger, uint32_t  CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_ConfigCommutationEvent_DMA(TIM_HandleTypeDef* htim, uint32_t  InputTrigger, uint32_t  CommutationSource);
HAL_StatusTypeDef HAL_TIMEx_MasterConfigSynchronization(TIM_HandleTypeDef* htim, TIM_MasterConfigTypeDef * sMasterConfig);
HAL_StatusTypeDef HAL_TIMEx_ConfigBreakDeadTime(TIM_HandleTypeDef* htim, TIM_BreakDeadTimeConfigTypeDef *sBreakDeadTimeConfig);

HAL_StatusTypeDef HAL_TIMEx_ConfigBreakInput(TIM_HandleTypeDef *htim, uint32_t BreakInput, TIMEx_BreakInputConfigTypeDef *sBreakInputConfig);

HAL_StatusTypeDef HAL_TIMEx_RemapConfig(TIM_HandleTypeDef* htim, uint32_t Remap);
HAL_StatusTypeDef HAL_TIMEx_GroupChannel5(TIM_HandleTypeDef *htim, uint32_t OCRef);


 



  
 
void HAL_TIMEx_CommutationCallback(TIM_HandleTypeDef* htim);
void HAL_TIMEx_BreakCallback(TIM_HandleTypeDef* htim);
void TIMEx_DMACommutationCplt(DMA_HandleTypeDef *hdma);


 



 
 
HAL_TIM_StateTypeDef HAL_TIMEx_HallSensor_GetState(TIM_HandleTypeDef* htim);


  



  

 
 
 
 


 
#line 550 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
                                 


                                      



#line 566 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"
                              
#line 619 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim_ex.h"




                                            





                                   






   

 


 
  


 



  



 
    






 
#line 1076 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"

 


 



 

 
HAL_StatusTypeDef HAL_TIM_Base_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Base_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Base_MspDeInit(TIM_HandleTypeDef *htim);
 
HAL_StatusTypeDef HAL_TIM_Base_Start(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_Stop(TIM_HandleTypeDef *htim);
 
HAL_StatusTypeDef HAL_TIM_Base_Start_IT(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_Base_Stop_IT(TIM_HandleTypeDef *htim);
 
HAL_StatusTypeDef HAL_TIM_Base_Start_DMA(TIM_HandleTypeDef *htim, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_Base_Stop_DMA(TIM_HandleTypeDef *htim);


 



 
 
HAL_StatusTypeDef HAL_TIM_OC_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_OC_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_MspDeInit(TIM_HandleTypeDef *htim);
 
HAL_StatusTypeDef HAL_TIM_OC_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OC_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIM_OC_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OC_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIM_OC_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_OC_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);



 



 
 
HAL_StatusTypeDef HAL_TIM_PWM_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_PWM_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_MspDeInit(TIM_HandleTypeDef *htim);
 
HAL_StatusTypeDef HAL_TIM_PWM_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIM_PWM_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIM_PWM_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_PWM_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);



 



 
 
HAL_StatusTypeDef HAL_TIM_IC_Init(TIM_HandleTypeDef *htim);
HAL_StatusTypeDef HAL_TIM_IC_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_MspDeInit(TIM_HandleTypeDef *htim);
 
HAL_StatusTypeDef HAL_TIM_IC_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIM_IC_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIM_IC_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_IC_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);



 



 
 
HAL_StatusTypeDef HAL_TIM_OnePulse_Init(TIM_HandleTypeDef *htim, uint32_t OnePulseMode);
HAL_StatusTypeDef HAL_TIM_OnePulse_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OnePulse_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_OnePulse_MspDeInit(TIM_HandleTypeDef *htim);
 
HAL_StatusTypeDef HAL_TIM_OnePulse_Start(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIM_OnePulse_Stop(TIM_HandleTypeDef *htim, uint32_t OutputChannel);

 
HAL_StatusTypeDef HAL_TIM_OnePulse_Start_IT(TIM_HandleTypeDef *htim, uint32_t OutputChannel);
HAL_StatusTypeDef HAL_TIM_OnePulse_Stop_IT(TIM_HandleTypeDef *htim, uint32_t OutputChannel);



 



 
 
HAL_StatusTypeDef HAL_TIM_Encoder_Init(TIM_HandleTypeDef *htim,  TIM_Encoder_InitTypeDef* sConfig);
HAL_StatusTypeDef HAL_TIM_Encoder_DeInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Encoder_MspInit(TIM_HandleTypeDef *htim);
void HAL_TIM_Encoder_MspDeInit(TIM_HandleTypeDef *htim);
  
HAL_StatusTypeDef HAL_TIM_Encoder_Start(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop(TIM_HandleTypeDef *htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIM_Encoder_Start_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop_IT(TIM_HandleTypeDef *htim, uint32_t Channel);
 
HAL_StatusTypeDef HAL_TIM_Encoder_Start_DMA(TIM_HandleTypeDef *htim, uint32_t Channel, uint32_t *pData1, uint32_t *pData2, uint16_t Length);
HAL_StatusTypeDef HAL_TIM_Encoder_Stop_DMA(TIM_HandleTypeDef *htim, uint32_t Channel);



 



 
 
void HAL_TIM_IRQHandler(TIM_HandleTypeDef *htim);



 



 
 
HAL_StatusTypeDef HAL_TIM_OC_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_PWM_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_IC_ConfigChannel(TIM_HandleTypeDef *htim, TIM_IC_InitTypeDef* sConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_OnePulse_ConfigChannel(TIM_HandleTypeDef *htim, TIM_OnePulse_InitTypeDef* sConfig, uint32_t OutputChannel,  uint32_t InputChannel);
HAL_StatusTypeDef HAL_TIM_ConfigOCrefClear(TIM_HandleTypeDef *htim, TIM_ClearInputConfigTypeDef * sClearInputConfig, uint32_t Channel);
HAL_StatusTypeDef HAL_TIM_ConfigClockSource(TIM_HandleTypeDef *htim, TIM_ClockConfigTypeDef * sClockSourceConfig);    
HAL_StatusTypeDef HAL_TIM_ConfigTI1Input(TIM_HandleTypeDef *htim, uint32_t TI1_Selection);
HAL_StatusTypeDef HAL_TIM_SlaveConfigSynchronization(TIM_HandleTypeDef *htim, TIM_SlaveConfigTypeDef * sSlaveConfig);
HAL_StatusTypeDef HAL_TIM_SlaveConfigSynchronization_IT(TIM_HandleTypeDef *htim, TIM_SlaveConfigTypeDef * sSlaveConfig);
HAL_StatusTypeDef HAL_TIM_DMABurst_WriteStart(TIM_HandleTypeDef *htim, uint32_t BurstBaseAddress, uint32_t BurstRequestSrc,                                               uint32_t  *BurstBuffer, uint32_t  BurstLength);

HAL_StatusTypeDef HAL_TIM_DMABurst_WriteStop(TIM_HandleTypeDef *htim, uint32_t BurstRequestSrc);
HAL_StatusTypeDef HAL_TIM_DMABurst_ReadStart(TIM_HandleTypeDef *htim, uint32_t BurstBaseAddress, uint32_t BurstRequestSrc,                                               uint32_t  *BurstBuffer, uint32_t  BurstLength);

HAL_StatusTypeDef HAL_TIM_DMABurst_ReadStop(TIM_HandleTypeDef *htim, uint32_t BurstRequestSrc);
HAL_StatusTypeDef HAL_TIM_GenerateEvent(TIM_HandleTypeDef *htim, uint32_t EventSource);
uint32_t HAL_TIM_ReadCapturedValue(TIM_HandleTypeDef *htim, uint32_t Channel);



 



 
 
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_OC_DelayElapsedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_IC_CaptureCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_PWM_PulseFinishedCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_TriggerCallback(TIM_HandleTypeDef *htim);
void HAL_TIM_ErrorCallback(TIM_HandleTypeDef *htim);



 



 
 
HAL_TIM_StateTypeDef HAL_TIM_Base_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_OC_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_PWM_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_IC_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_OnePulse_GetState(TIM_HandleTypeDef *htim);
HAL_TIM_StateTypeDef HAL_TIM_Encoder_GetState(TIM_HandleTypeDef *htim);



 
  


 
  
 


 



 

























































#line 1355 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"





#line 1373 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"

#line 1384 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"












































#line 1436 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"




#line 1448 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"




























#line 1496 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"

#line 1515 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_tim.h"






 
  


 

 


 
void TIM_Base_SetConfig(TIM_TypeDef *TIMx, TIM_Base_InitTypeDef *Structure);
void TIM_TI1_SetConfig(TIM_TypeDef *TIMx, uint32_t TIM_ICPolarity, uint32_t TIM_ICSelection, uint32_t TIM_ICFilter);
void TIM_OC1_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC2_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC3_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_OC4_SetConfig(TIM_TypeDef *TIMx, TIM_OC_InitTypeDef *OC_Config);
void TIM_ETR_SetConfig(TIM_TypeDef* TIMx, uint32_t TIM_ExtTRGPrescaler, uint32_t TIM_ExtTRGPolarity, uint32_t ExtTRGFilter);

void TIM_DMADelayPulseCplt(DMA_HandleTypeDef *hdma);
void TIM_DMAError(DMA_HandleTypeDef *hdma);
void TIM_DMACaptureCplt(DMA_HandleTypeDef *hdma);
void TIM_CCxChannelCmd(TIM_TypeDef* TIMx, uint32_t Channel, uint32_t ChannelState);


  
     


  



  
  






 
#line 377 "../Inc/stm32f7xx_hal_conf.h"


#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"

































 

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"



 



 

 


 



 
typedef struct
{
  uint32_t BaudRate;                  






 

  uint32_t WordLength;                
 

  uint32_t StopBits;                  
 

  uint32_t Parity;                    




 

  uint32_t Mode;                      
 

  uint32_t HwFlowCtl;                 

 

  uint32_t OverSampling;              
 

  uint32_t OneBitSampling;            

 
}UART_InitTypeDef;



 
typedef struct
{
  uint32_t AdvFeatureInit;        

 

  uint32_t TxPinLevelInvert;      
 

  uint32_t RxPinLevelInvert;      
 

  uint32_t DataInvert;            

 

  uint32_t Swap;                  
 

  uint32_t OverrunDisable;        
 

  uint32_t DMADisableonRxError;   
 

  uint32_t AutoBaudRateEnable;    
 

  uint32_t AutoBaudRateMode;      

 

  uint32_t MSBFirst;              
 
} UART_AdvFeatureInitTypeDef;









































 
typedef enum
{
  HAL_UART_STATE_RESET             = 0x00U,   
 
  HAL_UART_STATE_READY             = 0x20U,   
 
  HAL_UART_STATE_BUSY              = 0x24U,   
 
  HAL_UART_STATE_BUSY_TX           = 0x21U,   
 
  HAL_UART_STATE_BUSY_RX           = 0x22U,   
 
  HAL_UART_STATE_BUSY_TX_RX        = 0x23U,   

 
  HAL_UART_STATE_TIMEOUT           = 0xA0U,   
 
  HAL_UART_STATE_ERROR             = 0xE0U    
 
}HAL_UART_StateTypeDef;



 
typedef enum
{
  UART_CLOCKSOURCE_PCLK1      = 0x00U,     
  UART_CLOCKSOURCE_PCLK2      = 0x01U,     
  UART_CLOCKSOURCE_HSI        = 0x02U,     
  UART_CLOCKSOURCE_SYSCLK     = 0x04U,     
  UART_CLOCKSOURCE_LSE        = 0x08U,     
  UART_CLOCKSOURCE_UNDEFINED  = 0x10U      
}UART_ClockSourceTypeDef;



 
typedef struct
{
  USART_TypeDef            *Instance;         

  UART_InitTypeDef         Init;              

  UART_AdvFeatureInitTypeDef AdvancedInit;    

  uint8_t                  *pTxBuffPtr;       

  uint16_t                 TxXferSize;        

  volatile uint16_t            TxXferCount;       

  uint8_t                  *pRxBuffPtr;       

  uint16_t                 RxXferSize;        

  volatile uint16_t            RxXferCount;       

  uint16_t                 Mask;              

  DMA_HandleTypeDef        *hdmatx;           

  DMA_HandleTypeDef        *hdmarx;           

  HAL_LockTypeDef           Lock;             

  volatile HAL_UART_StateTypeDef    gState;      

 

  volatile HAL_UART_StateTypeDef    RxState;     
 

  volatile uint32_t             ErrorCode;    

}UART_HandleTypeDef;



 

 


 


 
#line 275 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"


 


 




 



 





 



 






 



 





 

 

 




 



 




 



 




 



 






 



 




 



 




 



 




 



 




 



 




 



 




 



 




 



 







 



 
#line 443 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"


 



 




 



 




 



 




 



 




 



 




 



 




 



 




 



 




 



 




 



 



 



 




 



 



 



 



 



 



 



 



 





 
#line 601 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"


 










 
#line 623 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"







 




 





 



 
#line 657 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"


 




 

 


 




 







 























 





 





 





 





 





 




























 

















 



















 




















 

















 













 





      





       





 





 














 


















 


















 


















 








 

 


 




 






 






 







 





 





 


























































#line 1073 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"

































 
 
#line 1 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"

































  

 







 
#line 46 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"



 



 

 
 


 
  


 
#line 71 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"


 

  


 






   

  


   
  
 



 
           




 
#line 266 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"









 
#line 312 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart_ex.h"



 

 



 



 

 
HAL_StatusTypeDef HAL_RS485Ex_Init(UART_HandleTypeDef *huart, uint32_t Polarity, uint32_t AssertionTime, uint32_t DeassertionTime);



 
  


  



 

 
HAL_StatusTypeDef HAL_MultiProcessorEx_AddressLength_Set(UART_HandleTypeDef *huart, uint32_t AddressLength);



 
  


 



 







 
#line 1109 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal_uart.h"
 


 



 

 
HAL_StatusTypeDef HAL_UART_Init(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_Init(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_LIN_Init(UART_HandleTypeDef *huart, uint32_t BreakDetectLength);
HAL_StatusTypeDef HAL_MultiProcessor_Init(UART_HandleTypeDef *huart, uint8_t Address, uint32_t WakeUpMethod);
HAL_StatusTypeDef HAL_RS485Ex_Init(UART_HandleTypeDef *huart, uint32_t Polarity, uint32_t AssertionTime, uint32_t DeassertionTime);
HAL_StatusTypeDef HAL_UART_DeInit (UART_HandleTypeDef *huart);
void HAL_UART_MspInit(UART_HandleTypeDef *huart);
void HAL_UART_MspDeInit(UART_HandleTypeDef *huart);



 



 

 
HAL_StatusTypeDef HAL_UART_Transmit(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_UART_Receive(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout);
HAL_StatusTypeDef HAL_UART_Transmit_IT(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Receive_IT(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Transmit_DMA(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_Receive_DMA(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size);
HAL_StatusTypeDef HAL_UART_DMAPause(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_UART_DMAResume(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_UART_DMAStop(UART_HandleTypeDef *huart);

void HAL_UART_IRQHandler(UART_HandleTypeDef *huart);
void HAL_UART_TxHalfCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart);
void HAL_UART_ErrorCallback(UART_HandleTypeDef *huart);



 



 

 
HAL_StatusTypeDef HAL_LIN_SendBreak(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_MultiProcessorEx_AddressLength_Set(UART_HandleTypeDef *huart, uint32_t AddressLength);
HAL_StatusTypeDef HAL_MultiProcessor_EnableMuteMode(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_MultiProcessor_DisableMuteMode(UART_HandleTypeDef *huart);
void HAL_MultiProcessor_EnterMuteMode(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_EnableTransmitter(UART_HandleTypeDef *huart);
HAL_StatusTypeDef HAL_HalfDuplex_EnableReceiver(UART_HandleTypeDef *huart);



 



 

 
HAL_UART_StateTypeDef HAL_UART_GetState(UART_HandleTypeDef *huart);
uint32_t HAL_UART_GetError(UART_HandleTypeDef *huart);



 



 

 


 

HAL_StatusTypeDef UART_SetConfig(UART_HandleTypeDef *huart);
HAL_StatusTypeDef UART_CheckIdleState(UART_HandleTypeDef *huart);
HAL_StatusTypeDef UART_WaitOnFlagUntilTimeout(UART_HandleTypeDef *huart, uint32_t Flag, FlagStatus Status, uint32_t Tickstart, uint32_t Timeout);
void UART_AdvFeatureConfig(UART_HandleTypeDef *huart);



 



 



 







 
#line 381 "../Inc/stm32f7xx_hal_conf.h"














































 
#line 443 "../Inc/stm32f7xx_hal_conf.h"






 

 
#line 47 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal.h"



 



  

 
 


 



 




 



 
   
 


 
  

 
#line 106 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal.h"

#line 131 "../Drivers/STM32F7xx_HAL_Driver/Inc/stm32f7xx_hal.h"



 

                                       


 









 






 





 





 
  
 


 


 
 
HAL_StatusTypeDef HAL_Init(void);
HAL_StatusTypeDef HAL_DeInit(void);
void HAL_MspInit(void);
void HAL_MspDeInit(void);
HAL_StatusTypeDef HAL_InitTick (uint32_t TickPriority);


 
 


  
 
void HAL_IncTick(void);
void HAL_Delay(volatile uint32_t Delay);
uint32_t HAL_GetTick(void);
void HAL_SuspendTick(void);
void HAL_ResumeTick(void);
uint32_t HAL_GetHalVersion(void);
uint32_t HAL_GetREVID(void);
uint32_t HAL_GetDEVID(void);
uint32_t HAL_GetUIDw0(void);
uint32_t HAL_GetUIDw1(void);
uint32_t HAL_GetUIDw2(void);
void HAL_DBGMCU_EnableDBGSleepMode(void);
void HAL_DBGMCU_DisableDBGSleepMode(void);
void HAL_DBGMCU_EnableDBGStopMode(void);
void HAL_DBGMCU_DisableDBGStopMode(void);
void HAL_DBGMCU_EnableDBGStandbyMode(void);
void HAL_DBGMCU_DisableDBGStandbyMode(void);
void HAL_EnableCompensationCell(void);
void HAL_DisableCompensationCell(void);
void HAL_EnableFMCMemorySwapping(void);
void HAL_DisableFMCMemorySwapping(void);

void HAL_EnableMemorySwappingBank(void);
void HAL_DisableMemorySwappingBank(void);



 



   
 
 


 


 
 


 


 
 
 


  



  
  






 
#line 156 "../Drivers/STM32F7xx_HAL_Driver/Src/stm32f7xx_hal_uart.c"



 




 



 
 


 




 
 
 
 


 
static void UART_EndTxTransfer(UART_HandleTypeDef *huart);
static void UART_EndRxTransfer(UART_HandleTypeDef *huart);
static void UART_DMATransmitCplt(DMA_HandleTypeDef *hdma);
static void UART_DMAReceiveCplt(DMA_HandleTypeDef *hdma);
static void UART_DMARxHalfCplt(DMA_HandleTypeDef *hdma);
static void UART_DMATxHalfCplt(DMA_HandleTypeDef *hdma);
static void UART_DMAError(DMA_HandleTypeDef *hdma);
static void UART_DMAAbortOnError(DMA_HandleTypeDef *hdma);
static HAL_StatusTypeDef UART_Transmit_IT(UART_HandleTypeDef *huart);
static HAL_StatusTypeDef UART_EndTransmit_IT(UART_HandleTypeDef *huart);
static HAL_StatusTypeDef UART_Receive_IT(UART_HandleTypeDef *huart);


 

 



 





























 






 
HAL_StatusTypeDef HAL_UART_Init(UART_HandleTypeDef *huart)
{
   
  if(huart == 0)
  {
    return HAL_ERROR;
  }

  if(huart->Init.HwFlowCtl != ((uint32_t)0x00000000U))
  {
     
    ((void)0U);
  }
  else
  {
     
    ((void)0U);
  }

  if(huart->gState == HAL_UART_STATE_RESET)
  {
     
    huart->Lock = HAL_UNLOCKED;

     
    HAL_UART_MspInit(huart);
  }

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart)->Instance ->CR1 &= ~(0x1U << (0U)));

   
  if (UART_SetConfig(huart) == HAL_ERROR)
  {
    return HAL_ERROR;
  }

  if (huart->AdvancedInit.AdvFeatureInit != ((uint32_t)0x00000000U))
  {
    UART_AdvFeatureConfig(huart);
  }

  

 
  ((huart->Instance ->CR2) &= ~(((0x1U << (14U)) | (0x1U << (11U)))));
  ((huart->Instance ->CR3) &= ~(((0x1U << (5U)) | (0x1U << (3U)) | (0x1U << (1U)))));

   
  ((huart)->Instance ->CR1 |= (0x1U << (0U)));

   
  return (UART_CheckIdleState(huart));
}






 
HAL_StatusTypeDef HAL_HalfDuplex_Init(UART_HandleTypeDef *huart)
{
   
  if(huart == 0)
  {
    return HAL_ERROR;
  }

  if(huart->gState == HAL_UART_STATE_RESET)
  {
     
    huart->Lock = HAL_UNLOCKED;

     
    HAL_UART_MspInit(huart);
  }

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart)->Instance ->CR1 &= ~(0x1U << (0U)));

   
  if (UART_SetConfig(huart) == HAL_ERROR)
  {
    return HAL_ERROR;
  }

  if (huart->AdvancedInit.AdvFeatureInit != ((uint32_t)0x00000000U))
  {
    UART_AdvFeatureConfig(huart);
  }

  

 
  ((huart->Instance ->CR2) &= ~(((0x1U << (14U)) | (0x1U << (11U)))));
  ((huart->Instance ->CR3) &= ~(((0x1U << (1U)) | (0x1U << (5U)))));

   
  ((huart->Instance ->CR3) |= ((0x1U << (3U))));

   
  ((huart)->Instance ->CR1 |= (0x1U << (0U)));

   
  return (UART_CheckIdleState(huart));
}











 
HAL_StatusTypeDef HAL_LIN_Init(UART_HandleTypeDef *huart, uint32_t BreakDetectLength)
{
   
  if(huart == 0)
  {
    return HAL_ERROR;
  }

   
  ((void)0U);
  ((void)0U);
  ((void)0U);

  if(huart->gState == HAL_UART_STATE_RESET)
  {
     
    huart->Lock = HAL_UNLOCKED;

     
    HAL_UART_MspInit(huart);
  }

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart)->Instance ->CR1 &= ~(0x1U << (0U)));

   
  if (UART_SetConfig(huart) == HAL_ERROR)
  {
    return HAL_ERROR;
  }

  if (huart->AdvancedInit.AdvFeatureInit != ((uint32_t)0x00000000U))
  {
    UART_AdvFeatureConfig(huart);
  }

  

 
  ((huart->Instance ->CR2) &= ~((0x1U << (11U))));
  ((huart->Instance ->CR3) &= ~(((0x1U << (3U)) | (0x1U << (1U)) | (0x1U << (5U)))));

   
  ((huart->Instance ->CR2) |= ((0x1U << (14U))));

   
  (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x1U << (5U))))) | (BreakDetectLength))));

   
  ((huart)->Instance ->CR1 |= (0x1U << (0U)));

   
  return (UART_CheckIdleState(huart));
}

















 
HAL_StatusTypeDef HAL_MultiProcessor_Init(UART_HandleTypeDef *huart, uint8_t Address, uint32_t WakeUpMethod)
{
   
  if(huart == 0)
  {
    return HAL_ERROR;
  }

   
  ((void)0U);

  if(huart->gState == HAL_UART_STATE_RESET)
  {
     
    huart->Lock = HAL_UNLOCKED;

     
    HAL_UART_MspInit(huart);
  }

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart)->Instance ->CR1 &= ~(0x1U << (0U)));

   
  if (UART_SetConfig(huart) == HAL_ERROR)
  {
    return HAL_ERROR;
  }

  if (huart->AdvancedInit.AdvFeatureInit != ((uint32_t)0x00000000U))
  {
    UART_AdvFeatureConfig(huart);
  }

  

 
  ((huart->Instance ->CR2) &= ~(((0x1U << (14U)) | (0x1U << (11U)))));
  ((huart->Instance ->CR3) &= ~(((0x1U << (5U)) | (0x1U << (3U)) | (0x1U << (1U)))));

  if (WakeUpMethod == ((uint32_t)(0x1U << (11U))))
  {
     
    (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0xFFU << (24U))))) | (((uint32_t)Address << ((uint32_t) 24U))))));
  }

   
  (((huart->Instance ->CR1)) = ((((((huart->Instance ->CR1))) & (~((0x1U << (11U))))) | (WakeUpMethod))));

   
  ((huart)->Instance ->CR1 |= (0x1U << (0U)));

   
  return (UART_CheckIdleState(huart));
}




















 
HAL_StatusTypeDef HAL_RS485Ex_Init(UART_HandleTypeDef *huart, uint32_t Polarity, uint32_t AssertionTime, uint32_t DeassertionTime)
{
  uint32_t temp = 0x0;

   
  if(huart == 0)
  {
    return HAL_ERROR;
  }
   
  ((void)0U);

   
  ((void)0U);

   
  ((void)0U);

   
  ((void)0U);

  if(huart->gState == HAL_UART_STATE_RESET)
  {
     
    huart->Lock = HAL_UNLOCKED;

     
    HAL_UART_MspInit(huart);
  }

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart)->Instance ->CR1 &= ~(0x1U << (0U)));

   
  if (UART_SetConfig(huart) == HAL_ERROR)
  {
    return HAL_ERROR;
  }

  if(huart->AdvancedInit.AdvFeatureInit != ((uint32_t)0x00000000U))
  {
    UART_AdvFeatureConfig(huart);
  }

   
  ((huart->Instance ->CR3) |= ((0x1U << (14U))));

   
  (((huart->Instance ->CR3)) = ((((((huart->Instance ->CR3))) & (~((0x1U << (15U))))) | (Polarity))));

   
  temp = (AssertionTime << ((uint32_t) 21U));
  temp |= (DeassertionTime << ((uint32_t) 16U));
  (((huart->Instance ->CR1)) = ((((((huart->Instance ->CR1))) & (~(((0x1FU << (16U))|(0x1FU << (21U)))))) | (temp))));

   
  ((huart)->Instance ->CR1 |= (0x1U << (0U)));

   
  return (UART_CheckIdleState(huart));
}





 
HAL_StatusTypeDef HAL_UART_DeInit(UART_HandleTypeDef *huart)
{
   
  if(huart == 0)
  {
    return HAL_ERROR;
  }

   
  ((void)0U);

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart)->Instance ->CR1 &= ~(0x1U << (0U)));

  huart->Instance->CR1 = 0x0U;
  huart->Instance->CR2 = 0x0U;
  huart->Instance->CR3 = 0x0U;

   
  HAL_UART_MspDeInit(huart);

  huart->ErrorCode = ((uint32_t)0x00000000U);
  huart->gState    = HAL_UART_STATE_RESET;
  huart->RxState   = HAL_UART_STATE_RESET;

   
  do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}





 
__weak void HAL_UART_MspInit(UART_HandleTypeDef *huart)
{
   
  ((void)(huart));

  

 
}





 
__weak void HAL_UART_MspDeInit(UART_HandleTypeDef *huart)
{
   
  ((void)(huart));

  

 
}



 























































 








 
HAL_StatusTypeDef HAL_UART_Transmit(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout)
{
  uint16_t* tmp;
  uint32_t tickstart = 0U;

   
  if(huart->gState == HAL_UART_STATE_READY)
  {
    if((pData == 0 ) || (Size == 0U))
    {
      return  HAL_ERROR;
    }

     
    do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

    huart->ErrorCode = ((uint32_t)0x00000000U);
    huart->gState = HAL_UART_STATE_BUSY_TX;

     
    tickstart = HAL_GetTick();

    huart->TxXferSize = Size;
    huart->TxXferCount = Size;
    while(huart->TxXferCount > 0U)
    {
      huart->TxXferCount--;
      if(UART_WaitOnFlagUntilTimeout(huart, ((uint32_t)0x00000080U), RESET, tickstart, Timeout) != HAL_OK)
      {
        return HAL_TIMEOUT;
      }
      if ((huart->Init.WordLength == ((uint32_t)(0x00001U << (12U)))) && (huart->Init.Parity == ((uint32_t)0x00000000U)))
      {
        tmp = (uint16_t*) pData;
        huart->Instance->TDR = (*tmp & (uint16_t)0x01FFU);
        pData += 2;
      }
      else
      {
        huart->Instance->TDR = (*pData++ & (uint8_t)0xFFU);
      }
    }
    if(UART_WaitOnFlagUntilTimeout(huart, ((uint32_t)0x00000040U), RESET, tickstart, Timeout) != HAL_OK)
    {
      return HAL_TIMEOUT;
    }

     
    huart->gState = HAL_UART_STATE_READY;

     
    do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}








 
HAL_StatusTypeDef HAL_UART_Receive(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size, uint32_t Timeout)
{
  uint16_t* tmp;
  uint16_t uhMask;
  uint32_t tickstart = 0U;

   
  if(huart->RxState == HAL_UART_STATE_READY)
  {
    if((pData == 0 ) || (Size == 0U))
    {
      return  HAL_ERROR;
    }

     
    do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

    huart->ErrorCode = ((uint32_t)0x00000000U);
    huart->RxState = HAL_UART_STATE_BUSY_RX;

     
    tickstart = HAL_GetTick();

    huart->RxXferSize = Size;
    huart->RxXferCount = Size;

     
    do { if ((huart)->Init . WordLength == ((uint32_t)(0x00001U << (12U)))) { if ((huart)->Init . Parity == ((uint32_t)0x00000000U)) { (huart)->Mask = 0x01FF ; } else { (huart)->Mask = 0x00FF ; } } else if ((huart)->Init . WordLength == ((uint32_t)0x0000U)) { if ((huart)->Init . Parity == ((uint32_t)0x00000000U)) { (huart)->Mask = 0x00FF ; } else { (huart)->Mask = 0x007F ; } } else if ((huart)->Init . WordLength == ((uint32_t)0x10000000U)) { if ((huart)->Init . Parity == ((uint32_t)0x00000000U)) { (huart)->Mask = 0x007F ; } else { (huart)->Mask = 0x003F ; } } } while(0);
    uhMask = huart->Mask;

     
    while(huart->RxXferCount > 0U)
    {
      huart->RxXferCount--;
      if(UART_WaitOnFlagUntilTimeout(huart, ((uint32_t)0x00000020U), RESET, tickstart, Timeout) != HAL_OK)
      {
        return HAL_TIMEOUT;
      }
      if ((huart->Init.WordLength == ((uint32_t)(0x00001U << (12U)))) && (huart->Init.Parity == ((uint32_t)0x00000000U)))
      {
        tmp = (uint16_t*) pData ;
        *tmp = (uint16_t)(huart->Instance->RDR & uhMask);
        pData +=2U;
      }
      else
      {
        *pData++ = (uint8_t)(huart->Instance->RDR & (uint8_t)uhMask);
      }
    }

     
    huart->RxState = HAL_UART_STATE_READY;

     
    do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}







 
HAL_StatusTypeDef HAL_UART_Transmit_IT(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size)
{
   
  if(huart->gState == HAL_UART_STATE_READY)
  {
    if((pData == 0 ) || (Size == 0U))
    {
      return HAL_ERROR;
    }

     
    do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

    huart->pTxBuffPtr = pData;
    huart->TxXferSize = Size;
    huart->TxXferCount = Size;

    huart->ErrorCode = ((uint32_t)0x00000000U);
    huart->gState = HAL_UART_STATE_BUSY_TX;

     
    do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

     
    ((huart->Instance ->CR1) |= ((0x1U << (7U))));

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}







 
HAL_StatusTypeDef HAL_UART_Receive_IT(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size)
{
   
  if(huart->RxState == HAL_UART_STATE_READY)
  {
    if((pData == 0 ) || (Size == 0U))
    {
      return HAL_ERROR;
    }

     
    do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

    huart->pRxBuffPtr = pData;
    huart->RxXferSize = Size;
    huart->RxXferCount = Size;

     
    do { if ((huart)->Init . WordLength == ((uint32_t)(0x00001U << (12U)))) { if ((huart)->Init . Parity == ((uint32_t)0x00000000U)) { (huart)->Mask = 0x01FF ; } else { (huart)->Mask = 0x00FF ; } } else if ((huart)->Init . WordLength == ((uint32_t)0x0000U)) { if ((huart)->Init . Parity == ((uint32_t)0x00000000U)) { (huart)->Mask = 0x00FF ; } else { (huart)->Mask = 0x007F ; } } else if ((huart)->Init . WordLength == ((uint32_t)0x10000000U)) { if ((huart)->Init . Parity == ((uint32_t)0x00000000U)) { (huart)->Mask = 0x007F ; } else { (huart)->Mask = 0x003F ; } } } while(0);

    huart->ErrorCode = ((uint32_t)0x00000000U);
    huart->RxState = HAL_UART_STATE_BUSY_RX;

     
    do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

     
    ((huart->Instance ->CR3) |= ((0x1U << (0U))));

     
    ((huart->Instance ->CR1) |= ((0x1U << (8U)) | (0x1U << (5U))));

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}







 
HAL_StatusTypeDef HAL_UART_Transmit_DMA(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size)
{
  uint32_t *tmp;

   
  if(huart->gState == HAL_UART_STATE_READY)
  {
    if((pData == 0 ) || (Size == 0U))
    {
      return HAL_ERROR;
    }

     
    do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

    huart->pTxBuffPtr = pData;
    huart->TxXferSize = Size;
    huart->TxXferCount = Size;

    huart->ErrorCode = ((uint32_t)0x00000000U);
    huart->gState = HAL_UART_STATE_BUSY_TX;

     
    huart->hdmatx->XferCpltCallback = UART_DMATransmitCplt;

     
    huart->hdmatx->XferHalfCpltCallback = UART_DMATxHalfCplt;

     
    huart->hdmatx->XferErrorCallback = UART_DMAError;

     
    huart->hdmatx->XferAbortCallback = 0;

     
    tmp = (uint32_t*)&pData;
    HAL_DMA_Start_IT(huart->hdmatx, *(uint32_t*)tmp, (uint32_t)&huart->Instance->TDR, Size);

     
    ((huart)->Instance ->ICR = (uint32_t)(((uint32_t)0x00000040U)));

     
    do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

    
 
    ((huart->Instance ->CR3) |= ((0x1U << (7U))));

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}









 
HAL_StatusTypeDef HAL_UART_Receive_DMA(UART_HandleTypeDef *huart, uint8_t *pData, uint16_t Size)
{
  uint32_t *tmp;

   
  if(huart->RxState == HAL_UART_STATE_READY)
  {
    if((pData == 0 ) || (Size == 0U))
    {
      return HAL_ERROR;
    }

     
    do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

    huart->pRxBuffPtr = pData;
    huart->RxXferSize = Size;

    huart->ErrorCode = ((uint32_t)0x00000000U);
    huart->RxState = HAL_UART_STATE_BUSY_RX;

     
    huart->hdmarx->XferCpltCallback = UART_DMAReceiveCplt;

     
    huart->hdmarx->XferHalfCpltCallback = UART_DMARxHalfCplt;

     
    huart->hdmarx->XferErrorCallback = UART_DMAError;

     
    huart->hdmarx->XferAbortCallback = 0;

     
    tmp = (uint32_t*)&pData;
    HAL_DMA_Start_IT(huart->hdmarx, (uint32_t)&huart->Instance->RDR, *(uint32_t*)tmp, Size);

     
    do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

     
    ((huart->Instance ->CR1) |= ((0x1U << (8U))));

     
    ((huart->Instance ->CR3) |= ((0x1U << (0U))));

    
 
    ((huart->Instance ->CR3) |= ((0x1U << (6U))));

    return HAL_OK;
  }
  else
  {
    return HAL_BUSY;
  }
}





 
HAL_StatusTypeDef HAL_UART_DMAPause(UART_HandleTypeDef *huart)
{
   
  do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

  if ((huart->gState == HAL_UART_STATE_BUSY_TX) &&
      ((((huart->Instance ->CR3) & ((0x1U << (7U)))) != RESET)))
  {
     
    ((huart->Instance ->CR3) &= ~((0x1U << (7U))));
  }
  if ((huart->RxState == HAL_UART_STATE_BUSY_RX) &&
      ((((huart->Instance ->CR3) & ((0x1U << (6U)))) != RESET)))
  {
     
    ((huart->Instance ->CR1) &= ~((0x1U << (8U))));
    ((huart->Instance ->CR3) &= ~((0x1U << (0U))));

     
    ((huart->Instance ->CR3) &= ~((0x1U << (6U))));
  }

   
  do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}





 
HAL_StatusTypeDef HAL_UART_DMAResume(UART_HandleTypeDef *huart)
{
   
  do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

  if(huart->gState == HAL_UART_STATE_BUSY_TX)
  {
     
    ((huart->Instance ->CR3) |= ((0x1U << (7U))));
  }
  if(huart->RxState == HAL_UART_STATE_BUSY_RX)
  {
     
    ((huart)->Instance ->ICR = (uint32_t)((0x1U << (3U))));

     
    ((huart->Instance ->CR1) |= ((0x1U << (8U))));
    ((huart->Instance ->CR3) |= ((0x1U << (0U))));

     
    ((huart->Instance ->CR3) |= ((0x1U << (6U))));
  }

   
  if ((huart->Instance->CR1 & (0x1U << (0U))) == 0U)
  {
     
    ((huart)->Instance ->CR1 |= (0x1U << (0U)));
  }

  return HAL_OK;
}





 
HAL_StatusTypeDef HAL_UART_DMAStop(UART_HandleTypeDef *huart)
{
  




 

   
  if ((huart->gState == HAL_UART_STATE_BUSY_TX) &&
      ((((huart->Instance ->CR3) & ((0x1U << (7U)))) != RESET)))
  {
    ((huart->Instance ->CR3) &= ~((0x1U << (7U))));

     
    if(huart->hdmatx != 0)
    {
      HAL_DMA_Abort(huart->hdmatx);
    }

    UART_EndTxTransfer(huart);
  }

   
  if ((huart->RxState == HAL_UART_STATE_BUSY_RX) &&
      ((((huart->Instance ->CR3) & ((0x1U << (6U)))) != RESET)))
  {
    ((huart->Instance ->CR3) &= ~((0x1U << (6U))));

     
    if(huart->hdmarx != 0)
    {
      HAL_DMA_Abort(huart->hdmarx);
    }

    UART_EndRxTransfer(huart);
  }

  return HAL_OK;
}





 
void HAL_UART_IRQHandler(UART_HandleTypeDef *huart)
{
  uint32_t isrflags   = ((huart->Instance ->ISR));
  uint32_t cr1its     = ((huart->Instance ->CR1));
  uint32_t cr3its     = ((huart->Instance ->CR3));
  uint32_t errorflags;

   
  errorflags = (isrflags & (uint32_t)((0x1U << (0U)) | (0x1U << (1U)) | (0x1U << (3U)) | (0x1U << (2U))));
  if (errorflags == RESET)
  {
     
    if(((isrflags & (0x1U << (5U))) != RESET) && ((cr1its & (0x1U << (5U))) != RESET))
    {
      UART_Receive_IT(huart);
      return;
    }
  }

   
  if(   (errorflags != RESET)
     && (   ((cr3its & (0x1U << (0U))) != RESET)
         || ((cr1its & ((0x1U << (5U)) | (0x1U << (8U)))) != RESET)) )
  {

     
    if(((isrflags & (0x1U << (0U))) != RESET) && ((cr1its & (0x1U << (8U))) != RESET))
    {
      ((huart)->Instance ->ICR = (uint32_t)((0x1U << (0U))));

      huart->ErrorCode |= ((uint32_t)0x00000001U);
    }

     
    if(((isrflags & (0x1U << (1U))) != RESET) && ((cr3its & (0x1U << (0U))) != RESET))
    {
      ((huart)->Instance ->ICR = (uint32_t)((0x1U << (1U))));

      huart->ErrorCode |= ((uint32_t)0x00000004U);
    }

     
    if(((isrflags & (0x1U << (2U))) != RESET) && ((cr3its & (0x1U << (0U))) != RESET))
    {
      ((huart)->Instance ->ICR = (uint32_t)((0x1U << (2U))));

      huart->ErrorCode |= ((uint32_t)0x00000002U);
    }
    
     
    if(((isrflags & (0x1U << (3U))) != RESET) &&
       (((cr1its & (0x1U << (5U))) != RESET) || ((cr3its & (0x1U << (0U))) != RESET)))
    {
      ((huart)->Instance ->ICR = (uint32_t)((0x1U << (3U))));

      huart->ErrorCode |= ((uint32_t)0x00000008U);
    }

     
    if(huart->ErrorCode != ((uint32_t)0x00000000U))
    {
       
      if(((isrflags & (0x1U << (5U))) != RESET) && ((cr1its & (0x1U << (5U))) != RESET))
      {
        UART_Receive_IT(huart);
      }

      
 
      if (((huart->ErrorCode & ((uint32_t)0x00000008U)) != RESET) ||
          ((((huart->Instance ->CR3) & ((0x1U << (6U)))) != RESET)))
      {
        

 
        UART_EndRxTransfer(huart);

         
        if ((((huart->Instance ->CR3) & ((0x1U << (6U)))) != RESET))
        {
          ((huart->Instance ->CR3) &= ~((0x1U << (6U))));

           
          if(huart->hdmarx != 0)
          {
            
 
            huart->hdmarx->XferAbortCallback = UART_DMAAbortOnError;

             
            if(HAL_DMA_Abort_IT(huart->hdmarx) != HAL_OK)
            {
               
              huart->hdmarx->XferAbortCallback(huart->hdmarx);
            }
          }
          else
          {
             
            HAL_UART_ErrorCallback(huart);
          }
        }
        else
        {
           
          HAL_UART_ErrorCallback(huart);
        }
      }
      else
      {
        
 
        HAL_UART_ErrorCallback(huart);
        huart->ErrorCode = ((uint32_t)0x00000000U);
      }
    }
    return;

  }  

   
  if(((isrflags & (0x1U << (7U))) != RESET) && ((cr1its & (0x1U << (7U))) != RESET))
  {
    UART_Transmit_IT(huart);
    return;
  }

   
  if(((isrflags & (0x1U << (6U))) != RESET) && ((cr1its & (0x1U << (6U))) != RESET))
  {
    UART_EndTransmit_IT(huart);
    return;
  }

}









 
HAL_StatusTypeDef UART_WaitOnFlagUntilTimeout(UART_HandleTypeDef *huart, uint32_t Flag, FlagStatus Status, uint32_t Tickstart, uint32_t Timeout)
{
   
  while(((((huart)->Instance ->ISR & (Flag)) == (Flag)) ? SET : RESET) == Status)
  {
     
    if(Timeout != 0xFFFFFFFFU)
    {
      if((Timeout == 0U)||((HAL_GetTick()-Tickstart) >=  Timeout))
      {
         
        ((huart->Instance ->CR1) &= ~(((0x1U << (5U)) | (0x1U << (8U)) | (0x1U << (7U)))));
        ((huart->Instance ->CR3) &= ~((0x1U << (0U))));

        huart->gState = HAL_UART_STATE_READY;
        huart->RxState = HAL_UART_STATE_READY;

         
        do{ (huart)->Lock = HAL_UNLOCKED; }while (0);
        return HAL_TIMEOUT;
      }
    }
  }
  return HAL_OK;
}





 
static void UART_DMATransmitCplt(DMA_HandleTypeDef *hdma)
{
  UART_HandleTypeDef* huart = ( UART_HandleTypeDef* )((DMA_HandleTypeDef* )hdma)->Parent;

   
  if((hdma->Instance->CR & (0x1U << (8U))) == 0U)
  {
    huart->TxXferCount = 0U;

    
 
    ((huart->Instance ->CR3) &= ~((0x1U << (7U))));

     
    ((huart->Instance ->CR1) |= ((0x1U << (6U))));
  }
   
  else
  {
    HAL_UART_TxCpltCallback(huart);
  }
}





 
static void UART_DMATxHalfCplt(DMA_HandleTypeDef *hdma)
{
  UART_HandleTypeDef* huart = (UART_HandleTypeDef*)((DMA_HandleTypeDef*)hdma)->Parent;

  HAL_UART_TxHalfCpltCallback(huart);
}





 
static void UART_DMAReceiveCplt(DMA_HandleTypeDef *hdma)
{
  UART_HandleTypeDef* huart = ( UART_HandleTypeDef* )((DMA_HandleTypeDef* )hdma)->Parent;

   
  if((hdma->Instance->CR & (0x1U << (8U))) == 0U)
  {
    huart->RxXferCount = 0U;

     
    ((huart->Instance ->CR1) &= ~((0x1U << (8U))));
    ((huart->Instance ->CR3) &= ~((0x1U << (0U))));

    
 
    ((huart->Instance ->CR3) &= ~((0x1U << (6U))));

	 
    huart->RxState = HAL_UART_STATE_READY;
  }
  HAL_UART_RxCpltCallback(huart);
}





 
static void UART_DMARxHalfCplt(DMA_HandleTypeDef *hdma)
{
  UART_HandleTypeDef* huart = (UART_HandleTypeDef*)((DMA_HandleTypeDef*)hdma)->Parent;

  HAL_UART_RxHalfCpltCallback(huart);
}





 
static void UART_DMAError(DMA_HandleTypeDef *hdma)
{
  UART_HandleTypeDef* huart = ( UART_HandleTypeDef* )((DMA_HandleTypeDef* )hdma)->Parent;
  huart->RxXferCount = 0U;
  huart->TxXferCount = 0U;
   
  if (  (huart->gState == HAL_UART_STATE_BUSY_TX)
      &&((((huart->Instance ->CR3) & ((0x1U << (7U)))) != RESET)) )
  {
    UART_EndTxTransfer(huart);
  }

   
  if (  (huart->RxState == HAL_UART_STATE_BUSY_RX)
      &&((((huart->Instance ->CR3) & ((0x1U << (6U)))) != RESET)) )
  {
    UART_EndRxTransfer(huart);
  }
  ((huart->ErrorCode) |= (((uint32_t)0x00000010U)));
  HAL_UART_ErrorCallback(huart);
}






 
static void UART_DMAAbortOnError(DMA_HandleTypeDef *hdma)
{
  UART_HandleTypeDef* huart = (UART_HandleTypeDef*)(hdma->Parent);
  huart->RxXferCount = 0U;
  huart->TxXferCount = 0U;

  HAL_UART_ErrorCallback(huart);
}





 
 __weak void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart)
{
   
  ((void)(huart));

  

 
}





 
 __weak void HAL_UART_TxHalfCpltCallback(UART_HandleTypeDef *huart)
{
   
  ((void)(huart));

  

 
}





 
__weak void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
   
  ((void)(huart));

  

 
}





 
__weak void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef *huart)
{
   
  ((void)(huart));

  

 
}





 
 __weak void HAL_UART_ErrorCallback(UART_HandleTypeDef *huart)
{
   
  ((void)(huart));

  

 
}







 
static HAL_StatusTypeDef UART_Transmit_IT(UART_HandleTypeDef *huart)
{
  uint16_t* tmp;

   
  if (huart->gState == HAL_UART_STATE_BUSY_TX)
  {

    if(huart->TxXferCount == 0U)
    {
       
      ((huart->Instance ->CR1) &= ~((0x1U << (7U))));

       
      ((huart->Instance ->CR1) |= ((0x1U << (6U))));

      return HAL_OK;
    }
    else
    {
      if ((huart->Init.WordLength == ((uint32_t)(0x00001U << (12U)))) && (huart->Init.Parity == ((uint32_t)0x00000000U)))
      {
        tmp = (uint16_t*) huart->pTxBuffPtr;
        huart->Instance->TDR = (*tmp & (uint16_t)0x01FFU);
        huart->pTxBuffPtr += 2U;
      }
      else
      {
        huart->Instance->TDR = (uint8_t)(*huart->pTxBuffPtr++ & (uint8_t)0xFFU);
      }

      huart->TxXferCount--;

      return HAL_OK;
    }
  }
  else
  {
    return HAL_BUSY;
  }
}






 
static HAL_StatusTypeDef UART_EndTransmit_IT(UART_HandleTypeDef *huart)
{
   
  ((huart->Instance ->CR1) &= ~((0x1U << (6U))));

   
  huart->gState = HAL_UART_STATE_READY;

  HAL_UART_TxCpltCallback(huart);

  return HAL_OK;
}







 
static HAL_StatusTypeDef UART_Receive_IT(UART_HandleTypeDef *huart)
{
  uint16_t* tmp;
  uint16_t uhMask = huart->Mask;

   
  if(huart->RxState == HAL_UART_STATE_BUSY_RX)
  {

    if ((huart->Init.WordLength == ((uint32_t)(0x00001U << (12U)))) && (huart->Init.Parity == ((uint32_t)0x00000000U)))
    {
      tmp = (uint16_t*) huart->pRxBuffPtr ;
      *tmp = (uint16_t)(huart->Instance->RDR & uhMask);
      huart->pRxBuffPtr +=2;
    }
    else
    {
      *huart->pRxBuffPtr++ = (uint8_t)(huart->Instance->RDR & (uint8_t)uhMask);
    }

    if(--huart->RxXferCount == 0)
    {
       
      ((huart->Instance ->CR1) &= ~(((0x1U << (5U)) | (0x1U << (8U)))));

       
      ((huart->Instance ->CR3) &= ~((0x1U << (0U))));

       
      huart->RxState = HAL_UART_STATE_READY;

      HAL_UART_RxCpltCallback(huart);

      return HAL_OK;
    }

    return HAL_OK;
  }
  else
  {
     
    ((huart)->Instance ->RQR |= (uint32_t)(((uint32_t)(0x1U << (3U)))));

    return HAL_BUSY;
  }
}





 
static void UART_EndTxTransfer(UART_HandleTypeDef *huart)
{
   
  ((huart->Instance ->CR1) &= ~(((0x1U << (7U)) | (0x1U << (6U)))));

   
  huart->gState = HAL_UART_STATE_READY;
}






 
static void UART_EndRxTransfer(UART_HandleTypeDef *huart)
{
   
  ((huart->Instance ->CR1) &= ~(((0x1U << (5U)) | (0x1U << (8U)))));
  ((huart->Instance ->CR3) &= ~((0x1U << (0U))));

   
  huart->RxState = HAL_UART_STATE_READY;
}



 

























 






 
HAL_StatusTypeDef HAL_MultiProcessor_EnableMuteMode(UART_HandleTypeDef *huart)
{
   
  do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart->Instance ->CR1) |= ((0x1U << (13U))));

  huart->gState = HAL_UART_STATE_READY;

  return (UART_CheckIdleState(huart));
}






 
HAL_StatusTypeDef HAL_MultiProcessor_DisableMuteMode(UART_HandleTypeDef *huart)
{
   
  do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

  huart->gState = HAL_UART_STATE_BUSY;

    
  ((huart->Instance ->CR1) &= ~((0x1U << (13U))));

  huart->gState = HAL_UART_STATE_READY;

  return (UART_CheckIdleState(huart));
}






 
void HAL_MultiProcessor_EnterMuteMode(UART_HandleTypeDef *huart)
{
  ((huart)->Instance ->RQR |= (uint32_t)(((uint32_t)(0x1U << (2U)))));
}







 
HAL_UART_StateTypeDef HAL_UART_GetState(UART_HandleTypeDef *huart)
{
  uint32_t temp1= 0x00U, temp2 = 0x00U;
  temp1 = huart->gState;
  temp2 = huart->RxState;

  return (HAL_UART_StateTypeDef)(temp1 | temp2);
}






 
uint32_t HAL_UART_GetError(UART_HandleTypeDef *huart)
{
  return huart->ErrorCode;
}





 
HAL_StatusTypeDef UART_SetConfig(UART_HandleTypeDef *huart)
{
  uint32_t tmpreg                     = 0x00000000U;
  UART_ClockSourceTypeDef clocksource = UART_CLOCKSOURCE_UNDEFINED;
  uint16_t brrtemp                    = 0x0000U;
  uint16_t usartdiv                   = 0x0000U;
  HAL_StatusTypeDef ret               = HAL_OK;

   
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);
  ((void)0U);


   
  




 
  tmpreg = (uint32_t)huart->Init.WordLength | huart->Init.Parity | huart->Init.Mode | huart->Init.OverSampling ;
  (((huart->Instance ->CR1)) = ((((((huart->Instance ->CR1))) & (~(((uint32_t)((0x10001U << (12U)) | (0x1U << (10U)) | (0x1U << (9U)) | (0x1U << (3U)) | (0x1U << (2U)) | (0x1U << (15U))))))) | (tmpreg))));

   
  
 
  (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x3U << (12U))))) | (huart->Init . StopBits))));

   
  



 
  tmpreg = (uint32_t)huart->Init.HwFlowCtl | huart->Init.OneBitSampling ;
  (((huart->Instance ->CR3)) = ((((((huart->Instance ->CR3))) & (~(((0x1U << (8U)) | (0x1U << (9U)) | (0x1U << (11U)))))) | (tmpreg))));

   
  do { if((huart)->Instance == ((USART_TypeDef *) ((0x40000000U + 0x00010000U) + 0x1000U))) { switch(((uint32_t)(((((RCC_TypeDef *) ((0x40000000U + 0x00020000U) + 0x3800U))->DCKCFGR2) & ((0x3U << (0U))))))) { case ((uint32_t)0x00000000U): (clocksource) = UART_CLOCKSOURCE_PCLK2; break; case (0x2U << (0U)): (clocksource) = UART_CLOCKSOURCE_HSI; break; case (0x1U << (0U)): (clocksource) = UART_CLOCKSOURCE_SYSCLK; break; case (0x3U << (0U)): (clocksource) = UART_CLOCKSOURCE_LSE; break; default: break; } } else if((huart)->Instance == ((USART_TypeDef *) (0x40000000U + 0x4400U))) { switch(((uint32_t)(((((RCC_TypeDef *) ((0x40000000U + 0x00020000U) + 0x3800U))->DCKCFGR2) & ((0x3U << (2U))))))) { case ((uint32_t)0x00000000U): (clocksource) = UART_CLOCKSOURCE_PCLK1; break; case (0x2U << (2U)): (clocksource) = UART_CLOCKSOURCE_HSI; break; case (0x1U << (2U)): (clocksource) = UART_CLOCKSOURCE_SYSCLK; break; case (0x3U << (2U)): (clocksource) = UART_CLOCKSOURCE_LSE; break; default: break; } } else if((huart)->Instance == ((USART_TypeDef *) (0x40000000U + 0x4800U))) { switch(((uint32_t)(((((RCC_TypeDef *) ((0x40000000U + 0x00020000U) + 0x3800U))->DCKCFGR2) & ((0x3U << (4U))))))) { case ((uint32_t)0x00000000U): (clocksource) = UART_CLOCKSOURCE_PCLK1; break; case (0x2U << (4U)): (clocksource) = UART_CLOCKSOURCE_HSI; break; case (0x1U << (4U)): (clocksource) = UART_CLOCKSOURCE_SYSCLK; break; case (0x3U << (4U)): (clocksource) = UART_CLOCKSOURCE_LSE; break; default: break; } } else if((huart)->Instance == ((USART_TypeDef *) (0x40000000U + 0x4C00U))) { switch(((uint32_t)(((((RCC_TypeDef *) ((0x40000000U + 0x00020000U) + 0x3800U))->DCKCFGR2) & ((0x3U << (6U))))))) { case ((uint32_t)0x00000000U): (clocksource) = UART_CLOCKSOURCE_PCLK1; break; case (0x2U << (6U)): (clocksource) = UART_CLOCKSOURCE_HSI; break; case (0x1U << (6U)): (clocksource) = UART_CLOCKSOURCE_SYSCLK; break; case (0x3U << (6U)): (clocksource) = UART_CLOCKSOURCE_LSE; break; default: break; } } else if ((huart)->Instance == ((USART_TypeDef *) (0x40000000U + 0x5000U))) { switch(((uint32_t)(((((RCC_TypeDef *) ((0x40000000U + 0x00020000U) + 0x3800U))->DCKCFGR2) & ((0x3U << (8U))))))) { case ((uint32_t)0x00000000U): (clocksource) = UART_CLOCKSOURCE_PCLK1; break; case (0x2U << (8U)): (clocksource) = UART_CLOCKSOURCE_HSI; break; case (0x1U << (8U)): (clocksource) = UART_CLOCKSOURCE_SYSCLK; break; case (0x3U << (8U)): (clocksource) = UART_CLOCKSOURCE_LSE; break; default: break; } } else if((huart)->Instance == ((USART_TypeDef *) ((0x40000000U + 0x00010000U) + 0x1400U))) { switch(((uint32_t)(((((RCC_TypeDef *) ((0x40000000U + 0x00020000U) + 0x3800U))->DCKCFGR2) & ((0x3U << (10U))))))) { case ((uint32_t)0x00000000U): (clocksource) = UART_CLOCKSOURCE_PCLK2; break; case (0x2U << (10U)): (clocksource) = UART_CLOCKSOURCE_HSI; break; case (0x1U << (10U)): (clocksource) = UART_CLOCKSOURCE_SYSCLK; break; case (0x3U << (10U)): (clocksource) = UART_CLOCKSOURCE_LSE; break; default: break; } } else if ((huart)->Instance == ((USART_TypeDef *) (0x40000000U + 0x7800U))) { switch(((uint32_t)(((((RCC_TypeDef *) ((0x40000000U + 0x00020000U) + 0x3800U))->DCKCFGR2) & ((0x3U << (12U))))))) { case ((uint32_t)0x00000000U): (clocksource) = UART_CLOCKSOURCE_PCLK1; break; case (0x2U << (12U)): (clocksource) = UART_CLOCKSOURCE_HSI; break; case (0x1U << (12U)): (clocksource) = UART_CLOCKSOURCE_SYSCLK; break; case (0x3U << (12U)): (clocksource) = UART_CLOCKSOURCE_LSE; break; default: break; } } else if ((huart)->Instance == ((USART_TypeDef *) (0x40000000U + 0x7C00U))) { switch(((uint32_t)(((((RCC_TypeDef *) ((0x40000000U + 0x00020000U) + 0x3800U))->DCKCFGR2) & ((0x3U << (14U))))))) { case ((uint32_t)0x00000000U): (clocksource) = UART_CLOCKSOURCE_PCLK1; break; case (0x2U << (14U)): (clocksource) = UART_CLOCKSOURCE_HSI; break; case (0x1U << (14U)): (clocksource) = UART_CLOCKSOURCE_SYSCLK; break; case (0x3U << (14U)): (clocksource) = UART_CLOCKSOURCE_LSE; break; default: break; } } } while(0);

   
  if (huart->Init.OverSampling == ((uint32_t)(0x1U << (15U))))
  {
    switch (clocksource)
    {
    case UART_CLOCKSOURCE_PCLK1:
        usartdiv = (uint16_t)(((((HAL_RCC_GetPCLK1Freq())*2)+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
    case UART_CLOCKSOURCE_PCLK2:
        usartdiv = (uint16_t)(((((HAL_RCC_GetPCLK2Freq())*2)+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
    case UART_CLOCKSOURCE_HSI:
        usartdiv = (uint16_t)(((((((uint32_t)16000000U))*2)+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
    case UART_CLOCKSOURCE_SYSCLK:
        usartdiv = (uint16_t)(((((HAL_RCC_GetSysClockFreq())*2)+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
    case UART_CLOCKSOURCE_LSE:
        usartdiv = (uint16_t)(((((((uint32_t)32768U))*2)+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
      case UART_CLOCKSOURCE_UNDEFINED:
    default:
        ret = HAL_ERROR;
      break;
    }

    brrtemp = usartdiv & 0xFFF0U;
    brrtemp |= (uint16_t)((usartdiv & (uint16_t)0x000FU) >> 1U);
    huart->Instance->BRR = brrtemp;
  }
  else
  {
    switch (clocksource)
    {
    case UART_CLOCKSOURCE_PCLK1:
        huart->Instance->BRR = (uint16_t)(((((HAL_RCC_GetPCLK1Freq()))+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
    case UART_CLOCKSOURCE_PCLK2:
        huart->Instance->BRR = (uint16_t)(((((HAL_RCC_GetPCLK2Freq()))+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
    case UART_CLOCKSOURCE_HSI:
        huart->Instance->BRR = (uint16_t)(((((((uint32_t)16000000U)))+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
    case UART_CLOCKSOURCE_SYSCLK:
        huart->Instance->BRR = (uint16_t)(((((HAL_RCC_GetSysClockFreq()))+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
    case UART_CLOCKSOURCE_LSE:
        huart->Instance->BRR = (uint16_t)(((((((uint32_t)32768U)))+((huart->Init . BaudRate)/2))/((huart->Init . BaudRate))));
      break;
      case UART_CLOCKSOURCE_UNDEFINED:
    default:
        ret = HAL_ERROR;
      break;
    }
  }

  return ret;

}






 
void UART_AdvFeatureConfig(UART_HandleTypeDef *huart)
{
   
  ((void)0U);

   
  if((((huart->AdvancedInit . AdvFeatureInit) & (((uint32_t)0x00000001U))) != RESET))
  {
    ((void)0U);
    (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x1U << (17U))))) | (huart->AdvancedInit . TxPinLevelInvert))));
  }

   
  if((((huart->AdvancedInit . AdvFeatureInit) & (((uint32_t)0x00000002U))) != RESET))
  {
    ((void)0U);
    (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x1U << (16U))))) | (huart->AdvancedInit . RxPinLevelInvert))));
  }

   
  if((((huart->AdvancedInit . AdvFeatureInit) & (((uint32_t)0x00000004U))) != RESET))
  {
    ((void)0U);
    (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x1U << (18U))))) | (huart->AdvancedInit . DataInvert))));
  }

   
  if((((huart->AdvancedInit . AdvFeatureInit) & (((uint32_t)0x00000008U))) != RESET))
  {
    ((void)0U);
    (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x1U << (15U))))) | (huart->AdvancedInit . Swap))));
  }

   
  if((((huart->AdvancedInit . AdvFeatureInit) & (((uint32_t)0x00000010U))) != RESET))
  {
    ((void)0U);
    (((huart->Instance ->CR3)) = ((((((huart->Instance ->CR3))) & (~((0x1U << (12U))))) | (huart->AdvancedInit . OverrunDisable))));
  }

   
  if((((huart->AdvancedInit . AdvFeatureInit) & (((uint32_t)0x00000020U))) != RESET))
  {
    ((void)0U);
    (((huart->Instance ->CR3)) = ((((((huart->Instance ->CR3))) & (~((0x1U << (13U))))) | (huart->AdvancedInit . DMADisableonRxError))));
  }

   
  if((((huart->AdvancedInit . AdvFeatureInit) & (((uint32_t)0x00000040U))) != RESET))
  {
    ((void)0U);
    (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x1U << (20U))))) | (huart->AdvancedInit . AutoBaudRateEnable))));
     
    if(huart->AdvancedInit.AutoBaudRateEnable == ((uint32_t)(0x1U << (20U))))
    {
      ((void)0U);
      (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x3U << (21U))))) | (huart->AdvancedInit . AutoBaudRateMode))));
    }
  }

   
  if((((huart->AdvancedInit . AdvFeatureInit) & (((uint32_t)0x00000080U))) != RESET))
  {
    ((void)0U);
    (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x1U << (19U))))) | (huart->AdvancedInit . MSBFirst))));
  }
}







 
HAL_StatusTypeDef UART_CheckIdleState(UART_HandleTypeDef *huart)
{
  uint32_t tickstart = 0U;

   
  huart->ErrorCode = ((uint32_t)0x00000000U);

   
  tickstart = HAL_GetTick();

   
  if((huart->Instance->CR1 & (0x1U << (3U))) == (0x1U << (3U)))
  {
     
    if(UART_WaitOnFlagUntilTimeout(huart, (0x1U << (21U)), RESET, tickstart, 0x1FFFFFFU) != HAL_OK)
    {
       
      return HAL_TIMEOUT;
    }
  }

   
  huart->gState= HAL_UART_STATE_READY;
  huart->RxState= HAL_UART_STATE_READY;

   
  do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}






 
HAL_StatusTypeDef HAL_HalfDuplex_EnableTransmitter(UART_HandleTypeDef *huart)
{
   
  do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);
  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart->Instance ->CR1) &= ~(((0x1U << (3U)) | (0x1U << (2U)))));
   
  ((huart->Instance ->CR1) |= ((0x1U << (3U))));

  huart->gState= HAL_UART_STATE_READY;
   
  do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}





 
HAL_StatusTypeDef HAL_HalfDuplex_EnableReceiver(UART_HandleTypeDef *huart)
{
   
  do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);
  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart->Instance ->CR1) &= ~(((0x1U << (3U)) | (0x1U << (2U)))));
   
  ((huart->Instance ->CR1) |= ((0x1U << (2U))));

  huart->gState = HAL_UART_STATE_READY;
   
  do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}






 
HAL_StatusTypeDef HAL_LIN_SendBreak(UART_HandleTypeDef *huart)
{
   
  ((void)0U);

   
  do{ if((huart)->Lock == HAL_LOCKED) { return HAL_BUSY; } else { (huart)->Lock = HAL_LOCKED; } }while (0);

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart->Instance ->RQR) |= (((uint32_t)(0x1U << (1U)))));

  huart->gState = HAL_UART_STATE_READY;

   
  do{ (huart)->Lock = HAL_UNLOCKED; }while (0);

  return HAL_OK;
}













 
HAL_StatusTypeDef HAL_MultiProcessorEx_AddressLength_Set(UART_HandleTypeDef *huart, uint32_t AddressLength)
{
   
  if(huart == 0)
  {
    return HAL_ERROR;
  }

   
  ((void)0U);

  huart->gState = HAL_UART_STATE_BUSY;

   
  ((huart)->Instance ->CR1 &= ~(0x1U << (0U)));

   
  (((huart->Instance ->CR2)) = ((((((huart->Instance ->CR2))) & (~((0x1U << (4U))))) | (AddressLength))));

   
  ((huart)->Instance ->CR1 |= (0x1U << (0U)));

   
  return (UART_CheckIdleState(huart));
}



 



 




 



 

 
