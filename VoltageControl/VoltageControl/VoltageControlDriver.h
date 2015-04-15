/*
 * VoltageControlDriver.h
 *
 * Created: 3/1/2015 4:42:19 PM
 *  Author: Brandon
 */ 


#ifndef VOLTAGECONTROLDRIVER_H_
#define VOLTAGECONTROLDRIVER_H_

//#define VCNTRL_PORT PORTF 
//#define VCNTRL_DDR DDRF
#define VCNTRL_PORT PORTA
#define VCNTRL_DDR DDRA
#define VEN_PORT PORTB 
#define VEN_DDR DDRB  

#define VCCENABLE 5
#define VCC_3_3V 2
#define VCC_5V 3
#define VCC_6_5V 4 

#define VPPENABLE 6
#define VPP_9V 5 
#define VPP_12V 6 
#define VPP_13V 7

#define VLENABLE 4
#define VL_3_3V 0
#define VL_5V 1

void voltageControlInit();
void VppClear();
void enableVppRegulator();
void disableVppRegulator();
void VccClear();
void enableVccRegulator(); 
void disbaleVccReglator();
void VLogicClear(); 
void enableVLogic(); 
void disableVLogic(); 
uint8_t setVcc(uint8_t voltageLevel);
uint8_t setVpp(uint8_t voltageLevel);
uint8_t setVLogic(uint8_t voltageLevel);


#endif /* VOLTAGECONTROLDRIVER_H_ */