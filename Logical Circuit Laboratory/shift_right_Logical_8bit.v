module shift_right_Logical_8bit(x,f,cout);
  input [7:0]x;
  output cout;
  output [7:0]f;
  buf(f[0],x[1]);
  buf(f[1],x[2]);
  buf(f[2],x[3]);
  buf(f[3],x[4]);
  buf(f[4],x[5]);
  buf(f[5],x[6]);
  buf(f[6],x[7]); 
  buf(f[7],0); 
  buf(cout,x[0]);
  endmodule

module test_shift_right_Logical_8bit;
  reg [7:0]a;
  wire [7:0]f;
  wire cout1;
  shift_right_Logical_8bit sr(.x(a) , .f(f), .cout(cout1));
  initial begin
    
          
a=8'b11111101;
    #20
a=8'b10001110;
    #20
a=8'b11001101;  
   #20
a=8'b10001111;
    
  end
endmodule