#include <mega16.h>
#include <delay.h>

// Declare your global variables here

void main(void)
{

PORTC=0x00;
DDRC=0xFF;

PORTD=0x00;
DDRD=0x01;

while (1)
      {
      PORTC=0x07;
      PORTD=0x00;
      delay_ms(100);
      PORTC=0x64;
      PORTD=0x00;
      delay_ms(100);
      PORTC=0x1c;
      PORTD=0x00;
      delay_ms(100);
      PORTC=0x84;
      PORTD=0x01;
      delay_ms(100);

      }
}

