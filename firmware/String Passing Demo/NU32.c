#include <plib.h>
#include "NU32.h"

void InitializeNU32()
// Perform initial initialization
{
        SYSTEMConfig(SYS_FREQ, SYS_CFG_ALL);
	INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
	INTEnableSystemMultiVectoredInt();
	InitializeLEDs();
	InitializeSerialPort();
}

void InitializeLEDs()
// NU32USER is by default an input
// Make NU32LED1 and NU32LED2 pins outputs
{

	TRISACLR = 0x0030; // Make A5 and A4 outputs (L2 and L1 on the silkscreen)
	NU32LED1 = 1; // L1 is off
	NU32LED2 = 0; // L2 is on
}

void InitializeSerialPort()
// Initialize the serial port
// Note: the NU32 is hard wired to use UART1 for communication and UART4 for
// bootloading 
// This fn will turn on the UART4 interrupt on Rx
// Call NU32_EnableUART1Interrupt to turn on UART1 interrupt on Rx
{
	// turn on UART1 without an interrupt
	UARTConfigure(UART1, UART_ENABLE_PINS_TX_RX_ONLY);
	UARTSetFifoMode(UART1, UART_INTERRUPT_ON_TX_NOT_FULL | UART_INTERRUPT_ON_RX_NOT_EMPTY);
	UARTSetLineControl(UART1, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);
	UARTSetDataRate(UART1, SYS_FREQ, DESIRED_BAUDRATE_NU32);
	UARTEnable(UART1, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));

	// turn on UART4 with an interrupt
	UARTConfigure(UART4, UART_ENABLE_PINS_TX_RX_ONLY);
	UARTSetFifoMode(UART4, UART_INTERRUPT_ON_TX_DONE | UART_INTERRUPT_ON_RX_NOT_EMPTY);
	UARTSetLineControl(UART4, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);
	UARTSetDataRate(UART4, SYS_FREQ, DESIRED_BAUDRATE_NU32);
	UARTEnable(UART4, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));

	// Configure UART4 RX Interrupt
	INTEnable(INT_U4RX, INT_ENABLED);
	INTSetVectorPriority(INT_UART_4_VECTOR, INT_PRIORITY_LEVEL_3);
	INTSetVectorSubPriority(INT_UART_4_VECTOR, INT_SUB_PRIORITY_LEVEL_0);
}

void EnableUART1Interrupt(void)
// Enable UART1 interrupt, but don't use NU32_ReadUART1 anymore
{
	// turn off the module to change the settings
	UARTEnable(UART1, UART_ENABLE_FLAGS(UART_DISABLE));

	// Configure UART1 RX Interrupt
	UARTConfigure(UART1, UART_ENABLE_PINS_TX_RX_ONLY);
	UARTSetFifoMode(UART1, UART_INTERRUPT_ON_TX_DONE | UART_INTERRUPT_ON_RX_NOT_EMPTY);
	UARTSetLineControl(UART1, UART_DATA_SIZE_8_BITS | UART_PARITY_NONE | UART_STOP_BITS_1);
	UARTSetDataRate(UART1, SYS_FREQ, DESIRED_BAUDRATE_NU32);
	UARTEnable(UART1, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));
	INTEnable(INT_U1RX, INT_ENABLED);
	INTSetVectorPriority(INT_UART_1_VECTOR, INT_PRIORITY_LEVEL_2);
	INTSetVectorSubPriority(INT_UART_1_VECTOR, INT_SUB_PRIORITY_LEVEL_0);

	// Now you can use the following ISR in your .c file:
/*
// interrupt when the NU32 gets a character from the computer
void __ISR(_UART_1_VECTOR, ipl2) IntUart1Handler(void)
{
	// Is this an RX interrupt?
	if(INTGetFlag(INT_SOURCE_UART_RX(UART1)))
	{

		char data = UARTGetDataByte(UART1);

		// do something with the data, like echo it back
		// PutCharacter(UART1,data);

		// Clear the RX interrupt Flag
		INTClearFlag(INT_SOURCE_UART_RX(UART1));
	}

	// We don't care about TX interrupt
	if(INTGetFlag(INT_SOURCE_UART_TX(UART1)))
	{
		INTClearFlag(INT_SOURCE_UART_TX(UART1));
	}
}
*/
}

void NU32ReadUART1(char * message, int max)
// Read from UART1
// block other functions until you get a '\r' or '\n'
// send the pointer to your char array and the number of elements in the array
{
	char data;
	int complete = 0, num_bytes = 0;
	// loop until you get a '\r' or '\n'
	while (!complete) {
		if (UARTReceivedDataIsAvailable(UART1)) {
			data = UARTGetDataByte(UART1);
			if ((data == '\n') || (data == '\r')) {
				complete = 1;
			} else {
				message[num_bytes] = data;
				num_bytes++;
				// roll over if the array is too small
				if (num_bytes >= max) {
					num_bytes = 0;
				}
			}
		}
	}
	// clear the remaining elements in the array
	int i;
	for (i = num_bytes; i < max; i++) {
		message[i] = '\0';
	}
}

void WriteString(UART_MODULE id, const char *string)
// Write a string over the serial port
{
	while (*string != '\0') {
		while (!UARTTransmitterIsReady(id));
		UARTSendDataByte(id, (char) *string);
		string++;
		while (!UARTTransmissionHasCompleted(id));
	}
}

void NU32PutCharacter(UART_MODULE id, const char character)
// Put a character over the serial port, called by WriteString
{
	while (!UARTTransmitterIsReady(id));
	UARTSendDataByte(id, character);
	while (!UARTTransmissionHasCompleted(id));
}

void __ISR(_UART_4_VECTOR, ipl3) IntUart4Handler(void)
// do a software reset and go into bootloader mode if you get a 'B'
{
	// Is this an RX interrupt?
	if (INTGetFlag(INT_SOURCE_UART_RX(UART4))) {

		char data = UARTGetDataByte(UART4);

		NU32LED1 = !NU32LED1;
		NU32LED2 = !NU32LED2;

		if (data == 'B') {
			sprintf(NU32_RS232OutBuffer, "Switching to bootloader\r\n");
			WriteString(UART1, NU32_RS232OutBuffer);

			SoftReset();
		}

		// Clear the RX interrupt Flag
		INTClearFlag(INT_SOURCE_UART_RX(UART4));
	}

	// We don't care about TX interrupt
	if (INTGetFlag(INT_SOURCE_UART_TX(UART4))) {
		INTClearFlag(INT_SOURCE_UART_TX(UART4));
	}
}


