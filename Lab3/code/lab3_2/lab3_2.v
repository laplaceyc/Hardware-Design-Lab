module lab3_2(output [15:0]LED,
              input sel_clk,
			  input clk,
			  input reset
			  );

clock_divisor(sel_clk, selected_clk, clk);

controller cc1(LED, selected_clk, reset);

endmodule
