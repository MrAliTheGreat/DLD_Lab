`timescale 1ns/1ns
module TestBench();
  reg en;
  wire pulse;
  
  reg FPGA_clk , FPGA_rst , ld_counter_regulator , generator_rst;
  reg [12:0] SW;
  wire out_psi;
  wire [7:0] waveForm , out_adjustedDiv;
  wire [15:0] out_duration;
  
  // Ring oscillator for frequency divider
  ring_oscillator cut_oscillator(en , pulse);
  
  // Main circuit from Quartus
  waveFromGenerator cut_circuit(
   .out_psi(out_psi),
   .FPGA_clk(FPGA_clk),
   .FPGA_rst(FPGA_rst),
   .SW(SW),
   .oscillator_clk(pulse),
   .ld_counter(ld_counter_regulator),
   .out_adjustedDiv(out_adjustedDiv),
   .out_duration(out_duration),
	 .waveForm(waveForm),
	 .generator_rst(generator_rst)
	 );

  // FPGA clock
  always #10 FPGA_clk =~ FPGA_clk;
  
  initial begin
    // SW -> [12:11] amplifier , [10:8] func , [7:0] setPeriod
    generator_rst = 1; SW = 13'b0011101111101;
    //Get PSI to correct frequency
    en = 0; ld_counter_regulator = 0; FPGA_clk = 0; FPGA_rst = 1;
    #40 en = 1; FPGA_rst = 0; ld_counter_regulator = 1;
    #800000
    // Now it's time to output desired wave form
    #20 generator_rst = 0;
    #5000000
    $stop;
  end
  
endmodule
