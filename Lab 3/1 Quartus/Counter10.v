`timescale 1ns/1ns
module Counter10(input clk , rst , output reg [9:0] out_count);
  always @(posedge clk , posedge rst) begin
    if(rst)
      out_count <= 10'b0;
    else
      out_count <= out_count + 1;
  end
endmodule