`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/11/12 03:26:02
// Design Name: 
// Module Name: create_large_pulse
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CreateLargePulse #(
	// means the pulse has to be solwed down
	// to the frequency of clk/(2^16)
	parameter PULSE_SIZE = 16 
)(
	output wire large_pulse,
	input wire small_pulse,
	input wire rst,
	input wire clk
);

	parameter WAITING = 1'b0;
	parameter COUNTING = 1'b1;
	reg state; 
	reg [PULSE_SIZE-1:0] counter;
	
	assign large_pulse = (counter != 0) ? 1 : 0;

	always @ (posedge clk, posedge rst) begin
		if (rst) begin
			state <= WAITING;
			counter <= 0;
		end else begin
			if (state == WAITING) begin
				if (small_pulse) begin
					state <= COUNTING;
					counter <= 1;
				end else begin
					state <= WAITING;
					counter <= 0;
				end
			end else if (state == COUNTING) begin
				counter <= counter + 1;
				if (counter == 0) begin
					state <= WAITING;
				end else begin
					state <= COUNTING;
				end
			end
		end
	end

endmodule
