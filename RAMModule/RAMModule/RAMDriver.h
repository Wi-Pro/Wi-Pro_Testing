/*
 * RAMDriver.h
 *
 * Created: 3/25/2015 8:40:52 PM
 *  Author: Brandon
 */ 


#ifndef RAMDRIVER_H_
#define RAMDRIVER_H_

#define SPI_PORT PORTB
#define SPI_DDR  DDRB
#define RAM_PORT PORTA
#define RAM_DDR DDRA 
#define RAM_CS PORTA1

#define MOSI PORTB5
#define SCK PORTB7
#define SS PORTB4

#define READ 0x03
#define WRITE 0x02
#define RDSR 0x05 
#define WRSR 0x01 

//Modes 
#define BYTE 0x00
#define PAGE 0x80
#define SEQ 0x40

void SPI_Init();
int getRAMStatus(); 
uint8_t SPI_Read(uint16_t address);
void SPI_Write(uint16_t address, char data);
void SPI_WriteAddress(uint16_t address);
void SPI_WriteData(char data);
int RAMWrite(char* data, uint16_t startAddress, uint16_t length);
char* RAMRead(uint16_t startAddress, uint16_t length);




#endif /* RAMDRIVER_H_ */