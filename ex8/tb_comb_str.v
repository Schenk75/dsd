`timescale 10ns / 1ns
`include "comb_str.v"

module tb_comb_str();
reg p_sel, a, b, c, d;
wire p_y;
integer i, j;

comb_str c1 (p_y, p_sel, a, b, c, d);

initial 
begin
  for (i=0; i<2; i=i+1)
  begin
    for (j=0; j<16; j=j+1) 
    begin
      p_sel = i;
      {a, b, c, d} = j;
      #10;
    end
  end
end

initial
  $monitor("time=%t, y=%b, sel=%b, ABCD=%b",
	    $time, p_y, p_sel, {a,b,c,d});

endmodule
