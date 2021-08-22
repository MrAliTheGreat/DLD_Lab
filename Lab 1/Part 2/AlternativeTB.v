`timescale 1ns/1ns
module AlternativeTB();
  reg clk , rst;
  wire out;
  
  Alternative cut_alternative(clk , rst , out);
  
  always #10 clk =~clk;
  
  initial begin
    clk = 0;
    rst = 1;
    #20 rst = 0;
    #500000;
    $stop;
  end
endmodule
