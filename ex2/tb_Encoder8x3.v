`timescale 10ns / 1ns
`include "Encoder8x3.v"

module tb_Encoder8x3;
  wire [2:0] p_code;
  reg [7:0] p_data;
  
  Encoder8x3 encoder(p_code, p_data);
  
  initial
  begin
    p_data = 8'b0000_0001;
    #10 p_data = 8'b0000_0010;
    #10 p_data = 8'b0000_0100;
    #10 p_data = 8'b0000_1000;
    #10 p_data = 8'b0001_0000;
    #10 p_data = 8'b0010_0000;
    #10 p_data = 8'b0100_0000;
    #10 p_data = 8'b1000_0000;
    #10 $stop;
  end
  
  initial $monitor("data=%b, code=%d", p_data, p_code);
endmodule
