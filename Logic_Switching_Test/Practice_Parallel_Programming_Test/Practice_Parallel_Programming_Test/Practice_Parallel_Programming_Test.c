/*
 * Practice_Parallel_Programming_Test.c
 *
 * Created: 3/7/2015 5:16:38 AM
 *  Author: Adam Vogel
 */ 


#define F_CPU 8000000UL
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

#define SReset 5
#define SROE 3

#define XTAL1 0
#define RDY_BSY 1
#define OE 2
#define WR 3
#define BS1_PAGEL 4
#define XA0 5
#define XA1_BS2 6

#define DATAOut PORTA
#define DATAIn PINA
#define DATADirection DDRA

#define ControlPort PORTC
#define ControlPortIn PINC
#define ControlDirection DDRC

void SPI_Init(void);
void SPI_Write(unsigned char SPI_Data);

void EnterParallelProgrammingMode(void);
void ExitParallelProgrammingMode(void);
void ReadSignatureBytes(void);
void ChipErase(void);
void ReadFlash(void);
void ProgramFlash(void);

void USB_UART_Initialization(void);
void USB_UART_Out(unsigned char TransmissionValue);
unsigned char USB_UART_In(void);
void HexToASCII(unsigned char DataValue);

unsigned char DataValueIn = 0;

int main(void)
{
	USB_UART_Initialization();
	
	Shift_Reg_Cntrl_DDR |= (1<<SROE | 1<<Switching_Circuitry_SPI_CS | 1<<SReset | 1<<6);
	
	DDRD |= 1<<2;
	
	Shift_Reg_Cntrl_PORT |= 1<<SReset;
	SPI_Init();
	Shift_Reg_Cntrl_PORT &= ~(1<<SROE);
	PORTD |= 1<<6;
	
	ControlDirection |= ( 1<<XTAL1 | 1<<OE | 1<<WR | 1<<BS1_PAGEL | 1<<XA0 | 1<<XA1_BS2);
	ControlDirection &= ~(1<<RDY_BSY);
	ControlPort &= ~(1<<XTAL1);
	DATADirection = 0xFF;
	
	EnterParallelProgrammingMode();
	ReadSignatureBytes();
	ExitParallelProgrammingMode();
	
	while (1)
	{
	}
}



void EnterParallelProgrammingMode(void)
{	
	ControlPort &= ~(1<<XA1_BS2 | 1<<XA0 | 1<<BS1_PAGEL | 1<<WR);
	
	Switching_Circuitry_CS_PORT &= ~(1<<Switching_Circuitry_SPI_CS);
	SPI_Write(0x00); //Pull Downs
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	
	SPI_Write(0x00); //GND
	SPI_Write(0x00);
	SPI_Write(0x08);
	SPI_Write(0x00);
	SPI_Write(0x00);
	
	SPI_Write(0x00); //Pull Ups
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	
	SPI_Write(0x00); //VCC
	SPI_Write(0x20);
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	
	SPI_Write(0x00); //VPP
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	Switching_Circuitry_CS_PORT |= (1<<Switching_Circuitry_SPI_CS);
	
	//_delay_us(25);
	//PORTD |= 1<<2;
	
	 Switching_Circuitry_CS_PORT &= ~(1<<Switching_Circuitry_SPI_CS);
	SPI_Write(0x00); //Pull Downs
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	
	SPI_Write(0x00); //GND
	SPI_Write(0x00);
	SPI_Write(0x08);
	SPI_Write(0x00);
	SPI_Write(0x00);
	
	SPI_Write(0x00); //Pull Ups
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	
	SPI_Write(0x00); //VCC
	SPI_Write(0x20);
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x00);
	
	SPI_Write(0x00); //VPP
	SPI_Write(0x00);
	SPI_Write(0x00);
	SPI_Write(0x04);
	SPI_Write(0x00);
	 Switching_Circuitry_CS_PORT |= (1<<Switching_Circuitry_SPI_CS);
	_delay_us(15);
	ControlPort |= (1<<WR | 1<<OE);
	_delay_us(310);
}

void ReadSignatureBytes(void)
{
	//A: Load Command "Read Signature Bytes"
	ControlPort |= 1<<XA1_BS2;
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x08;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//B: Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x00;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//Read data
	DATADirection = 0;
	ControlPort &= ~(1<<OE);
	ControlPort &= ~(1<<BS1_PAGEL);
	_delay_us(1000);
	DataValueIn = DATAIn;
	USB_UART_Out(DataValueIn);
	//HexToASCII(DataValueIn);
	ControlPort |= 1<<OE;
	DATADirection = 0xFF;
	
	//Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x01;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//Read data
	DATADirection = 0;
	ControlPort &= ~(1<<OE);
	ControlPort &= ~(1<<BS1_PAGEL);
	_delay_us(1000);
	DataValueIn = DATAIn;
	USB_UART_Out(DataValueIn);
	//HexToASCII(DataValueIn);
	ControlPort |= 1<<OE;
	DATADirection = 0xFF;
	
	//Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x02;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//Read data
	DATADirection = 0;
	ControlPort &= ~(1<<OE);
	ControlPort &= ~(1<<BS1_PAGEL);
	_delay_us(1000);
	DataValueIn = DATAIn;
	USB_UART_Out(DataValueIn);
	//HexToASCII(DataValueIn);
	ControlPort |= 1<<OE;
	DATADirection = 0xFF;
}

void ReadFlash(void)
{
	for (unsigned int LowAddressByte = 0; LowAddressByte <= 0x20; LowAddressByte++)
	{
		//A: Load Command "Read Flash"
		ControlPort |= 1<<XA1_BS2;
		ControlPort &= ~(1<<XA0);
		ControlPort &= ~(1<<BS1_PAGEL);
		DATAOut = 0x02;
		ControlPort |= 1<<XTAL1;
		ControlPort &= ~(1<<XTAL1);
		
		//F: Load Address High Byte
		ControlPort &= ~(1<<XA1_BS2);
		ControlPort &= ~(1<<XA0);
		ControlPort |= 1<<BS1_PAGEL;
		DATAOut = 0x00;
		ControlPort |= 1<<XTAL1;
		ControlPort &= ~(1<<XTAL1);
		
		//B: Load Address Low Byte
		ControlPort &= ~(1<<XA1_BS2);
		ControlPort &= ~(1<<XA0);
		ControlPort &= ~(1<<BS1_PAGEL);
		DATAOut = LowAddressByte;
		ControlPort |= 1<<XTAL1;
		ControlPort &= ~(1<<XTAL1);
		
		//Read data
		DATADirection = 0;
		ControlPort &= ~(1<<OE);
		ControlPort &= ~(1<<BS1_PAGEL); //Reading flash word low byte
		_delay_us(10);
		DataValueIn = DATAIn;
		HexToASCII(DataValueIn);
		ControlPort |= 1<<BS1_PAGEL; //Reading flash word high byte
		_delay_us(10);
		DataValueIn = DATAIn;
		HexToASCII(DataValueIn);
		ControlPort |= 1<<OE;
		DATADirection = 0xFF;
	}
}

void ChipErase(void)
{
	ControlPort |= 1<<XA1_BS2;
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x80;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	ControlPort &= ~(1<<WR);
	ControlPort |= 1<<WR;
	while(!(ControlPortIn & (1<<RDY_BSY)));
}

void ProgramFlash(void)
{
	//A: Load Command "Program Flash"
	ControlPort |= 1<<XA1_BS2;
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x10;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);

	//B: Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x00;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//C: Load Data Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort |= 1<<XA0;
	DATAOut = 0x12;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//D: Load Data High Byte
	ControlPort |= 1<<BS1_PAGEL;
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort |= 1<<XA0;
	DATAOut = 0xC0;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//B: Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x01;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//C: Load Data Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort |= 1<<XA0;
	DATAOut = 0x22;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//D: Load Data High Byte
	ControlPort |= 1<<BS1_PAGEL;
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort |= 1<<XA0;
	DATAOut = 0x33;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//F: Load Address High Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort |= 1<<BS1_PAGEL;
	DATAOut = 0x00;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
	
	//G: Program Page
	ControlPort &= ~(1<<WR);
	ControlPort |= 1<<WR;
	while(!(ControlPortIn & (1<<RDY_BSY)));
	
	//I: End Page Programming
	ControlPort |= 1<<XA1_BS2;
	ControlPort &= ~(1<<XA0);
	DATAOut = 0x00;
	ControlPort |= 1<<XTAL1;
	ControlPort &= ~(1<<XTAL1);
}

void ExitParallelProgrammingMode(void)
{
	PORTD &= ~(1<<2);

	Switching_Circuitry_CS_PORT &= ~(1<<Switching_Circuitry_SPI_CS);
		SPI_Write(0x00); //Pull Downs
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		
		SPI_Write(0x00); //GND
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		
		SPI_Write(0x00); //Pull Ups
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		
		SPI_Write(0x00); //VCC
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		
		SPI_Write(0x00); //VPP
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
		SPI_Write(0x00);
	Switching_Circuitry_CS_PORT |= (1<<Switching_Circuitry_SPI_CS);
}

void SPI_Init(void)
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

void USB_UART_Initialization(void)
{
	DDRD |= 1<<1;
	DDRD &= ~(1<<0);
	PORTD |= 1<<0;
	UCSR0C = (1<<UCSZ01 | 1<<UCSZ00);	//8 bit data
	UBRR0H = 0;
	UBRR0L = 25;						//2400 Baud
	UCSR0B |= 1<<TXEN0; //Enable Transmit
	UCSR0B |= 1<<RXEN0; //Enable Receive
	//UCSR0B |= 1<<RXCIE0;	//Interrupt enable
}

void USB_UART_Out(unsigned char TransmissionValue)
{
	while(!(UCSR0A & (1<<UDRE0))); //buffer empty and ready to transmit
	UDR0 = TransmissionValue; //start transmitting value
	while(!(UCSR0A & (1<<TXC0))); //wait for transmit to complete
	UCSR0A |= 1<<TXC0; //clear transmit complete flag
}

//ISR(USART0_RX_vect)
//{
//cli();
//unsigned char ReceivedValue = 0;
//ReceivedValue = UDR0; //pull in value
//sei();
//}

unsigned char USB_UART_In(void)
{
	unsigned char TransmissionValue = 0;
	
	while (!(UCSR0A & (1<<RXC0))); //received a value?
	TransmissionValue = UDR0;
	
	return TransmissionValue;
}

void HexToASCII(unsigned char DataValue)
{
	unsigned char DataValue1 = 0;
	unsigned char DataValue2 = 0;
	
	DataValue1 = (0xF0 & DataValue);
	DataValue1 = (DataValue1>>4);
	
	if (DataValue1 >= 10)
	{
		DataValue1 = (DataValue1 - 9);
		DataValue1 = (0x40 | DataValue1);
	}
	else
	{
		DataValue1 = (0x30 | DataValue1);
	}
	
	USB_UART_Out(DataValue1);
	
	DataValue2 = (0x0F & DataValue);
	
	if (DataValue2 >= 10)
	{
		DataValue2 = (DataValue2 - 9);
		DataValue2 = (0x40 | DataValue2);
	}
	else
	{
		DataValue2 = (0x30 | DataValue2);
	}
	
	USB_UART_Out(DataValue2);
}