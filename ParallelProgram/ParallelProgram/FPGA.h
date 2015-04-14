/*
 * FPGA.h
 *
 * Created: 4/13/2015 9:00:30 PM
 *  Author: Brandon
 */ 


#ifndef FPGA_H_
#define FPGA_H_

#define FPGA_CS_DDR	DDRG
#define FPGA_CS_PORT PORTG
#define FPGA_SPI_CS	4

#define SPI_PORT PORTB
#define SPI_DDR  DDRB
#define MISO 3
#define MOSI 2
#define SCK 1
#define SS 0

void SPI_FPGA_Init();
void SPI_FPGA_Write(unsigned char SPI_Data);



#endif /* FPGA_H_ */