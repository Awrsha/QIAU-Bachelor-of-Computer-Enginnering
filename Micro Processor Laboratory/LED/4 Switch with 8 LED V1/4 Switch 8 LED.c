#include <mega16.h>
#include <delay.h>

void main(void) {
    unsigned char switchValue; 

    DDRC = 0xFF; 
    PORTA = 0x00;
    DDRA = 0x00; 

    while (1) {
        switchValue = PINA & 0x0F; 
        
        switch (switchValue) {
            case 0x01:
                PORTC = 0x01;
                break;
            case 0x02:
                PORTC = 0x02;
                break;
            case 0x03:
                PORTC = 0x04;
                break;
            case 0x04:
                PORTC = 0x08;
                break;
            case 0x05:
                PORTC = 0x10;
                break;
            case 0x06:
                PORTC = 0x20;
                break;
            case 0x07:
                PORTC = 0x40;
                break;
            case 0x08:
                PORTC = 0x80;
                break;
            case 0x09:
                PORTC = 0x03;
                break;
            case 0x0A:
                PORTC = 0x0C;
                break;
            case 0x0B:
                PORTC = 0x30;
                break;
            case 0x0C:
                PORTC = 0xC0;
                break;
            case 0x0D:
                PORTC = 0x0F;
                break;
            case 0x0E:
                PORTC = 0xF0;
                break;
            case 0x0F:
                PORTC = 0xFF;
                break;
            default:
                PORTC = 0x00;
                break;
        }
    }
}
