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
	setVcc(VCC_5V);
	setVpp(VPP_12V);
	setVLogic(VL_5V);
    while(1)
    {
        //TODO:: Please write your application code 
    }
}