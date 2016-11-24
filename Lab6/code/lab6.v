`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/25 08:48:39
// Design Name: 
// Module Name: lab6
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


module lab6(output wire [3:0] DIGIT,
            output wire [6:0] DISPLAY,
            output wire [9:0] drop_money,
            output wire drop_business_ticket,
            output wire drop_general_ticket,
           
            inout wire PS2_CLK,
            inout wire PS2_DATA,
            input wire reset,
            input wire clk);
            
wire money_1,   money_5,   money_10,   business_ticket,   general_ticket,   cancel;
wire l_money_1, l_money_5, l_money_10, l_business_ticket, l_general_ticket, l_cancel; 

ButtonCtrl b_ctrl (
    .money_1(money_1),
    .money_5(money_5),
    .money_10(money_10),
    .cancel(cancel),
    .business_ticket(business_ticket),
    .general_ticket(general_ticket),
    .PS2_DATA(PS2_DATA),
    .PS2_CLK(PS2_CLK),
    .rst(reset),
    .clk(clk));
    
// Slow down the signal for b_ctrl to the 
// frequency that vending_machine can detect.
CreateLargePulse #(
    .PULSE_SIZE(16)
) c_pulse_meney_1 (
    .large_pulse(l_money_1),
    .small_pulse(money_1),
    .rst(reset),
    .clk(clk)
);

CreateLargePulse #(
    .PULSE_SIZE(16)
) c_pulse_meney_5 (
    .large_pulse(l_money_5),
    .small_pulse(money_5),
    .rst(reset),
    .clk(clk)
);

CreateLargePulse #(
    .PULSE_SIZE(16)
) c_pulse_meney_10 (
    .large_pulse(l_money_10),
    .small_pulse(money_10),
    .rst(reset),
    .clk(clk)
);

CreateLargePulse #(
    .PULSE_SIZE(16)
) c_pulse_business_ticket (
    .large_pulse(l_business_ticket),
    .small_pulse(business_ticket),
    .rst(reset),
    .clk(clk)
);

CreateLargePulse #(
    .PULSE_SIZE(16)
) c_pulse_general_ticket (
    .large_pulse(l_general_ticket),
    .small_pulse(general_ticket),
    .rst(reset),
    .clk(clk)
);

CreateLargePulse #(
    .PULSE_SIZE(16)
) c_pulse_cancel (
    .large_pulse(l_cancel),
    .small_pulse(cancel),
    .rst(reset),
    .clk(clk)
);

TicketMachineCtrl ticket_machine(DIGIT,
                                 DISPLAY,
                                 drop_money,
                                 drop_business_ticket,
                                 drop_general_ticket,
                                 
                                 l_money_1,
                                 l_money_5,
                                 l_money_10,
                                 l_business_ticket,
                                 l_general_ticket,
                                 l_cancel,
                                 reset,
                                 clk);
endmodule
