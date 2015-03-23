/*
 * FPGA_SPI_Test.c
 *
 * Created: 3/14/2015 6:43:27 PM
 *  Author: Adam Vogel
 */ 

#define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

#define SPI_PORT PORTB
#define SPI_DDR  DDRB
#define CS_PORT PORTD
#define SPI_CS  PORTD4

#define MOSI PORTB5
#define SCK PORTB7
#define SS PORTB4

void SPI_Init(void);
void SPI_Write(unsigned char SPI_Data);

int main(void)
{
	DDRA |= 1<<0;
	SPI_Init();
	SPI_Write(0x55);
	SPI_Write(0x00);
    while(1)
    {
        PORTA |= 1<<0;
		_delay_ms(10);
		PORTA &= ~(1<<0);
		_delay_ms(10);
    }
}

void SPI_Init(void)
{
	// Set MOSI ,SCK, and SS as output, others as input
	SPI_DDR = (1<<MOSI)|(1<<SCK)|(1<<SS);
	DDRD |= 1<<4;
	// CS pin is not active
	CS_PORT |= (1<<SPI_CS);
	// Enable SPI, Master Mode 0, set the clock rate fck/4
	SPCR0 = (1<<SPE0)|(1<<MSTR0);
}

void SPI_Write(unsigned char SPI_Data)
{
	// Start Write transmission
	CS_PORT &= ~(1<<SPI_CS);
	SPDR0 = SPI_Data;
	// Wait for transmission complete
	while(!(SPSR0 & (1<<SPIF0)));
	CS_PORT |= (1<<SPI_CS);
}