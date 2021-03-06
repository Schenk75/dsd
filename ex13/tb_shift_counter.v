`timescale 10ns / 1ns
`include "shift_counter.v"

module tb_shift_counter();
reg clock, rst;
wire [7:0] cnt;

shift_counter s1 (cnt, clock, rst);

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

initial #500 $stop;

initial $monitor("time=%t, count=%b, reset=%b", $time, cnt, rst);

endmodule