`timescale 10ns / 1ns
`include "seq_detect.v"

module tb_seq_detect();
    reg clock, rst, in;
    wire flag;

    seq_detect s (flag, in, clock, rst);

    initial begin clock = 0; forever #10 clock = ~clock; end
    initial begin rst = 1'b1; #20 rst = 1'b0; end
    initial #400 $stop;

    parameter SIZE = 16;
    reg [SIZE-1:0] data = 24'b1100_1101_0100_1101;

    initial begin: SERIES
        integer i;
        in = 0;
        #30;
        for (i=0; i<SIZE; i=i+1) begin
            in = data[SIZE-1];
            data = data << 1;
            #20;
        end
    end

endmodule
