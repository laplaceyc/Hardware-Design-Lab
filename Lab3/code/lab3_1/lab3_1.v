module lab3_1(output [15:0]LED,
			  input  clk,
			  input  reset
			  );
			  
clock_divisor c1(.clk26(clk26), .clk(clk));

controller c2(.LED(LED), .clk26(clk26), .reset(reset));

endmodule
