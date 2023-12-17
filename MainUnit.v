`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 03:18:26 PM
// Design Name: 
// Module Name: MainUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/**
  * Main unit for the piano. Brings together 15 unique sound units with a alu and controls the changing of octaves. 
  * 
  * @param  sw        Input switches to toggle a sound being played 
  * @return JB        DAC Output 
  * @return led       Led Output to give visual for which audio is meant to be played 
  * @param  clk       10^8 MHZ Clock Signal 
  * @param  btnL      Left Button for moving down a octave 
  * @param  btnR      Right Button for moving up a octave 
  * @return seg       Segments for the Number Display to give a visual for the current octave 
  * @param  an        Annodes that let us chose to output the octave number to the right most digit
  *  
*/
module MainUnit(
    input [15:0] sw, 
    output [7:0] JB, 
    output [15:0] led, 
    input clk, 
    input btnL, btnR,
    output [6:0] seg, // segments
    output [3:0] an   // display specific anodes
    );
    integer i = 0; 
    reg [3:0] octave = 1; 
    
   // Changing of the octaves 
    always@ (posedge clk) begin 
        if ( i == 25000000) begin
            if (btnL) begin 
                octave = octave - 1; 
            end 
            if (btnR) begin
                octave = octave + 1; 
            end
            i = 0; 
        end 
        if ( octave == 8 ) begin 
            octave = 1; 
        end
        if ( octave == 0 ) begin 
            octave = 7; 
        end 
        i = i + 1; 
        
    end 
    // Output the Current Octave 
    BCDToLED vis(octave, seg[6:0], an[3:0]); 
    

    wire [7:0] output_wave; 
    // Different Sound Waves 

    wire [7:0] out4; 
    wire [7:0] out5; 
    wire [7:0] out6;
    wire [7:0] out7; 
    wire [7:0] out8;  
    wire [7:0] out9; 
    wire [7:0] out10;
    wire [7:0] out11; 
    wire [7:0] out12;   
    wire [7:0] out13; 
    wire [7:0] out14;
    wire [7:0] out15;
    // Creating each of the output sound waves 
    // Clock Freq is 10^8 
    // Pass in for X the Clock Freq/ Target Freq 
  
    // Target Freq 61.735 
    wire [7:0] out4_; 
    PianoSound BKey(clk, sw[4],32'd1619827, octave[3:0], out4_[7:0]); 
    assign out4[4:0] = out4_[4:0]; 
    // Omitting the last 3 bits if sw 0 is off ( Quiet Mode ) This allows us to merge signals together and have space to see them add proeprly 
    assign out4[7:5] = out4_[7:5] & {3{sw[0]}};
    
    // Target Freq 58.275
    wire [7:0] out5_; 
    PianoSound ASharpKey(clk, sw[5], 32'd1716002, octave[3:0], out5_[7:0]); 
    assign out5[4:0] = out5_[4:0]; 
    assign out5[7:5] = out5_[7:5] & {3{sw[0]}}; 

    // Target Freq 55.0
    wire [7:0] out6_; 
    PianoSound AKey(clk, sw[6], 32'd1818182, octave[3:0], out6_[7:0]); 
    assign out6[4:0] = out6_[4:0]; 
    assign out6[7:5] = out6_[7:5] & {3{sw[0]}}; 
    
    // Target Freq 51.913
    wire [7:0] out7_; 
    PianoSound GSharpKey(clk, sw[7], 32'd1926230, octave[3:0], out7_[7:0]); 
    assign out7[4:0] = out7_[4:0]; 
    assign out7[7:5] = out7_[7:5] & {3{sw[0]}}; 
 
    // Target Freq 48.999
    wire [7:0] out8_; 
    PianoSound GKey(clk, sw[8], 32'd2040858, octave[3:0], out8_[7:0]); 
    assign out8[4:0] = out8_[4:0]; 
    assign out8[7:5] = out8_[7:5] & {3{sw[0]}}; 
    
    // Target Freq 46.249
    // X = 2162209    
    wire [7:0] out9_; 
    PianoSound FSharpKey(clk, sw[9], 32'd2162209, octave[3:0], out9_[7:0]); 
    assign out9[4:0] = out9_[4:0]; 
    assign out9[7:5] = out9_[7:5] & {3{sw[0]}}; 
    
    // Target Freq 43.654
    // X = 2290741    
    wire [7:0] out10_; 
    PianoSound FKey(clk, sw[10], 32'd2290741, octave[3:0], out10_[7:0]); 
    assign out10[4:0] = out10_[4:0]; 
    assign out10[7:5] = out10_[7:5] & {3{sw[0]}}; 
    
    // Target Freq 41.203
    wire [7:0] out11_; 
    PianoSound EKey(clk, sw[11], 32'd2427008, octave[3:0], out11_[7:0]); 
    assign out11[4:0] = out11_[4:0]; 
    assign out11[7:5] = out11_[7:5] & {3{sw[0]}}; 
    
    // Target Freq 38.891
    wire [7:0] out12_; 
    PianoSound DSharpKey(clk, sw[12], 32'd2571289, octave[3:0], out12_[7:0]); 
    assign out12[4:0] = out12_[4:0]; 
    assign out12[7:5] = out12_[7:5] & {3{sw[0]}}; 
    
    // Target Freq 36.708
    // X = 2724202    
    wire [7:0] out13_; 
    PianoSound DKey(clk, sw[13], 32'd2724202, octave[3:0], out13_[7:0]); 
    assign out13[4:0] = out13_[4:0]; 
    assign out13[7:5] = out13_[7:5] & {3{sw[0]}};
    
    // Target Freq 34.648
    wire [7:0] out14_; 
    PianoSound CSharpKey(clk, sw[14], 32'd2886169, octave[3:0], out14_[7:0]); 
    assign out14[4:0] = out14_[4:0]; 
    assign out14[7:5] = out14_[7:5] & {3{sw[0]}}; 
    
    // Target Freq 32.703
    wire [7:0] out15_; 
    PianoSound CKey(clk, sw[15], 32'd3057823, octave[3:0], out15_[7:0]); 
    assign out15[4:0] = out15_[4:0]; 
    assign out15[7:5] = out15_[7:5] & {3{sw[0]}};  

    // Choording signals together 
    assign JB[7:0] = out4[7:0] + out5[7:0] + out6[7:0] + out7[7:0] + out8[7:0] + out9[7:0] + out10[7:0] + out11[7:0] + out12[7:0] + out13[7:0] + out14[7:0] + out15[7:0];     
    // Giving LED Visual for the output sound waves 
    assign led[15] = ~(out15[7:0] == 0); 
    assign led[14] = ~(out14[7:0] == 0);
    assign led[13] = ~(out13[7:0] == 0);
    assign led[12] = ~(out12[7:0] == 0);
    assign led[11] = ~(out11[7:0] == 0);
    assign led[10] = ~(out10[7:0] == 0);
    assign led[9] = ~(out9[7:0] == 0);
    assign led[8] = ~(out8[7:0] == 0);
    assign led[7] = ~(out7[7:0] == 0);
    assign led[6] = ~(out6[7:0] == 0);
    assign led[5] = ~(out5[7:0] == 0); 
    assign led[4] = ~(out4[7:0] == 0);
    
//    assign led[15:14] = L[2:1];
    assign led[0] = sw[0]; 
    
    
 
endmodule
