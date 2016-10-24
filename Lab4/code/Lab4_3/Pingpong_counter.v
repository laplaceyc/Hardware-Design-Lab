module Pingpong_counter (clk, reset, en, BCD0, BCD1, cout);

	input	clk, reset, en;
	output	[3:0] BCD0, BCD1;
	output	cout;
	
	reg en_in, dir;
	
	Lab2_2 bcd_counter_1 (.clk(clk), .reset(reset), .en(en_in), .dir(dir), .BCD(BCD0), .cout(c1));
	Lab2_2 bcd_counter_2 (.clk(clk), .reset(reset), .en(c1), .dir(dir), .BCD(BCD1), .cout(cout));
	
   always@(posedge reset or posedge en) begin
        if (reset) begin
            en_in <= 1'b0;
        end else begin
            en_in <= ~en_in;
        end
    end
     
    always @ (negedge clk or posedge reset) begin
        if (reset) begin
            dir <= 1'b0;
        end else begin
            dir <= dir_next;
        end
    end
    
    assign dir_next = ( BCD0==4'b1000 && BCD1==4'b1001 && dir==1'b1 ) ? 0 :
                      ( BCD0==4'b0001 && BCD1==4'b0000 && dir==1'b0 ) ? 1 : dir;
endmodule
