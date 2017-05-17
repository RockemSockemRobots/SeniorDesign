/*******************************************************************************
	Viasat Radar Based Vehicle Location and Navagation System
	University of Arizona ENGR498 Team 16060
	
	Data Acquisition Firmware
	
	Comment:
		team created file
		timer header file

********************************************************************************/

/* 
 * File:   timer.h
 * Author: jsiek
 *
 * Created on February 17, 2017, 3:00 PM
 */

#ifndef TIMER_H
#define	TIMER_H

#include <xc.h>

#ifdef	__cplusplus
extern "C" {
#endif

void initTimer3();
void initTimer4();
void initTimer5();
void initTimer6();
void initTimer7();
void timer3ON();
void timer3OFF();
void timer4ON();
void timer4OFF();
void timer5ON();
void timer5OFF();
void timer6ON();
void timer6OFF();
void timer7ON();
void timer7OFF();
void delay5ms();
void delay2_47us();
void testTimer3();

#ifdef	__cplusplus
}
#endif

#endif	/* TIMER_H */

