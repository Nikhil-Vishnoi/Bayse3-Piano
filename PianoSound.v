`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 09:02:40 PM
// Design Name: 
// Module Name: PianoSound.v
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
 * This Module is a Piano Wave form credited from the following stack overflow post 
 * https://dsp.stackexchange.com/questions/46598/mathematical-equation-for-the-sound-wave-that-a-piano-makes
 * The purpose of this module is to abstract the sound_wave for each not to save storage space on the fpga
 *
 * @param    clk         100MHz Clock Signal used to iterate through our sound wave 
 * @param    on          input from switch telling us if this sound should be playing or not 
 * @param    Z           an integer telling us the frequency ratio of clock to target  
 * @param    octave      a 4bit number that symbolizes which octave of the piano we are on octave runs from (1, 7)
 * @return   sound_wave  Output Register that has the current soundwave value written to it 
*/
module PianoSound(
    input clk, on,
    input [31:0] Z,
    input[4:0] octave,
    output reg [7:0] sound_wave 
    );
    real base_freq; 
    // Sound Wave that is going to be read from 
    // Values for this sound wave are defined in the bottom of this module 
    reg[7:0] sound_wave_stored[100:0]; 
    integer index = 0; 
    integer wave_length = 100; 
    always@ (posedge clk) begin 
        if(on==1'b1) begin 
            // Go through the wave
            // This makes it so when choord is 0001 it is playing the corrosponding frequency 
            // for a note like A1 
            // sound_wave <= sound_wave_stored[index/(clock_freq/wave_length/base_freq)]; 

            sound_wave <= sound_wave_stored[index/(Z/wave_length)]; 
            // This makes it so every time the choord is increased by 1 the corrosponding 
            // not frequencies doubles which is similar to a real piano
            if ( octave == 4'd1) begin 
                index = index + 1; 
            end 
            else if ( octave == 4'd2) begin 
                index = index + 2; 
            end 
            else if ( octave == 4'd3) begin 
                index = index + 4;
            end 
            else if ( octave == 4'd4) begin 
                index = index + 8;
            end      
            else if ( octave == 4'd5) begin 
                index = index + 16;
            end
            else if ( octave == 4'd6) begin 
                 index = index + 32; 
            end 
            else if ( octave == 4'd7) begin 
                index = index + 64;            
            end 
            // Catch index out of bounds 
            if (index >= wave_length * (Z/wave_length) ) begin 
                index = 0; 
            end
            
        end 
        else if (on == 1'b0) begin 
            // Do nothing here 
            sound_wave = 0; 
            index = 0; 
        end 
    
    end 
    
    // Setting the values for the sound_wave_stored 
    initial begin


sound_wave_stored[ 1 ] =  4 ;

sound_wave_stored[ 2 ] =  8 ;

sound_wave_stored[ 3 ] =  11 ;

sound_wave_stored[ 4 ] =  15 ;

sound_wave_stored[ 5 ] =  19 ;

sound_wave_stored[ 6 ] =  23 ;

sound_wave_stored[ 7 ] =  27 ;

sound_wave_stored[ 8 ] =  30 ;

sound_wave_stored[ 9 ] =  34 ;

sound_wave_stored[ 10 ] =  37 ;

sound_wave_stored[ 11 ] =  40 ;

sound_wave_stored[ 12 ] =  43 ;

sound_wave_stored[ 13 ] =  46 ;

sound_wave_stored[ 14 ] =  49 ;

sound_wave_stored[ 15 ] =  51 ;

sound_wave_stored[ 16 ] =  54 ;

sound_wave_stored[ 17 ] =  56 ;

sound_wave_stored[ 18 ] =  57 ;

sound_wave_stored[ 19 ] =  59 ;

sound_wave_stored[ 20 ] =  60 ;

sound_wave_stored[ 21 ] =  61 ;

sound_wave_stored[ 22 ] =  62 ;

sound_wave_stored[ 23 ] =  63 ;

sound_wave_stored[ 24 ] =  63 ;

sound_wave_stored[ 25 ] =  64 ;

sound_wave_stored[ 26 ] =  63 ;

sound_wave_stored[ 27 ] =  63 ;

sound_wave_stored[ 28 ] =  62 ;

sound_wave_stored[ 29 ] =  61 ;

sound_wave_stored[ 30 ] =  60 ;

sound_wave_stored[ 31 ] =  59 ;

sound_wave_stored[ 32 ] =  57 ;

sound_wave_stored[ 33 ] =  56 ;

sound_wave_stored[ 34 ] =  54 ;

sound_wave_stored[ 35 ] =  51 ;

sound_wave_stored[ 36 ] =  49 ;

sound_wave_stored[ 37 ] =  46 ;

sound_wave_stored[ 38 ] =  43 ;

sound_wave_stored[ 39 ] =  40 ;

sound_wave_stored[ 40 ] =  37 ;

sound_wave_stored[ 41 ] =  34 ;

sound_wave_stored[ 42 ] =  30 ;

sound_wave_stored[ 43 ] =  27 ;

sound_wave_stored[ 44 ] =  23 ;

sound_wave_stored[ 45 ] =  19 ;

sound_wave_stored[ 46 ] =  15 ;

sound_wave_stored[ 47 ] =  11 ;

sound_wave_stored[ 48 ] =  8 ;

sound_wave_stored[ 49 ] =  4 ;

sound_wave_stored[ 50 ] =  0 ;

sound_wave_stored[ 51 ] =  -4 ;

sound_wave_stored[ 52 ] =  -8 ;

sound_wave_stored[ 53 ] =  -11 ;

sound_wave_stored[ 54 ] =  -15 ;

sound_wave_stored[ 55 ] =  -19 ;

sound_wave_stored[ 56 ] =  -23 ;

sound_wave_stored[ 57 ] =  -27 ;

sound_wave_stored[ 58 ] =  -30 ;

sound_wave_stored[ 59 ] =  -34 ;

sound_wave_stored[ 60 ] =  -37 ;

sound_wave_stored[ 61 ] =  -40 ;

sound_wave_stored[ 62 ] =  -43 ;

sound_wave_stored[ 63 ] =  -46 ;

sound_wave_stored[ 64 ] =  -49 ;

sound_wave_stored[ 65 ] =  -51 ;

sound_wave_stored[ 66 ] =  -54 ;

sound_wave_stored[ 67 ] =  -56 ;

sound_wave_stored[ 68 ] =  -57 ;

sound_wave_stored[ 69 ] =  -59 ;

sound_wave_stored[ 70 ] =  -60 ;

sound_wave_stored[ 71 ] =  -61 ;

sound_wave_stored[ 72 ] =  -62 ;

sound_wave_stored[ 73 ] =  -63 ;

sound_wave_stored[ 74 ] =  -63 ;

sound_wave_stored[ 75 ] =  -64 ;

sound_wave_stored[ 76 ] =  -63 ;

sound_wave_stored[ 77 ] =  -63 ;

sound_wave_stored[ 78 ] =  -62 ;

sound_wave_stored[ 79 ] =  -61 ;

sound_wave_stored[ 80 ] =  -60 ;

sound_wave_stored[ 81 ] =  -59 ;

sound_wave_stored[ 82 ] =  -57 ;

sound_wave_stored[ 83 ] =  -56 ;

sound_wave_stored[ 84 ] =  -54 ;

sound_wave_stored[ 85 ] =  -51 ;

sound_wave_stored[ 86 ] =  -49 ;

sound_wave_stored[ 87 ] =  -46 ;

sound_wave_stored[ 88 ] =  -43 ;

sound_wave_stored[ 89 ] =  -40 ;

sound_wave_stored[ 90 ] =  -37 ;

sound_wave_stored[ 91 ] =  -34 ;

sound_wave_stored[ 92 ] =  -30 ;

sound_wave_stored[ 93 ] =  -27 ;

sound_wave_stored[ 94 ] =  -23 ;

sound_wave_stored[ 95 ] =  -19 ;

sound_wave_stored[ 96 ] =  -15 ;

sound_wave_stored[ 97 ] =  -11 ;

sound_wave_stored[ 98 ] =  -8 ;

sound_wave_stored[ 99 ] =  -4 ;


    end 
    
        
    
    
endmodule
