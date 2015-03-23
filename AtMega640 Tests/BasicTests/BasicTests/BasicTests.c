/*
 * BasicTests.c
 *
 * Created: 3/23/2015 5:39:53 PM
 *  Author: Brandon
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include "LED.h"

#define F_CPU 8000000UL

int main(void)
{
	LEDInit();
	
    while(1)
    {
		ToggleRed(ON);
		_delay_ms(250);
		ToggleYellow(ON);
		_delay_ms(250);
		ToggleGreen(ON);
		_delay_ms(500);
		ToggleRed(OFF);
		_delay_ms(250);
		ToggleYellow(OFF);
		_delay_ms(250);
		ToggleGreen(OFF);
    }
}