module Lab4_3( DIGIT, DISPLAY, max, min, en, reset, clk);
		
input en;
input reset;
input clk;
output [3:0] DIGIT; 
output [6:0] DISPLAY; 
output max, min;
wire [3:0] BCD0, BCD1; 


clock_divider CD(clk13, clk25, clk);
Pingpong_counter BC(clk25, reset_debounced, en_debounced, BCD0, BCD1, cout);
seven_segment SS(DIGIT, DISPLAY, BCD0, BCD1, clk13);	
debounce DB1(en_debounced, en, clk13);
debounce DB2(reset_debounced, reset, clk13);
       
             
assign max = (BCD0==4'b1001 && BCD1==4'b1001) ? 1 : 0;
assign min = (BCD0==4'b0000 && BCD1==4'b0000) ? 1 : 0;

endmodule
