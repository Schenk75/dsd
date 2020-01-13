`timescale 10ns / 1ns
`include "comb_Y2.v"

module tb_comb_Y2();
  reg a, b, c, d;
  wire y;
  integer i;
  
  comb_Y2 c0 (y, a, b, c, d);
  
  initial
  begin
    {a,b,c,d} = 4'b0;
    for (i=0; i<16; i=i+1)
    begin
      {a,b,c,d} = i;
      #1;
    end
  end
  
  initial
    $monitor("time=%4t, ABCD=%b, Y=%b",
              $time, {a,b,c,d}, y);
  
endmodule
