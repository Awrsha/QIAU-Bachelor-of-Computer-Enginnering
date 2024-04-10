// In the name of God

// -------- (Half Adder) --------
module HalfAdder(x, y, Sum, Cout);
    input x, y;
    output Sum, Cout;
    
    xor(Sum, x, y);
    and(Cout, x, y);
endmodule

// -------- (Full Adder 1-bit) --------
module FullAdder1_1bit(Cin, X, Y, Sum, Cout);
    input Cin, X, Y;
    output Sum, Cout;
    
    wire w1, w2, w3;
    HalfAdder fA0(.x(Cin), .y(X), .Sum(w1), .Cout(w2));
    HalfAdder fA1(.x(w1), .y(Y), .Sum(Sum), .Cout(w3));
    or(Cout, w2, w3);
endmodule

// -------- (Full Adder 8-bit) --------
module FullAdder_8bit(cin, x, y, sum, cout);
    input cin;
    input [7:0] x, y;
    output [7:0] sum;
    output cout;
    
    FullAdder1_1bit ful0(.Cin(cin), .X(x[0]), .Y(y[0]), .Sum(sum[0]), .Cout(cout)); // 0
    FullAdder1_1bit ful1(.Cin(cin), .X(x[1]), .Y(y[1]), .Sum(sum[1]), .Cout(cout)); // 1
    FullAdder1_1bit ful2(.Cin(cin), .X(x[2]), .Y(y[2]), .Sum(sum[2]), .Cout(cout)); // 2
    FullAdder1_1bit ful3(.Cin(cin), .X(x[3]), .Y(y[3]), .Sum(sum[3]), .Cout(cout)); // 3
    FullAdder1_1bit ful4(.Cin(cin), .X(x[4]), .Y(y[4]), .Sum(sum[4]), .Cout(cout)); // 4
    FullAdder1_1bit ful5(.Cin(cin), .X(x[5]), .Y(y[5]), .Sum(sum[5]), .Cout(cout)); // 5
    FullAdder1_1bit ful6(.Cin(cin), .X(x[6]), .Y(y[6]), .Sum(sum[6]), .Cout(cout)); // 6
    FullAdder1_1bit ful7(.Cin(cin), .X(x[7]), .Y(y[7]), .Sum(sum[7]), .Cout(cout)); // 7
endmodule

// -------- Test --------
module Test_FullAdder_8bit;
    reg [7:0] x, y;
    reg cin;
    wire cout;
    wire [7:0] sum;

    FullAdder_8bit F1(.x(x), .y(y), .cin(cin), .sum(sum), .cout(cout));

    initial begin 
        $monitor("X = %d  Y = %d  cin = %b ===> cout = %d  sum = %d", x, y, cin, cout, sum);
        x = 8'd1; y = 8'd8; cin = 8'b0;
        #5
        x = 8'd2; y = 8'd8; cin = 8'b0;
        #5
        x = 8'd3; y = 8'd8; cin = 8'b0;
        #5
        x = 8'd1; y = 8'd8; cin = 8'b1;
        #5
        x = 8'd2; y = 8'd8; cin = 8'b1;
    end
endmodule