/*******************************************************
This program was created by the
CodeWizardAVR V3.14 Advanced
Automatic Program Generator
© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
Version : 
Date    : 11/20/2023
Author  : 
Company : 
Comments: 


Chip type               : ATmega16
Program type            : Application
AVR Core Clock frequency: 8.001000 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 256
*******************************************************/

#include <mega16.h>
#include <delay.h>


char ss[10] = {0x3f , 0x06 , 0x5b , 0x4f , 0x66 , 0x6d , 0x7d , 0x07 , 0x7f , 0x6f};
//int i,j;

void main(void)
{
PORTC = 0x00;
DDRC = 0xff;

PORTD = 0xff;
DDRD = 0xff;

PORTA = 0x00;
DDRA = 0x00;


while (1)
      {
      if(PINA == 0x00 )
      {
      PORTC = ss[0];
      PORTD = ~ss[0];
      }
      if(PINA == 0x01 )
      {
      PORTC = ss[0];
      PORTD = ~ss[1];
      }
      if(PINA == 0x02 )
      {
      PORTC = ss[0];
      PORTD = ~ss[2];
      }
      if(PINA == 0x03 )
      {
      PORTC = ss[0];
      PORTD = ~ss[3];
      }
       if(PINA == 0x04 )
      {
      PORTC = ss[0];
      PORTD = ~ss[4];
      }
        if(PINA == 0x05 )
      {
      PORTC = ss[0];
      PORTD = ~ss[5];
      }
       if(PINA == 0x06 )
      {
      PORTC = ss[0];
      PORTD = ~ss[6];
      }
       if(PINA == 0x07 )
      {
      PORTC = ss[0];
      PORTD = ~ss[7];
      }
       if(PINA == 0x08 )
      {
      PORTC = ss[0];
      PORTD = ~ss[8];
      }
       if(PINA == 0x09 )
      {
      PORTC = ss[0];
      PORTD = ~ss[9];
      }
       if(PINA == 0x0a )
      {
      PORTC = ss[1];
      PORTD = ~ss[0];
      }
       if(PINA == 0x0b )
      {
      PORTC = ss[1];
      PORTD = ~ss[1];
      }
       if(PINA == 0x0c )
      {
      PORTC = ss[1];
      PORTD = ~ss[2];
      }
       if(PINA == 0x0d )
      {
      PORTC = ss[1];
      PORTD = ~ss[3];
      }
       if(PINA == 0x0e )
      {
      PORTC = ss[1];
      PORTD = ~ss[4];
      }
       if(PINA == 0x0f )
      {
      PORTC = ss[1];
      PORTD = ~ss[6];
      }
      
      //for (i=0 ; i<10 ; i++)
      //{
      //  for( j=0 ; j<10 ; j++)
      //  {
        //PORTC = ss[i];
        //PORTD = ~ss[j];
        //delay_ms(500);
      //  }
      //}
      //PORTC = ss[i];
      //delay_ms(500);
      //i++;
      //if(i>9)
      //i = 0;
      }
}