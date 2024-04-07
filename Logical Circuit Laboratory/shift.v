module d1 (x0,x1,x2,x3,x4,x5,x6,x7,f0,f1,f2,f3,f4,f5,f6,f7,cout);
  input x0,x1,x2,x3,x4,x5,x6,x7;
  output f0,f1,f2,f3,f4,f5,f6,f7,cout;
  buf (f0,0);
  buf (f1,x0);
  buf (f2,x1);
  buf (f3,x2);
  buf (f4,x3);
  buf (f5,x4);
  buf (f6,x5);
  buf (f7,x6);
  buf (cout,x7);
  
endmodule

module test_m2();
  reg _x0,_x1,_x2,_x3,_x4,_x5,_x6,_x7;
  wire _f0,_f1,_f2,_f3,_f4,_f5,_f6,_f7;
  
  d1 test(.x0(_x0),.x1(_x1),.x2(_x2),.x3(_x3),.x4(_x4),.x5(_x5),.x6(_x6),.x7(_x7),.f0(_f0),.f1(_f1),.f2(_f2),.f3(_f3),.f4(_f4),.f5(_f5),.f6(_f6),.f7(_f7),.cout(_cout));
  
  initial begin
    _x0=1'b1;  _x1=1'b0;  _x2=1'b0; _x3=1'b0; _x4=1'b0; _x5=1'b0; _x6=1'b0; _x7=1'b0;
    #20
    _x0=1'b0;  _x1=1'b1;  _x2=1'b0; _x3=1'b0; _x4=1'b0; _x5=1'b0; _x6=1'b0; _x7=1'b0;
    #20
    _x0=1'b0;  _x1=1'b0;  _x2=1'b1; _x3=1'b0; _x4=1'b0; _x5=1'b0; _x6=1'b0; _x7=1'b0;
    #20
    _x0=1'b0;  _x1=1'b0;  _x2=1'b0; _x3=1'b1; _x4=1'b0; _x5=1'b0; _x6=1'b0; _x7=1'b0;
    #20
    _x0=1'b0;  _x1=1'b0;  _x2=1'b0; _x3=1'b0; _x4=1'b1; _x5=1'b0; _x6=1'b0; _x7=1'b0;
    #20
    _x0=1'b0;  _x1=1'b0;  _x2=1'b0; _x3=1'b0; _x4=1'b0; _x5=1'b1; _x6=1'b0; _x7=1'b0;
    #20
    _x0=1'b0;  _x1=1'b0;  _x2=1'b0; _x3=1'b0; _x4=1'b0; _x5=1'b0; _x6=1'b1; _x7=1'b0;
    #20
    _x0=1'b0;  _x1=1'b0;  _x2=1'b0; _x3=1'b0; _x4=1'b0; _x5=1'b0; _x6=1'b0; _x7=1'b1;
  end
  endmodule