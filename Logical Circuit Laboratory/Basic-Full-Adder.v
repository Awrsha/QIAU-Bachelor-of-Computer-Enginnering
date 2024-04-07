module full_adder(a,b,cin,cout,sum);
	input a,b,cin;
	output cout,sum;
	wire w1,w2,w3;
	xor(sum,a,b,cin);
	and(w1,a,b);
	and(w2,a,cin);
	and(w3,b,cin);
	or(cout,w1,w2,w3);
endmodule