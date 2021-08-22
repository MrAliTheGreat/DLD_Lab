`timescale 1ns/1ns
module AmplitudeSelector(input [1:0] sel , input [7:0] wave , output [7:0] final_wave);
  assign final_wave = (sel == 2'b00) ? wave :
                      (sel == 2'b01) ? wave / 2 :
                      (sel == 2'b10) ? wave / 4 :
                      (sel == 2'b11) ? wave / 8 : 8'bz;
endmodule
