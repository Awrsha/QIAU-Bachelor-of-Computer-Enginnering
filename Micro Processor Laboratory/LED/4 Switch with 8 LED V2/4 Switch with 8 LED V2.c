#include <mega16.h>

void main(void)
{

DDRA=0xFF;
PORTA=0x00;

DDRC=0x00;
PORTC=0x00;

while (1)
      {
      if(PINC==0x00)
        PORTA=0x00;
      if(PINC==0x01)
        PORTA=0x01;
      if(PINC==0x02)
        PORTA=0x03;
      if(PINC==0x03)
        PORTA=0x07;
      if(PINC==0x04)
        PORTA=0x0F;
      if(PINC==0x05)
        PORTA=0x1F;
      if(PINC==0x06)
        PORTA=0x3F;
      if(PINC==0x07)
        PORTA=0x7F;
      if(PINC==0x08)
        PORTA=0xFF;
      }
}
