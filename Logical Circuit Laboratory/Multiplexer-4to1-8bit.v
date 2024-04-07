module Mux4to1(A0,A1,A2,A3,S1,S0,F);
  input A0,A1,A2,A3,S1,S0;
  output F;
  wire w0,w1,w2,w3,w4,w5;
  not (W0,S0);
  not (W1,S1);
  and (W2,W0,W1,A0);
  and (W3,W1,S0,A1);
  and (W4,S1,W0,A2);
  and (W5,S1,S0,A3);
  or (F,W2,W3,W4,W5);
endmodule

module mux4to1_8bit(I0,I1,I2,I3,S1,S0,f);
  input [7:0] I0,I1,I2,I3;
  input S0,S1;
  output [7:0] f;
    
  Mux4to1 mux0(.A3(I3[0]),.A2(I2[0]),.A1(I1[0]),.A0(I0[0]),.S0(S0),.S1(S1),.F(f[0]));
  Mux4to1 mux1(.A3(I3[1]),.A2(I2[1]),.A1(I1[1]),.A0(I0[1]),.S0(S0),.S1(S1),.F(f[1]));
  Mux4to1 mux2(.A3(I3[2]),.A2(I2[2]),.A1(I1[2]),.A0(I0[2]),.S0(S0),.S1(S1),.F(f[2]));
  Mux4to1 mux3(.A3(I3[3]),.A2(I2[3]),.A1(I1[3]),.A0(I0[3]),.S0(S0),.S1(S1),.F(f[3]));
  Mux4to1 mux4(.A3(I3[4]),.A2(I2[4]),.A1(I1[4]),.A0(I0[4]),.S0(S0),.S1(S1),.F(f[4]));
  Mux4to1 mux5(.A3(I3[5]),.A2(I2[5]),.A1(I1[5]),.A0(I0[5]),.S0(S0),.S1(S1),.F(f[5]));
  Mux4to1 mux6(.A3(I3[6]),.A2(I2[6]),.A1(I1[6]),.A0(I0[6]),.S0(S0),.S1(S1),.F(f[6]));
  Mux4to1 mux7(.A3(I3[7]),.A2(I2[7]),.A1(I1[7]),.A0(I0[7]),.S0(S0),.S1(S1),.F(f[7]));
  
endmodule
//_____________________________________testmodule_______________________________________________//


module test_mux4_1_8bit ;
  reg[7:0]t0,t1,t2,t3 ;
  reg ts0,ts1;
  wire[7:0]tf;
  
  mux4to1_8bit mux(.I0(t0),.I1(t1),.I2(t2),.I3(t3),.S1(ts1),.S0(ts0),.f(tf));
  initial begin


  t0=8'b01010101 ; t1=8'b00001111; t2=8'b11110000 ; t3=8'b1111111; ts0=1'b0; ts1=1'b0; 
  #20 
  
  t0=8'b01010101 ; t1=8'b00001111; t2=8'b11110000 ; t3=8'b1111111; ts0=1'b0; ts1=1'b1; 
  #20 
  
  t0=8'b01010101 ; t1=8'b00001111; t2=8'b11110000 ; t3=8'b1111111; ts0=1'b1; ts1=1'b0; 
  #20 
  
  t0=8'b01010101 ; t1=8'b00001111; t2=8'b11110000 ; t3=8'b1111111; ts0=1'b1; ts1=1'b1; 
  
end 
endmodule 
  
  
  