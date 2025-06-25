`timescale 1ns / 1ps

module tb_top();
    reg clk;
    reg rst_n;
    reg [3:0] sw;
    wire [3:0] led;
    
    // Instantiate design under test
    top dut (
        .clk(clk),
        .rst_n(rst_n),
        .sw(sw),
        .led(led)
    );
    
    // Clock generation (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period = 100MHz
    end
    
    // Test sequence with more activity
    initial begin
        $display("Starting simulation at time %0t", $time);
        
        // Initialize signals
        rst_n = 0;
        sw = 4'b0000;
        
        // Hold reset for several clocks
        repeat(10) @(posedge clk);
        rst_n = 1;
        $display("Reset released at time %0t", $time);
        
        // Test different switch combinations with clock delays
        repeat(5) @(posedge clk);
        sw = 4'b0001;
        $display("Switch = 0001 at time %0t, LED = %b", $time, led);
        
        repeat(5) @(posedge clk);
        sw = 4'b0010;
        $display("Switch = 0010 at time %0t, LED = %b", $time, led);
        
        repeat(5) @(posedge clk);
        sw = 4'b0100;
        $display("Switch = 0100 at time %0t, LED = %b", $time, led);
        
        repeat(5) @(posedge clk);
        sw = 4'b1000;
        $display("Switch = 1000 at time %0t, LED = %b", $time, led);
        
        repeat(5) @(posedge clk);
        sw = 4'b1111;
        $display("Switch = 1111 at time %0t, LED = %b", $time, led);
        
        repeat(10) @(posedge clk);
        $display("Simulation complete at time %0t", $time);
        $finish;
    end
    
    // Additional monitoring
    always @(posedge clk) begin
        $display("Time=%0t: clk=%b rst_n=%b sw=%b led=%b", $time, clk, rst_n, sw, led);
    end
    
endmodule