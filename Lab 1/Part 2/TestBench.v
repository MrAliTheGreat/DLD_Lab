`timescale 1ns/1ns
module TestBench();
  reg clk , rst;
  wire out;
  
  lm_555_timer cut_timer(clk , rst , out);
  
  always #10 clk =~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
    #50000;
    $stop;
  end
endmodule


