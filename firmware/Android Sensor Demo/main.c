/*
 * Android Sensor Demo
 * File:   main.c
 * Author: Sheng Wu
 *
 * Establishes an ADB (Android Debug Bridge) connection with an Android phone
 *  and receives a variety of data from sensors on the Android device.
 * Relies on libusb, libadb, libconn from Ytai's IOIO code.
 * 
 */

#include <plib.h>
#include "NU32.h"
#include "LCD.h"
#include "adb.h"
#include "connection.h"

// Identifiers that match the identifiers in Android application code
#define GPS_ID 0x08
#define CAMERA_ID 0x09
#define TS_ID 0x0a
#define MIC_ID 0x0b


// ============================
// Helper function declarations
// ============================
void SensorDemoCallback(ADB_CHANNEL_HANDLE handle, const void* data, UINT32 data_len);
void NU32DebugMessage(char message[]);

// Handle incoming data from Android sensors
// (e.g. when the Android camera demo sends data, cameraInData is called)
void gpsInData(ADB_CHANNEL_HANDLE handle, BYTE data[], int data_len);
void cameraInData(ADB_CHANNEL_HANDLE handle, BYTE data[], int data_len);
void tsInData(ADB_CHANNEL_HANDLE handle, BYTE data[], int data_len);
void micInData(ADB_CHANNEL_HANDLE handle, BYTE data[], int data_len);

// Handle outgoing data for Android sensor demos
void gpsOutData(ADB_CHANNEL_HANDLE handle);
void cameraOutData(ADB_CHANNEL_HANDLE handle);
void tsOutData(ADB_CHANNEL_HANDLE handle);
void micOutData(ADB_CHANNEL_HANDLE handle);

// Convert between bytes and floating point numbers
// According to Microchip manual DS51686A, the C32 compiler uses IEEE 754 floats
// Check endianness if there are errors
float floatFromBytes(BYTE in[]);
void bytesFromFloat(float in, BYTE out[]);

// Convert between bytes and integers
int intFromBytes(BYTE in[]);
void bytesFromInt(int in, BYTE out[]);

// Take a slice of a byte array
void arraySlice(BYTE target[], BYTE array[], int start, int end);


// =====================
// Variable declarations
// =====================
typedef enum {
  STATE_INIT,
  STATE_WAITING,
  STATE_CONNECTING,
  STATE_CONNECTED
} STATE;
static STATE state = STATE_INIT;
static CHANNEL_HANDLE h;

// Keep track of which sensor demo we're in
typedef enum {
    NONE = 0x00,
    GPS_DEMO = GPS_ID,
    CAMERA_DEMO = CAMERA_ID,
    TS_DEMO = TS_ID,
    MIC_DEMO = MIC_ID
} SENSOR_STATE;
static SENSOR_STATE sensor_state = NONE;

// A function will set this flag to TRUE when there is outgoing data to send
static BOOL sendOutData = FALSE;

// Structs to hold data for each sensor demo
// We're using global variables, which isn't ideal.
struct GPS_DATA {
    float lat;
    float lng;
};
static struct GPS_DATA gps_data;

#define CAMERA_DATA_SIZE 3600
struct CAMERA_DATA {
    BYTE data[CAMERA_DATA_SIZE];
};
static struct CAMERA_DATA camera_data;

struct TS_DATA {
    float pic_x;
    float pic_y;
    float step_x;
    float step_y;
};
#define TS_CURSOR_STEP 0.02
static struct TS_DATA ts_data = {0, 0, TS_CURSOR_STEP, TS_CURSOR_STEP};

typedef enum {
    QUIET,
    LOUD,
    LOUDER,
    LOUDEST
} MIC_STATE;
struct MIC_DATA {
    int max;
    MIC_STATE mic_state;
    MIC_STATE previous_state;
};
static struct MIC_DATA mic_data;

// Convert between bytes and float, or bytes and int
union {
    BYTE array[4];
    float value;
} fConverter;
union {
    BYTE array[4];
    int value;
} iConverter;

// ==================
// Main program logic
// ==================
int main()
{
    // Initialize NU32 and LCD
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
                    // (the name tcp:4545 should not matter)
                    h = ADBOpen("tcp:4545", &SensorDemoCallback);
                    
                    if (h != INVALID_CHANNEL_HANDLE) {
                        state = STATE_CONNECTED;
                        NU32DebugMessage("Connected.");
                    }
                }
                break;

            case STATE_CONNECTED:
                if (!ADBAttached()) {
                    state = STATE_INIT;
                }
                if (ADBChannelReady(h) && sendOutData) {
                    // If a function has raised the sendOutData flag,
                    // call the appropriate outgoing data function
                    // and set sendOutData back to FALSE
                    switch(sensor_state) {
                        case GPS_DEMO:
                            gpsOutData(h);
                            break;
                        case CAMERA_DEMO:
                            cameraOutData(h);
                            break;
                        case TS_DEMO:
                            tsOutData(h);
                            break;
                        case MIC_DEMO:
                            micOutData(h);
                            break;
                    }
                    sendOutData = FALSE;
                }
                break;
        } // end state machine
    } // end while loop
    
    return 0;
} // end main


// ===========================
// Helper function definitions
// ===========================

// For this sensor demo, we use the first byte to identify incoming data.
// Then, we pass the data to the function specified for whichever
// sensor demo was identified. 
void SensorDemoCallback(ADB_CHANNEL_HANDLE handle, const void* data, UINT32 data_len)
{
    // Ignore empty messages
    if (data_len < 1) {
        return;
    }

    // Get data without the first byte
    BYTE raw_data[data_len-1];
    memcpy(raw_data, data+1, data_len-1);

    // First byte identifies the data
    BYTE* id = (BYTE*) data;

    // Assign sensor state based on identifier
    sensor_state = *id;

    switch (*id) {
        case GPS_ID:
            gpsInData(handle, raw_data, data_len-1);
            break;
        case CAMERA_ID:
            cameraInData(handle, raw_data, data_len-1);
            break;
        case TS_ID:
            tsInData(handle, raw_data, data_len-1);
            break;
        case MIC_ID:
            micInData(handle, raw_data, data_len-1);
            break;
        default:
            NU32DebugMessage("unidentified");
            break;
    }
}

// Transform the longitude and latitude to the location across the world
// (the antipode) and send the coordinates back. 
void gpsInData(ADB_CHANNEL_HANDLE handle, BYTE data[], int data_len)
{
    static char line[16];
    static char line2[16];

    // Assume the Android application will pass us two floats
    // (8 bytes total)
    float lat = floatFromBytes(data);
    float lng = floatFromBytes(data + 4);

    // Display the values
    sprintf(line, "%16.7f", lat);
    sprintf(line2, "%16.7f", lng);
    LCDClear(0);
    LCDWriteString(line, 1, 1);
    LCDWriteString(line2, 2, 1);

    // Generate random coordinates and send them
    // Will end up in Africa, Europe, or Asia
    gps_data.lat = (rand() * 1.0 / RAND_MAX) * 60.0;
    gps_data.lng = (rand() * 1.0 / RAND_MAX) * 140.0 - 16.0;

    sendOutData = TRUE;
}

// Invert the RGB pixels received and send them back
void cameraInData(ADB_CHANNEL_HANDLE handle, BYTE data[], int data_len)
{
    static char disp[16];
    NU32DebugMessage("Data received.");
    int i;
    for (i = 0; i < CAMERA_DATA_SIZE; i++) {
        camera_data.data[i] = 0xff - data[i];
        if (i % 50 == 0) {
            sprintf(disp, "Processed: %i", i);
            LCDWriteString(disp, 2, 1);
        }
    }
    sendOutData = TRUE;
}

// For data passed by the touchscreen demo,
// update the LCD and send back randomly generated coordinates.
void tsInData(ADB_CHANNEL_HANDLE handle, BYTE data[], int data_len)
{
    static char disp[16];

    // Values for Nexus S 4G
    static const int DEVICE_WIDTH = 480;
    static const int DEVICE_HEIGHT = 720;

    // Assume the Android application will pass us two floats
    // (8 bytes total)

    // The Android application will send us floats between 0 and 1
    // Scale by the device's screen resolution for actual numbers
    int x = (int) (floatFromBytes(data) * DEVICE_WIDTH);
    int y = (int) (floatFromBytes(data + 4) * DEVICE_HEIGHT);

    sprintf(disp, "(%i, %i)", x, y);
    LCDWriteString("Touch location:", 1, 1);
    LCDWriteString("                ", 2, 1);
    LCDWriteString(disp, 2, 1);

    // Generate movement for the orange cursor that the PIC is controlling.
    // Just like how the Android application sends us floats between 0 and 1
    // to represent the user's cursor location, we'll do it similarly.
    // What's happening here: whenever the user touches the screen and sends
    // data to the PIC, this code is executed (inside tsInData). We're keeping
    // track of our orange cursor's coordinates with ts_data.pic_x and
    // ts_data.pic_y. 

    ts_data.pic_x += ts_data.step_x;
    ts_data.pic_y += ts_data.step_y;

    // 10% chance we'll reverse direction (in either x or y).
    if (rand() % 10 == 0) {
        ts_data.step_x = -ts_data.step_x;
    }
    if (rand() % 10 == 0) {
        ts_data.step_y = -ts_data.step_y;
    }

    // Keep cursor coordinates between 0 and 1
    if (ts_data.pic_x < 0) {
        ts_data.pic_x += 1.0;
    } else if (ts_data.pic_x > 1) {
        ts_data.pic_x -= 1.0;
    }
    if (ts_data.pic_y < 0) {
        ts_data.pic_y += 1.0;
    } else if (ts_data.pic_y > 1) {
        ts_data.pic_y -= 1.0;
    }

    // Send coordinates to PIC
    sendOutData = TRUE;
}

// Get the maximum amplitude of the received waveform sample
// micOutData will comment on the loudness.
void micInData(ADB_CHANNEL_HANDLE handle, BYTE data[], int data_len)
{
    mic_data.max = intFromBytes(data);
    sendOutData = TRUE;
}

// Send back coordinates across the world
void gpsOutData(ADB_CHANNEL_HANDLE handle)
{
    // Data passed to ADBWrite must be valid until the next write
    // Making out_data static works but may not be the best solution
    static BYTE out_data[8];
    bytesFromFloat(gps_data.lat, out_data);
    bytesFromFloat(gps_data.lng, out_data+4);
    ADBWrite(handle & 0xff, out_data, 8);
}

// Write back inverted image data
void cameraOutData(ADB_CHANNEL_HANDLE handle)
{
    ADBWrite(handle & 0xff, camera_data.data, CAMERA_DATA_SIZE);
    NU32DebugMessage("Data sent.");
}

// Send the coordinates of the cursor we're controlling
void tsOutData(ADB_CHANNEL_HANDLE handle)
{
    static BYTE out_data[8];
    bytesFromFloat(ts_data.pic_x, out_data);
    bytesFromFloat(ts_data.pic_y, out_data+4);
    ADBWrite(handle & 0xff, out_data, 8);
}

// Comment on the loudness level sent by the Android device
void micOutData(ADB_CHANNEL_HANDLE handle)
{
    if (mic_data.max > 24575) {
        mic_data.mic_state = LOUDEST;
    } else if (mic_data.max > 16383) {
        mic_data.mic_state = LOUDER;
    } else if (mic_data.max > 8191) {
        mic_data.mic_state = LOUD;
    } else {
        mic_data.mic_state = QUIET;
    }

    if (mic_data.mic_state != mic_data.previous_state) {
        switch(mic_data.mic_state) {
            case QUIET:
                NU32DebugMessage("Wha?");
                ADBWrite(handle & 0xff, "Wha?", 5);
                break;
            case LOUD:
                NU32DebugMessage("I hear you");
                ADBWrite(handle & 0xff, "I hear you", 11);
                break;
            case LOUDER:
                NU32DebugMessage("Pretty loud");
                ADBWrite(handle & 0xff, "Pretty loud", 12);
                break;
            case LOUDEST:
                NU32DebugMessage("Ouch, my ears!");
                ADBWrite(handle & 0xff, "Ouch, my ears!", 15);
                break;
        }
    }

    mic_data.previous_state = mic_data.mic_state;
}

// Send a message to the LCD and to NU32_utility
// Warning: does not check if messages are too long 
void NU32DebugMessage(char message[])
{
    LCDClear(0);
    LCDWriteString(message, 1, 1);
    sprintf(NU32_RS232OutBuffer, "%s\n", message);
    NU32WriteUART1(NU32_RS232OutBuffer);
}

// Convert an array of four bytes to an IEEE 754 float
float floatFromBytes(BYTE in[]) {
    fConverter.array[0] = in[0];
    fConverter.array[1] = in[1];
    fConverter.array[2] = in[2];
    fConverter.array[3] = in[3];
    return fConverter.value;
}

// Convert an IEEE 754 float to an array of four bytes
void bytesFromFloat(float in, BYTE out[]) {
    fConverter.value = in;
    out[0] = fConverter.array[0];
    out[1] = fConverter.array[1];
    out[2] = fConverter.array[2];
    out[3] = fConverter.array[3];
}

// Convert an array of four bytes to an integer
int intFromBytes(BYTE in[]) {
    iConverter.array[0] = in[0];
    iConverter.array[1] = in[1];
    iConverter.array[2] = in[2];
    iConverter.array[3] = in[3];
    return iConverter.value;
}

// Convert an integer to an array of four bytes
void bytesFromInt(int in, BYTE out[]) {
    iConverter.value = in;
    out[0] = iConverter.array[0];
    out[1] = iConverter.array[1];
    out[2] = iConverter.array[2];
    out[3] = iConverter.array[3];
}

// Take a slice of a byte array
void arraySlice(BYTE target[], BYTE array[], int start, int end) {
    target = array + end - start;
}