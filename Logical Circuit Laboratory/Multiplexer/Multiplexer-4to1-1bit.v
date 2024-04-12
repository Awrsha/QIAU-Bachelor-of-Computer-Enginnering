module Mux4to1_1b(A0, A1, A2, A3, S1, S0, F);
    input A0, A1, A2, A3, S1, S0;
    output F;
    wire w0, w1, w2, w3, w4, w5;
    // Inverters for generating complement signals
    not W0(S0);
    not W1(S1);
    // Intermediate wires for AND gate outputs
    and W2(w0, W0, W1, A0);
    and W3(w1, W1, S0, A1);
    and W4(w2, S1, W0, A2);
    and W5(w3, S1, S0, A3);
    // Output calculation using OR gate
    or (F, W2, W3, W4, W5);
endmodule

module test_mux4to1_1b;
    reg _s0, _s1, _a, _b, _c, _d;
    wire _f;
    Mux4to1_1b mux(
        .S1(_s1), .S0(_s0),
        .A0(_a), .A1(_b), .A2(_c), .A3(_d),
        .F(_f)
    );
    initial begin
        // Test cases for the 4-to-1 multiplexer
        _s1 = 1'b0; _s0 = 1'b0; _a = 1'b1;  _b = 1'b0; _c = 1'b0; _d = 1'b0;
        #10
        _s1 = 1'b0; _s0 = 1'b0; _a = 1'b0;  _b = 1'b1; _c = 1'b1; _d = 1'b1;
        #10
        _s1 = 1'b0; _s0 = 1'b1; _a = 1'b0;  _b = 1'b1; _c = 1'b0; _d = 1'b0;
        #10
        _s1 = 1'b0; _s0 = 1'b1; _a = 1'b1;  _b = 1'b0; _c = 1'b1; _d = 1'b1;
        #10
        _s1 = 1'b1; _s0 = 1'b0; _a = 1'b0;  _b = 1'b0; _c = 1'b1; _d = 1'b0;
        #10
        _s1 = 1'b1; _s0 = 1'b0; _a = 1'b1;  _b = 1'b1; _c = 1'b0; _d = 1'b1;
        #10
        _s1 = 1'b1; _s0 = 1'b1; _a = 1'b0;  _b = 1'b0; _c = 1'b0; _d = 1'b1;
        #10
        _s1 = 1'b1; _s0 = 1'b1; _a = 1'b1;  _b = 1'b1; _c = 1'b1; _d = 1'b0;
    end
endmodule