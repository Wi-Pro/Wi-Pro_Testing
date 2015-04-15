/*
 * FPGA.c
 *
 * Created: 4/13/2015 8:52:26 PM
 *  Author: Brandon
 */ 
#include <avr/io.h>
#include <util/delay.h>
#include "FPGA.h"

void SPI_FPGA_Init(void)
{
	// Set MOSI ,SCK, and SS as output, others as input
	SPI_DDR |= ((1<<MOSI)|(1<<SCK)|(1<<SS));
	SPI_DDR &= ~(1<<MISO);
	// CS pin is not active
	FPGA_CS_DDR |= (1<<FPGA_SPI_CS);
	FPGA_CS_PORT |= (1<<FPGA_SPI_CS);
	// Enable SPI, Master Mode 0, set the clock rate fck/128
	SPCR = ((1<<SPE)|(1<<MSTR)|(1<<SPR1));
	SPSR &= ~(1<<SPI2X);
	SPI_FPGA_Write(0x00);
}

void SPI_FPGA_Write(unsigned char SPI_Data)
{
	FPGA_CS_PORT &= ~(1<<FPGA_SPI_CS);
	// Start Write transmission
	SPDR = SPI_Data;
	// Wait for transmission complete
	while(!(SPSR & (1<<SPIF)));
	FPGA_CS_PORT |= (1<<FPGA_SPI_CS);
}