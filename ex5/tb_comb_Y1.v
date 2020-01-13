`timescale 10ns / 1ns
`include "comb_Y1.v"

module tb_comb_Y1();
  reg a, b, c;
  wire y;
  integer i;
  
  comb_Y1 c0 (y, a, b, c);
  
  initial
  begin
    {a,b,c} = 3'b0;
    for (i=0; i<8; i=i+1)
    begin
      {a,b,c} = i;
      #1;
    end
  end
  
  initial
    $monitor("time=%4t, ABC=%b, Y=%b",
              $time, {a,b,c}, y);
  
endmodule
 