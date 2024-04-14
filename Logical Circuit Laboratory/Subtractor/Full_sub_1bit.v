module Full_sub_1bit (
    input x, y, bin,
    output diff, bout
);

    wire xor_xy, not_x, w1, w2;

    xor #(1) u_xor_xy (xor_xy, x, y);
    xor #(1) u_diff (diff, bin, xor_xy);

    assign not_x = ~x;
    and #(1) u_w1 (w1, not_x, y);

    assign not xor_xy = ~xor_xy;
    and #(1) u_w2 (w2, xor_xy, bin);

    or #(1) u_bout (bout, w2, w1);

endmodule

module test_Full_sub_1bit;

    reg _x, _y, _bin;
    wire _diff, _bout;

    Full_sub_1bit full (
        .x(_x),
        .y(_y),
        .bin(_bin),
        .diff(_diff),
        .bout(_bout)
    );

    initial begin
        _x = 1'b0; _y = 1'b0; _bin = 1'b0; #10;
        _x = 1'b0; _y = 1'b0; _bin = 1'b1; #10;
        _x = 1'b0; _y = 1'b1; _bin = 1'b0; #10;
        _x = 1'b0; _y = 1'b1; _bin = 1'b1; #10;
        _x = 1'b1; _y = 1'b0; _bin = 1'b0; #10;
        _x = 1'b1; _y = 1'b0; _bin = 1'b1; #10;
        _x = 1'b1; _y = 1'b1; _bin = 1'b0; #10;
        _x = 1'b1; _y = 1'b1; _bin = 1'b1; #10;
    end

endmodule
