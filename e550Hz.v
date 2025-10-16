`timescale 1ns / 1ps

module e5_660Hz(
    input clk_100MHz,
    output o_660Hz     
    );
    
    // 100MHz / 113,636 / 2 = 440.0014Hz
    reg r_660Hz;
    reg [16:0] r_counter = 0;
    
    always @(posedge clk_100MHz)
        if(r_counter == 17'd75758) begin
            r_counter <= 0;
            r_660Hz <= ~r_660Hz;
            end
        else
            r_counter <= r_counter + 1;

    assign o_660Hz = r_660Hz;
    
endmodule
