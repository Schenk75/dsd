`include "mux2x1.v"

module mux4x1(output dout, 
              input [1:0] sel, 
              input [3:0] din);
  wire out0, out1, sel_tmp;
  
  mux2x1 m0 (out0, sel[0], {din[3], din[0]});
  mux2x1 m1 (out1, sel[1], {din[2], din[1]});
  xor x (sel_tmp, sel[0], sel[1]);
  mux2x1 m2 (dout, sel_tmp, {out1, out0});
  
endmodule
