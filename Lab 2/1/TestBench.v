`timescale 1ns/1ns
module TestBench();
  reg clk , rst , psi;
  reg [7:0] setPeriod;
  wire [7:0] adjustedDiv;
  
  FrequencyRegulator cut_regulator(clk , rst , psi , setPeriod , adjustedDiv);
  
  always #10 clk =~ clk;
  always #25 psi =~ psi;
  
  initial begin
    clk = 1; rst = 1;
    #20 rst = 0; setPeriod = 125; psi = 0;
    #5000
    $stop;
  end
  
endmodule
