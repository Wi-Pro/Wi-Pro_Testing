/*
 * VoltageControl.c
 *
 * Created: 3/1/2015 3:39:01 PM
 *  Author: Brandon
 */ 

#define F_CPU 8000000UL
#include <avr/io.h>
#include <util/delay.h>
#include "VoltageControlDriver.h"

int main(void)
{
	voltageControlInit(); 
	setVcc(VCC_5V);
	enableVccRegulator();
	setVpp(VPP_12V);
	enableVppRegulator();
	setVLogic(VL_5V);
	enableVLogic();
	
    while(1)
    {
        //TODO:: Please write your application code 
    }
}