module buff(x, f, cout);
    input [7:0] x;
    output [7:0] f;
    output cout;

    // Instantiate 8 buffers to copy input to output
    buf buf0(f[0], 0);
    buf buf1(f[1], x[0]);
    buf buf2(f[2], x[1]);
    buf buf3(f[3], x[2]);
    buf buf4(f[4], x[3]);
    buf buf5(f[5], x[4]);
    buf buf6(f[6], x[5]);
    buf buf7(f[7], x[6]);
    
    // Connect MSB of input directly to cout
    buf buf_cout(cout, x[7]);
endmodule

module test_buff();
    reg [7:0] _x;
    wire [7:0] _f;
    wire _cout;
    
    // Instantiate buffer module for testing
    buff m1(.x(_x), .f(_f), .cout(_cout));
    
    // Initialize input
    initial begin
        _x = 8'b00000001;
    end
endmodule