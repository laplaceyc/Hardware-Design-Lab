`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/25 08:50:56
// Design Name: 
// Module Name: ButtonCtrl
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


module ButtonCtrl(output reg money_1,
                  output reg money_5,
                  output reg money_10,
                  output reg cancel,
                  output reg business_ticket,
                  output reg general_ticket,
                  
                  input wire clk,
                  input wire rst,
                  
                  inout wire PS2_DATA,
                  inout wire PS2_CLK);
                  
parameter [8:0] LEFT_SHIFT_CODES  = 9'b0_0001_0010;
parameter [8:0] RIGHT_SHIFT_CODES = 9'b0_0101_1001;
wire [8:0] KEY_CODES [0:5]   = {9'b0_0011_0010,//b -> 32
                                9'b0_0011_0100,//g -> 34
                                9'b0_0001_0110,//1 -> 16
                                9'b0_0010_1110,//5 -> 2E
                                9'b0_0100_0101,//0 -> 45
                                9'b0_0111_0110};//ESC -> 76
wire shift_down;
wire [511:0] key_down;
wire [8:0] last_change;
wire been_ready;
	
assign shift_down = (key_down[LEFT_SHIFT_CODES] == 1'b1 || key_down[RIGHT_SHIFT_CODES] == 1'b1) ? 1'b1 : 1'b0;
KeyboardDecoder key_de (.key_down(key_down), .last_change(last_change), .key_valid(been_ready), .PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .rst(rst), .clk(clk));

always @ (posedge clk, posedge rst) begin
    if (rst) begin
        money_1             <= 1'b0;
        money_5             <= 1'b0;
        money_10            <= 1'b0;
        cancel              <= 1'b0;
        business_ticket     <= 1'b0;
        general_ticket      <= 1'b0;
    end else begin
        money_1             <= 1'b0;
        money_5             <= 1'b0;
        money_10            <= 1'b0;
        cancel              <= 1'b0;
        business_ticket     <= 1'b0;
        general_ticket      <= 1'b0;
        if (been_ready && key_down[last_change] == 1'b1) begin
            if (last_change == KEY_CODES[0]) business_ticket     <= shift_down;
            if (last_change == KEY_CODES[1]) general_ticket      <= shift_down;
            if (last_change == KEY_CODES[2]) money_1  <= 1'b1;
            if (last_change == KEY_CODES[3]) money_5  <= 1'b1;
            if (last_change == KEY_CODES[4]) money_10 <= 1'b1;
            if (last_change == KEY_CODES[5]) cancel   <= 1'b1;
        end
    end
end	
    
endmodule
