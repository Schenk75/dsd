module counter8b_updown(count, clk, reset, dir);
output reg [7:0] count = 8'b0;
input clk, reset, dir;

always @ (posedge clk, posedge reset)
begin
  if (reset) count <= 8'b0;
  else begin
    if (dir) count <= count+1;  //up
    else count <= count-1;  //down
  end
end

endmodule
