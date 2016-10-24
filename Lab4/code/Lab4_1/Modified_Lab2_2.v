module Modified_Lab2_2 (clk, reset, en, dir, BCD0, cout);

	input	clk, reset, en, dir;
	output	[3:0] BCD0;
	output	cout;
	reg en_in;
	Lab2_2 bcd_counter_1 (.clk(clk), .reset(reset), .en(en_in), .dir(dir), .BCD(BCD0), .cout(cout));
	
    always@(posedge reset or posedge en) begin
    if (reset) begin
        en_in <= 1'b0;
    end else begin
        en_in <= ~en_in;
    end
end
endmodule
