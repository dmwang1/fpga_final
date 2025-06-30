`timescale 1ns / 1ps

// Ultra-slow approach - back to basics
module top_module (
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

// Testbench
module tb_top_module;
    // Testbench signals
    reg clk;
    reg rst_n;
    reg [3:0] sw;
    wire [3:0] led;
    
    // Clock generation - 100MHz (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period = 100MHz
    end
    
    // Instantiate the module under test
    top_module uut (
        .clk(clk),
        .rst_n(rst_n),
        .sw(sw),
        .led(led)
    );
    
    // Test stimulus
    initial begin
        // Initialize inputs
        rst_n = 0;
        sw = 4'b0000;
        
        // Hold reset for a few cycles
        #100;
        rst_n = 1;
        
        // Let it run for a while to see counter behavior
        // Note: For simulation, we probably don't want to wait 4 billion ns!
        // So let's modify the parameter for simulation or just observe initial behavior
        #1000;
        
        // Test reset functionality
        rst_n = 0;
        #50;
        rst_n = 1;
        
        // Run for more cycles
        #2000;
        
        $finish;
    end
    
    // Monitor key signals
    initial begin
        $monitor("Time=%0t, rst_n=%b, counter=%0d, blink_pattern=%b, led=%b", 
                 $time, rst_n, uut.counter, uut.blink_pattern, led);
    end
    
    // For debugging - display counter value periodically
    always @(posedge clk) begin
        if (uut.counter % 1000000 == 0) begin // Every million cycles
            $display("Counter milestone: %0d", uut.counter);
        end
    end
    
endmodule
