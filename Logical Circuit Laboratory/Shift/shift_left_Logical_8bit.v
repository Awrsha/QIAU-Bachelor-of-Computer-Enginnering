module left_shift (
    input [7:0] x,
    output [7:0] f,
    output cout
);

    buf buf0 (f[0], 0);
    buf buf1 (f[1], x[0]);
    buf buf2 (f[2], x[1]);
    buf buf3 (f[3], x[2]);
    buf buf4 (f[4], x[3]);
    buf buf5 (f[5], x[4]);
    buf buf6 (f[6], x[5]);
    buf buf7 (f[7], x[6]);

    buf buf8 (cout, x[7]);
    xor ove (x[7], x[6]);

endmodule

module test_left_shift;

    reg [7:0] _x;
    wire [7:0] _f;
    wire _cout;

    left_shift full (
        .x(_x),
        .f(_f),
        .cout(_cout)
    );

    initial begin
        _x = 8'b00000001; #20;
        _x = 8'b01100000; #20;
        _x = 8'b10000000;
    end

endmodule
