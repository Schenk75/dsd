module mux2x1(output dout, input sel, input [1:0] din);
  
  bufif0 b1 (dout, din[0], sel);
  bufif1 b2 (dout, din[1], sel);
  
endmodule
  