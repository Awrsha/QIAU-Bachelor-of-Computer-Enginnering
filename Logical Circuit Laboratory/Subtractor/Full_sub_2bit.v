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

module Full_sub_2bit (
    input [1:0] x, y,
    input _bin,
    output [1:0] diff,
    output _bout
);

    wire w1;
    Full_sub_1bit m0(.x(x[0]), .y(y[0]), .bin(_bin), .diff(diff[0]), .bout(w1));
    Full_sub_1bit m1(.x(x[1]), .y(y[1]), .bin(w1), .diff(diff[1]), .bout(_bout));

endmodule

module test_Full_sub_2bit ();

    reg [1:0] b0, b1;
    reg _bin;

    wire [1:0] _diff;
    wire _bout;

    Full_sub_2bit full (
        .x(b0),
        .y(b1),
        ._bin(_bin),
        .diff(_diff),
        ._bout(_bout)
    );

    initial begin
        b0 = 2'b11; b1 = 2'b11; _bin = 1'b0; #10;
        b0 = 2'b11; b1 = 2'b00; _bin = 1'b0; #10;
        b0 = 2'b10; b1 = 2'b01; _bin = 1'b0; #10;
    end

endmodule
