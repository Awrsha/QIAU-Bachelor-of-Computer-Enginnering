#include <mega16.h>
#include <delay.h>

// Declare your global variables here

void main(void) {

    PORTC = 0x00;
    DDRC = 0x0F;

    PORTA = 0x00;
    DDRA = 0x00;

    while (1) {
        if (PINA == 0x00)
            PORTC = 0x01;
        if (PINA == 0x01)
            PORTC = 0x02;
        if (PINA == 0x02)
            PORTC = 0x04;
        if (PINA == 0x03)
            PORTC = 0x08;
    }
}
