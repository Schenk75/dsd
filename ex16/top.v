`timescale 10ns / 1ns
`include "mealy.v"
`include "moore.v"

module top();
    reg clock, rst, in;
    wire flag_mealy, flag_moore;

    mealy m1 (flag_mealy, in, clock, rst);
    moore m2 (flag_moore, in, clock, rst);

    initial begin clock = 0; forever #10 clock = ~clock; end
    initial begin rst = 1'b1; #20 rst = 1'b0; end
    initial #600 $stop;

    parameter SIZE = 24;
    reg [SIZE-1:0] data = 24'b1100_1101_0100_1101_0101_0100;

    initial begin: SERIES
        integer i;
        in = 0;
        #30;
        for (i=0; i<SIZE; i=i+1) begin
            in = data[0];
            data = data >> 1;
            #20;
        end
    end

endmodule
