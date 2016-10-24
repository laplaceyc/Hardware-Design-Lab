module Lab4_1( DIGIT, DISPLAY, cout, en, reset, clk, dir);
		
input en;
input reset;
input clk;
input dir;
output [3:0] DIGIT; 
output [6:0] DISPLAY;
output cout;

wire [3:0] BCD0; 


clock_divider CD(clk13, clk25, clk);
Modified_Lab2_2 BC(clk25, reset_debounced, en_debounced, dir, BCD0, cout);
seven_segment SS(DIGIT, DISPLAY, BCD0, clk13);	
debounce DB1(en_debounced, en, clk13);
debounce DB2(reset_debounced, reset, clk13);

endmodule