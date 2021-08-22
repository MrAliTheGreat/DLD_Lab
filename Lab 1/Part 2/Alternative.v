`timescale 1us/1us

module Alternative#(parameter Resistor1 = 1 , parameter Resistor2 = 50 , parameter capacitor = 10)(input clk , rst , output reg pulse); 
  localparam integer onduration = ((Resistor1 + Resistor2) * capacitor * 0.693); 
	localparam integer offduration = ( Resistor2 * capacitor * 0.693);
	integer count_on;
	integer count_off;
	
	always@(posedge clk , posedge rst) begin
	  if(rst)
	    pulse <= 0;
	  else begin
	     for(count_on = 0 ; count_on < onduration ; count_on = count_on + 1) begin
	       #0.7;
	       pulse <= 1'b1;
	     end
	     
	     for(count_off = 0 ; count_off < offduration ; count_off = count_off + 1) begin
	       #0.7;
	       pulse <= 1'b0;
	     end
	     count_on = 0;
	     count_off = 0;
	  end
	  
	end

endmodule                      

