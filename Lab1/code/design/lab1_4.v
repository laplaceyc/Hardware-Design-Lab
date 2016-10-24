`timescale 1ns / 1ps


module lab1_4(a,b,c,aluctr,d,e);
input [3:0] a,b;
input [1:0] aluctr;
input c;
output [3:0] d;
output e;

lab1_3 com0(a[0],b[0],c,aluctr,d[0],c1);
lab1_3 com1(a[1],b[1],c1,aluctr,d[1],c2);
lab1_3 com2(a[2],b[2],c2,aluctr,d[2],c3);
lab1_3 com3(a[3],b[3],c3,aluctr,d[3],e);



endmodule
