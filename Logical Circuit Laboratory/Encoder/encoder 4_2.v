module encoder4_2 (D0,D1,D2,D3,A0,A1,out);

input D0,D1,D2,D3;
output A0,A1,out;

wire nD2,and_nD2_D1;

not (nD2,D2);
and (and_nD2_D1,nD2,D1);
or (A0,D3,and_nD2_D1);

or (A1,D2,D3);	

or (out,D0,D1,D2,D3);

endmodule

module test_encoder4_2;

reg _D0,_D1,_D2,_D3;
wire _A0,_A1,_out;

encoder4_2 full(.D0(_D0),.D1(_D1),.D2(_D2),.D3(_D3),.A0(_A0),.A1(_A1),.out(_out));

initial begin
_D0=1'b0; _D1=1'b0; _D2=1'b0; _D3=1'b0;

#10

_D0=1'b1; _D1=1'b0; _D2=1'b0; _D3=1'b0;

#10

_D0=1'b0; _D1=1'b1; _D2=1'b0; _D3=1'b0;

#10

_D0=1'b0; _D1=1'b0; _D2=1'b1; _D3=1'b0;

#10

_D0=1'b0; _D1=1'b0; _D2=1'b0; _D3=1'b1;

end

endmodule