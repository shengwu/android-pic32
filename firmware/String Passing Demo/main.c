/*
 * String Passing Demo
 * File:   main.c
 * Author: Sheng Wu
 *
 * Establishes an ADB (Android Debug Bridge) connection with an Android phone
 * and communicates using sequences of bytes interpreted as chars.
 * Relies on libusb, libadb, libconn from Ytai's IOIO code.
 * 
 * To learn more about the USB stack, see Microchip manuals AN1140 & AN1141.
 * Explore the IOIO source at https://github.com/ytai/ioio/
 */

#include <plib.h>
#include "NU32.h"
#include "LCD.h"
#include "adb.h"
#include "connection.h"


// ============================
// Helper function declarations
// ============================
void ADBCallback(ADB_CHANNEL_HANDLE handle, const void* data, UINT32 data_len);
void NU32DebugMessage(char message[]);
void MonitorUserButton(ADB_CHANNEL_HANDLE handle);


// =====================
// Variable declarations
// =====================
typedef enum {
  STATE_INIT,
  STATE_WAITING,
  STATE_CONNECTING,
  STATE_CONNECTED
} STATE;
static CHANNEL_HANDLE h;
static STATE state = STATE_INIT;


// ==================
// Main program logic
// ==================
int main()
{
    // Initialize NU32 and its LCD
    InitializeNU32();
    InitializeLCD();
    NU32DebugMessage("NU32 initialized.");

    // For this demo, configure user button as input
    // (pin C13 on the PIC32MX795F512L)
    TRISCSET = 0x2000;

    // Initialize the USB host
    ConnectionInit();
    NU32DebugMessage("USB host initialized.");
    
    while (1) {
        // Keep the USB connection running;
        // Handle incoming data and manage outgoing data.
        ConnectionTasks();

        // Main state machine
        switch (state) {
            case STATE_INIT:
                state = STATE_WAITING;
                NU32DebugMessage("Waiting.");
                h = INVALID_CHANNEL_HANDLE;
                break;

            case STATE_WAITING:
                if (ADBAttached()) {
                    state = STATE_CONNECTING;
                    NU32DebugMessage("Connecting...");
                }
                break;

            case STATE_CONNECTING:
                if (ADBConnected()) {
                    // Open a channel to the Android device
                    // See "adb.h" in libadb for more details
                    // (I don't think the name tcp:4545 matters)
                    h = ADBOpen("tcp:4545", &ADBCallback);
                    
                    if (h != INVALID_CHANNEL_HANDLE) {
                        state = STATE_CONNECTED;
                        NU32DebugMessage("Connected.");
                        // Send plaintext and let the recipient do formatting
                        ADBWrite(h & 0xFF, "Hello from NU32!", 17);
                    }
                }
                break;

            case STATE_CONNECTED:
                if (!ADBAttached()) {
                    state = STATE_INIT;
                }
                if (ADBChannelReady(h)) {
                    // Execute tasks that rely on the Android-PIC32 connection
                    MonitorUserButton(h);
                }
                break;
        } // end state machine
    } // end while loop
    
    return 0;
} // end main()


// ===========================
// Helper function definitions
// ===========================

// Print any data received.
// This function is automatically called when data is received over ADB. 
// In this demo, we assume all messages are to be printed.
// In your applications, you may want to create a system to classify data
// and process it appropriately (e.g. using the first byte to classify data)
void ADBCallback(ADB_CHANNEL_HANDLE handle, const void* data, UINT32 data_len)
{
    // Ignore empty messages
    if (data_len < 1) {
        return;
    }

    // Copy 32 bytes of the message for display
    char message[32];
    strncpy(message, (char*) data, 31);
    message[data_len] = '\0';

    NU32DebugMessage(message);
}

// Send a message to the LCD and to NU32_utility
// Warning: does not check if messages are too long - may cause errors. 
void NU32DebugMessage(char message[])
{
    LCDClear(0);
    LCDWriteString(message, 1, 1);
    sprintf(NU32_RS232OutBuffer, "%s\n", message);
    NU32WriteUART1(NU32_RS232OutBuffer);
}

// Tell the Android device when the user button is pressed or released
// There may be inconsistent output without debouncing.
void MonitorUserButton(ADB_CHANNEL_HANDLE handle)
{
    // Assume button is initially released
    static int previous_state = 1;

    if (NU32USER == 0 && previous_state == 1) {
        ADBWrite(handle & 0xFF, "User button pressed.", 20);
    }
    if (NU32USER == 1 && previous_state == 0) {
        ADBWrite(handle & 0xFF, "User button released.", 21);
    }

    previous_state = NU32USER;
}