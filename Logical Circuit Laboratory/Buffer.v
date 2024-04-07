module buff(x,f,cout);
  input [7:0] x;
  output [7:0] f;
  output cout;
  buf(f[0],0);
  buf(f[1],x[0]);
  buf(f[2],x[1]);
  buf(f[3],x[2]);
  buf(f[4],x[3]);
  buf(f[5],x[4]);
  buf(f[6],x[5]);
  buf(f[7],x[6]);
  buf(cout,x[7]);
endmodule

module test_buff();
    reg [7:0] _x;
    wite [7:0] _f;
    wire [7:0] _cout;
    buff m1(.x(_x),.f(_f),.cout(_cout));
    initial begin
      _x=8'b00000001;
    end
endmodule
