module seven_segment(DIGIT, DISPLAY, BCD0, clk
    );
input clk;
input [3:0] BCD0;
output reg [3:0] DIGIT;
output [6:0] DISPLAY;

reg [3:0] value;
    
	always @ ( posedge clk) begin
	    DIGIT <= 4'b1110;	
		value <= BCD0;
	end

	assign DISPLAY = (value==4'd0) ? 7'b0000001 :
						(value==4'd1) ? 7'b1001111 :
						(value==4'd2) ? 7'b0010010 :
						(value==4'd3) ? 7'b0000110 :
						(value==4'd4) ? 7'b1001100 :
						(value==4'd5) ? 7'b0100100 :
						(value==4'd6) ? 7'b0100000 :
						(value==4'd7) ? 7'b0001111 :
						(value==4'd8) ? 7'b0000000 : 
						(value==4'd9) ? 7'b0000100 :
                 						7'b1111111;

endmodule
