/*
 * ParallelProgram.c
 *
 * Created: 4/13/2015 8:41:16 PM
 *  Author: Brandon
 */ 

#define F_CPU 8000000UL
#include <avr/io.h>
#include <util/delay.h>
#include "ProgramDriver.h"
#include "IntelHex.h"
#include "Print/PrintDriver.h"
#include "RAM/RAMDriver.h"
#include "RAM/MemoryMap.h"

#define ATtiny2313 1
#define ATmega324PA 2
#define ATtiny261A 3
#define ATmega48P 4

int main(void)
{
	char* SignatureBytes;
	uart2_init();
	hexInit();
//
	SPI_Init();
	printf("\n\n");
	writeHexFileTest();
	RAMPrint(HEX_FILE_ADDRESS, 50);
	//Write test file to external RAM 
	//Test switching circuitry code
	
	ApplyPullDowns();
	ProgInit();
	EnableProgMode(ATtiny2313);
	//EnableProgMode(ATmega324PA);
	SignatureBytes = ReadSignatureBytes();
	
	//printf("\nSignature Bytes: 0x%02X 0x%02X 0x%02X\n", *SignatureBytes, *(SignatureBytes + 1), *(SignatureBytes + 2));
	//if ( (*SignatureBytes == 0x1E) && (*(SignatureBytes + 1) == 0x91) && (*(SignatureBytes + 2) == 0x0A) )
	//{
		//printf("Starting Programming!\n");
		//printf("Erasing...\n");
		//ChipErase();
		//ReadFlash();
		//printf("\nDone Erasing!\n");
		//printf("Programming...\n");
		//ProgramFlash();
		//printf("Verifying...\n");
		//ReadFlash();
		//printf("\nDone!\n\n");
	//}
	//else
	//{
		//printf("ERROR: Signature Bytes Mismatch\n");
	//}
	
	//if ( (*SignatureBytes == 0x1E) && (*(SignatureBytes + 1) == 0x95) && (*(SignatureBytes + 2) == 0x11) )
	//{
	//printf("Starting Programming!\n");
	//printf("Erasing...\n");
	//ChipErase();
	//ReadFlash();
	//printf("\nDone Erasing!\n");
	//printf("Programming...\n");
	//ProgramFlash();
	//printf("Verifying...\n");
	//ReadFlash();
	//printf("\nDone!\n\n");
	//}
	//else
	//{
	//printf("ERROR: Signature Bytes Mismatch\n");
	//}
	
	ExitParallelProgrammingMode();
	//Then test parallel programming code here 
	
    while(1)
    {
    }
}