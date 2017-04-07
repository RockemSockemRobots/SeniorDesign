/* 
 * File:   radar.h
 * Author: jsiek
 *
 * Created on April 6, 2017, 5:25 PM
 */

#ifndef RADAR_H
#define	RADAR_H

#include <xc.h>
#include "SPI.h"
#include "pll_ref.h"

#ifdef	__cplusplus
extern "C" {
#endif

void initRADAR();
unsigned char Frequency_Cal();
void CT_Discovery(unsigned int Voffset11);
void FT_Discovery(unsigned char j, unsigned int Voffset00, unsigned int Voffset11);


#ifdef	__cplusplus
}
#endif

#endif	/* RADAR_H */

