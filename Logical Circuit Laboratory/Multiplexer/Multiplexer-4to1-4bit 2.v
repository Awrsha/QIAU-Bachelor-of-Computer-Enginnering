
module Mux4to1(A0,A1,A2,A3,S1,S0,F);
  input A0,A1,A2,A3,S1,S0;
  output F;
  not (W0,S0);
  not (W1,S1);
  and (W2,W0,W1,A0);
  and (W3,W1,S0,A1);
  and (W4,S1,W0,A2);
  and (W5,S1,S0,A3);
  or (F,W2,W3,W4,W5);
endmodule


module mux4to1_4bit(I0,I1,I2,I3,S1,S0,f);
  input [3:0] I0,I1,I2,I3;
  input S0,S1;
  output [3:0] f;
    
  Mux4to1 mux0(.A3(I3[0]),.A2(I2[0]),.A1(I1[0]),.A0(I0[0]),.S0(S0),.S1(S1),.F(f[0]));
  Mux4to1 mux1(.A3(I3[1]),.A2(I2[1]),.A1(I1[1]),.A0(I0[1]),.S0(S0),.S1(S1),.F(f[1]));
  Mux4to1 mux2(.A3(I3[2]),.A2(I2[2]),.A1(I1[2]),.A0(I0[2]),.S0(S0),.S1(S1),.F(f[2]));
  Mux4to1 mux3(.A3(I3[3]),.A2(I2[3]),.A1(I1[3]),.A0(I0[3]),.S0(S0),.S1(S1),.F(f[3]));
endmodule


 
 

  