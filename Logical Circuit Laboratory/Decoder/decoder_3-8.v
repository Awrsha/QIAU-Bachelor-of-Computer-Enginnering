module decoder_8_3 (A0,A1,A2,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);

input A0,A1,A2;
output Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;

wire notA0,notA1,notA2;

not(notA0,A0); not(notA1,A1); not(notA2,A2);

and (Y0,notA0,notA1,notA2);
and (Y1,A0,notA1,notA2);
and (Y2,notA0,A1,notA2);
and (Y3,A0,A1,notA2);
and (Y4,notA0,notA1,A2);
and (Y5,A0,notA1,A2);
and (Y6,notA0,A1,A2);
and (Y7,A0,A1,A2);

endmodule

module test_decoder_8_3;

reg _A0,_A1,_A2;
wire _Y0,_Y1,_Y2,_Y3,_Y4,_Y5,_Y6,_Y7;

decoder_8_3 full(.A0(_A0),.A1(_A1),.A2(_A2),.Y0(_Y0),.Y1(_Y1),.Y2(_Y2),.Y3(_Y3),.Y4(_Y4),.Y5(_Y5),.Y6(_Y6),.Y7(_Y7));

initial begin

_A0=1'b0; _A1=1'b0; _A2=1'b0;

#20
_A0=1'b1; _A1=1'b0; _A2=1'b0;

#20
_A0=1'b0; _A1=1'b1; _A2=1'b0;

#20
_A0=1'b1; _A1=1'b1; _A2=1'b0;

#20
_A0=1'b0; _A1=1'b0; _A2=1'b1;

#20
_A0=1'b1; _A1=1'b0; _A2=1'b1;

#20
_A0=1'b0; _A1=1'b1; _A2=1'b1;

#20
_A0=1'b1; _A1=1'b1; _A2=1'b1;

end
endmodule