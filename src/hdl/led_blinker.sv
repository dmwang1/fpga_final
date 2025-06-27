module led_blinker (
    input wire clk_sys,         // 100MHz system clock
    input wire clk_fast,        // 200MHz (or 50MHz) fast clock
    input wire reset,           // Active high reset
    input wire locked,          // PLL locked signal
    output reg blink_1hz,       // 1Hz blink output
    output reg blink_2hz,       // 2Hz blink output  
    output reg blink_fast       // Fast blink output
);

    // Counter sizes for different blink rates
    // For 100MHz clock: 
    // 1Hz = 100M/2 = 50M cycles
    // 2Hz = 100M/4 = 25M cycles
    localparam COUNT_1HZ = 26'd50_000_000;  // 1Hz toggle
    localparam COUNT_2HZ = 25'd25_000_000;  // 2Hz toggle
    localparam COUNT_FAST = 20'd500_000;    // Fast blink (~100Hz)
    
    // Counters
    reg [25:0] counter_1hz;
    reg [24:0] counter_2hz; 
    reg [19:0] counter_fast;
    
    // 1Hz blinker (slowest)
    always_ff @(posedge clk_sys or posedge reset) begin
        if (reset || !locked) begin
            counter_1hz <= 26'd0;
            blink_1hz <= 1'b0;
        end else begin
            if (counter_1hz >= COUNT_1HZ - 1) begin
                counter_1hz <= 26'd0;
                blink_1hz <= ~blink_1hz;
            end else begin
                counter_1hz <= counter_1hz + 1;
            end
        end
    end
    
    // 2Hz blinker (medium speed)
    always_ff @(posedge clk_sys or posedge reset) begin
        if (reset || !locked) begin
            counter_2hz <= 25'd0;
            blink_2hz <= 1'b0;
        end else begin
            if (counter_2hz >= COUNT_2HZ - 1) begin
                counter_2hz <= 25'd0;
                blink_2hz <= ~blink_2hz;
            end else begin
                counter_2hz <= counter_2hz + 1;
            end
        end
    end
    
    // Fast blinker (uses fast clock)
    always_ff @(posedge clk_fast or posedge reset) begin
        if (reset || !locked) begin
            counter_fast <= 20'd0;
            blink_fast <= 1'b0;
        end else begin
            if (counter_fast >= COUNT_FAST - 1) begin
                counter_fast <= 20'd0;
                blink_fast <= ~blink_fast;
            end else begin
                counter_fast <= counter_fast + 1;
            end
        end
    end

endmodule