#include <mega16.h>
#include <delay.h>

int mainLED = 0;
int i;

void main(void) {
    PORTC = 0x00;
    DDRC = 0xFF;

    while (1) {
        for (i = 0; i < 8; i++) {
            if (i == mainLED) {
                PORTC |= (1 << i);
            } else {
                PORTC &= ~(1 << i);
            }
            delay_ms(100);
        }
        mainLED++;
        if (mainLED >= 8) {
            mainLED = 0;
            for (i = 0; i < 8; i++) {
                PORTC &= ~(1 << i);
            }
            delay_ms(500); 
        }
    }
}
