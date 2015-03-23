/*
 * LED.c
 *
 * Created: 3/23/2015 5:40:32 PM
 *  Author: Brandon
 */ 

#include "LED.h"
#include <avr/io.h>
#include <stdio.h>

void LEDInit()
{
	//Sets pins 0, 1, and 2 as outputs
	LED_DDR |= 0x07; 
}

void ToggleRed(int val)
{
	if(val == ON)
		LED_REG |= (1<<RED_LED);
	else
		LED_REG &= ~(1<<RED_LED);
}

void ToggleYellow(int val)
{
	if(val == ON)
		LED_REG |= (1<<YELLOW_LED);
	else
		LED_REG &= ~(1<<YELLOW_LED);
}

void ToggleGreen(int val)
{
	if(val == ON)
		LED_REG |= (1<<GREEN_LED);
	else
		LED_REG &= ~(1<<GREEN_LED);
}