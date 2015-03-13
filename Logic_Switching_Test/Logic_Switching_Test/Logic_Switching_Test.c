/*
 * Logic_Switching_Test.c
 *
 * Created: 3/1/2015 3:43:12 PM
 *  Author: Adam Vogel
 */ 

# define F_CPU 1000000UL
#include <avr/io.h>
#include <util/delay.h>

#define SPI_PORT PORTB
#define SPI_DDR  DDRB
#define Switching_Circuitry_CS_PORT PORTD
#define Switching_Circuitry_SPI_CS  PORTD4

#define MOSI PORTB5
#define SCK PORTB7
#define SS PORTB4

#define Shift_Reg_Cntrl_DDR DDRD
#define Shift_Reg_Cntrl_PORT PORTD

#define Reset 5
#define OE 3


void SPI_Init();
void SPI_Write(unsigned char SPI_Data);

int main(void)
{
	_delay_ms(1000);
	DDRA = 0x00;
	Shift_Reg_Cntrl_DDR |= (1<<3 | 1<<4 | 1<<5);
	DDRD |= 1<<6;
	
	Shift_Reg_Cntrl_PORT |= 1<<Reset;
	SPI_Init();
	Shift_Reg_Cntrl_PORT &= ~(1<<OE);
	
	PORTD |= 1<<6;
	
	//PORTA = 0x00;
	
	
	
	// Activate the CS pin
	Switching_Circuitry_CS_PORT &= ~(1<<Switching_Circuitry_SPI_CS);
	SPI_Write(0x07);
	SPI_Write(0x01);
	// CS pin is not active
	Switching_Circuitry_CS_PORT |= (1<<Switching_Circuitry_SPI_CS);
	
    while(1)
    {

    }
}

void SPI_Init()
{
	// Set MOSI ,SCK, and SS as output, others as input
	SPI_DDR = (1<<MOSI)|(1<<SCK)|(1<<SS);
	// CS pin is not active
	Switching_Circuitry_CS_PORT |= (1<<Switching_Circuitry_SPI_CS);
	// Enable SPI, Master Mode 0, set the clock rate fck/4
	SPCR0 = (1<<SPE0)|(1<<MSTR0);
}

void SPI_Write(unsigned char SPI_Data)
{
	// Start Write transmission
	SPDR0 = SPI_Data;
	// Wait for transmission complete
	while(!(SPSR0 & (1<<SPIF0)));	
}