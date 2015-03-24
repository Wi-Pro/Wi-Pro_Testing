/*
 * VoltageControl.c
 *
 * Created: 3/1/2015 3:39:01 PM
 *  Author: Brandon
 */ 


#include <avr/io.h>
#include "VoltageControlDriver.h"

int main(void)
{
	voltageControlInit(); 
	enableVccRegulator();
	setVcc(VCC_3_3V);
	enableVppRegulator();
	setVpp(VPP_12V);
	enableVLogic();
	setVLogic(VL_3_3V);
    while(1)
    {
        //TODO:: Please write your application code 
    }
}