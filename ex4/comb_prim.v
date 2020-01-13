module comb_prim(output Y, input A, B, C, D);
comb_p cp(Y, A, B, C, D);
endmodule

primitive comb_p(Y, A, B, C, D);
output Y;
input A, B, C, D;
  
  table
    // A B C D : Y;
       0 0 0 0 : 0;
       0 0 0 1 : 0;
       0 0 1 0 : 0;
       0 0 1 1 : 0;
       0 1 0 0 : 0;
       0 1 0 1 : 0;
       0 1 1 0 : 1;
       0 1 1 1 : 0;
       1 0 0 0 : 0;
       1 0 0 1 : 0;
       1 0 1 0 : 0;
       1 0 1 1 : 0;
       1 1 0 0 : 0;
       1 1 0 1 : 0;
       1 1 1 0 : 0;
       1 1 1 1 : 0;
  endtable
endprimitive
