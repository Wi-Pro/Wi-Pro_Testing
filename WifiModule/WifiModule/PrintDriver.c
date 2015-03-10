/*
 * PrintDriver.c
 *
 * Created: 2/15/2015 2:44:02 PM
 *  Author: Brandon
 */ 
#include <avr/io.h>
#include <string.h>
#include <stdio.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "PrintDriver.h"

void uart_flush()
{
	unsigned char dummy;
	while (UCSR0A & (1<<RXC0)) dummy = UDR0;
}


int uart_sendStream(char ch,FILE *stream)
{
	if (ch == '\n')
	uart_sendStream('\r', stream);
	while (!(UCSR0A & (1<<UDRE0)));
	UDR0=ch;
	return 0;
}

int uart_receiveStream(FILE *stream)
{
	unsigned char ch;
	while (!(UCSR0A & (1<<RXC0)));
	ch=UDR0;

	/* Echo the Output Back to terminal */
	uart_sendStream(ch,stream);

	return ch;
}

FILE uart_stream = FDEV_SETUP_STREAM(uart_sendStream, uart_receiveStream, _FDEV_SETUP_RW);

void uart0_init()
{
	UBRR0H = (((F_CPU/BAUD_RATE)/16)-1)>>8;	// set baud rate
	UBRR0L = (((F_CPU/BAUD_RATE)/16)-1);
	UCSR0B = (1<<RXEN0)|(1<<TXEN0); 		// enable Rx & Tx
	UCSR0C=  (1<<UCSZ01)|(1<<UCSZ00);  	       // config USART; 8N1
	//DDRD |= (1<<PORTD1)|(1<<PORTD0);
	// Define Output/Input Stream
	stdout = stdin = &uart_stream;
}

