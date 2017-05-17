/*******************************************************************************
	Viasat Radar Based Vehicle Location and Navagation System
	University of Arizona ENGR498 Team 16060
	
	Data Acquisition Firmware
	
	Comment:
		team created file
		spi header file

********************************************************************************/

/* 
 * File:   SPI.h
 * Author: jsiek
 *
 */

#ifndef SPI_H
#define	SPI_H

#include <xc.h>
#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

void initSPI();
void send_spi_word(uint16_t word);

#ifdef	__cplusplus
}
#endif

#endif	/* SPI_H */