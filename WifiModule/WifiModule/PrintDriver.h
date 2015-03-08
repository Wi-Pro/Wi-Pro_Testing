/*
 * PrintDriver.h
 *
 * Created: 2/15/2015 2:56:11 PM
 *  Author: Brandon
 */ 
#include <stdio.h>

#ifndef PRINTDRIVER_H_
#define PRINTDRIVER_H_

#define BAUD_RATE 2400 
#define F_CPU 1000000UL

void uart0_init();
void uart1_init();
void uart_flush();
int uart_send(unsigned char data[]);
int uart_sendStream(char ch,FILE *stream);
int uart_receiveStream(FILE *stream);



#endif /* PRINTDRIVER_H_ */