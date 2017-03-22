/*******************************************************************************
 System Interrupts File

  File Name:
    system_interrupt.c

  Summary:
    Raw ISR definitions.

  Description:
    This file contains a definitions of the raw ISRs required to support the
    interrupt sub-system.

  Summary:
    This file contains source code for the interrupt vector functions in the
    system.

  Description:
    This file contains source code for the interrupt vector functions in the
    system.  It implements the system and part specific vector "stub" functions
    from which the individual "Tasks" functions are called for any modules
    executing interrupt-driven in the MPLAB Harmony system.

  Remarks:
    This file requires access to the systemObjects global data structure that
    contains the object handles to all MPLAB Harmony module objects executing
    interrupt-driven in the system.  These handles are passed into the individual
    module "Tasks" functions to identify the instance of the module to maintain.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2011-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END

// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************

#include <xc.h>
#include <sys/attribs.h>
#include "app.h"
#include "system_definitions.h"

// *****************************************************************************
// *****************************************************************************
// Section: System Interrupt Vector Functions
// *****************************************************************************
// *****************************************************************************

    
void __ISR(_TIMER_2_VECTOR, IPL4AUTO) IntHandlerDrvTmrInstance0(void)
{
    DRV_TMR_Tasks(sysObj.drvTmr0);
}
  
void __ISR( _USB_VECTOR , IPL4AUTO)_IntHandler_USB_stub ( void )
{
    DRV_USBHS_Tasks_ISR(sysObj.drvUSBObject);
}

void __ISR ( _USB_DMA_VECTOR, IPL4AUTO)  _IntHandlerUSBInstance0_USBDMA ( void )
{
    DRV_USBHS_Tasks_ISR_USBDMA(sysObj.drvUSBObject);
}

void __ISR( _TIMER_3_VECTOR, IPL6AUTO) _IntHandlerDebounceTimer(void) { //debouncetimer
    IFS0bits.T3IF = 0;
    timer3OFF();
    setDebounced();
    togglePress();
    TMR3 = 0x0000;
}

void __ISR(_CHANGE_NOTICE_G_VECTOR, IPL1AUTO) _CNInterrupt(void) {
    int dummy = PORTG;
    IFS3bits.CNGIF = 0;
    timer3ON(); //delay for debounce
}

void __ISR( _TIMER_4_VECTOR, IPL1AUTO) _IntHandlerTmr4(void) { //older test
    IFS0bits.T4IF = 0;
    //incTimeStamp(); 
    //addSample();
    TMR4 = 0x0000;
}

void __ISR( _TIMER_6_VECTOR, IPL7AUTO) _IntHandlerTmr6(void) {
    IFS0bits.T6IF = 0;
    TMR6 = 0x0000;
    readFIFO();
}

//void __ISR( _TIMER_5_VECTOR, IPL1AUTO) _IntHandlerTmr5(void) {
//    IFS0bits.T5IF = 0;
//    TMR5 = 0x0000;
//}

//void __ISR( _ADC_FIFO_VECTOR, IPL7AUTO) _IntHandlerADCFIFO(void){
//    //addSampleFromFIFO();
//}

//void __ISR( _ADC_VECTOR, IPL6AUTO) _IntHandlerADCGlobal(void){
//    if(ADCDSTAT1bits.ARDY2 && ADCDSTAT1bits.ARDY3){ //these probably won't be ready at the same time...
//        addSample();
//        IFS1 = 0; //flags CANNOT be cleared until after data has been read
//    }
//}

//void __attribute__ ((interrupt(IPL4SRS))) _DefaultInterrupt(void){
//    
//}

//void __ISR( _ADC_DATA1_VECTOR, IPL6AUTO) _IntHandlerADCData1(void){
//    IFS1bits.ADCD1IF = 0; //pull global adc flag down
//    if(ADCDSTAT1bits.ARDY1 && ADCDSTAT1bits.ARDY2 && ADCDSTAT1bits.ARDY3 && ADCDSTAT1bits.ARDY4){ //these probably won't be ready at the same time...
//        addSample();
//    }
//    else{
//        error();
//    }
//}
//void __ISR( _ADC_DATA2_VECTOR, IPL6AUTO) _IntHandlerADCData2(void){
//    if(ADCDSTAT1bits.ARDY2 && ADCDSTAT1bits.ARDY3){ //these probably won't be ready at the same time...
//        addSample();
//        IFS1 = 0; //flags CANNOT be cleared until after data has been read
//    }
//}
//
//void __ISR( _ADC_DATA3_VECTOR, IPL6AUTO) _IntHandlerADCData3(void){
//    if(ADCDSTAT1bits.ARDY2 && ADCDSTAT1bits.ARDY3){ //these probably won't be ready at the same time...
//        addSample();
//        IFS1 = 0; //flags CANNOT be cleared until after data has been read
//    }
//}
//void __ISR( _ADC_DATA4_VECTOR, IPL6AUTO) _IntHandlerADCData4(void){
//    IFS1bits.ADCD4IF = 0; //pull global adc flag down
//    if(ADCDSTAT1bits.ARDY1 && ADCDSTAT1bits.ARDY2 && ADCDSTAT1bits.ARDY3 && ADCDSTAT1bits.ARDY4){ //these probably won't be ready at the same time...
//        addSample();
//    }
//    else{
//        error();
//    }
//}
/*******************************************************************************
 End of File
*/
