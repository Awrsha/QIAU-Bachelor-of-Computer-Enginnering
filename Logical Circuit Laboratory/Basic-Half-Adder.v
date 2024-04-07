module half_adder(a,b,carry,sum);
	input a,b;
	output carry,sum;
	xor(sum,a,b);
	and(carry,a,b);
endmodule
