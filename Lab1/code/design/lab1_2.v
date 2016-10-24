`timescale 1ns / 1ps



module lab1_2(a,b,c,aluctr,d,e);
input a,b,c;
input [1:0] aluctr;
output d,e;

    
//assign {e,d}=a+b+c;
assign {e,d}=(aluctr==2'b00) ? a+b+c :
                  (aluctr==2'b01) ? a&b :
                  (aluctr==2'b10) ? a|b : a^b ;
    
endmodule
