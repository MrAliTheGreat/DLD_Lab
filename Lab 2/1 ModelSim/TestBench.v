`timescale 1ns/1ns
module TestBench();
  reg en;
  wire pulse;
  
  reg FPGA_clk , FPGA_rst , ld_counter;
  reg [7:0] setPeriod;
  wire outA_MSB , outB_MSB , outC_MSB , outD_MSB , outA_LSB , outB_LSB , outC_LSB , outD_LSB , input_signal , out_increase , out_decrease;
  wire [7:0] out_adjustedDiv;
  wire [15:0] out_duration;
  
  // Ring Oscillator clk is located in test bench (as mentioned in experiment 1)
  ring_oscillator cut_oscillator(en , pulse);
  
  Regulator cut_circuit(
	 .outD_LSB(outD_LSB),
	 .FPGA_clk(FPGA_clk),
	 .FPGA_rst(FPGA_rst),
	 .ld_counter(ld_counter),
	 .setPeriod(setPeriod),
	 .oscillator_clk(pulse),
	 .outC_LSB(outC_LSB),
	 .outB_LSB(outB_LSB),
	 .outA_LSB(outA_LSB),
	 .outD_MSB(outD_MSB),
	 .outC_MSB(outC_MSB),
	 .outB_MSB(outB_MSB),
	 .outA_MSB(outA_MSB),
	 .input_signal(input_signal),
	 .out_decrease(out_decrease),
	 .out_increase(out_increase),
	 .out_adjustedDiv(out_adjustedDiv),
	 .out_duration(out_duration)
	 );
  
  // FPGA clk -> 50 MHZ --> clk cycle length = 20 ns ---> each 1 or 0 in clk cycle = 10 ns
  always #10 FPGA_clk =~ FPGA_clk;
  
  initial begin
    en = 0; ld_counter = 0; FPGA_clk = 0; FPGA_rst = 1; setPeriod = 125;
    #40 en = 1; FPGA_rst = 0; ld_counter = 1;
    #1000000
    $stop;
  end
  
  
endmodule
