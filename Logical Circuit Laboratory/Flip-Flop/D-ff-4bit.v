module DFF_4bit (D, clk, rst, Q);
  input [3:0] D;   // 4-bit data input
  input clk, rst;
  output reg [3:0] Q;   // 4-bit output

  always @(posedge clk or posedge rst)
    if (rst == 1)
      Q <= 4'b0000;
    else
      Q <= D;
endmodule
