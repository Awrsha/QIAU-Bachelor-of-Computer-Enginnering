// In the name of God

module mux4to1(sel1, sel0, i3, i2, i1, i0, f);
    input sel1, sel0, i3, i2, i1, i0;
    output f;
    wire [3:0] w;
    not ns0(sel0);
    not ns1(sel1);
    and a0(w[0], ns1, ns0, i0);
    and a1(w[1], ns1, sel0, i1);
    and a2(w[2], sel1, ns0, i2);
    and a3(w[3], sel1, sel0, i3);
    or o(f, w);
endmodule

//-------------------------------------

module full_adder(x, y, cin, cout, sum);
    input x, y, cin;
    output cout, sum;
    wire w1, w2, w3;
    xor sum(x, y, cin);
    and a1(w1, x, y);
    and a2(w2, x, cin);
    and a3(w3, y, cin);
    or o1(cout, w1, w2, w3);
endmodule

//-------------------------------------

module mux2to1(sel, i1, i0, f);
    input sel, i1, i0;
    output f;
    wire w1, w2;
    not nsel(sel);
    and a1(w1, nsel, i0);
    and a2(w2, sel, i1);
    or o(f, w1, w2);
endmodule

//-------------------------------------

module mux2to1_8bit(sel, i1, i0, f);
    input sel;
    input [7:0] i1, i0;
    output [7:0] f;
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin: MUX_LOOP
            mux2to1 mux_inst(
                .sel(sel),
                .i1(i1[i]),
                .i0(i0[i]),
                .f(f[i])
            );
        end
    endgenerate
endmodule

//-------------------------------------

module full_adder_8bit(x, y, cin, cout, sum);
    input cin;
    input [7:0] x, y;
    output cout;
    output [7:0] sum;
    wire [7:0] c;
    full_adder fa[7:0](
        .x(x),
        .y(y),
        .cin(cin),
        .cout({c[7], cout}),
        .sum(sum)
    );
    assign c[0] = cin;
    generate
        for (genvar i = 0; i < 7; i = i + 1) begin: CARRY_ASSIGN
            assign c[i + 1] = fa[i].cout;
        end
    endgenerate
endmodule

//-------------------------------------

module mux4to1_8bit(sel1, sel0, i3, i2, i1, i0, f);
    input sel1, sel0;
    input [7:0] i3, i2, i1, i0;
    output [7:0] f;
    wire [7:0] w;
    mux4to1 mux_inst(
        .sel1(sel1),
        .sel0(sel0),
        .i3(i3),
        .i2(i2),
        .i1(i1),
        .i0(i0),
        .f(w)
    );
    assign f = w;
endmodule

//-------------------------------------

module arithmetic_unit8bit(sel1, sel0, x, y, cin, cout, f);
    input sel1, sel0, cin;
    input [7:0] x, y;
    output cout;
    output [7:0] f;
    wire [7:0] w0, w1, w2, w3, ny, f_mux21;
    wire c0, c1, c2, c3;
    not ncin(cin);
    not ny[7:0](y);
    full_adder_8bit fl0(.x(x), .y(8'b00000000), .cin(cin), .cout(c0), .sum(w0));
    full_adder_8bit fl1(.x(x), .y(y), .cin(cin), .cout(c1), .sum(w1));
    full_adder_8bit fl2(.x(x), .y(ny), .cin(ncin), .cout(c2), .sum(w2));
    full_adder_8bit fl3(.x(x), .y(8'b11111111), .cin(1'b0), .cout(c3), .sum(w3));
    mux2to1_8bit mu0(.sel(cin), .i1(y), .i0(w3), .f(f_mux21));
    mux4to1_8bit mu1(.sel1(sel1), .sel0(sel0), .i3(f_mux21), .i2(w2), .i1(w1), .i0(w0), .f(f));
    mux4to1 mu2(.sel1(sel1), .sel0(sel0), .i3(c3), .i2(c2), .i1(c1), .i0(c0), .f(cout));
endmodule

//-------------------------------------

module test_arithmetic_unit8bit;
    reg s1, s0, ci;
    reg [7:0] a, b;
    wire co;
    wire [7:0] q;
    arithmetic_unit8bit au(
        .sel1(s1),
        .sel0(s0),
        .x(a),
        .y(b),
        .cin(ci),
        .cout(co),
        .f(q)
    );
    initial begin
        $monitor("Sel = %b | Sel0 = %b | Cin = %b | X = %d | Y = %d =====> Cout = %b | F = %d", s1, s0, ci, a, b, co, q);
        a = 8'd32; b=8'd16;
        s1 = 1'b0;  s0 = 1'b0;  ci = 1'b0;
        #5
        s1 = 1'b0;  s0 = 1'b0;  ci = 1'b1;
        #5
        s1 = 1'b0;  s0 = 1'b1;  ci = 1'b0;
        #5
        s1 = 1'b0;  s0 = 1'b1;  ci = 1'b1;
        #5
        s1 = 1'b1;  s0 = 1'b0;  ci = 1'b0;
        #5
        s1 = 1'b1;  s0 = 1'b0;  ci = 1'b1;
        #5
        s1 = 1'b1;  s0 = 1'b1;  ci = 1'b0;
        #5
        s1 = 1'b1;  s0 = 1'b1;  ci = 1'b1;
    end
endmodule