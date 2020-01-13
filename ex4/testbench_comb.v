`timescale 10ns / 1ns
`include "comb_str.v"
`include "comb_dataflow.v"
`include "comb_behavior.v"
`include "comb_prim.v"

module testbench_comb();
  reg a, b, c, d;
  wire y_str, y_dataflow, y_behavior, y_prim;
  integer i;
  
  comb_str c0 (y_str, a, b, c, d);
  comb_dataflow c1 (y_dataflow, a, b, c, d);
  comb_behavior c2 (y_behavior, a, b, c, d);
  comb_prim c3 (y_prim, a, b, c, d);
  
  initial
  begin
    {a, b, c, d} = 4'b0;
    for (i=0; i<16; i=i+1)
    begin
      {a, b, c, d} = i;
      #1;
    end
  end
  
  initial
    $monitor("time=%4t, ABCD=%b, Y_str=%b, Y_dataflow=%b, Y_behavior=%b, Y_prim=%b",
              $time, {a, b, c, d}, y_str, y_dataflow, y_behavior, y_prim);
endmodule