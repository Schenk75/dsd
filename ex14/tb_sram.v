`timescale 10ns / 1ns
`include "sram.v"

module tb_sram();
  reg [7:0] din;
  reg [7:0] addr;
  reg wr, rd, cs;
  wire [7:0] dout;
  integer i;

  sram s1 (dout, din, addr, wr, rd, cs);

  initial
  begin
    wr = 1'b0;
    forever #5 wr = ~wr;
  end

  initial begin
    din = 8'b1011_1101;
    addr = 8'b1;
    cs = 0; rd = 1;
    #10 cs = 1;
    #10 rd = 0;
    #25 din = 8'b0; addr = 8'b1000_0000;
  end

  initial #100 $stop;
endmodule
