/*
 * VoltageControlDriver.h
 *
 * Created: 3/1/2015 4:42:19 PM
 *  Author: Brandon
 */ 


#ifndef VOLTAGECONTROLDRIVER_H_
#define VOLTAGECONTROLDRIVER_H_

#define VCNTRL_PORT PORTB 
#define VCNTRL_DDR DDRB 
 
#define VCCENABLE 0
#define VCC_3_6V 1
#define VCC_5_3V 2
#define VCC_6_8V 3

#define VPPENABLE 4
#define VPP_9V 5 
#define VPP_12V 6
#define VPP_13V 7 

void voltageControlInit();
void VppClear();
void enableVppRegulator();
void disableVppRegulator();
void VccClear();
void enableVccRegulator(); 
void disbaleVccReglator();
uint8_t setVcc(uint8_t voltageLevel);
uint8_t setVpp(uint8_t voltageLevel);


#endif /* VOLTAGECONTROLDRIVER_H_ */