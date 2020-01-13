module seq_detect(output reg flag, input din, clk, rst_n);
    parameter IDLE = 7'b000_0001, A = 7'b000_0010, B = 7'b000_0100, C = 7'b000_1000, 
              D = 7'b001_0000, E = 7'b010_0000, F = 7'b100_0000;
    reg [6:0] state;
    always @(negedge clk)
    begin
        if (~rst_n) begin flag <= 1'b0; state <= IDLE; end
        else begin
            case (state)
                IDLE:   if (din) begin flag <= 1'b0; state <= A; end
                        else begin flag <= 1'b0; state <= D; end
                A:      if (din) begin flag <= 1'b0; state <= B; end
                        else begin flag <= 1'b0; state <= D; end
                B:      if (din) begin flag <= 1'b0; state <= B; end
                        else begin flag <= 1'b0; state <= C; end
                C:      if (din) begin flag <= 1'b1; state <= E; end
                        else begin flag <= 1'b0; state <= D; end
                D:      if (din) begin flag <= 1'b0; state <= E; end
                        else begin flag <= 1'b0; state <= D; end
                E:      if (din) begin flag <= 1'b0; state <= F; end
                        else begin flag <= 1'b0; state <= D; end
                F:      if (din) begin flag <= 1'b0; state <= B; end
                        else begin flag <= 1'b1; state <= C; end   
                default:  begin flag <= 1'b0; state <= IDLE; end
            endcase
        end
    end 

endmodule
