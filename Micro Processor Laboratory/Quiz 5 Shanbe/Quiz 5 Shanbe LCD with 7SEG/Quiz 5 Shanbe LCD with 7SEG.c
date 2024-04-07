#include <mega16.h>
#include <stdio.h>
#include <alcd.h>

int i=0, j=1;

char ss[16];

void main(void)
{

PORTA=0x00;
DDRA=0xFF;

PORTB=0x00;
DDRB=0x00;

PORTC=0x00;
DDRC=0x00;

PORTD=0x00;
DDRD=0x00;

lcd_init(16);

while (1)
      {
      sprintf(ss, "Mojtaba:%d",i);
      lcd_gotoxy(0,0);
      lcd_puts(ss);
      if(PIND.0==1 && j==1)
      {
        i=i+2;
        j=0;
      }
      if(i>20)
      {
        i=0;
        lcd_clear();
      }
      if(i<10)
        PORTA = 0x3F;
      if(i>=10)
        PORTA = 0x06;
    }
}
