`timescale 10ns / 1ns
`include "filter.v"

module tb_filter();
reg clk, rst, in;
wire out;

filter f1 (out, clk, rst, in);

initial
begin
  clk = 1'b0;
  forever #5 clk = ~clk;
end

initial
begin
  rst = 1'b0;
  #15 rst = 1'b1;
  #60 rst = 1'b0;
  #10 rst = 1'b1;
end

initial
begin
  in = 1'b1; 
  #200 in = ~in;
  #200 in = ~in;
end

initial #500 $stop;

initial $monitor("time=%t, sig_out=%b, reset=%b, sig_in=%b", $time, out, rst, in);
endmodule
