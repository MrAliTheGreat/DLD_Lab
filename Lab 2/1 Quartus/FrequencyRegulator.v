`timescale 1ns/1ns
module FrequencyRegulator(input clk , rst , psi , input [7:0] setPeriod , output reg [7:0] adjustedDiv , output[15:0] out_duration , output out_increase , out_decrease);
  // psi -> output max/min frequency divider after passing T Flip-Flop 
  // adjustedDiv -> ABCD values for counter
  // clk -> 50 MHz -> clk cycle length = 20 ns
  // setPeriod -> desired frequency
  
  reg prev_psi , increase , decrease;
  reg [15:0] counter;
  
  
  always @(posedge clk , posedge rst) begin : decide_when_to_count_and_count
    if(rst)
      counter <= 16'b0;
    else begin
      case({prev_psi , psi})
        2'b00: counter <= counter;
        2'b01: counter <= 16'b1;
        2'b10: counter <= counter;
        2'b11: counter <= counter + 1;
      endcase
    end
  end
  
  always @(prev_psi , psi) begin : comparison
    if({prev_psi , psi} == 2'b10) begin
      if(setPeriod < counter)
        {increase , decrease} = 2'b10;
      else if(setPeriod > counter)
        {increase , decrease} = 2'b01;
      else
        {increase , decrease} = 2'b00;
    end
  end
  
  always @(posedge clk , posedge rst) begin : increment_decrement
    if(rst)
      adjustedDiv <= 8'b01111111;
    else begin
      if({prev_psi , psi} == 2'b10) begin
        if(increase == 0 & decrease == 0)
          adjustedDiv <= adjustedDiv;
        if(increase)
          adjustedDiv <= adjustedDiv + 1'b1;
        else if(decrease)
          adjustedDiv <= adjustedDiv - 1'b1;
      end
    end
  end
  
  always @(posedge clk , posedge rst) begin : prev_psi_update
    if(rst)
      prev_psi <= 1'b0;
    else
      prev_psi <= psi;
  end
  
  // For showing that we have reached to target
  assign out_increase = increase;
  assign out_decrease = decrease;
  
  // Duration for seeing the number of clk cycles when psi is 1
  assign out_duration = counter;
  
endmodule
