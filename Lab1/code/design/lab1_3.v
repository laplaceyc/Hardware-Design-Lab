`timescale 1ns / 1ps



module lab1_3(a,b,c,aluctr,d,e);
input a,b,c;
input [1:0] aluctr;
output d,e;
reg d,e;

always@(*) begin    
    //assign {e,d}=a+b+c;
    {e,d}=(aluctr==2'b00) ? a+b+c :
                      (aluctr==2'b01) ? a&b :
                      (aluctr==2'b10) ? a|b : a^b ;      
end
    
    
endmodule
