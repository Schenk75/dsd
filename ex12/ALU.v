`define AND 3'd0
`define SUBTRACT 3'd1
`define SUBTRACT_A 3'd2
`define OR_AB 3'd3
`define AND_AB 3'd4
`define NOT_AB 3'd5
`define EXOR 3'd6
`define EXNOR 3'd7

module ALU(c_out, sum, oper, a, b, c_in);
output reg c_out;
output reg [7:0] sum;
input [2:0] oper;
input [7:0] a;
input [7:0] b;
input c_in;
wire [7:0] abar, bbar;
wire c_inbar;

assign abar = ~a;
assign bbar = ~b;
assign c_inbar = ~c_in;

always @ (*)
begin
  case (oper)
    `AND: {c_out, sum} = a + b + c_in;
    `SUBTRACT: {c_out, sum} = a + bbar + c_in;
    `SUBTRACT_A: {c_out, sum} = abar + b + c_inbar;
    `OR_AB: {c_out, sum} = {1'b0, a|b};
    `AND_AB: {c_out, sum} = {1'b0, a&b};
    `NOT_AB: {c_out, sum} = {1'b0, abar&b};
    `EXOR: {c_out, sum} = {1'b0, a^b};
    `EXNOR: {c_out, sum} = {1'b0, a~^b};
  default:  {c_out, sum} = 9'b0;
  endcase
end

endmodule

