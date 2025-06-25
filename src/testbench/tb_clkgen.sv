`timescale 1ns / 1ps

module tb_clkgen();
    // Testbench signals
    reg clk_in;
    reg reset_in;
    wire clk_sys;
    wire clk_fast;
    wire locked;
    
    // Instantiate the clock generator
    clk_gen dut (
        .clk_in(clk_in),
        .reset_in(reset_in),
        .clk_sys(clk_sys),
        .clk_fast(clk_fast),
        .locked(locked)
    );
    
    // Generate 100MHz input clock (10ns period)
    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in;  // 100MHz
    end
    
    // Test sequence
    initial begin
        $display("Starting clock generator simulation at time %0t", $time);
        
        // Initialize
        reset_in = 1;
        
        // Hold reset for a few cycles
        repeat(5) @(posedge clk_in);
        reset_in = 0;
        $display("Reset released at time %0t", $time);
        
        // Wait for lock
        wait(locked == 1);
        $display("Clock generator locked at time %0t", $time);
        
        // Run for a while to observe clocks
        repeat(50) @(posedge clk_in);
        
        // Test reset again
        $display("Testing reset at time %0t", $time);
        reset_in = 1;
        repeat(3) @(posedge clk_in);
        reset_in = 0;
        
        // Wait for lock again
        wait(locked == 1);
        $display("Re-locked at time %0t", $time);
        
        repeat(20) @(posedge clk_in);
        $display("Simulation complete at time %0t", $time);
        $finish;
    end
    
    // Monitor signals for debugging
    always @(posedge clk_in) begin
        $display("Time=%0t: clk_in=%b clk_sys=%b clk_fast=%b locked=%b reset=%b", 
                 $time, clk_in, clk_sys, clk_fast, locked, reset_in);
    end
    
    // Check that clk_fast is roughly 2x clk_in frequency
    integer clk_fast_count = 0;
    integer clk_in_count = 0;
    
    always @(posedge clk_fast) clk_fast_count++;
    always @(posedge clk_in) clk_in_count++;
    
    // Report frequency relationship every 20 input clocks
    always @(posedge clk_in) begin
        if (clk_in_count % 20 == 0 && locked) begin
            $display("Frequency check - clk_in cycles: %0d, clk_fast cycles: %0d, ratio: %0.1f", 
                     clk_in_count, clk_fast_count, real'(clk_fast_count)/real'(clk_in_count));
        end
    end
    
endmodule