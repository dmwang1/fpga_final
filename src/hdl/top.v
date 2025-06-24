`timescale 1ns / 1ps

module top (
    input clk,
    input rst_n,
    input [3:0] sw,
    output [3:0] led
);

// Just turn all LEDs on - simplest possible test
assign led = 4'b1111;

endmodule