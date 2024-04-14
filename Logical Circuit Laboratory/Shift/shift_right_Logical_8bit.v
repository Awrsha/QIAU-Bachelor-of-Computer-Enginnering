module shift_right_Logical_8bit (
    input [7:0] x,
    output cout,
    output [7:0] f
);

    buf buf0 (f[0], x[1]);
    buf buf1 (f[1], x[2]);
    buf buf2 (f[2], x[3]);
    buf buf3 (f[3], x[4]);
    buf buf4 (f[4], x[5]);
    buf buf5 (f[5], x[6]);
    buf buf6 (f[6], x[7]);
    buf buf7 (f[7], 0);
    buf buf8 (cout, x[0]);

endmodule

module test_shift_right_Logical_8bit;

    reg [7:0] a;
    wire [7:0] f;
    wire cout1;

    shift_right_Logical_8bit sr (
        .x(a),
        .f(f),
        .cout(cout1)
    );

    initial begin
        a = 8'b11111101; #20;
        a = 8'b10001110; #20;
        a = 8'b11001101; #20;
        a = 8'b10001111; #20;
    end

endmodule
