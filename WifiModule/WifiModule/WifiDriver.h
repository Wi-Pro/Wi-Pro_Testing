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

#define MaxRecSize 750
#define MaxSendSize 50

//Wi-Fi Commands
#define NOPREFIX -1
#define GET 1 
#define SET 2
#define NOVAL ""
#define ENDCOMMAND "\r\n\0"

//Wi-Fi Receive Header File 
#define response 0
#define errorCode 1
#define tenThousands 2
#define thousands 3
#define hundreds 4
#define tens 5
#define ones 6
#define endHeader 7

//I/Os 
#define RTS PORTD4
#define CTS PORTD5 

void setTestPrint(); 
void uart_init();
int uart_send(unsigned char* data, unsigned int length);
int uart_sendChar(unsigned char data);
int enableReceiveINT();
int disableReceiveINT();
unsigned char uart_receive(unsigned char *data, unsigned char size);
unsigned char uart_receiveChar();
unsigned char* getReceiveBuffer();
char* getMessageHeader();
unsigned int sendCommand(int8_t prefix, char* command, char* value);
uint16_t getStringLen(unsigned char* p);
int waitForReceive();
int errorCheck();

#endif /* WIFIDRIVER_H_ */