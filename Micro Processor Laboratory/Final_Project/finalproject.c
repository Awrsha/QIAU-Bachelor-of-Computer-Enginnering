/*******************************************************
This program was created by the
CodeWizardAVR V3.12 Advanced
Automatic Program Generator
© Copyright 1998-2014 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
Version : 
Date    : 1/7/2023
Author  : 
Company : 
Comments: 


Chip type               : ATmega16
Program type            : Application
AVR Core Clock frequency: 8.000000 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 256
*******************************************************/

#include <mega16.h>
#include <delay.h>
#include <alcd.h>
#include <stdio.h>

char ll[16];
char seg[10]={0X3F,0X06,0X5B,0X4F,0X66,0X6D,0X7D,0X07,0XFF,0XEF};
int i=0 , j=0 , a , b , c=1 , s=1 , second=0;

// External Interrupt 2 service routine
interrupt [EXT_INT2] void ext_int2_isr(void)
{
    if(PORTB.3==1)
    {
     delay_ms(2000);
    }
    
    if(PORTB.3==0)
    {
     delay_ms(2000);
    }
    
}

void main(void)
{

DDRA=0XFF;
PORTA=0X00;

DDRB=0xFF;
PORTB=0x00;

DDRC=0X7F;
PORTC=0X7F;

DDRD=0XFF;
PORTD=0X00;

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: Timer 0 Stopped
// Mode: Normal top=0xFF
// OC0 output: Disconnected
TCCR0=(0<<WGM00) | (0<<COM01) | (0<<COM00) | (0<<WGM01) | (0<<CS02) | (0<<CS01) | (0<<CS00);
TCNT0=0x00;
OCR0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: Timer1 Stopped
// Mode: Normal top=0xFFFF
// OC1A output: Disconnected
// OC1B output: Disconnected
// Noise Canceler: Off
// Input Capture on Falling Edge
// Timer1 Overflow Interrupt: Off
// Input Capture Interrupt: Off
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
TCCR1A=(0<<COM1A1) | (0<<COM1A0) | (0<<COM1B1) | (0<<COM1B0) | (0<<WGM11) | (0<<WGM10);
TCCR1B=(0<<ICNC1) | (0<<ICES1) | (0<<WGM13) | (0<<WGM12) | (0<<CS12) | (0<<CS11) | (0<<CS10);
TCNT1H=0x00;
TCNT1L=0x00;
ICR1H=0x00;
ICR1L=0x00;
OCR1AH=0x00;
OCR1AL=0x00;
OCR1BH=0x00;
OCR1BL=0x00;

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer2 Stopped
// Mode: Normal top=0xFF
// OC2 output: Disconnected
ASSR=0<<AS2;
TCCR2=(0<<PWM2) | (0<<COM21) | (0<<COM20) | (0<<CTC2) | (0<<CS22) | (0<<CS21) | (0<<CS20);
TCNT2=0x00;
OCR2=0x00;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK=(0<<OCIE2) | (0<<TOIE2) | (0<<TICIE1) | (0<<OCIE1A) | (0<<OCIE1B) | (0<<TOIE1) | (0<<OCIE0) | (0<<TOIE0);

// External Interrupt(s) initialization
// INT0: Off
// INT1: Off
// INT2: On
// INT2 Mode: Falling Edge
GICR|=(0<<INT1) | (0<<INT0) | (1<<INT2);
MCUCR=(0<<ISC11) | (0<<ISC10) | (0<<ISC01) | (0<<ISC00);
MCUCSR=(0<<ISC2);
GIFR=(0<<INTF1) | (0<<INTF0) | (1<<INTF2);

// USART initialization
// USART disabled
UCSRB=(0<<RXCIE) | (0<<TXCIE) | (0<<UDRIE) | (0<<RXEN) | (0<<TXEN) | (0<<UCSZ2) | (0<<RXB8) | (0<<TXB8);

// Analog Comparator initialization
// Analog Comparator: Off
// The Analog Comparator's positive input is
// connected to the AIN0 pin
// The Analog Comparator's negative input is
// connected to the AIN1 pin
ACSR=(1<<ACD) | (0<<ACBG) | (0<<ACO) | (0<<ACI) | (0<<ACIE) | (0<<ACIC) | (0<<ACIS1) | (0<<ACIS0);
SFIOR=(0<<ACME);

// ADC initialization
// ADC disabled
ADCSRA=(0<<ADEN) | (0<<ADSC) | (0<<ADATE) | (0<<ADIF) | (0<<ADIE) | (0<<ADPS2) | (0<<ADPS1) | (0<<ADPS0);

// SPI initialization
// SPI disabled
SPCR=(0<<SPIE) | (0<<SPE) | (0<<DORD) | (0<<MSTR) | (0<<CPOL) | (0<<CPHA) | (0<<SPR1) | (0<<SPR0);

// TWI initialization
// TWI disabled
TWCR=(0<<TWEA) | (0<<TWSTA) | (0<<TWSTO) | (0<<TWEN) | (0<<TWIE);

// Alphanumeric LCD initialization
// Connections are specified in the
// Project|Configure|C Compiler|Libraries|Alphanumeric LCD menu:
// RS - PORTB Bit 0
// RD - PORTB Bit 1
// EN - PORTB Bit 2
// D4 - PORTB Bit 4
// D5 - PORTB Bit 5
// D6 - PORTB Bit 6
// D7 - PORTB Bit 7
// Characters/line: 16
lcd_init(16);

// Global enable interrupts
#asm("sei")

while (1)
      {
      
      // ---------(*)-----------  
         if(PINA.7==0 && PINA.6==0)
          {    
               // ---------(Part1 run)-----------
               PORTC=~seg[a];
               PORTD=seg[b];  
               if(PINC.7==1 && c==1)
               {  
               b++;
               c=0;
               }
           
               if(PINC.7==0)
               {  
               c=1;
               }
               
               if(b==10)
               {  
               b=0;
               a++;
               } 
               
               if(a==2 && b==1)
               {  
               a=0;
               b=0;
               s=1;
               second=s;
               } 
                
               // ---------(Part1 run so this code run)-----------
               if(PIND.7==1 && second)
               {
                   for(j=0; j<2; j++)
                   {
                     for(i=0; i<10; i++)
                     {  
                       PORTD=seg[i];
                       PORTC=~seg[j];
                       delay_ms(500);  
                     }
                   } 
               }       
                                             
          } 
          
          // ---------(*)-----------        
          if(PINA.6==1 && PINA.7==1)
          {            
          PORTB=0X08;
          delay_ms(1000);       
          PORTB=0X00;
          delay_ms(1000);      
          } 
          
          // ---------(*)-----------  
          if(PINA.6==1 && PINA.7==0)
          {            
          PORTA=0X21;
          delay_ms(2000);       
          PORTA=0X12;
          delay_ms(2000);  
          PORTA=0X0c;
          delay_ms(2000);
          PORTA=0X12;
          delay_ms(2000);      
          } 
           
          // ---------(*)-----------  
          if(PINA.7==1 && PINA.6==0)
          {   
          PORTB=0X80;
          delay_ms(500);
          PORTB=0X00;
          delay_ms(500);
          
          
          sprintf(ll,"Time : %2d :%d",j,i);
          lcd_gotoxy(2,0);
          lcd_puts(ll);
           
          if(PINA.7==1)
          {
              delay_ms(500);   
              i++;
          }  
          
          if(i==10)
          {   
              i=0; 
              j++;
          }       
           
          if(j==60)
          {  
              j=0;
              if(i>60)       
              j=0; 
          } 
          
          if(PINA.7==0)
          {
              i=0;   
              j=0;
          }
             
              
          }
          
          // ---------(*)-----------   
          if(PINA.6==0 || PINA.7==0)  
          {
           PORTA=0X00;
          }
         
         
         
         
         
      }
}
