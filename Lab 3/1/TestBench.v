`timescale 1ns/1ns
module TestBench();
  reg clk , rst;
  reg [2:0] func;
  wire [7:0] waveForm;
  
  WaveGenerator cut_waveGenerator(clk , rst , func , waveForm);
  
  always #10 clk =~ clk;
  
  initial begin
    clk = 0; rst = 1; func = 3'b110;
    #20 rst = 0;
    #50000
    $stop;
  end

endmodule
