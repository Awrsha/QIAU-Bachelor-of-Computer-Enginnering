module Full_Adder(x, y, cin, cout, sum);
  input x, y, cin;
  output cout, sum;
  wire w1, w2, w3;
  
  // Define intermediate wires for each AND gate output
  and (w1, x, y);
  and (w2, x, cin);
  and (w3, y, cin);
  
  // Generate sum and carry-out using intermediate wires
  or (cout, w1, w2, w3);
  xor (sum, x, y, cin);
endmodule

module Full_Adder_8bit (x, y, cin, cout, sum);
  input cin;
  input [7:0] x, y;
  output cout;
  output [7:0] sum;
  wire c0, c1, c2, c3, c4, c5, c6;
  
  // Instantiate 8-bit full adders and chain carry-out
  Full_Adder bit0(.x(x[0]), .y(y[0]), .cin(cin), .cout(c0), .sum(sum[0]));
  Full_Adder bit1(.x(x[1]), .y(y[1]), .cin(c0), .cout(c1), .sum(sum[1]));
  Full_Adder bit2(.x(x[2]), .y(y[2]), .cin(c1), .cout(c2), .sum(sum[2]));
  Full_Adder bit3(.x(x[3]), .y(y[3]), .cin(c2), .cout(c3), .sum(sum[3]));
  Full_Adder bit4(.x(x[4]), .y(y[4]), .cin(c3), .cout(c4), .sum(sum[4]));
  Full_Adder bit5(.x(x[5]), .y(y[5]), .cin(c4), .cout(c5), .sum(sum[5]));
  Full_Adder bit6(.x(x[6]), .y(y[6]), .cin(c5), .cout(c6), .sum(sum[6]));
  Full_Adder bit7(.x(x[7]), .y(y[7]), .cin(c6), .cout(cout), .sum(sum[7]));
endmodule 

module mux2x1(i0, i1, s, f);
  input i0, i1, s;
  output f;
  wire w0, w1, w2;
  
  // Implement 2x1 multiplexer using AND, NOT, and OR gates
  not (w0, s);
  and (w1, i0, w0);
  and (w2, i1, s);
  or (f, w1, w2);
endmodule

module mux4x1(i0, i1, i2, i3, s0, s1, f);
  input i0, i1, i2, i3, s0, s1;
  output f;
  wire w0, w1;
  
  // Implement 4x1 multiplexer using 2x1 multiplexers
  mux2x1 mux0(.i0(i0), .i1(i1), .s(s0), .f(w0));
  mux2x1 mux1(.i0(i2), .i1(i3), .s(s0), .f(w1));
  mux2x1 mux3(.i0(w0), .i1(w1), .s(s1), .f(f));
endmodule

module mux8x1(i0, i1, i2, i3, i4, i5, i6, i7, s0, s1, s2, f);
  input i0, i1, i2, i3, i4, i5, i6, i7, s0, s1, s2;
  output f;
  wire w0, w1;
  
  // Implement 8x1 multiplexer using 4x1 multiplexers
  mux4x1 mux0(.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1), .f(w0));
  mux4x1 mux1(.i0(i4), .i1(i5), .i2(i6), .i3(i7), .s0(s0), .s1(s1), .f(w1));
  mux2x1 mux2(.i0(w0), .i1(w1), .s(s2), .f(f));
endmodule

module mux8x1_8bit(i0, i1, i2, i3, i4, i5, i6, i7, s0, s1, s2, f);
  input [7:0] i0, i1, i2, i3, i4, i5, i6, i7;
  input s0, s1, s2;
  output [7:0] f;
  
  // Implement 8x1 multiplexer for 8-bit inputs
  mux8x1 mux0(.i0(i0[0]), .i1(i1[0]), .i2(i2[0]), .i3(i3[0]), .i4(i4[0]), .i5(i5[0]), .i6(i6[0]), .i7(i7[0]), .s0(s0), .s1(s1), .s2(s2), .f(f[0]));
  mux8x1 mux1(.i0(i0[1]), .i1(i1[1]), .i2(i2[1]), .i3(i3[1]), .i4(i4[1]), .i5(i5[1]), .i6(i6[1]), .i7(i7[1]), .s0(s0), .s1(s1), .s2(s2), .f(f[1]));
  mux8x1 mux2(.i0(i0[2]), .i1(i1[2]), .i2(i2[2]), .i3(i3[2]), .i4(i4[2]), .i5(i5[2]), .i6(i6[2]), .i7(i7[2]), .s0(s0), .s1(s1), .s2(s2), .f(f[2]));
  mux8x1 mux3(.i0(i0[3]), .i1(i1[3]), .i2(i2[3]), .i3(i3[3]), .i4(i4[3]), .i5(i5[3]), .i6(i6[3]), .i7(i7[3]), .s0(s0), .s1(s1), .s2(s2), .f(f[3]));
  mux8x1 mux4(.i0(i0[4]), .i1(i1[4]), .i2(i2[4]), .i3(i3[4]), .i4(i4[4]), .i5(i5[4]), .i6(i6[4]), .i7(i7[4]), .s0(s0), .s1(s1), .s2(s2), .f(f[4]));
  mux8x1 mux5(.i0(i0[5]), .i1(i1[5]), .i2(i2[5]), .i3(i3[5]), .i4(i4[5]), .i5(i5[5]), .i6(i6[5]), .i7(i7[5]), .s0(s0), .s1(s1), .s2(s2), .f(f[5]));
  mux8x1 mux6(.i0(i0[6]), .i1(i1[6]), .i2(i2[6]), .i3(i3[6]), .i4(i4[6]), .i5(i5[6]), .i6(i6[6]), .i7(i7[6]), .s0(s0), .s1(s1), .s2(s2), .f(f[6]));
  mux8x1 mux7(.i0(i0[7]), .i1(i1[7]), .i2(i2[7]), .i3(i3[7]), .i4(i4[7]), .i5(i5[7]), .i6(i6[7]), .i7(i7[7]), .s0(s0), .s1(s1), .s2(s2), .f(f[7]));
endmodule

module au(x, y, s0, s1, cin, cout, f);
  input [7:0] x, y;
  input s0, s1, cin;
  output [7:0] f;
  output cout;
  wire [7:0] notY, w1, w2, w3, w4, w5, w6;
  wire cout1, cout2, cout3, cout4, cout5, cout6;
  
  // Generate inverted y
  assign notY = ~y;
  
  // Instantiate full adders and multiplexers
  Full_Adder_8bit full0(.x(x), .y(8'b00000001), .cin(1'b0), .cout(cout1), .sum(w1));
  Full_Adder_8bit full1(.x(x), .y(y), .cin(1'b0), .cout(cout2), .sum(w2));
  Full_Adder_8bit full2(.x(x), .y(y), .cin(1'b1), .cout(cout3), .sum(w3));
  Full_Adder_8bit full3(.x(x), .y(notY), .cin(1'b1), .cout(cout4), .sum(w4));
  Full_Adder_8bit full4(.x(x), .y(notY), .cin(1'b0), .cout(cout5), .sum(w5));
  Full_Adder_8bit full5(.x(x), .y(8'b11111110), .cin(1'b1), .cout(cout6), .sum(w6));
  
  mux8x1_8bit muxF(.i0(x), .i1(w1), .i2(w2), .i3(w3), .i4(w4), .i5(w5), .i6(w6), .i7(y), .s0(cin), .s1(s0), .s2(s1), .f(f));
  mux8x1 muxF1(.i0(1'b0), .i1(cout1), .i2(cout2), .i3(cout3), .i4(cout4), .i5(cout5), .i6(cout6), .i7(1'b0), .s0(s0), .s1(s1), .s2(cin), .f(cout));
endmodule

module test;
  reg [7:0] x, y;
  reg s0, s1, cin;
  wire cout;
  wire [7:0] f;
  
  // Instantiate the AU module for testing
  au au(.x(x), .y(y), .s0(s0), .s1(s1), .cin(cin), .cout(cout), .f(f));
  
  // Initialize inputs and control signals, and monitor outputs
  initial begin
    $monitor("x= %b , y= %b , s0= %b ,s1= %b, cin= %b | cout= %b , f=>%b", x, y, s0, s1, cin, cout, f);
    x = 8'b00001010; y = 8'b00001000;
    s0 = 1'b0; s1 = 1'b0; cin = 1'b0;
    #5
    s0 = 1'b0; s1 = 1'b0; cin = 1'b1;
    #5
    s0 = 1'b1; s1 = 1'b0; cin = 1'b0;
    #5
    s0 = 1'b1; s1 = 1'b0; cin = 1'b1;
    #5
    s0 = 1'b0; s1 = 1'b1; cin = 1'b0;
    #5
    s0 = 1'b0; s1 = 1'b1; cin = 1'b1;
    #5
    s0 = 1'b1; s1 = 1'b1; cin = 1'b0;
    #5
    s0 = 1'b1; s1 = 1'b1; cin = 1'b1;     
  end
endmodule