`timescale 1ns / 1ps

module top_clkgen (
    input clk,      // From constraint file
    input rst_n,    // From constraint file  
    input [3:0] sw, // From constraint file
    output [3:0] led // From constraint file
);

    wire clk_sys, clk_fast, locked;
    
    // Instantiate your clock generator
    clk_gen clk_inst (
        .clk_in(clk),
        .reset_in(~rst_n),  // Convert active-low to active-high
        .clk_sys(clk_sys),
        .clk_fast(clk_fast),
        .locked(locked)
    );
    
    // Show status on LEDs
    assign led = {locked, clk_fast, clk_sys, clk};

endmodule