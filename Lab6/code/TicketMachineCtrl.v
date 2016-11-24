`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/25 09:01:29
// Design Name: 
// Module Name: TicketMachineCtrl
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


module TicketMachineCtrl(output wire [3:0] DIGIT,
                         output wire [6:0] DISPLAY,
                         output wire [9:0] drop_money,
                         output wire drop_business_ticket,
                         output wire drop_general_ticket,
                         
                         input  wire money_1,
                         input  wire money_5,
                         input  wire money_10,
                         input  wire business_ticket,
                         input  wire general_ticket,
                         input  wire cancel,
                         input  wire reset,
                         input  wire clk);

wire [3:0] BCD3, BCD2, BCD1, BCD0;
    
HSR_ticketsystem_FSM moore(.drop_money(drop_money),
                           .drop_business_ticket(drop_business_ticket),
                           .drop_general_ticket(drop_general_ticket),
                           .BCD3(BCD3),      
                           .BCD2(BCD2),
                           .BCD1(BCD1),      
                           .BCD0(BCD0),
                                
                           .clk16(clk16),
                           .clk25(clk25),    
                           .reset(reset),  
                           .money_1(money_1),    
                           .money_5(money_5),             
                           .money_10(money_10),
                           .cancel(cancel),              
                           .business_ticket(business_ticket),     
                           .general_ticket(general_ticket)); 
    
clock_divider cd(clk13, clk16, clk25, clk);
    
LED7SEG SevenSeg(DIGIT, DISPLAY, clk13, BCD3, BCD2, BCD1, BCD0);
    
endmodule
