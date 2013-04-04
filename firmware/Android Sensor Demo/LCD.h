#ifndef LCD_H
#define LCD_H

// Buffer for sprintf in LCD communication
char LCDOutBuffer[16];
typedef unsigned char BYTE;

// ==============
// User functions
// ==============

// Initialize the LCD.
void InitializeLCD();

// Write a string to the LCD starting at this position.
// Row and column numbering starts at 1
void LCDWriteString(char* str, int row, int col);

// Clears the designated line in the LCD.
// 0 clears both lines.
void LCDClear(int line);


// =================
// Internal routines
// =================

void LCDCommand(int control, BYTE data);
void Wait();
#define LCDWriteChar(c) LCDCommand(1, c)

#endif