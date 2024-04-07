module half_adder (x,y,c,s);
  input x,y;
  output c,s;
  xor (s,x,y);
  and(c,x,y);
endmodule

module full_adder_h (a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
  wire w1,w2,w3;
half_adder h1(.x(a), .y(b), .c(w1), .s(w2));
half_adder h2(.x(cin), .y(w2), .c(w3), .s(sum));
or (cout, w3,w1);
endmodule

module Test_full_adder_h;
    reg _a,_b,_cin;
    wire _sum,_cout;
    full_adder_h fa(.a(_a),.b(_b),.cin(_cin),.cout(_cout),.sum(_sum));
    initial begin
      _a=1'b0; _b=1'b0; _cin=1'b0;
      #20
      _cin=1'b1;
      #20
      _b=1'b1; _cin=1'b0;
      #20
      _cin=1'b1;
      #20
      _a=1'b1; _b=1'b0; _cin=1'b0;
      #20
      _cin=1'b1;
      #20
      _b=1'b1; _cin=1'b0;
      #20
      _cin=1'b1;
    end
  endmodule
