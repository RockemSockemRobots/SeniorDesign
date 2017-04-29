/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

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

#include "app.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds usb data

  Description:
    This structure holds the usb's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

USB_OBJ usbObj;

volatile int transmits = 0;
volatile bool debounced = false;
volatile uint32_t n = 0;
volatile uint16_t radarDataBuffer1[BUFFERSIZE][(NUM_RX_CHANNELS*2)];
volatile uint16_t radarDataBuffer2[BUFFERSIZE][(NUM_RX_CHANNELS*2)];
volatile int bufferindex = 0;
volatile int bufferindex2 = 0;
volatile int bufferindex3 = 0;
volatile int bufferindex4 = 0;
volatile int currInBuff = 1;
volatile int currOutBuff = 2;
volatile bool currentlyPressed = false;
volatile unsigned int testNumber = 0;
volatile bool adcActive = false;
volatile bool initializing = true;
volatile int garbage = 0;
// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback functions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

void setDebounced(){
    debounced = true;
}
void addSample(){
    if(!initializing){
        adcActive = true;
        BSP_LEDOn( BSP_RGB_LED_RED );
        BSP_LEDOff( BSP_RGB_LED_GREEN );
        BSP_LEDOff( BSP_RGB_LED_BLUE );
        n++;
        if(currInBuff == 1 && currOutBuff == 2){
            radarDataBuffer1[bufferindex][0] = ADCDATA2;
            radarDataBuffer1[bufferindex][1] = ADCDATA3;
            bufferindex++;
            if(bufferindex == BUFFERSIZE){
                currInBuff = 2; currOutBuff = 1;
                bufferindex = 0;
                usbObj.state = STATE_WRITE_TO_FILE;
            }
        }
        else if(currInBuff == 2 && currOutBuff == 1){
            radarDataBuffer2[bufferindex][0] = ADCDATA2;
            radarDataBuffer2[bufferindex][1] = ADCDATA3;
            bufferindex++;
            if(bufferindex == BUFFERSIZE){
                currInBuff = 1; currOutBuff = 2;
                bufferindex = 0;
                usbObj.state = STATE_WRITE_TO_FILE;
            }
        }
        else{ usbObj.state = STATE_ERROR; }
    }
    else{
        garbage = ADCDATA2;
        garbage = ADCDATA3;
    }
}
void togglePress(){
    currentlyPressed = !currentlyPressed;
}
void convertValues(char usbCharBuff[],volatile uint32_t buffer2Conv[][1+(NUM_RX_CHANNELS*2)]){ //sprintf takes way too long
    char temp[18] = "";
    int row = 0;
    for(row = 0; row < BUFFERSIZE; row++){
        sprintf(temp, "%07d\t%04d\t%04d\n", buffer2Conv[row][0], buffer2Conv[row][1], buffer2Conv[row][2]);
        strcat(usbCharBuff, temp);
    }
}
// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    int i = 0;
    unsigned char FreqCalFlag;
    unsigned int samp;
    /* Place the App state machine in its initial state. */
    usbObj.state = STATE_BUS_ENABLE;
    usbObj.deviceIsConnected = false;
    
    initTimer3();
    initTimer4();
    initTimer5();
    configureADCs();
    for(i = 0; i < 10; i++){
        delay5ms();
    }
    initOnBoardSwitch();
    initOffBoardSwitch();
    initIRSwitch();
    init1MHzPLL_REF();
    initSPI();
    //radar module initialization and frequency calibration
    FreqCalFlag = initRADAR();
    if(FreqCalFlag != 0){
        usbObj.state = STATE_ERROR;
    }
    else{
        BSP_LEDOff(BSP_RGB_LED_BLUE);
        BSP_LEDOff(BSP_RGB_LED_RED);
        BSP_LEDOn(BSP_RGB_LED_GREEN);
        initializing = false;
    }
}

USB_HOST_EVENT_RESPONSE APP_USBHostEventHandler (USB_HOST_EVENT event, void * eventData, uintptr_t context)
{
    switch (event)
    {
        case USB_HOST_EVENT_DEVICE_UNSUPPORTED:
            break;
        default:
            break;
    }
    return(USB_HOST_EVENT_RESPONSE_NONE);
}

void APP_SYSFSEventHandler(SYS_FS_EVENT event, void * eventData, uintptr_t context)
{
    switch(event)
    {
        case SYS_FS_EVENT_MOUNT:
            usbObj.deviceIsConnected = true;
            break;
        case SYS_FS_EVENT_UNMOUNT:
            usbObj.deviceIsConnected = false;
            break;
        default:
            break;
    }
}

/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */
void APP_Tasks ( void )
{
    int remainingBytes = 0;
    char fullFilename[FULLFILENAMECHARLIM] = "\0";
    char testNumberStr[FULLFILENAMECHARLIM] = "\0";
    switch(usbObj.state)
    {
        case STATE_BUS_ENABLE:   
           /* Set the event handler and enable the bus */
            SYS_FS_EventHandlerSet(APP_SYSFSEventHandler, (uintptr_t)NULL);
            USB_HOST_EventHandlerSet(APP_USBHostEventHandler, 0);
            USB_HOST_BusEnable(0);
            usbObj.state = STATE_WAIT_FOR_BUS_ENABLE_COMPLETE;
            break;
            
        case STATE_WAIT_FOR_BUS_ENABLE_COMPLETE:
            BSP_LEDOff(BSP_RGB_LED_BLUE);
            BSP_LEDOn(BSP_RGB_LED_RED);
            BSP_LEDOff(BSP_RGB_LED_GREEN);
            if(USB_HOST_BusIsEnabled(0))
            {
                usbObj.state = STATE_WAIT_FOR_DEVICE_ATTACH;
                BSP_LEDOn(BSP_RGB_LED_BLUE);
                BSP_LEDOff(BSP_RGB_LED_RED);
                BSP_LEDOff(BSP_RGB_LED_GREEN);
            }
            break;
       
        case STATE_WAIT_FOR_DEVICE_ATTACH:
            /* Wait for device attach. The state machine will move
             * to the next state when the attach event
             * is received.  */
            if(usbObj.deviceIsConnected)
            {
                BSP_LEDOn( APP_USB_LED_3 );
                BSP_LEDOff( APP_USB_LED_2 );
                usbObj.state = STATE_DEVICE_CONNECTED;
            }
            break;

        case STATE_DEVICE_CONNECTED:
            /* Device was connected. We can try mounting the disk */
            usbObj.state = STATE_OPEN_FILE;
            break;

        case STATE_OPEN_FILE:
            /* Try opening the file for append */
            strcat(fullFilename, FILEPATH);
            sprintf(testNumberStr, "%d", testNumber);
            strcat(fullFilename, testNumberStr);
            strcat(fullFilename, FILEEXT);
            usbObj.fileHandle = SYS_FS_FileOpen(fullFilename, (SYS_FS_FILE_OPEN_APPEND_PLUS));
            if(usbObj.fileHandle == SYS_FS_HANDLE_INVALID)
            {
                /* Could not open the file. Error out*/
                usbObj.state = STATE_ERROR;
                
            }
            else
            {
                /* File opened successfully. Write to file */
                usbObj.state = STATE_WAIT_FOR_TEST;
                /* Turn on Purple LED */ //means ready to collect data
                BSP_LEDOn( BSP_RGB_LED_BLUE );
                BSP_LEDOn( BSP_RGB_LED_RED );
            }
            break;
            
        case STATE_WAIT_FOR_TEST:
            if(debounced == true && !currentlyPressed){ //for debouncing the switch
                usbObj.state = STATE_IDLE_TESTING;
                debounced = false;
                BSP_LEDOff( BSP_RGB_LED_RED );
                n = 0;
                while(!adcActive){
                    timer5OFF();
                    timer5ON();
                    while(!IFS0bits.T5IF){}
                }
            }
            else if(debounced == true && currentlyPressed){
                debounced = false;
            }
            break;
            
        case STATE_IDLE_TESTING:
            if(debounced == true && !currentlyPressed){
                timer5OFF();
                usbObj.state = STATE_CLOSE_FILE;
                debounced = false;
            }
            else{
                if(debounced == true && currentlyPressed){
                    debounced = false;
                }
            }
            break;
            
        case STATE_WRITE_TO_FILE:
            if(currInBuff == 1 && currOutBuff == 2){
//                convertValues(textBuff, radarDataBuffer2);
                if(SYS_FS_FileWrite( usbObj.fileHandle, (const void *) radarDataBuffer2, USBBYTES) == -1){ usbObj.state = STATE_ERROR; }
                else{
                    usbObj.state = STATE_IDLE_TESTING; 
                }
            }
            else if(currInBuff == 2 && currOutBuff == 1){
//                convertValues(textBuff, radarDataBuffer1);
                if(SYS_FS_FileWrite( usbObj.fileHandle, (const void *) radarDataBuffer1, USBBYTES) == -1){ usbObj.state = STATE_ERROR; }
                else{
                    usbObj.state = STATE_IDLE_TESTING;
                }
            }
            else{ usbObj.state = STATE_ERROR; }
            break;

        case STATE_CLOSE_FILE:
            /* Calculate remaining sample data not yet sent */
            remainingBytes = bufferindex*4;
            /* Finish writing collected data */
            if(currInBuff == 1 && currOutBuff == 2){
                if(SYS_FS_FileWrite( usbObj.fileHandle, (const void *) radarDataBuffer1, remainingBytes) == -1){ usbObj.state = STATE_ERROR; } //send remaining data from currInBuff
                else{
                    /* Close the file */
                    SYS_FS_FileClose(usbObj.fileHandle);
                    usbObj.state = STATE_TEST_COMPLETE;
                }
            }
            else if(currInBuff == 2 && currOutBuff == 1){
                if(SYS_FS_FileWrite( usbObj.fileHandle, (const void *) radarDataBuffer2, remainingBytes) == -1){ usbObj.state = STATE_ERROR; } //send remaining data from currInBuff
                else{
                    /* Close the file */
                    SYS_FS_FileClose(usbObj.fileHandle);
                    usbObj.state = STATE_TEST_COMPLETE;
                }
            }
            else{ usbObj.state = STATE_ERROR; }
            break;

        case STATE_TEST_COMPLETE:
            currInBuff = 1; currOutBuff = 2;
            bufferindex = 0;
            adcActive = false;
            testNumber++;
            BSP_LEDOff( APP_USB_LED_3);
            BSP_LEDOn( APP_USB_LED_2 );
            BSP_LEDOff(BSP_RGB_LED_BLUE);
            BSP_LEDOff(BSP_RGB_LED_RED);
            BSP_LEDOn(BSP_RGB_LED_GREEN);
            if(usbObj.deviceIsConnected == false)
            {
                usbObj.state = STATE_WAIT_FOR_DEVICE_ATTACH;
                BSP_LEDOff(APP_USB_LED_2);
                BSP_LEDOff(BSP_RGB_LED_GREEN);
                BSP_LEDOff(BSP_RGB_LED_RED);
                BSP_LEDOff(BSP_RGB_LED_BLUE);
            }
            else{
                usbObj.state = STATE_OPEN_FILE;
                BSP_LEDOff(APP_USB_LED_2);
                BSP_LEDOff(BSP_RGB_LED_GREEN);
                BSP_LEDOff(BSP_RGB_LED_RED);
                BSP_LEDOff(BSP_RGB_LED_BLUE);
            }
            break;

        case STATE_ERROR:

            /* The application comes here when the demo
             * has failed. Provide LED indication .*/
            BSP_LEDOn( APP_USB_LED_1 );
            if(SYS_FS_Unmount("/mnt/myDrive") != 0)
            {
                /* The disk could not be un mounted. Try
                 * un mounting again until success. */

                usbObj.state = STATE_ERROR;
            }
            else
            {
                /* UnMount was successful. Wait for device attach */
                usbObj.state =  STATE_WAIT_FOR_DEVICE_ATTACH;
            }
            break;

        default:
            break;
    }
}

/*******************************************************************************
 End of File
 */
