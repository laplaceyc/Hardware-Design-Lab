`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/11 11:44:15
// Design Name: 
// Module Name: lab5
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


module lab5(output [9:0]drop_money,
            output drop_business_ticket,
            output drop_general_ticket,
            output [3:0]DIGIT,
            output [6:0]DISPLAY,
            
            input  clk,
            input  reset, 
			input  money_5,
			input  money_10,
			input  cancel,
			input  business_ticket,
			input  general_ticket);
			
wire [3:0] BCD3, BCD2, BCD1, BCD0;

clock_divisor CD(clk13, clk16, clk25, clk);

debounce money_5_DB(DB_money_5, money_5, clk16);
onepulse money_5_OP(pulse_money_5, clk16, DB_money_5);

debounce money_10_DB(DB_money_10, money_10, clk16);
onepulse money_10_OP(pulse_money_10, clk16, DB_money_10);

debounce cancel_DB(DB_cancel, cancel, clk16);
onepulse cancel_OP(pulse_cancel, clk16, DB_cancel);

debounce business_ticket_DB(DB_business_ticket, business_ticket, clk16);
onepulse business_ticket_OP(pulse_business_ticket, clk16, DB_business_ticket);

debounce general_ticket_DB(DB_general_ticket, general_ticket, clk16);
onepulse general_ticket_OP(pulse_general_ticket, clk16, DB_general_ticket);

LED7SEG SevenSeg(DIGIT, DISPLAY, clk13, BCD3, BCD2, BCD1, BCD0);			

ticketsystem_FSM fsm(drop_money,
                     drop_business_ticket,
                     drop_general_ticket,
                     BCD3,      
                     BCD2,
                     BCD1,      
                     BCD0,
                     
                     clk16,
                     clk25,    
                     reset,      
                     pulse_money_5,             
                     pulse_money_10,            
                     pulse_cancel,              
                     pulse_business_ticket,     
                     pulse_general_ticket); 

endmodule
