`timescale 1ns / 1ps

module lab2_1 (inputs, en, dir, outputs, cout);
	
	input   [3:0] inputs;
	input   en, dir;
	output  [3:0] outputs;
	output  cout;
	
	assign cout = (en == 1 && dir == 1 && inputs == 4'b1001) ? 1 :
				  (en == 1 && dir == 0 && inputs == 4'b0000) ? 1 : 0;
	
	assign outputs = (en == 0) ? inputs :
					 (inputs >= 4'b1010) ? 4'b0000 :
					 (dir == 1 && inputs < 4'b1001) ? inputs + 1 :
					 (dir == 1 && inputs == 4'b1001) ? 4'b0000 :
					 (dir == 0 && inputs > 4'b0000) ? inputs - 1 :
					 (dir == 0 && inputs == 4'b0000) ? 4'b1001 : 4'b0000; 
	
endmodule