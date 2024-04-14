module DFF_4bit (
  input [3:0] D,    // 4-bit data input
  input clk,        // Clock input
  input rst,        // Reset input
  output reg [3:0] Q // 4-bit output
);

// Sequential logic for D flip-flop
always @(posedge clk or posedge rst) begin
  if (rst)            // Reset condition
    Q <= 4'b0000;     // Reset output to 0000
  else
    Q <= D;           // Update output with input D on clock edge
end

endmodule
