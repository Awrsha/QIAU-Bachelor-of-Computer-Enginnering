#include <mega16.h>
#include <delay.h>

int mainLED = 7;
int i;

void main(void) {
    PORTC = 0x00;
    DDRC = 0xFF;

    while (1) {
        for (i = 7; i >= 0; i--) { 
            if (i == mainLED) {
                PORTC |= (1 << i);
            } else {
                PORTC &= ~(1 << i);
            }
            delay_ms(200);
        }
        mainLED--;
        if (mainLED < 0) {
            mainLED = 7; 
            for (i = 0; i <= 7; i++) {
                PORTC &= ~(1 << i);
            }
            delay_ms(500);
        } 
    }
}
