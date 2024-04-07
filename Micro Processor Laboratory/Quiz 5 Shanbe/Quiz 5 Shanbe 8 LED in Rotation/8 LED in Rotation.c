#include <mega16.h>
#include <delay.h>

int i;
char LL[8]={0xfe,0xfd,0xfb,0xf7,0xef,0xdf,0xbf,0x7f};

void main(void)
{

PORTC=0xff;
DDRC=0xff;

while (1)
      {
      for(i=0;i<=7;i++){
        PORTC=LL[i];
        delay_ms(500);
      }

    }
}
