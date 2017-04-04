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
void sendWordSPI(uint16_t word);

#ifdef	__cplusplus
}
#endif

#endif	/* SPI_H */