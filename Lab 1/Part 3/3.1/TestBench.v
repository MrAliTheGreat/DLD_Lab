`timescale 1ns/1ns
module TestBench();
  reg clk , rst;
  wire out;
  
  Oscillator cut_oscillator(clk , rst , out);
  
  always #10 clk =~ clk;
  
  initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
    #5000;
    $stop;
  end
  
  
endmodule
