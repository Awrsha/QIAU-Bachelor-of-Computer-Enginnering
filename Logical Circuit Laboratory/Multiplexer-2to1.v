module mux1(s,a,b,f);
  input s,a,b;
  output f;
  wire w1,w2,w3;
  
  and(w2,a,w1);
  not(w1,s);
  and(w3,b,s);
  or(f,w2,w3);
endmodule

module test_a();
    reg _s,_a,_b;
    wire _f;
    mux1 m1(.a(_a),.b(_b),.s(_s),.f(_f));
    initial begin
    

    _s=1'b0; _a=1'b0; _b=1'b0;
   #20
    _s=1'b0; _a=1'b0; _b=1'b1;
   #20
    _s=1'b0; _a=1'b1; _b=1'b0;
   #20
    _s=1'b0; _a=1'b1; _b=1'b1;
   #20
    _s=1'b1; _a=1'b0; _b=1'b0;
   #20
    _s=1'b1; _a=1'b0; _b=1'b1;
   #20
   _s=1'b1;  _a=1'b1; _b=1'b0;
   #20
    _s=1'b1; _a=1'b0; _b=1'b1;
end
endmodule