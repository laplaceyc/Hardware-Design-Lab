module BCD_counter (clk, reset, en, dir, BCD0, BCD1, cout
    );
	input	clk, reset, en, dir;
	output	[3:0] BCD0, BCD1;
	output	cout;
	reg en_in;
	//reg en_next;
	Lab2_2 bcd_counter_1 (.clk(clk), .reset(reset), .en(en_in), .dir(dir), .BCD(BCD0), .cout(c1));
	Lab2_2 bcd_counter_2 (.clk(clk), .reset(reset), .en(c1), .dir(dir), .BCD(BCD1), .cout(cout));
   
   always@(posedge reset or posedge en) begin
        if (reset) begin
            en_in <= 1'b0;
        end else begin
            en_in <= ~en_in;
        end
    end

endmodule
