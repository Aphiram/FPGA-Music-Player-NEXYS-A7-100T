🎵 FPGA Music Player

A digital music player implemented on FPGA using Verilog, capable of playing predefined melodies through digital signal processing techniques.

📁 Project Structure


Multi-note Support: Generates 10 different musical frequencies
State Machine Controller: Sequential playback of musical notes
Precise Timing: Accurate note durations and pauses
Polyphonic Capability: Can play multiple notes simultaneously
FPGA Optimized: Efficient resource usage on Xilinx FPGAs

🎼 Supported Notes

Note	Frequency	Verilog Module
E5	660 Hz	e5_660Hz
D5	588 Hz	d5_588Hz
F#	370 Hz	fS_370Hz
G#	415 Hz	gS_415Hz
C#5	554 Hz	cS5_554Hz
E	330 Hz	e_330Hz
B	494 Hz	b_494Hz
D	294 Hz	d_294Hz
A	440 Hz	a_440Hz
C#	277 Hz	cS_277Hz

**🛠️ Technical Implementation**

Architecture

Clock Divider Design: Each tone generator uses counter-based frequency division
Finite State Machine: Controls note sequencing and timing
Synchronous Design: All logic synchronized to 100MHz clock
Resource Efficient: Minimal LUT and register usage
Key Modules

**Tone Generator**

verilog
module e5_660Hz(
    input clk_100MHz,
    output reg o_660Hz
);
    parameter COUNT_MAX = 75757;  // 100MHz / (660Hz * 2)
    // Clock division logic
endmodule

**Song Sequencer**

verilog
module Song_logic2(
    input clk_100MHz,
    input w_btn2,
    output reg [7:0] tune2
);
    // State machine with precise timing control
endmodule

Frequency Generation: Each note module divides the 100MHz system clock to create specific frequencies
State Machine: Controls the sequence and duration of notes
Timing Control: Uses precise counter-based timing for note durations (200ms, 400ms, 600ms)
Output Mixing: Combines multiple frequencies for polyphonic output
Timing Example



