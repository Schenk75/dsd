`timescale 10ns / 1ns
`include "ALU.v"

module tb_ALU();
reg [2:0] oper;
reg [7:0] a;
reg [7:0] b;
reg c_in;
wire c_out;
wire [7:0] sum;
integer i;

reg [7:0] temp;
reg out;

ALU a1 (c_out, sum, oper, a, b, c_in);

initial
begin
  c_in = 1'b1;
  a = 8'b1011_1101;
  b = 8'b1101_1011;
  {out, temp} = 8'hbd + 8'h24 + 1'b1;
end

initial
begin
  for (i=0; i<8; i=i+1)
  begin
    oper = i;
    #5;
  end
end

initial $monitor("time=%t, c_out=%b, sum=%b, oper=%b, a=%b, b=%b, c_in=%b", 
                  $time, c_out, sum, oper, a, b, c_in);

endmodule
