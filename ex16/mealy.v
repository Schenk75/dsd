module mealy(output reg flag, input din, clk, rst);
    parameter IDLE = 8'b0000_0001, A = 8'b0000_0010, B = 8'b0000_0100, C = 8'b0000_1000, 
              D = 8'b0001_0000, E = 8'b0010_0000, F = 8'b0100_0000, G = 8'b1000_0000;
    reg [7:0] state;
    always @(posedge clk, posedge rst) begin
        if (rst) begin flag <= 1'b0; state <= IDLE; end
        else begin
            case (state)
                IDLE:   if (din) begin flag <= 1'b0; state <= IDLE; end
                        else begin flag <= 1'b0; state <= A; end
                A:      if (din) begin flag <= 1'b0; state <= B; end
                        else begin flag <= 1'b0; state <= A; end
                B:      if (din) begin flag <= 1'b0; state <= IDLE; end
                        else begin flag <= 1'b0; state <= C; end
                C:      if (din) begin flag <= 1'b0; state <= D; end
                        else begin flag <= 1'b0; state <= A; end
                D:      if (din) begin flag <= 1'b0; state <= IDLE; end
                        else begin flag <= 1'b0; state <= E; end
                E:      if (din) begin flag <= 1'b0; state <= F; end
                        else begin flag <= 1'b0; state <= A; end
                F:      if (din) begin flag <= 1'b0; state <= IDLE; end
                        else begin flag <= 1'b0; state <= G; end
                G:      if (din) begin flag <= 1'b1; state <= F; end
                        else begin flag <= 1'b0; state <= A; end
                default: begin flag <= 1'b0; state <= IDLE; end
            endcase
        end
    end

endmodule
