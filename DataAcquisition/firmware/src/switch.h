/*******************************************************************************
	Viasat Radar Based Vehicle Location and Navagation System
	University of Arizona ENGR498 Team 16060
	
	Data Acquisition Firmware
	
	Comment:
		team created file
		switch header file

********************************************************************************/

/* 
 * File:   switch.h
 * Author: jsiek
 *
 * Created on February 23, 2017, 11:40 AM
 */

#ifndef SWITCH_H
#define	SWITCH_H

#include <xc.h>

#ifdef	__cplusplus
extern "C" {
#endif

void initOnBoardSwitch();
void initIRSwitch();
void initOffBoardSwitch();


#ifdef	__cplusplus
}
#endif

#endif	/* SWITCH_H */

