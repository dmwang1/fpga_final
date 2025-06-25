`timescale 1ns / 1ps

module clk_gen (
    // INPUT SIGNALS - Connect these to top-level
    input  wire clk_in,          // 100MHz from crystal
    input  wire reset_in,        // Active high reset
    
    // OUTPUT SIGNALS - Use these in your design
    output wire clk_sys,         // 100MHz system clock
    output wire clk_fast,        // 200MHz processing clock
    output wire locked           // All clocks ready flag
);

    // Internal registers for clock generation
    reg clk_fast_reg;
    reg [3:0] lock_counter;  // Counter for lock delay
    reg locked_reg;
    
    // System clock - direct passthrough (100MHz)
    assign clk_sys = clk_in;
    
    // Fast clock generation (200MHz from 100MHz input)  
    // Simple approach: just toggle every posedge (creates 50MHz for now)
    // For real 200MHz, you'd use Xilinx MMCM IP
    always_ff @(posedge clk_in or posedge reset_in) begin
        if (reset_in) begin
            clk_fast_reg <= 1'b0;
        end else begin
            clk_fast_reg <= ~clk_fast_reg;  // Creates 50MHz clock
        end
    end
    
    assign clk_fast = clk_fast_reg;
    
    // Lock signal generation - simulates PLL lock time
    always_ff @(posedge clk_in or posedge reset_in) begin
        if (reset_in) begin
            lock_counter <= 4'b0000;
            locked_reg <= 1'b0;
        end else begin
            if (lock_counter < 4'b1111) begin
                lock_counter <= lock_counter + 1;
                locked_reg <= 1'b0;  // Not locked yet
            end else begin
                locked_reg <= 1'b1;  // Locked after 15 cycles
            end
        end
    end
    
    assign locked = locked_reg;

endmodule