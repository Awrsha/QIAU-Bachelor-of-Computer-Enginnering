module Full_sub_1bit (x,y,bin,diff,bout);

input x,y,bin;
output diff,bout;

wire xor_xy,not_x,w1,w2;

xor (xor_xy,x,y);
xor (diff,bin,xor_xy);

not (not_x,x);
and (w1,not_x,y);

not(not_xor_xy,xor_xy);
and (w2,not_xor_xy,bin);

or (bout,w2,w1);
endmodule


module test_Full_sub_1bit;

reg _x,_y,_bin;
wire _diff,_bout;

Full_sub_1bit full(.x(_x),.y(_y),.bin(_bin),.diff(_diff),.bout(_bout));

initial begin

_x=1'b0; _y=1'b0; _bin=1'b0;

#10

_x=1'b0; _y=1'b0; _bin=1'b1;

#10

_x=1'b0; _y=1'b1; _bin=1'b0;

#10

_x=1'b0; _y=1'b1; _bin=1'b1;

#10

_x=1'b1; _y=1'b0; _bin=1'b0;

#10

_x=1'b1; _y=1'b0; _bin=1'b1;

#10

_x=1'b1; _y=1'b1; _bin=1'b0;

#10

_x=1'b1; _y=1'b1; _bin=1'b1;

end

endmodule