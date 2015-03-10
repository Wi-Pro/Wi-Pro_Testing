/*
 * WifiDriver.h
 *
 * Created: 3/7/2015 5:10:18 PM
 *  Author: Brandon
 */ 


#ifndef WIFIDRIVER_H_
#define WIFIDRIVER_H_

#define BAUD_RATE 4800
#define F_CPU 1000000UL

void uart_init();
int uart_send(unsigned char data[]);
int uart_sendChar(unsigned char data);
unsigned char uart_receive(unsigned char *data, unsigned char size);
unsigned char uart_receiveChar();

#endif /* WIFIDRIVER_H_ */