`include "test.v"

module tb_ones_count();
    wire [3:0] y;
    reg [7:0] x;

    ones_count one(.count(y), .dat_in(x));

    initial
    begin
        x = 8'b0;
        while (x <= 8'b1111_1111)
        begin
            #10 x = x + 1;
        end
    end

    initial
    begin
        #500 $stop;
    end

    initial
    begin
        $monitor("At time %tns, dat_in=%b, count=%b", 
        $time, x, y);
    end

endmodule
