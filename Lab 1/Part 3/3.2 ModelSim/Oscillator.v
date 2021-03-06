`timescale 1ns/1ns
module Oscillator#(parameter num_invs = 3 , parameter inv_delay = 35.8)(input clk , rst , output reg pulse);
  integer i;
  reg temp;
  
  always@(posedge clk , posedge rst) begin
    if(rst) begin
      temp <= 0;
      pulse <= 0;
    end else begin
      for(i = 0 ; i < num_invs ; i = i + 1) begin
        // 6*D = 0.215 us = 215 ns -> D = 215/6 = 35.8 ns --> LTSpice
        #inv_delay
        temp =~ temp;
      end
      pulse <= temp;
    end
    
  end
  
endmodule


