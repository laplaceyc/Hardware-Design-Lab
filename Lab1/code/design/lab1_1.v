`timescale 1ns / 1ps



module lab1_1(a,b,c,aluctr,d,e);
input a,b,c;
input [1:0] aluctr;
output d,e;


xor(w1,a,b);
and(w2,a,b);
or(w3,a,b);
and(w4,w1,c);
xor(w5,w1,c);
xor(w6,w4,w2);
mux4_to_1 mux1(d,w5,w2,w3,w1,aluctr);
mux4_to_1 mux2(e,w6,1'b0,1'b0,1'b0,aluctr);

endmodule
