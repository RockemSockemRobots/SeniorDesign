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
void timer3ON();
void timer3OFF();
void timer4ON();
void timer4OFF();
void timer5ON();
void timer5OFF();
void delay5ms();
void testTimer3();

#ifdef	__cplusplus
}
#endif

#endif	/* TIMER_H */

