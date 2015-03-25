/*
 * WifiDriver.c
 *
 * Created: 3/7/2015 5:10:03 PM
 *  Author: Brandon
 */ 

#include <avr/io.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "PrintDriver.h"
#include "WifiDriver.h"

char receiveBuffer[100];
char receiveBuffer2[100];
unsigned int  i = 0;
uint8_t receiveFlag = 0; 
unsigned int transLength = 0;
int testPrint = 0; 

void setTestPrint()
{
	testPrint = 1; 
}

void uart_init()
{
	UBRR1H = (((F_CPU/BAUD_RATE)/16)-1)>>8;	// set baud rate
	UBRR1L = (((F_CPU/BAUD_RATE)/16)-1);
	UCSR1B = (1<<RXEN1)|(1<<TXEN1); // enable Rx & Tx
	UCSR1C =  (1<<UCSZ11)|(1<<UCSZ10); // config USART; 8N1
	UCSR1B |= (1<<RXCIE1);	//Enable Receive Interrupt 
	
	DDRA |= (1<<PORTA1);
}

uint16_t getStringLen(unsigned char* p)
{
	uint16_t count = 0; 
	while(*p != '\0')
	{
		count++; 
		p++; 
	}
	return count; 
}

int uart_send(unsigned char* data, unsigned int length)
{
	//printf("Uart Send Function: %s\nAddress: %p", data, data);
	uint8_t i = 0;
	UCSR1B |= (1<<RXCIE1);
	receiveFlag = 0;
	memset(receiveBuffer, 0x00, MaxRecSize);
	PORTD |= (1<<RTS);
	//while(!(PIND & (1<<CTS))){
		//_delay_us(100);
		//printf("Waiting..\n");
	//} 
	while(i < length){
		while(!(UCSR1A & (1<<UDRE1)));
		UDR1 = data[i];
		i++;
	}
	//while(!(PIND & (1<<CTS))){_delay_us(100);}
	return 0;
}

unsigned char uart_receive(unsigned char* data, unsigned char size)
{
	uint16_t i = 0;
 
	while(1 < size - 1) {
		unsigned char c;
		while (!(UCSR1A & (1<<RXC1)));
		c = UDR1;
		//printf("Moving Received Byte %d: %c\n", i, c);
		//_delay_ms(500);
		printf("%c",c);
		if(c == '\0') break; 
		data[i] = c; 
		i++; 
	} 
	//Null terminating character 
	data[i] = 0;
	printf("%s", data);
	return i + 1;  
}

unsigned char uart_receiveChar()
{
	//printf("Receiving...\n");
	while (!(UCSR1A & (1<<RXC1)));
	PORTA ^= 0xFF; 
	return UDR1; 
}

int enableReceiveINT()
{
	UCSR1B |= (1<<RXCIE1);
	sei(); 
	return 1; 
}

int disableReceiveINT()
{
	UCSR1B &= ~(1<<RXCIE1);
	return 1; 
}

unsigned char* getReceiveBuffer()
{
	//printf("Waiting for Receive to Complete...\n");
	//Wait for receiving to be completed
	//sendFlag accounts for the delay between sending and receiving 
	while(!receiveFlag & 1)
	{
		//While loop does not work correctly without a delay 
		//An issue with the compiler or the stack pointer when invoking the interrupt 
		_delay_us(100);
		//printf("Receive Flag: %d\n", receiveFlag);
	}
	//_delay_ms(500);
	//begin receiving
	printf("Received Data: %s\n", receiveBuffer);
	return receiveBuffer; 
}

unsigned int getTransmissionLength()
{
	if(testPrint)
	{
		//printf("Header: ");
		for(int i = -5; i < endHeader; i++)
		{
			printf("Value: %c, Address: %p\n", receiveBuffer[i], receiveBuffer + i);
			//printf("0x%02x ", receiveBuffer[i]);
		}
		printf("\n");
	}
	
	unsigned int transLength = 0;
	transLength += (receiveBuffer[ones] & 0x0F);
	transLength += (receiveBuffer[tens] & 0x0F) * 10; 
	transLength += (receiveBuffer[hundreds] & 0x0F) * 100; 
	transLength += (receiveBuffer[thousands] & 0x0F) * 1000; 
	transLength += (receiveBuffer[tenThousands] & 0x0F) * 10000; 
	if(transLength < MaxRecSize)
		return transLength; 
	else
		//8 is the length of the header 
		return MaxRecSize - 8; 
}

char* getMessageHeader()
{
	char* header = ""; 
	
	for(int i = 0; i < endHeader; i++)
	{
		*(header + i) = receiveBuffer[i]; 
	}
	
	return header; 
}

int errorCheck() 
{
	while(!receiveFlag & 1)
	{
		//While loop does not work correctly without a delay
		//An issue with the compiler or the stack pointer when invoking the interrupt
		_delay_us(100);
	}
	
	char* header = getMessageHeader();
	//0 denotes a successful command 
	if(header[errorCode] != 0)
		return 1; 
	else 
		return 0; 
}

unsigned int sendCommand(int8_t prefix, char* command, char* value)
{	
	char* fullCommand = (char *)malloc(MaxSendSize);
	switch(prefix)
	{
		case NOPREFIX: 
			break; 
		case GET: 
			strcat(fullCommand, "get ");
			break; 
		case SET: 
			strcat(fullCommand, "set ");
			break; 
		default:
			return 0; 
			break; 
	}
	//printf("Command: %s Length: %d, Address: %p\n", fullCommand, strlen(fullCommand), fullCommand);
	//printf("Command: %s Length: %d, Address: %p\n", command, strlen(command),  command);
	strcat(fullCommand, command);
	
	if(value != NOVAL)
	{
		strcat(fullCommand, " ");
		strcat(fullCommand, value);
	}
	
	//printf("fullCommand: %s\n", fullCommand);
	strcat(fullCommand, ENDCOMMAND);
	uint16_t length = getStringLen(fullCommand);
	printf("Command: %s Length: %d, Address: %p\n", fullCommand, length, fullCommand);
	uart_send(fullCommand, length);
	PORTD |= (1<<RTS);
	while(!receiveFlag & 1)
	{
		//While loop does not work correctly without a delay
		//An issue with the compiler or the stack pointer when invoking the interrupt
		_delay_us(10);
		//printf("Loop\n");
	}
	free(fullCommand);
	return 1; 
}

ISR(USART1_RX_vect)
{
	//printf("Receive Interrupt!\n");
	cli();
	//Grab Receive Header
	if(i < endHeader)
		receiveBuffer[i] = uart_receiveChar();
	else if(i == endHeader)
	{
		//transLength = getTransmissionLength();
		//if(testPrint)
		//printf("Transmission Length: %d\n", transLength);
	}
	else
	{
		if(i < 8 + 8)
		{
			receiveBuffer[i] = uart_receiveChar();
			//printf("Writing...\n");
			//printf("Received String: %c @ location %d\n", receiveBuffer[i], i);
		}

		else
		{
			//printf("End of String!\n");
			receiveBuffer[i] = 0;
			UCSR1B &= ~(1<<RXCIE1);
			//cli();
			i = 0;
			//done receiving
			receiveFlag = 1;
			printf("Transmission Length: %d\n", getTransmissionLength());
			printf("Done Receiving!\n");
		}
	}	
	i++; 
	//printf("%d\n", i);
	sei(); 
}
