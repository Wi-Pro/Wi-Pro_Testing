/*
 * ATmega1280Test.c
 *
 * Created: 3/23/2015 6:51:16 PM
 *  Author: Adam Vogel
 */ 

#define F_CPU 8000000UL
#include <avr/io.h>
#include <util/delay.h>

#define SPI_PORT PORTB
#define SPI_DDR  DDRB
#define MISO 3
#define MOSI 2
#define SCK 1
#define SS 0
#define FPGA_CS_DDR	DDRG
#define FPGA_CS_PORT PORTG
#define FPGA_SPI_CS	4

#define SR_Cntrl_DDR DDRJ
#define SR_Cntrl_PORT PORTJ
#define SReset 5
#define SRCS 4
#define SROE 3
#define LT_OE_DDR DDRG
#define LT_OE_PORT PORTG
#define LTOE 5

#define WR_DDR DDRJ
#define WR_PORT PORTJ
#define FPGAWR 2

#define RDY_BSY 0

#define XTAL1 0
#define OE 1
#define WR 2
#define BS1_PAGEL 3
#define XA0 4
#define XA1_BS2 5
#define PAGEL 6
#define BS2 7

#define DATAOut PORTL
#define DATAIn PINL
#define DATADirection DDRL

#define ControlPort PORTD
#define ControlPortIn PIND
#define ControlDirection DDRD

#define RDY_BSY_DDR DDRC
#define RDY_BSY_PORT PORTC
#define RDY_BSY_In PINC

#define LED_DDR DDRG
#define LED_PORT PORTG
#define LED_Green 0
#define LED_Yellow 1
#define LED_Red 2

void USB_UART2_Initialization(void);
void USB_UART2_Out(unsigned char TransmissionValue);
unsigned char USB_UART2_In(void);
void HexToASCII(unsigned char DataValue);

void USB_UART0_Initialization(void);
void USB_UART0_Out(unsigned char TransmissionValue);
unsigned char USB_UART0_In(void);

void SPI_FPGA_Init(void);
void SPI_FPGA_Write(unsigned char SPI_Data);

void SPI_Switching_Circuitry_Init(void);
void SPI_Switching_Circuitry_Write(unsigned char SPI_Data);

void ParallelProgrammingInit(void);
void EnterParallelProgrammingMode(void);
void ExitParallelProgrammingMode(void);
void ReadSignatureBytes(void);
void ChipErase(void);
void ReadFlash(void);
void ProgramFlash(void);

int main(void)
{
	_delay_ms(1000);
	
	USB_UART0_Initialization();
	USB_UART2_Initialization();
	SPI_FPGA_Init();
	SPI_Switching_Circuitry_Init();
	ParallelProgrammingInit();
	
	_delay_ms(2000);

	//_delay_ms(1000);
	//
	//USB_UART0_Out('h');
	//USB_UART0_Out('e');
	//USB_UART0_Out('l');
	//USB_UART0_Out('p');
	//USB_UART0_Out(0x0A);
	
	//turning on top board LEDs
	LED_DDR |= ((1<<LED_Green) | (1<<LED_Yellow) | (1<<LED_Red));
	LED_PORT |= ((1<<LED_Green) | (1<<LED_Yellow) | (1<<LED_Red));
	
	//_delay_ms(500);
	//EnterParallelProgrammingMode();
	//ReadSignatureBytes();
	
	while(1)
	{
		_delay_ms(500);
		EnterParallelProgrammingMode();
		//ReadSignatureBytes();
		//ExitParallelProgrammingMode();
	}
}

void ParallelProgrammingInit(void)
{
	//Setting Power Control Circuitry
	DDRF = 0xFF;
	PORTF = (1<<1 | 1<<4 | 1<<6); //voltage selection
	//PORTF = (1<<1 | 1<<5 | 1<<7); //voltage selection setting vlogic and vcc to 3.3v
	
	//voltage enable
	DDRB |= 1<<4;
	DDRB |= 1<<5;
	DDRB |= 1<<6;
	//PORTB |= 1<<4;
	PORTB |= 1<<5;
	PORTB |= 1<<6;
	_delay_ms(100);
	//Done setting Power Control Circuitry
	
	//Setting up FPGA
	WR_DDR |= 1<<FPGAWR;
	
	//Setting up Control lines
	ControlDirection |= ( (1<<XTAL1) | (1<<OE) | (1<<WR) | (1<<BS1_PAGEL) | (1<<XA0) | (1<<XA1_BS2) | (1<<PAGEL) | (1<<BS2));
	DATADirection = 0xFF;
}

void EnterParallelProgrammingMode(void)
{
	LED_PORT &= ~((1<<LED_Green) | (1<<LED_Yellow) | (1<<LED_Red));
	
	RDY_BSY_DDR &= ~(1<<RDY_BSY);
	ControlPort &= ~(1<<XTAL1);
	
	ControlPort &= ~(1<<XA1_BS2 | 1<<XA0 | 1<<BS1_PAGEL | 1<<WR);
	
	
	WR_PORT &= ~(1<<FPGAWR);
	SPI_FPGA_Write(0x01);
	DATAOut = 0x00;
	ControlPort = 0x00;
	
	SR_Cntrl_PORT &= ~(1<<SReset); //Clearing Max395s and Shift Registers
	_delay_us(25);
	SR_Cntrl_PORT |= (1<<SReset);
	_delay_us(25);
	SR_Cntrl_PORT &= ~(1<<SROE);
	_delay_us(25);
	SR_Cntrl_PORT &= ~(1<<SRCS); //Applying VCC and GND
	SPI_Switching_Circuitry_Write(0x00); //Pull Downs
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	
	SPI_Switching_Circuitry_Write(0x00); //GND
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x08);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	
	SPI_Switching_Circuitry_Write(0x00); //Pull Ups
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	
	SPI_Switching_Circuitry_Write(0x00); //VCC
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x20);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	
	SPI_Switching_Circuitry_Write(0x00); //VPP
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x04);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	
	SPI_Switching_Circuitry_Write(0x00);//MAX395s
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x1F);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0xF7);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0xD0);
	_delay_us(10);
	SPI_Switching_Circuitry_Write(0x00);
	_delay_us(10);
	SR_Cntrl_PORT |= (1<<SRCS);
	
	_delay_us(50);
	
	PORTB |= 1<<4;
	_delay_us(50);
	ControlPort |= (1<<WR | 1<<OE);
	_delay_us(400);
	
}

void ReadSignatureBytes(void)
{
	unsigned char DataValueIn = 0;
	
	//A: Load Command "Read Signature Bytes"
	ControlPort |= 1<<XA1_BS2;
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x08;
	_delay_us(100);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(100);
	
	//B: Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x00;
	_delay_us(100);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(100);
	
	//Read data
	DATADirection = 0;
	WR_PORT |= (1<<FPGAWR);
	ControlPort &= ~(1<<OE);
	ControlPort &= ~(1<<BS1_PAGEL);
	_delay_us(500);
	DataValueIn = DATAIn;
	HexToASCII(DataValueIn);
	ControlPort |= 1<<OE;
	WR_PORT &= ~(1<<FPGAWR);
	DATADirection = 0xFF;
	_delay_us(100);
	
	//Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x01;
	_delay_us(100);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(100);
	
	//Read data
	DATADirection = 0;
	WR_PORT |= (1<<FPGAWR);
	ControlPort &= ~(1<<OE);
	ControlPort &= ~(1<<BS1_PAGEL);
	_delay_us(500);
	DataValueIn = DATAIn;
	HexToASCII(DataValueIn);
	ControlPort |= 1<<OE;
	WR_PORT &= ~(1<<FPGAWR);
	DATADirection = 0xFF;
	_delay_us(100);
	
	//Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x02;
	_delay_us(100);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(100);
	
	//Read data
	DATADirection = 0;
	WR_PORT |= (1<<FPGAWR);
	ControlPort &= ~(1<<OE);
	ControlPort &= ~(1<<BS1_PAGEL);
	_delay_us(500);
	DataValueIn = DATAIn;
	HexToASCII(DataValueIn);
	ControlPort |= 1<<OE;
	WR_PORT &= ~(1<<FPGAWR);
	DATADirection = 0xFF;
	DATAOut = 0x00;
}

void ReadFlash(void)
{
	unsigned char DataValueIn = 0;
	
	for (unsigned int LowAddressByte = 0; LowAddressByte <= 0x20; LowAddressByte++)
	{
		//A: Load Command "Read Flash"
		ControlPort |= 1<<XA1_BS2;
		ControlPort &= ~(1<<XA0);
		ControlPort &= ~(1<<BS1_PAGEL);
		DATAOut = 0x02;
		_delay_us(25);
		ControlPort |= 1<<XTAL1;
		_delay_us(25);
		ControlPort &= ~(1<<XTAL1);
		_delay_us(25);
		
		//F: Load Address High Byte
		ControlPort &= ~(1<<XA1_BS2);
		ControlPort &= ~(1<<XA0);
		ControlPort |= 1<<BS1_PAGEL;
		DATAOut = 0x00;
		_delay_us(25);
		ControlPort |= 1<<XTAL1;
		_delay_us(25);
		ControlPort &= ~(1<<XTAL1);
		_delay_us(25);
		
		//B: Load Address Low Byte
		ControlPort &= ~(1<<XA1_BS2);
		ControlPort &= ~(1<<XA0);
		ControlPort &= ~(1<<BS1_PAGEL);
		DATAOut = LowAddressByte;
		_delay_us(25);
		ControlPort |= 1<<XTAL1;
		_delay_us(25);
		ControlPort &= ~(1<<XTAL1);
		_delay_us(25);
		
		//Read data
		DATADirection = 0;
		WR_PORT |= (1<<FPGAWR);
		ControlPort &= ~(1<<OE);
		ControlPort &= ~(1<<BS1_PAGEL); //Reading flash word low byte
		_delay_us(100);
		DataValueIn = DATAIn;
		HexToASCII(DataValueIn);
		ControlPort |= 1<<BS1_PAGEL; //Reading flash word high byte
		_delay_us(100);
		DataValueIn = DATAIn;
		HexToASCII(DataValueIn);
		ControlPort |= 1<<OE;
		WR_PORT &= ~(1<<FPGAWR);
		DATADirection = 0xFF;
		_delay_us(25);
	}
}

void ChipErase(void)
{
	ControlPort |= 1<<XA1_BS2;
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x80;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
	ControlPort &= ~(1<<WR);
	_delay_us(25);
	ControlPort |= 1<<WR;
	_delay_us(25);
	while(!(ControlPortIn & (1<<RDY_BSY)));
}

void ProgramFlash(void)
{
	//A: Load Command "Program Flash"
	ControlPort |= 1<<XA1_BS2;
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x10;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);

	//B: Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x00;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
	
	//C: Load Data Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort |= 1<<XA0;
	DATAOut = 0x12;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
	
	//D: Load Data High Byte
	ControlPort |= 1<<BS1_PAGEL;
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort |= 1<<XA0;
	DATAOut = 0xC0;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
	
	//B: Load Address Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort &= ~(1<<BS1_PAGEL);
	DATAOut = 0x01;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
	
	//C: Load Data Low Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort |= 1<<XA0;
	DATAOut = 0x22;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
	
	//D: Load Data High Byte
	ControlPort |= 1<<BS1_PAGEL;
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort |= 1<<XA0;
	DATAOut = 0x33;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
	
	//F: Load Address High Byte
	ControlPort &= ~(1<<XA1_BS2);
	ControlPort &= ~(1<<XA0);
	ControlPort |= 1<<BS1_PAGEL;
	DATAOut = 0x00;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
	
	//G: Program Page
	ControlPort &= ~(1<<WR);
	_delay_us(25);
	ControlPort |= 1<<WR;
	_delay_us(25);
	while(!(ControlPortIn & (1<<RDY_BSY)));
	
	//I: End Page Programming
	ControlPort |= 1<<XA1_BS2;
	ControlPort &= ~(1<<XA0);
	DATAOut = 0x00;
	_delay_us(25);
	ControlPort |= 1<<XTAL1;
	_delay_us(25);
	ControlPort &= ~(1<<XTAL1);
	_delay_us(25);
}

void ExitParallelProgrammingMode(void)
{
	_delay_ms(5);
	DATAOut = 0x00;
	ControlPort = 0x00;
	_delay_ms(1);
	SPI_FPGA_Write(0x00);
	
	SR_Cntrl_PORT &= ~(1<<SRCS); //Applying VCC and GND
	SPI_Switching_Circuitry_Write(0x00); //Pull Downs
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	
	SPI_Switching_Circuitry_Write(0x00); //GND
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	
	SPI_Switching_Circuitry_Write(0x00); //Pull Ups
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	
	SPI_Switching_Circuitry_Write(0x00); //VCC
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	
	SPI_Switching_Circuitry_Write(0x00); //VPP
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	
	SPI_Switching_Circuitry_Write(0x00);//MAX395s
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SPI_Switching_Circuitry_Write(0x00);
	SR_Cntrl_PORT |= (1<<SRCS);
	
	SR_Cntrl_PORT &= ~(1<<SReset); //Clearing Max395s and Shift Registers
	_delay_us(20);
	SR_Cntrl_PORT |= (1<<SReset);
	
	SR_Cntrl_PORT |= (1<<SROE);
	
	LED_PORT |= (1<<LED_Green);
}

void SPI_Switching_Circuitry_Init(void)
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

void USB_UART0_Initialization(void)
{
	DDRE |= 1<<1;
	DDRE &= ~(1<<0);
	PORTE |= 1<<0;

	UCSR0C = (1<<UCSZ01 | 1<<UCSZ00);	//8 bit data
	UBRR0H = 0;
	UBRR0L = 1;						//250,000 Baud at 8MHz
	UCSR0B |= 1<<TXEN0; //Enable Transmit
	UCSR0B |= 1<<RXEN0; //Enable Receive
}


unsigned char USB_UART0_In(void)
{
	unsigned char TransmissionValue = 0;
	
	while (!(UCSR0A & (1<<RXC0))); //received a value?
	TransmissionValue = UDR0;
	
	return TransmissionValue;
}

void USB_UART0_Out(unsigned char TransmissionValue)
{
	while(!(UCSR0A & (1<<UDRE0))); //buffer empty and ready to transmit
	UDR0 = TransmissionValue; //start transmitting value
	while(!(UCSR0A & (1<<TXC0))); //wait for transmit to complete
	UCSR0A |= 1<<TXC0; //clear transmit complete flag
}

void USB_UART2_Initialization(void)
{
	DDRH |= 1<<1;
	DDRH &= ~(1<<0);
	PORTH |= 1<<0;
	UCSR2C = (1<<UCSZ21 | 1<<UCSZ20);	//8 bit data
	UBRR2H = 0;
	UBRR2L = 51;						//9600 Baud at 8MHz
	UCSR2B |= 1<<TXEN2; //Enable Transmit
	UCSR2B |= 1<<RXEN2; //Enable Receive
	//UCSR0B |= 1<<RXCIE0;	//Interrupt enable
}


unsigned char USB_UART2_In(void)
{
	unsigned char TransmissionValue = 0;
	
	while (!(UCSR2A & (1<<RXC2))); //received a value?
	TransmissionValue = UDR2;
	
	return TransmissionValue;
}

void USB_UART2_Out(unsigned char TransmissionValue)
{
	while(!(UCSR2A & (1<<UDRE2))); //buffer empty and ready to transmit
	UDR2 = TransmissionValue; //start transmitting value
	while(!(UCSR2A & (1<<TXC2))); //wait for transmit to complete
	UCSR2A |= 1<<TXC2; //clear transmit complete flag
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
	
	USB_UART2_Out(DataValue1);
	
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
	
	USB_UART2_Out(DataValue2);
}