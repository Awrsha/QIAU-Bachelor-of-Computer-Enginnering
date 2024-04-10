// Module CRC_16_serial 
// Module function: This module is a CRC-16 checksum encoding circuit that uses a serial linear shift stage.
module CRC_16_serial(clk, rst, load, d_finish, crc_in, crc_out); 
    input clk;          // Clock signal
    input rst;          // Reset signal
    input load;         // Signal to start encoding
    input d_finish;     // Signal indicating encoding completion
    input crc_in;       // Input word to be encoded
    output crc_out;     // Encoded output code word
    reg crc_out;        // Staged output code word, 1 bit 
    reg [15:0] crc_reg; // Linear shift register, 16 bits 
    reg [1:0] state;    // State register, 2 bits 
    reg [4:0] count;    // Count register, 5 bits 
    parameter idle = 2'b00;    // Idle state
    parameter compute = 2'b01; // Computation state
    parameter finish = 2'b10;  // Finish state
    
    always @ (posedge clk) // Executed on each positive edge of the clock
    begin 
        // Case statement based on state
        case (state)
            idle: begin // Idle state
                if (load) // Transition to compute state when load signal is active
                    state <= compute; 
                else
                    state <= idle; 
            end
            
            compute: begin // Compute state
                if (d_finish) // Transition to finish state when d_finish signal is active
                    state <= finish; 
                else
                    state <= compute; 
            end
            
            finish: begin // Finish state
                if (count == 16) // Check if all 16 bits have been output
                    state <= idle; 
                else
                    count <= count + 1; 
            end
        endcase
    end 
    
    always @ (posedge clk or negedge rst) // Executed on each positive edge of the clock or negative edge of the reset signal
    begin 
        if (rst) // Reset condition
        begin 
            // Initialize crc_reg to pre-defined value b0000_0000_0000_0000 (15:0), 16'b
            count <= 5'b0_0000; 
            state <= idle; 
        end
        else // When not in reset
            case (state) 
                idle: begin
                    crc_reg[15:0] <= 16'b0000_0000_0000_0000; // Initialize crc_reg to all zeros
                end
                
                compute: begin 
                    // Generate polynomial x^16 + x^15 + x^2 + 1 
                    crc_reg[0] <= crc_reg[15] ^ crc_in; 
                    crc_reg[1] <= crc_reg[0]; 
                    crc_reg[2] <= crc_reg[1] ^ crc_reg[15] ^ crc_in; 
                    crc_reg[14:3] <= crc_reg[13:2]; 
                    crc_reg[15] <= crc_reg[14] ^ crc_reg[15] ^ crc_in; 
                    crc_out <= crc_in; // Input is the output
                end 
                
                finish: begin 
                    crc_out <= crc_reg[15]; // Output stage 15
                    crc_reg[15:0] <= {crc_reg[14:0], 1'b0}; // Shift left
                end 
            endcase 
    end
endmodule