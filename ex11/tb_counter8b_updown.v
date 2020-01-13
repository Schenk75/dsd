`timescale 10ns / 1ns
`include "counter8b_updown.v"

module tb_counter8b_updown();
reg clock, rst, dir;
wire [7:0] cnt;

counter8b_updown c1 (cnt, clock, rst, dir);

initial
begin
  clock = 1'b0;
  forever #5 clock = ~clock;
end

initial
begin
  rst = 1'b0;
  #66 rst = 1'b1;
  #13 rst = 1'b0;
end

initial
begin
  dir = 1'b1; 
  #200 dir = ~dir;
  #200 dir = ~dir;
end

initial #500 $stop;

initial $monitor("time=%t, count=%d, reset=%b, dir=%b", $time, cnt, rst, dir);
endmodule
