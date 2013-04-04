#ifndef __NU32_H
#define __NU32_H

#define SYS_FREQ 80000000
#define DESIRED_BAUDRATE_NU32 115200 // Baudrate for RS232

#define NU32LED1 LATAbits.LATA4
#define NU32LED2 LATAbits.LATA5
#define NU32USER PORTCbits.RC13

// Initialization routines
void StartNU32();
void InitializeNU32();
void InitializeLEDs();

// RS232 Functions
void InitializeSerialPort();
void EnableUART1Interrupt();
void NU32ReadUART1(char*,int);
#define NU32WriteUART1(string) WriteString(UART1, string)
void WriteString(UART_MODULE id, const char *string);
void PutCharacter(UART_MODULE id, const char character);

// Buffers
char NU32_RS232OutBuffer[32];  // Buffer for sprintf in serial communication

#endif // __NU32_H

