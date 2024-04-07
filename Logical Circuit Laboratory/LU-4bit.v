
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

module logic_unit(x,y,s0,s1,f);
  input [3:0] x,y;
  input s0,s1;
  output[3:0]f;
  wire[3:0] w0,w1,w2,w3;
  
  and(w0[0], x[0],y[0]);
  and(w0[1], x[1],y[1]);
  and(w0[2], x[2],y[2]);
  and(w0[3], x[3],y[3]);

  
  or(w1[0], x[0],y[0]);
  or(w1[1], x[1],y[1]);
  or(w1[2], x[2],y[2]);
  or(w1[3], x[3],y[3]);

  
  
  xor(w2[0], x[0],y[0]);
  xor(w2[1], x[1],y[1]);
  xor(w2[2], x[2],y[2]);
  xor(w2[3], x[3],y[3]);

  
  not(w3[0],x[0]);
  not(w3[1],x[1]);
  not(w3[2],x[2]);
  not(w3[3],x[3]);

  
  mux4to1_4bit mx(.I0(w0),.I1(w1),.I2(w2),.I3(w3),.S1(s1),.S0(s0),.f(f));
  
endmodule

module test_logic_unit();
  reg[3:0]tx,ty;
  reg ts0,ts1;
  wire[3:0]tf;
  
 logic_unit L(.x(tx),.y(ty),.s1(ts1),.s0(ts0),.f(tf));
 
 initial begin
 tx=4'b1011; ty=4'b1100; ts0=1'b0; ts1=1'b0;
 #20
 tx=4'b1011; ty=4'b1100; ts0=1'b0; ts1=1'b1;
 #20
 tx=4'b1011; ty=4'b1100; ts0=1'b1; ts1=1'b0;
 #20
 tx=4'b1011;  ts0=1'b1; ts1=1'b1;
 end
endmodule
 
 

  