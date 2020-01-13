`timescale 10ns / 1ns
`include "mux4x1.v"

module tb_mux4x1();
  reg [3:0] p_din;
  reg [1:0] p_sel;
  wire p_dout;
  integer i, j;
  
  mux4x1 m (p_dout, p_sel, p_din);
  
  initial
  begin
    p_sel = 2'b0;
    p_din = 4'b0;
    for (i=0; i<4; i=i+1)
    begin
      for (j=0; j<16; j=j+1)
      begin
        p_sel = i;
        p_din = j;
        #1;
      end
    end
  end
  
endmodule

