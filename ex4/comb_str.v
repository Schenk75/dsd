module comb_str(Y, A, B, C, D);
  output Y;
  input A, B, C, D;
  wire [3:0] out;
  
  not u0 (out[0], D);
  or u1 (out[1], A, D);
  and u2 (out[2], B, C, out[0]);
  not u3 (out[3], out[1]);
  and u4 (Y, out[3], out[2]);
  
endmodule
