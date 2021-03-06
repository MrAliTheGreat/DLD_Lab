`timescale 1ns/1ns
module TestBench();
  // Inputs
  reg ld , en , clk , rst , DownUp;
  reg A_LSB , B_LSB , C_LSB , D_LSB , A_MSB , B_MSB , C_MSB , D_MSB;
  
  // Outputs
  wire outA_LSB , outB_LSB , outC_LSB , outD_LSB , outA_MSB , outB_MSB , outC_MSB , outD_MSB;
  wire pulse_clk , outMaxMin , rippleClk_LSB;
  
  Oscillator cut_oscillator(clk , rst , pulse_clk);
  
  part3_2 cut_divider(
	 .outD_LSB(outD_LSB),
	 .ld(ld),
	 .D_MSB(D_MSB),
	 .C_MSB(C_MSB),
	 .B_MSB(B_MSB),
	 .A_MSB(A_MSB),
	 .DownUp(DownUp),
	 .en(en),
	 .D_LSB(D_LSB),
	 .C_LSB(C_LSB),
	 .B_LSB(B_LSB),
	 .A_LSB(A_LSB),
	 .clk(pulse_clk),
	 .outC_LSB(outC_LSB),
	 .outB_LSB(outB_LSB),
	 .outA_LSB(outA_LSB),
	 .outD_MSB(outD_MSB),
	 .outC_MSB(outC_MSB),
	 .outB_MSB(outB_MSB),
	 .outA_MSB(outA_MSB),
	 .outMaxMin(outMaxMin),
	 .rippleClk_LSB(rippleClk_LSB)
	);
  
  always #10 clk =~ clk;
  
  initial begin
    clk = 0; rst = 1; ld = 0; en = 0; DownUp = 0;
    {D_LSB , C_LSB , B_LSB , A_LSB} = 4'b1110;
    {D_MSB , C_MSB , B_MSB , A_MSB} = 4'b1000;
    #50 rst = 0; ld = 1;
    #500000;
    $stop;
  end  
  
endmodule
