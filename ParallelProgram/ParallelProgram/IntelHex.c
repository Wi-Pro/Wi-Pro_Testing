/*
 * IntelHex.c
 *
 * Created: 4/13/2015 8:59:22 PM
 *  Author: Brandon
 * Description: Pulls the Hex file from External RAM, row by row, and parses it in accordance with Intel Hex file standards. 
 * For use with the Atmel AVR Microcontrollers 
 */ 

#include <string.h>
#include "IntelHex.h"
#include "RAM/RAMDriver.h"
#include "RAM/MemoryMap.h"

char hexRow[50];
uint16_t RAMOffset; 


void hexInit()
{
	RAMOffset = 0; 
	memset(hexRow, 0x00, 50); 
} 

char* getHexRow()
{
	char buffer; 
	int i=0; 
	for(i=0; i<DATA_BEGIN; i++)
	{
		//Read the bytes from RAM and throw them into the buffer
		buffer = RAMReadByte(HEX_FILE_ADDRESS + RAMOffset);
		hexRow[i] = buffer; 
		RAMOffset++; 
	}
	
	uint8_t dataLength = hexRow[BYTE_COUNT];
	//Add 1 to dataLength to catch the checkSum 
	for(i=0;i<dataLength+1;i++)
	{
		buffer = RAMReadByte(HEX_FILE_ADDRESS + RAMOffset);
		hexRow[DATA_BEGIN + i] = RAMReadByte(HEX_FILE_ADDRESS + RAMOffset);
		RAMOffset++; 
	}
	
	return hexRow; 
}