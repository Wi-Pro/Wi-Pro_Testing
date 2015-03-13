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

#define MaxRecSize 1000

//Wi-Fi Commands
#define GET "get "
#define SET "set "
#define ENDCOMMAND "/r/n" 
#define SCAN "scan"

//Wi-Fi Receive Header File 
#define response 0
#define errorCode 1
#define tenThousands 2
#define thousands 3
#define hundreds 4
#define tens 5
#define ones 6
#define endHeader 7

void uart_init();
int uart_send(unsigned char data[], unsigned int length);
int uart_sendChar(unsigned char data);
unsigned char uart_receive(unsigned char *data, unsigned char size);
unsigned char uart_receiveChar();
unsigned char* getReceiveBuffer();
unsigned int sendCommand(uint8_t set, char* command);

#endif /* WIFIDRIVER_H_ */