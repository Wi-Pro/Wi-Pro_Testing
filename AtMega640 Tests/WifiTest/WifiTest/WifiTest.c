/*
 * WifiTest.c
 *
 * Created: 3/24/2015 6:05:19 PM
 *  Author: Brandon
 */ 

#define F_CPU 8000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "WifiDriver.h"
#include "Wifi.h"


int main(void)
{
	uart_init();
	sei(); 
	setMachineMode();
	networkScan();
}