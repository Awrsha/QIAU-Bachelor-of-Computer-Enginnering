module encoder4to2(i0, i1, i2, i3, o1, o2, v);
    input i0, i1, i2, i3;
    output o1, o2, v;
    wire w1, w2;

    // Invert input i2
    not(w1, i2);
    // Generate output o1
    or(o1, i2, i3);
    // Generate output o2
    and(w2, i1, w1);
    or(o2, i3, w2);
    // Generate output v (valid)
    or(v, i0, i1, i2, i3);
endmodule

module test_bench_encoder4to2();
    reg _i0, _i1, _i2, _i3;
    wire _o1, _o2, _v;
    encoder4to2 enc(.i0(_i0), .i1(_i1), .i2(_i2), .i3(_i3), .o1(_o1), .o2(_o2), .v(_v));

    // Initialize inputs
    initial begin
        _i3 = 1'b0; _i2 = 1'b0; _i1 = 1'b0; _i0 = 1'b0;
        #20
        _i0 = 1'b1;
        #20
        _i1 = 1'b1;
        #20
        _i2 = 1'b1;
        #20
        _i3 = 1'b1;
    end
endmodule