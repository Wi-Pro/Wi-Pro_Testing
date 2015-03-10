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

void uart_init()
{
	UBRR1H = (((F_CPU/BAUD_RATE)/16)-1)>>8;	// set baud rate
	UBRR1L = (((F_CPU/BAUD_RATE)/16)-1);
	UCSR1B = (1<<RXEN1)|(1<<TXEN1); 		// enable Rx & Tx
	UCSR1C=  (1<<UCSZ11)|(1<<UCSZ10);  	       // config USART; 8N1
	UCSR1B |= (1<<RXCIE1);	//Enable Receive Interrupt 
	DDRD |=  (1<<PORTD3);	//rx as output
	DDRD &= ~(1<<PORTD2);
}

int uart_send(unsigned char data[])
{
	printf("Uart Send Function: %c\n", data);
	uint8_t i = 0;
	while(data[i] != 0x00){
		while(!(UCSR1A & (1<<UDRE1)));
		UDR1 = data[i];
		i++;
	}
	//Enable Interrupt to receive response from Wi-Fi Module 
	//sei();
	return 0;
}

int uart_sendChar(unsigned char data)
{
	while(!(UCSR1A & (1<<UDRE1)));
	UDR1 = data; 
}

unsigned char uart_receive(unsigned char *data, unsigned char size)
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
	while (!(UCSR1A & (1<<RXC1)));
	return UDR1; 
}


ISR(USART1_RX_vect)
{
	cli(); 
	printf("Starting RX0 Interrupt...\n");
	unsigned char receivedData[] = ""; 
	uart_receive(receivedData, 100);
	printf("Received Data: %s\n", receivedData);
	//uart_send(receivedData);
}