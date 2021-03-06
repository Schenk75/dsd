module comb_str(y, sel, A, B, C, D);
output y;
input sel, A, B, C, D;
wire out1, out2;

nand #(3) n1 (out1, A, B);
nand #(4) n2 (out2, C, D);
bufif0 b1 (y, out1, sel);
bufif1 b2 (y, out2, sel);

endmodule
