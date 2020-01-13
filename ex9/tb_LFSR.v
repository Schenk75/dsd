`timescale 10ns/1ns
`include "LFSR.v"

module tb_LFSR();
reg p_clk, p_rst, p_load;
reg [1:26] p_din;
wire [1:26] p_q;

LFSR l1 (p_q, p_clk, p_rst, p_load, p_din);

initial
begin
  p_clk = 1'b0;
  forever #5 p_clk = ~p_clk;
end

initial
begin
  p_rst = 1'b0;
  #8 p_rst = 1'b1;
end

initial
begin
  p_load = 1'b0; 
  p_din = 26'b0; 

  #88 p_load = 1'b1; 
  p_din = 26'b1100_1011_1000_1101_1001_1111_10; 
  #10 p_load = 1'b0; 

  #50 p_load = 1'b1; 
  p_din = 26'b0; 
  #10 p_load = 1'b0;
end

initial #300 $stop;

initial $monitor("time=%tns, q = %b, rst_n = %b, load = %b, din = %b", $time, p_q, p_rst, p_load, p_din);
endmodule
