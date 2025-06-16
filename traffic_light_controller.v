module traffic_light_controller (
    input clk,          // Clock input
    input reset,        // Reset input
    output reg [2:0] light // 3-bit output for lights (Red, Yellow, Green)
);

    // State encoding
    parameter RED = 3'b001;
    parameter YELLOW = 3'b010;
    parameter GREEN = 3'b100;

    // State variable
    reg [2:0] state;

    // Timing parameters
    integer count;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= RED; // Start with Red light
            count <= 0;
        end else begin
            count <= count + 1;
            case (state)
                RED: begin
                    if (count >= 50) begin // Adjust timing as needed
                        state <= GREEN;
                        count <= 0;
                    end
                end
                GREEN: begin
                    if (count >= 30) begin
                        state <= YELLOW;
                        count <= 0;
                    end
                end
                YELLOW: begin
                    if (count >= 10) begin
                        state <= RED;
                        count <= 0;
                    end
                end
            endcase
        end
    end

    // Output logic
    always @(*) begin
        case (state)
            RED: light = 3'b001; // Red light on
            GREEN: light = 3'b100; // Green light on
            YELLOW: light = 3'b010; // Yellow light on
            default: light = 3'b000; // All lights off
        endcase
    end
endmodule


module tb_traffic_light_controller;

    reg clk;
    reg reset;
    wire [2:0] light;

    // Instantiate the traffic light controller
    traffic_light_controller tlc (
        .clk(clk),
        .reset(reset),
        .light(light)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        reset = 1; // Start with reset
        #10 reset = 0; // Release reset after 10 time units
        #300 $finish; // Stop simulation after 300 time units
    end

    // Monitor output
    initial begin
        $monitor("Time: %0d, Light: %b", $time, light);
    end
endmodule