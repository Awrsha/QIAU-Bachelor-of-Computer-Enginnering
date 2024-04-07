module FA_1bit(a,b,cin,cout,sum);
  input a,b,cin;
  output cout, sum;
  xor(w1,cin,a);
  and(w2,cin,a);
  and(w3,a,b);
  and(w4,b,cin);
  xor(sum,w1,b);
  or(cout,w2,w3,w4);
endmodule
  
module FA_2bit(cin,a,b,sum,cout);
  input cin;
  input[1:0] a,b;
  output cout;
  output[1:0] sum;
  FA_1bit m0(.sum(sum[0]), .cout(w1),.cin(cin),.a(a[0]),.b(b[0]));
  FA_1bit m1(.sum(sum[1]), .cout(cout),.cin(w1),.a(a[1]),.b(b[1]));
endmodule
  
module test_fa2bit();
  reg cin;
  reg [1:0]f0,f1;
  wire cout;
  wire[1:0]sum;
  FA_2bit mm(.cin(cin),.a(f0),.b(f1), .sum(sum),.cout(cout));
  
  initial begin
    cin=1'b1; f0=2'b11;f1=2'b11;
    #20
    cin=1'b0; f0=2'b00;f1=2'b00;
    #20
    cin=1'b1; f0=2'b10;f1=2'b10;
    #20
    f0=2'b01;f1=2'b01;
    #20
    cin=1'b0; f0=2'b00;f1=2'b11;
  end
endmodule
    