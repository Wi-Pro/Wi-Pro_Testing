/*
 * WifiDriver.c
 *
 * Created: 3/7/2015 5:10:03 PM
 *  Author: Brandon
 */ 

#include <avr/io.h>
#include <stdio.h>
#include <string.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "PrintDriver.h"
#include "WifiDriver.h"

unsigned char receiveBuffer[MaxRecSize];
unsigned int  i = 0;
uint8_t receiveFlag = 0; 
unsigned int transLength = 0;

void uart_init()
{
	UBRR1H = (((F_CPU/BAUD_RATE)/16)-1)>>8;	// set baud rate
	UBRR1L = (((F_CPU/BAUD_RATE)/16)-1);
	UCSR1B = (1<<RXEN1)|(1<<TXEN1); // enable Rx & Tx
	UCSR1C =  (1<<UCSZ11)|(1<<UCSZ10); // config USART; 8N1
	UCSR1B |= (1<<RXCIE1);	//Enable Receive Interrupt 
}

int getStringLen(unsigned char* p)
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
	printf("Uart Send Function: %s\n", data);
	uint8_t i = 0;
	while(i <= length){
		while(!(UCSR1A & (1<<UDRE1)));
		UDR1 = data[i];
		//while(!(UCSR1A & (1<<TXC1))); //wait for transmit to complete
		i++;
	}
	//enable Receive Interrupt
	receiveFlag = 0;  
	//UCSR1B |= (1<<RXCIE1);
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
	//printf("Returning...\n");
	return UDR1; 
}

int enableReceiveINT()
{
	UCSR1B |= (1<<RXCIE1);
	return 1; 
}

int disableReceiveINT()
{
	UCSR1B &= ~(1<<RXCIE1);
	return 1; 
}

unsigned char* getReceiveBuffer()
{
	printf("Waiting for Receive to Complete...\n");
	//Wait for receiving to be completed
	//sendFlag accounts for the delay between sending and receiving 
	while(!receiveFlag & 1)
	{
		//While loop does not work correctly without a delay 
		//An issue with the compiler or the stack pointer when invoking the interrupt 
		_delay_us(100);
		//printf("Loop\n");
	}
	//_delay_ms(500);
	//begin receiving
	printf("Received Data: %s\n", receiveBuffer);
	return receiveBuffer; 
}

unsigned int getTransmissionLength()
{
	unsigned int transLength = 0;
	transLength += (receiveBuffer[ones] & 0x0F);
	transLength += (receiveBuffer[tens] & 0x0F) * 10; 
	transLength += (receiveBuffer[hundreds] & 0x0F) * 100; 
	transLength += (receiveBuffer[thousands] & 0x0F) * 1000; 
	transLength += (receiveBuffer[tenThousands] & 0x0F) * 10000; 
	if(transLength < MaxRecSize)
		return transLength; 
	else
		return MaxRecSize; 
}

unsigned int sendCommand(int8_t prefix, unsigned char* command, unsigned char* value)
{	
	char* fullCommand = ""; 
	switch(prefix)
	{
		case NOPREFIX: 
			fullCommand = "";
			break; 
		case GET: 
			fullCommand = "get ";
			printf("fullCommand: %s\n", fullCommand);
			break; 
		case SET: 
			fullCommand = "set ";
			printf("fullCommand: %s\n", fullCommand);
			break; 
		default:
			return 0; 
			break; 
	}

	strcat(fullCommand, command);
	
	if(value != NOVAL)
	{
		strcat(fullCommand, " ");
		strcat(fullCommand, value);
	}
	
	
	printf("fullCommand: %s\n", fullCommand);
	strcat(fullCommand, ENDCOMMAND);
	uint16_t length = getStringLen(fullCommand);
	printf("Command: %s Length: %d\n", fullCommand, length);
	uart_send(fullCommand, length);
	
	memset(fullCommand, 0x00, length);
	//memset(command, 0x00, length);
	
	//uart_send("set system.print_level 0\r\n\0", getStringLen("set system.print_level 0\r\n\0"));
	//uart_send("set system.cmd.prompt_enabled 1\r\n\0", getStringLen("set system.cmd.prompt_enabled 1\r\n\0"));
	//unsigned char* test = "set system.print_level 0\r\n\0";
	//length = getStringLen(test);
	//uart_send(test, length);
	//test = "set system.cmd.prompt_enabled 1\r\n\0";
	//length = getStringLen(test);
	//uart_send(test, length);
	
	//while(!receiveFlag & 1)
	//{
		////While loop does not work correctly without a delay
		////An issue with the compiler or the stack pointer when invoking the interrupt
		//_delay_us(100);
		////printf("Loop\n");
	//}
	return 1; 
}

ISR(USART1_RX_vect)
{
	cli();
	//Grab Receive Header
	if(i < endHeader)
		receiveBuffer[i] = uart_receiveChar();
	else if(i == endHeader)
	{
		transLength = getTransmissionLength(); 
		//printf("Transmission Length: %d\n", transLength);
	}
	else
	{
		if(i < transLength + 6)
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
			printf("Transmission Length: %d\n", transLength);
			printf("Done Receiving!\n");
		}
	}
	i++; 
	//printf("%d\n", i);
	sei(); 
}

//int uart_sendChar(unsigned char data)
//{
//UCSR1B |= (1<<RXCIE1);
//while(!(UCSR1A & (1<<UDRE1)));
//UDR1 = data;
//return 0;
//}