module Full_Adder(x, y, cin, sum, cout);
    input x, y, cin;
    output sum, cout;
    wire w1, w2, w3;

    // XOR gate to calculate sum
    xor(sum, cin, x, y);

    // Intermediate wires and gates for carry calculation
    wire w4;
    or(w1, cin, y);
    and(w2, cin, y);
    and(w3, w1, x);
    or(w4, w2, w3);
    assign cout = w4;
endmodule

module Test_Full_Adder;
    reg a, b, c;
    wire u, v;

    // Instantiate Full_Adder module for testing
    Full_Adder fa(.x(a), .y(b), .cin(c), .sum(v), .cout(u));

    // Initialize inputs
    initial begin
        a = 1'b0; b = 1'b0; c = 1'b0;
        #20
        c = 1'b1;
        #20
        b = 1'b1; c = 1'b0;
        #20
        c = 1'b1;
        #20
        a = 1'b1; b = 1'b0; c = 1'b0;
        #20
        c = 1'b1;
        #20
        b = 1'b1; c = 1'b0;
        #20
        c = 1'b1;
    end
endmodule