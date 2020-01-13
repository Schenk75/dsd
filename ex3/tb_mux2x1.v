`timescale 10ns / 1ns
`include "mux2x1.v"

module tb_mux2x1();
  reg p_sel;
  reg [1:0] p_din;
  wire p_dout;
  integer i, j;
  
  mux2x1 m (p_dout, p_sel, p_din);
  
  initial
  begin
    p_din = 2'b0;
    p_sel = 1'b0;
    for (i=0; i<2; i=i+1)
    begin
      for (j=0; j<4; j=j+1)
      begin
        p_sel = i;
        p_din = j;
        #10;
      end
    end
  end
  
endmodule
