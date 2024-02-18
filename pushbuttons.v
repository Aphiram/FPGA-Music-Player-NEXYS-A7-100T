    module button_interface (
    input wire clk,               // Clock input
    input wire rst_n,            // Reset input (active-low)
    input wire [4:0] buttons,   // Input buttons
    output reg play_pause,     // Output for play/pause control
    output reg volume_up,      // Output for volume up control
    output reg volume_down,   // Output for volume down control
    output reg forward,        // Output for forward control
    output reg backward        // Output for backward control
);

    // Internal state registers for debouncing
    reg [4:0] buttons_prev;
    reg [4:0] buttons_debounced;
    reg [3:0] debounce_counter;

    // Button debouncing process
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            buttons_prev <= 5'b0;
            buttons_debounced <= 5'b0;
            debounce_counter <= 4'b0;
        end else begin
            // Shift in current button values
            buttons_prev <= {buttons_prev[3:0], buttons};

            // Increment debounce counter
            if (debounce_counter < 4'd15) begin
                debounce_counter <= debounce_counter + 1;
            end

            // Debounce logic
            if (debounce_counter == 4'd15) begin
                buttons_debounced <= buttons_prev;
            end
        end
    end

    // Button control logic
    always @* begin
        // Play/pause control
        if (buttons_debounced[0] && !buttons_prev[0]) begin
            play_pause <= ~play_pause;
        end

        // Volume up control
        if (buttons_debounced[1] && !buttons_prev[1]) begin
            volume_up <= 1'b1;
        end else begin
            volume_up <= 1'b0;
        end

        // Volume down control
        if (buttons_debounced[2] && !buttons_prev[2]) begin
            volume_down <= 1'b1;
        end else begin
            volume_down <= 1'b0;
        end

        // Forward control
        if (buttons_debounced[3] && !buttons_prev[3]) begin
            forward <= 1'b1;
        end else begin
            forward <= 1'b0;
        end

        // Backward control
        if (buttons_debounced[4] && !buttons_prev[4]) begin
            backward <= 1'b1;
        end else begin
            backward <= 1'b0;
        end
    end

endmodule
