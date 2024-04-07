#include <mega16.h>
#include <delay.h>

void main(void) {

PORTC=0xFF;
DDRC=0xFF;

while (1)
      {
      PORTC=0xFF;
      delay_ms(500);
      
      PORTC=0x00;
      delay_ms(500);

      }
}
