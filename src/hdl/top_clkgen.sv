`timescale 1ns / 1ps

// Ultra-slow approach - back to basics
module top_clkgen (
    input clk,              // 100MHz system clock (matches your constraints)
    input rst_n,            // Reset button (active low, matches your constraints)
    input [3:0] sw,         // 4 slide switches (matches your constraints)
    output [3:0] led        // 4 User LEDs (matches your constraints)
);

    // MASSIVE counter for ultra-slow blinking
    reg [31:0] counter = 0;
    reg [3:0] blink_pattern = 0;
    
    // Count to 400 million = 4 seconds at 100MHz
    parameter COUNT_4SEC = 400_000_000;
    
    always @(posedge clk) begin
        if (!rst_n) begin
            counter <= 0;
            blink_pattern <= 0;
        end else begin
            if (counter >= (COUNT_4SEC - 1)) begin
                counter <= 0;
                blink_pattern <= blink_pattern + 1;  // Change every 4 seconds
            end else begin
                counter <= counter + 1;
            end
        end
    end
    
    // Show the pattern - should change every 4 seconds
    assign led = blink_pattern;

endmodule