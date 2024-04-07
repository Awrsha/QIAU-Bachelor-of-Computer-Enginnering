#include <mega16.h>
#include <delay.h>

// Declare your global variables here
unsigned char buttonState = 0; // Variable to track button state

void main(void)
{
    PORTC = 0x00;
    DDRC = 0x01;

    PORTA = 0x00;
    DDRA = 0x00;

    while (1)
    {
        if (PINA.0 == 1 && buttonState == 0) // Check if button is pressed and buttonState is 0
        {
            buttonState = 1; // Set buttonState to 1
            PORTC.0 = !PORTC.0; // Toggle the LED
            while (PINA.0 == 1); // Wait for button release
        }
        else if (PINA.0 == 0) // Check if button is not pressed
        {
            buttonState = 0; // Reset buttonState
        }
    }
}