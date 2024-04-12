module Full_adder_1bit (sum,cout,cin,x,y);

input x,y,cin;
output sum,cout;

wire w1,w2,w3;

xor (sum,x,y,cin);

and (w1,x,cin);
and (w2,y,cin);
and (w3,x,y);

or (cout,w1,w2,w3);

endmodule

module Full_adder_4bit (cin,x,y,sum,cout);

input cin;
input [3:0] x,y;
output cout;
output [3:0] sum;

Full_adder_1bit m0(.sum(sum[0]),.cout(w1),.cin(cin),.x(x[0]),.y(y[0]));
Full_adder_1bit m1(.sum(sum[1]),.cout(w2),.cin(w1),.x(x[1]),.y(y[1]));
Full_adder_1bit m2(.sum(sum[2]),.cout(w3),.cin(w2),.x(x[2]),.y(y[2]));
Full_adder_1bit m3(.sum(sum[3]),.cout(cout),.cin(w3),.x(x[3]),.y(y[3]));


endmodule

module mux_4x1 (i0,i1,i2,i3,s0,s1,out);

input i0,i1,i2,i3,s0,s1;
output out;

wire ns0,ns1,wi0,wi1,wi2,wi3;

not(ns0,s0);
not(ns1,s1);

and(wi0,i0,ns0,ns1);

and(wi1,i1,s0,ns1);

and(wi2,i2,ns0,s1);

and(wi3,i3,s0,s1);

or (out,wi0,wi1,wi2,wi3);

endmodule

module mux_4x1_4bit (i0,i1,i2,i3,s0,s1,out);

input [3:0] i0,i1,i2,i3;
input s0,s1;

output [3:0] out;

mux_4x1 m0(.i0(i0[0]),.i1(i1[0]),.i2(i2[0]),.i3(i3[0]),.s0(s0),.s1(s1),.out(out[0]));
mux_4x1 m1(.i0(i0[1]),.i1(i1[1]),.i2(i2[1]),.i3(i3[1]),.s0(s0),.s1(s1),.out(out[1]));
mux_4x1 m2(.i0(i0[2]),.i1(i1[2]),.i2(i2[2]),.i3(i3[2]),.s0(s0),.s1(s1),.out(out[2]));
mux_4x1 m3(.i0(i0[3]),.i1(i1[3]),.i2(i2[3]),.i3(i3[3]),.s0(s0),.s1(s1),.out(out[3]));

endmodule

module ALU (a, b, cin, s0, s1, out, cout);

input  [3:0] a,b;
input  s0, s1,cin;
output [3:0] out;
output cout;

wire [3:0] wsum,wxor,woor,wnot;
  
Full_adder_4bit full (.cin(cin),.x(a),.y(b),.sum(wsum),.cout(cout));
 
xor(wxor[0],a[0],b[0]);
xor(wxor[1],a[1],b[1]);
xor(wxor[2],a[2],b[2]);
xor(wxor[3],a[3],b[3]);

or(woor[0],a[0],b[0]);
or(woor[1],a[1],b[1]);
or(woor[2],a[2],b[2]);
or(woor[3],a[3],b[3]);

not(wnot[0],a[0]);
not(wnot[1],a[1]);
not(wnot[2],a[2]);
not(wnot[3],a[3]);

mux_4x1_4bit m0(.i0(wsum),.i1(wxor),.i2(woor),.i3(wnot),.s0(s0),.s1(s1),.out(out));

endmodule


 module test_ALU_4bit;
   reg [3:0]a,b;
   reg cin,s0,s1;
   wire [3:0]out;
   wire cout;
   
   
   ALU full(.a(a),.b(b),.cin(cin),.s0(s0),.s1(s1),.out(out),.cout(cout));
   
   initial begin 
     a=4'b1001;b=4'b1101;cin=1'b0;s0=1'b0;s1=1'b0;
     #20
     a=4'b1001;b=4'b1101;cin=1'b0;s0=1'b1;s1=1'b0;
     #20
     a=4'b1001;b=4'b1101;cin=1'b0;s0=1'b0;s1=1'b1;
     #20
     a=4'b1001;b=4'b1101;cin=1'b0;s0=1'b1;s1=1'b1;
     
end
endmodule
