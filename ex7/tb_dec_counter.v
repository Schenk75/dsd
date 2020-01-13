`timescale 10ns / 1ns
`include "dec_counter.v"

module tb_dec_counter();
reg p_clk, p_reset;
wire [3:0] p_count;

dec_counter d1 (p_count, p_clk, p_reset);

//generate clock signal
initial
begin
  p_clk = 1'b0;
  forever #5 p_clk = ~p_clk;
end

//generate reset signal
initial
begin
  p_reset = 1'b1;
  #9 p_reset = 1'b0;
  #20 p_reset = 1'b1;
  #30 p_reset = 1'b0;
end
initial
  #200 $stop;
initial
  $monitor("time=%t, count=%d, reset=%b", $time, p_count[3:0], p_reset);
endmodule
