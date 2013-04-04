// TODO: Determine if this library has external effects
// (because LATE8 and LATE9 are included in LATESET and LATECLR)

#include <plib.h>
#include "LCD.h"
#include "NU32.h"

#define RS LATGbits.LATG12
#define RW LATGbits.LATG13
#define EN LATGbits.LATG15

void InitializeLCD()
{
    // Register pins
    TRISGbits.TRISG12 = 0;
    TRISGbits.TRISG13 = 0;
    TRISGbits.TRISG15 = 0;

    // Data pins
    TRISECLR = 0xff;
    
    // Wait 20 ns
    Wait();
    EN = 0;

    LCDCommand(0, 0b00111000); // Initialize 2 lines
    LCDCommand(0, 0b00000001); // Clear screen
    LCDCommand(0, 0b00000110); // Cursor moves right
    LCDCommand(0, 0b00001100); // Restore screen
}

void LCDWriteString(char *str, int row, int col)
{
    LCDCommand(0, 0x80 + (--row << 6) + --col);

    while(*str)
        LCDWriteChar(*(str++));
}

void LCDClear(int line)
{
    switch(line)
    {
        case 1:
            LCDWriteString("                ", 1, 1);
            break;
        case 2:
            LCDWriteString("                ", 2, 1);
            break;
        default:
            LCDCommand(0, 0b00000001);
    }
}

void LCDCommand(int control, BYTE data)
{
    RS = control;
    LATESET = data;
    LATECLR = data ^ 0xff;

    EN = 1;
    Wait();
    EN = 0;
    Wait();
}

void Wait()
{
    int i;
    for (i = 0; i < 10000; i++) {
        // do nothing
    }
}