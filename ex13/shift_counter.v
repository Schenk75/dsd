module shift_counter(count, clk, reset);
output reg [7:0] count = 8'b0000_0001;
input clk, reset;
reg [4:0] flag; 

always @ (posedge clk)
begin
  if (reset) 
  begin
    count <= 1;
    flag <= 0;
  end
  else begin
    if (flag<3)
    begin 
      flag <= flag + 1;
      count <= 1;
    end
    else if (flag>=3 && flag<10)
    begin
      flag <= flag +1;
      count <= count << 1;
    end
    else if (flag>=10 && flag<17)
    begin
      flag <= flag + 1;
      count <= count >> 1;
    end
    else begin
      flag <= 0;
      count <= 1;
    end
  end
end

endmodule
