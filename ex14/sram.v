module sram(dout, din, addr, wr, rd, cs);
  output [7:0] dout;
  input [7:0] din;
  input [7:0] addr;
  input wr, rd, cs;
  reg [7:0] store[0:255];
  reg [7:0] out;

  // output
  assign dout = (cs && ~wr && ~rd) ? out : 8'bz;

  // write 
  always @ (posedge wr)
  begin 
    if (cs) store[addr] <= din;
  end

  // read
  always @ (*)
  begin 
    if (cs && ~wr && ~rd) out <= store[addr];
  end
  
endmodule
