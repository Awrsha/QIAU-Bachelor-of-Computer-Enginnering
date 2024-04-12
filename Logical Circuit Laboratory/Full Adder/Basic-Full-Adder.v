module full_adder(a, b, cin, cout, sum);
    input a, b, cin;
    output cout, sum;
    wire w1, w2, w3;
    
    // XOR gate to generate sum
    xor(sum, a, b, cin);
    
    // AND gates for intermediate calculations
    and(w1, a, b);
    and(w2, a, cin);
    and(w3, b, cin);
    
    // OR gate to generate carry-out
    or(cout, w1, w2, w3);
endmodule