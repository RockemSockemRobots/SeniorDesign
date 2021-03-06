/*******************************************************************************
	Viasat Radar Based Vehicle Location and Navagation System
	University of Arizona ENGR498 Team 16060
	
	Data Acquisition Firmware
	
	Comment:
		team created file
		radar header file

********************************************************************************/

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
#include "timer.h"
#include "bsp.h"

#ifdef	__cplusplus
extern "C" {
#endif

unsigned char initRADAR();
unsigned char Frequency_Cal();
void CT_Discovery(unsigned int Voffset11);
void FT_Discovery(unsigned char j, unsigned int Voffset00, unsigned int Voffset11);


#ifdef	__cplusplus
}
#endif

#endif	/* RADAR_H */

