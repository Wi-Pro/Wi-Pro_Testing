/*
 * RAMModule.c
 *
 * Created: 3/25/2015 8:32:06 PM
 *  Author: Brandon
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include "RAMDriver.h"

#define F_CPU 8000000UL
 
int main(void)
{
	SPI_Init(); 
	//getRAMStatus(); 
	//SPI_Write(0xFFFF, 0x55);
	////_delay_us(1000);
	//SPI_Read(0xFFFF);	
	//SPI_Read(0x0100);
	char* hello = "Hello!";
	RAMWrite(hello, 0x0001, 6);
	_delay_ms(10);
	RAMRead(0x0001, 6);
    while(1)
    {
		//SPI_Read(0x0100);
        //TODO:: Please write your application code 
    }
}