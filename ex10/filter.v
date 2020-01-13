module filter(sig_out, clock, reset, sig_in);
output reg sig_out;
input clock, reset, sig_in;
reg q0, q1, q2, q3, j, k;

always @ (posedge clock)
begin
  if (~reset) {q0,q1,q2,q3,sig_out} = 5'b0;
  else begin
    q0 <= sig_in;
    q1 <= q0;
    q2 <= q1;
    q3 <= q2;
    k <= (~q1) & (~q2) & (~q3);
    j <= q1 & q2 & q3;
    case ({j,k})
      2'b01: sig_out = 1'b0;
      2'b10: sig_out = 1'b1;
      2'b11: sig_out = ~sig_out;
      default: sig_out = sig_out;
    endcase
  end
end

endmodule
