`timescale 1ns/1ns
module WaveGenerator#(parameter max_wave = 60 , min_wave = 10 , square_num_clks = 50 , num_clks_rectified = 203)
                     (input clk , rst , input [2:0] func , output [7:0] wave);
  
  reg signed [15:0] sin , cos;
  reg [7:0] counter;
  reg increase , decrease , make_min , make_max , make_counter_min , start , is_sin , positive , is_rhomboid , rising;
  integer count_clks_rect;
  
  always @(posedge clk , posedge rst) begin
    if(rst) begin
      {increase , decrease , make_min , make_max , is_sin , is_rhomboid , positive , make_counter_min , rising} = 9'b0;
      start = 1'b1;
      sin = 0; cos = 30000;
      count_clks_rect = 0;
    end else begin
      case(func)
        // Rhomboid
        3'b000: begin
          if(start)
            {increase , decrease , start , is_rhomboid , rising , positive} = 6'b100111;
          else if(rising) begin
            {increase , decrease} = 2'b10;
            if(counter == max_wave | counter == min_wave)
              rising = 0;
          end
          else begin
            {increase , decrease} = 2'b01;
            if(counter == (max_wave + min_wave) / 2)
              rising = 1;
          end 
          
          if(counter % 2 == 0)
            positive = 1'b1;
          else
            positive = 1'b0;          
        end
        // Sine
        3'b001: begin
          if(start)
            {start , is_sin , positive} = 3'b011;
          else begin
            sin = sin + cos / 64;
            cos = cos - sin / 64;
          end  
        end
        // Square
        3'b010: begin
          if(start)
            {increase , decrease , make_min , make_max , start} = 5'b10010;
          else if(counter % square_num_clks == 0 & make_max) begin
            {increase , decrease , make_min , make_max} = 4'b0110;
          end
          else if(counter % square_num_clks == 0 & make_min) begin
            {increase , decrease , make_min , make_max} = 4'b1001;            
          end
        end
        // Triangle
        3'b011: begin
          if(start)
            {increase , decrease , start} = 3'b100;
          else if(counter == min_wave)
            {increase , decrease} = 2'b10;
          else if(counter == max_wave)
            {increase , decrease} = 2'b01;
        end
        // Saw-tooth
        3'b100: begin
          if(start)
            {increase , decrease , make_min , make_max , make_counter_min , start} = 6'b100000;
          else if(counter == min_wave)
            {increase , decrease , make_min , make_max , make_counter_min} = 5'b10000;
          else if(counter == max_wave)
            {increase , decrease , make_min , make_max , make_counter_min} = 5'b00101;
        end
        // Full-wave rectified
        3'b101: begin
          if(start)
            {is_sin , start , positive} = 3'b101;
          else begin
            sin = sin + cos / 64;
            cos = cos - sin / 64;
            count_clks_rect = count_clks_rect + 1;
            if(count_clks_rect == num_clks_rectified) begin
              sin = 0; cos = 30000;
              count_clks_rect = 0;
            end
          end            
        end
        // Modulated sine wave
        3'b110: begin
          if(start)
            {increase , decrease , is_sin , start} = 4'b1010;
          else begin
            sin = sin + cos / 64;
            cos = cos - sin / 64;
            if(counter % 2 == 0)
              positive = 1'b1;
            else
              positive = 1'b0;
          end
        end
      endcase
    end
  end
  
  always @(posedge clk , posedge rst) begin
    if(rst)
      counter <= (max_wave + min_wave) / 2;
    else begin
      if(increase)
        counter <= counter + 1;
      else if(decrease)
        counter <= counter - 1;
      else if(make_counter_min)
        counter <= min_wave;
      else
        counter <= counter;
    end
  end
  
  assign wave = is_sin ? positive ? (sin[15:8] + 127) : -(sin[15:8] + 127) :
                is_rhomboid ? positive ? counter : (max_wave + min_wave - counter) : 
                make_max ? max_wave :
                make_min ? min_wave :
                counter;
  
endmodule


