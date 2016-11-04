`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/11 12:47:00
// Design Name: 
// Module Name: HSR_ticketsystem_FSM
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


module     ticketsystem_FSM(output reg [9:0]drop_money,
                            output drop_business_ticket,
                            output drop_general_ticket,
                            output [3:0]BCD3,      
                            output [3:0]BCD2,
                            output [3:0]BCD1,      
                            output [3:0]BCD0,
                            
                            input  clk16,
                            input  clk25,    
                            input  reset,      
                            input  money_5,             
                            input  money_10,
                            input  cancel,              
                            input  business_ticket,     
                            input  general_ticket);     
                            
parameter   SLECT_TICKET = 2'b00;
parameter   DEPOSIT     = 2'b01;
parameter   DROP_TICKET  = 2'b10;
parameter   REFUND       = 2'b11;

parameter   price_business_ticket = 75;
parameter   price_general_ticket   = 55;

reg [1:0]state, next_state;
reg [7:0]deposited_money, next_deposited_money, total_money, next_total_money;
reg [9:0]next_drop_money;
                
assign clk_select = ( (state == SLECT_TICKET) || (state == DEPOSIT) ) ? clk16 : clk25;
                             
always@(posedge clk_select or posedge reset) begin
  if(reset) begin
    state <= SLECT_TICKET;
    deposited_money <= 8'h00;
    drop_money <=  10'h000;
    total_money <= 8'h00;
  end else begin
    state <= next_state;
    deposited_money <= next_deposited_money;
    drop_money <= next_drop_money;	
    total_money <= next_total_money;
  end
end

always@(*)begin
    case(state)
        SLECT_TICKET:
            if(business_ticket)begin
                next_state <= DEPOSIT;
                next_deposited_money <= 8'h00;
                next_total_money <= price_business_ticket;
                next_drop_money <= 10'h000;
            end else if(general_ticket) begin
                next_state <= DEPOSIT;
                next_deposited_money <= 8'h00;
                next_total_money <= price_general_ticket;
                next_drop_money <= 10'h000;
            end else begin
                next_state <= SLECT_TICKET;
                next_deposited_money <= 8'h00;
                next_total_money <= 0;
                next_drop_money <= 10'h000;
            end
//---------------------------------------------------------------------------------------------------------------------------------------
        DEPOSIT:
            if(cancel)begin
                next_state <= REFUND;
                next_deposited_money <= deposited_money;
                next_total_money <= 0;
                next_drop_money <= 0;
            end else if((deposited_money < total_money) && money_5) begin
                next_state <= DEPOSIT;
                next_deposited_money <= deposited_money + 5;
                next_total_money <= total_money;
                next_drop_money <= 0;
            end else if((deposited_money < total_money) && money_10) begin
                next_state <= DEPOSIT;
                next_deposited_money <= deposited_money + 10;
                next_total_money <= total_money;
                next_drop_money <= 0;
            end else if(deposited_money >= total_money) begin
                next_state <= DROP_TICKET;
                next_deposited_money <= deposited_money;
                next_total_money <= total_money;
                next_drop_money <= 0;
            end else begin
                next_state <= DEPOSIT;
                next_deposited_money <= deposited_money;
                next_total_money <= total_money;
                next_drop_money <= 0;
            end
//---------------------------------------------------------------------------------------------------------------------------------------
        DROP_TICKET:
                if(total_money == price_business_ticket)begin
                    next_state <= REFUND;
                    next_deposited_money <= deposited_money - price_business_ticket;
                    next_total_money <= 0;
                    next_drop_money <= 0;
                end else if(total_money == price_general_ticket)begin
                    next_state <= REFUND;
                    next_deposited_money <= deposited_money - price_general_ticket;
                    next_total_money <= 0;
                    next_drop_money <= 0;
                end else begin
                    next_state <= DROP_TICKET;
                    next_deposited_money <= deposited_money;
                    next_total_money <= total_money;
                    next_drop_money <= 0;
                end
//---------------------------------------------------------------------------------------------------------------------------------------
        REFUND:
            if(deposited_money>=10)begin
                next_state <= REFUND;
                next_deposited_money <= deposited_money - 10;
                next_total_money <= 0;
                next_drop_money <= 10'hfff;
            end else if(deposited_money>=5)begin
                next_state <= REFUND;
                next_deposited_money <= deposited_money - 5;
                next_total_money <= 0;
                next_drop_money <= 10'h01f;
            end else begin
                next_state <= SLECT_TICKET;
                next_deposited_money <= 0;
                next_total_money <= 0;
                next_drop_money <= 0;
            end
        default:
            begin
                next_state <= SLECT_TICKET;
                next_deposited_money <= 0;
                next_total_money <= 0;
                next_drop_money <= 0;
            end
    endcase 
end                       

assign drop_business_ticket =  (reset) ? 1'b0:
                              ( (state == DROP_TICKET) && (total_money == price_business_ticket) ) ? 1'b1 : 1'b0;
                              
assign drop_general_ticket =  (reset) ? 1'b0:
                              ( (state == DROP_TICKET) && (total_money == price_general_ticket) )  ? 1'b1 : 1'b0;
              
assign BCD0 = deposited_money % 10;
assign BCD1 = deposited_money / 10;
assign BCD2 = total_money % 10;
assign BCD3 = total_money / 10;
                                
endmodule
