`timescale 1ns / 1ps


module Song_logic2(
    input            clk_100MHz,           // Clock 
    output reg [7:0] tune2,     // Speaker output
    input            w_btn2 
            
    );
    
// decalring wire variables
    wire e5,d5,fS,gS,cS5,e,b,d,a,cS;
    
    //tone 2
    //calling submodules
    e5_660Hz   t_e5(.clk_100MHz(clk_100MHz), .o_660Hz(e5)); 
    d5_588Hz   t_d5(.clk_100MHz(clk_100MHz), .o_588Hz(d5));
    fS_370Hz   t_fS(.clk_100MHz(clk_100MHz), .o_370Hz(fS));
    gS_415Hz   t_gS (.clk_100MHz(clk_100MHz), .o_415Hz(gS)); //--
    cS5_554Hz  t_cS5(.clk_100MHz(clk_100MHz), .o_554Hz(cS5));
    e_330Hz   t_e(.clk_100MHz(clk_100MHz), .o_330Hz(e));
    b_494Hz  t_b(.clk_100MHz(clk_100MHz), .o_494Hz(b));
    d_294Hz   t_d(.clk_100MHz(clk_100MHz), .o_294Hz(d));
    a_440Hz   t_a (.clk_100MHz(clk_100MHz), .o_440Hz(a));//---
    cS_277Hz  t_cS(.clk_100MHz(clk_100MHz), .o_277Hz(cS));

    
    // Song Note Delays
    parameter CLK_FREQ = 100_000_000;                   // 100MHz
    parameter integer D_500ms = 0.20000000 * CLK_FREQ;  // 200ms
    parameter integer D_1000ms =0.40000000 * CLK_FREQ;  // 400ms // D_1000 == 400ms 
    parameter integer D_2000ms =0.60000000 * CLK_FREQ;  // 600ms
   
    // Note Break Delay
    parameter integer D_break = 0.10000000 * CLK_FREQ;  // 100ms
    
    // Registers for Delays
    reg [25:0] count = 26'b0;
    reg counter_clear = 1'b0;
    reg flag_500ms = 1'b0;
    reg flag_1000ms = 1'b0;
    reg flag_2000ms = 1'b0;
    reg  flag_break = 1'b0;
   
    // State Machine Register
    reg [31:0] state = "idle";
    
    always @(posedge clk_100MHz) begin
        // reaction to counter_clear signal
        if(counter_clear) begin
            count <= 26'b0;
            counter_clear <= 1'b0;
            flag_500ms  <= 1'b0;
            flag_1000ms <= 1'b0;
            flag_2000ms <= 1'b0;
            flag_break  <= 1'b0;
        end
        
        // set flags based on count
        if(!counter_clear) begin
            count <= count + 1;
            if(count == D_break) begin
                flag_break <= 1'b1;
            end
            if(count == D_1000ms) begin
                flag_1000ms <= 1'b1;
            end
            if(count == D_2000ms) begin
                flag_2000ms <= 1'b1;
            end
            if(count == D_500ms) begin
                flag_500ms <= 1'b1;
            end
        end
       
        // State Machine
        case(state)
            "idle" : begin
                counter_clear <= 1'b1;
                if(w_btn2) begin
                    state <= "n1";
                end    
            end
            
            "n1" : begin
                if(flag_500ms) begin
                    counter_clear <= 1'b1;
                    state <= "b1";
                end
            end
            
            "b1" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n2";
                end
            end
        
            "n2" : begin
                if(flag_500ms) begin
                    counter_clear <= 1'b1;
                    state <= "b2";
                end
            end
        
            "b2" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n3";
                end
            end
        
            "n3" : begin
                if(flag_1000ms) begin
                    counter_clear <= 1'b1;
                    state <= "b3";
                end
            end
        
            "b3" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n4";
                end
            end
        
            "n4" : begin
                if(flag_1000ms) begin
                    counter_clear <= 1'b1;
                    state <= "b4";
                end
            end
        
            "b4" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n5";
                end
            end
        
            "n5" : begin
                if(flag_500ms) begin
                    counter_clear <= 1'b1;
                    state <= "b5";
                end
            end
        
            "b5" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n6";
                end
            end
        
            "n6" : begin
                if(flag_500ms) begin
                    counter_clear <= 1'b1;
                    state <= "b6";
                end
            end
            
            "b6" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n7";
                end
            end
            
            "n7" : begin
                if(flag_1000ms) begin
                    counter_clear <= 1'b1;
                    state <= "b7";
                end
            end
            
            "b7" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n8";
                end
            end
            
            "n8" : begin
                if(flag_1000ms) begin
                    counter_clear <= 1'b1;
                    state <= "b8";
                end
            end
            
            "b8" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n9";
                end
            end
            
            "n9" : begin
                if(flag_500ms) begin
                    counter_clear <= 1'b1;
                    state <= "b9";
                end
            end
        
            "b9" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n10";
                end
            end
            
            "n10" : begin
                if(flag_500ms) begin
                    counter_clear <= 1'b1;
                    state <= "b10";
                end
            end
            
            "b10" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n11";
                end
            end
            
            "n11" : begin
                if(flag_1000ms) begin
                    counter_clear <= 1'b1;
                    state <= "b11";
                end
            end
            
            "b11" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n12";
                end
            end
            
            "n12" : begin
                if(flag_1000ms) begin
                    counter_clear <= 1'b1;
                    state <= "b12";
                end
            end
            
            "b12" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "n13";
                end
            end
            
            "n13" : begin
                if(flag_2000ms) begin
                    counter_clear <= 1'b1;
                    state <= "b13";
                end
            end
        
            "b13" : begin
                if(flag_break) begin
                    counter_clear <= 1'b1;
                    state <= "idle";
                end
            end
                                      
        endcase                
    end
    
    always @(posedge clk_100MHz) 
    
    begin
    // Output to speaker
      
     tune2 =         (state=="n1" || state=="n8" || state=="n12" ) ? e5:   
		             (state=="n2" || state=="n8" || state=="n12" ) ? d5: 
                     (state=="n3" || state=="n7" )                 ? fS:                                               
                     (state=="n4" )                                ? gS:    
                     (state=="n5" )                                ? cS5:   
 		             (state=="n6" || state=="n9" )                 ? b:   
		             (state=="n7" )                                ? d:   
                     (state=="n8" || state=="n12")                 ? e:                                            
                     (state=="n10" || state=="n13")                ? a :                                                                          
                     (state=="n11")                                ? cS: 0;
  
   end
             
    
endmodule
