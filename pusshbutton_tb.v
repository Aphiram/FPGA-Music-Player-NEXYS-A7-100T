`timescale 1ns / 1ps

module button_interface_tb;

    // Constants
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk = 0;
    reg rst_n = 1;
    reg [4:0] buttons;
    wire play_pause, volume_up, volume_down, forward, backward;

    // Instantiate button interface module
    button_interface dut (
        .clk(clk),
        .rst_n(rst_n),
        .buttons(buttons),
        .play_pause(play_pause),
        .volume_up(volume_up),
        .volume_down(volume_down),
        .forward(forward),
        .backward(backward)
    );

    // Clock generation
    always #(CLK_PERIOD / 2) clk = ~clk;

    // Button input stimulus
    initial begin
        // Reset
        #100 rst_n = 0;
        #10 rst_n = 1;

        // Simulate button presses
        #10 buttons = 5'b00001; // Simulate pressing button 0
        #10 buttons = 5'b00010; // Simulate pressing button 1
        #10 buttons = 5'b00100; // Simulate pressing button 2
        #10 buttons = 5'b01000; // Simulate pressing button 3
        #10 buttons = 5'b10000; // Simulate pressing button 4

        // End simulation
        #10 $finish;
    end

endmodule
