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
    
    // Clock generation - THIS IS CRITICAL
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle every 5ns
    end
    
    // Test sequence
    initial begin
        $display("Starting simulation...");
        rst_n = 0;
        sw = 4'b0000;
        
        #100 rst_n = 1;
        $display("Reset released");
        
        #100 sw = 4'b0001;
        #100 sw = 4'b0010;
        #100 sw = 4'b0100;
        #100 sw = 4'b1000;
        
        #100 $display("Simulation complete");
    end
endmodule