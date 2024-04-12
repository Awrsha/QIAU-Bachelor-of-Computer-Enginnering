module half_adder(a, b, carry, sum);
    input a, b;
    output carry, sum;
    wire w1, w2;
    
    // XOR gate to generate sum
    xor(sum, a, b);
    
    // AND gate to generate carry
    and(carry, a, b);
endmodule