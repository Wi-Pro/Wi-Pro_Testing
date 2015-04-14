/*
 * SwitchingCircuitry.c
 *
 * Created: 4/13/2015 9:15:51 PM
 *  Author: Brandon
 */ 

//Shift Register Data
//2D array that will contain the configuration for the chip in the correct order  
#include <avr/io.h>
#include <avr/delay.h>
#include "SwitchingCircuitry.h"
#include "ProgramDriver.h"


char ShiftRegData[PIN_TYPES][SOCKET_SIZE/sizeof(char)]; 


void SPI_Switching_Circuitry_Init()
{
	LT_OE_DDR |= 1<<LTOE;
	SR_Cntrl_DDR |= ((1<<SReset) | (1<<SRCS) | (1<<SROE));
	SR_Cntrl_PORT |= ((1<<SRCS) | (1<<SROE));
	SR_Cntrl_PORT &= ~(1<<SReset);
	LT_OE_PORT |= 1<<LTOE;
}

void SPI_Switching_Circuitry_Write(unsigned char SPI_Data)
{
	// Start Write transmission
	SPDR = SPI_Data;
	// Wait for transmission complete
	while(!(SPSR & (1<<SPIF)));
}

void SwitchingCircuitryEnable()
{
	SR_Cntrl_PORT &= ~(1<<SReset); //Clearing Max395s and Shift Registers
	_delay_us(25);
	SR_Cntrl_PORT |= (1<<SReset);
	_delay_us(25);
	SR_Cntrl_PORT &= ~(1<<SROE);
	_delay_us(25);
	SR_Cntrl_PORT &= ~(1<<SRCS); //Applying VCC and GND
}

//Clears the internal buffer
void ClearShiftRegData()
{
	for(int i=0; i<PIN_TYPES; i++)
	{
		for(int j=0; j<SOCKET_SIZE/sizeof(char); j++)
		{
			ShiftRegData[i][j] = 0x00; 
		}
	}
}


void SetShiftRegData(uint8_t pinType, char data[SOCKET_SIZE/sizeof(char)])
{
	//MSB gets shifted out first 
	for(int i=0; i<SOCKET_SIZE/sizeof(data); i++)
	{
		ShiftRegData[pinType][i] = *(data + i); 
	}
}

void WriteShiftRegData()
{
	SwitchingCircuitryEnable(); 
	
	for(int i=0; i<PIN_TYPES; i++)
	{
		for(int j=0; j<SOCKET_SIZE/sizeof(char); j++)
		{
			SPI_Switching_Circuitry_Write(ShiftRegData[i][j]);
			_delay_us(10); 
		}
	}
	
	SR_Cntrl_PORT |= (1<<SRCS);
}





