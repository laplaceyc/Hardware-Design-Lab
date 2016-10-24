module Lab2_2 (clk, reset, en, dir, BCD, cout);
	
	input	clk, reset, en, dir;
	output	[3:0] BCD;
	output	cout;
	
	wire	[3:0] outputs;
	reg		[3:0] inputs;
	
	Lab2_1 bcd (.inputs(inputs), .en(en), .dir(dir), .outputs(outputs), .cout(cout));
	
	always @ (negedge clk or posedge reset) begin
		if (reset) begin
			inputs <= 4'b1001;
		end else begin
			inputs <= outputs;
		end
	end
	
	assign BCD = inputs;
	
endmodule
