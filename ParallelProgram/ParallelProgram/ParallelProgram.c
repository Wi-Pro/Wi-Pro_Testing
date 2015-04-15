/*
 * ParallelProgram.c
 *
 * Created: 4/13/2015 8:41:16 PM
 *  Author: Brandon
 */ 


#include <avr/io.h>
#include <util/delay.h>
#include "SwitchingCircuitry.h"
#include "IntelHex.h"

int main(void)
{
	uart0_init();
	//Write test file to external RAM 
	writeHexFileTest(); 
	//Test switching circuitry code 
	SPI_Switching_Circuitry_Init(); 
	setAtTiny2313(); 
	SwitchingCircuitryEnable(); 
	WriteShiftRegData(); 
	//Then test parallel programming code here 
	
    while(1)
    {
        //TODO:: Please write your application code 
    }
}