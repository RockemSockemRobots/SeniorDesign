/*******************************************************************************
	Viasat Radar Based Vehicle Location and Navagation System
	University of Arizona ENGR498 Team 16060
	
	Data Acquisition Firmware
	
	Comment:
		adc header file

********************************************************************************/

/* 
 * File:   adc.h
 * Author: jsiek
 *
 * Created on February 24, 2017, 2:16 PM
 */

#ifndef ADC_H
#define	ADC_H

#include <xc.h>

#ifdef	__cplusplus
extern "C" {
#endif

    void configureADCs();
    unsigned int sampleVTUNE();


#ifdef	__cplusplus
}
#endif

#endif	/* ADC_H */

