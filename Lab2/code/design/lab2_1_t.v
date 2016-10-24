`timescale 1ns / 1ps


module lab2_1_t;
	
	reg     [3:0] inputs;
	reg     en, dir;
	wire    [3:0] outputs;
	wire    cout;
	
	reg     pass;
	
	lab2_1 bcd (.inputs(inputs), .en(en), .dir(dir), .outputs(outputs), .cout(cout));
	
	// create all the possiable combination of input
	initial begin
			$monitor("%5dns : en : %d, dir : %d, inputs : %d, outputs : %d, cout : %d", $time, en, dir, inputs, outputs, cout);
			inputs = 4'b0000;
			en = 0;
			dir = 1;
			pass = 1;
		#80
			dir = 0;
		#80
			en = 1;
		#80
			dir = 1;
		#80
			if (pass == 1)
				$display("-------------------------\n     -----[PASS]-----     \n-------------------------");
			$finish;
	end
	
	always begin
		#5  inputs = inputs + 1;
	end
	
	//check correctness
	always @ (inputs or en or dir) begin
		#1
			if (en == 0 && (inputs != outputs || cout != 0)) begin
				pass = 0;
				printerror(1);
			end else if (en == 1 && inputs >= 4'b1010) begin
				if (outputs != 4'b0000 || cout != 0) begin
					pass = 0;
					printerror(2);
				end
			end else if (en == 1 && dir == 1 && inputs == 4'b1001) begin
				if (outputs != 4'b0000 || cout != 1) begin
					pass = 0;
					printerror(3);
				end
			end else if (en == 1 && dir == 1 && inputs < 4'b1001) begin
				if (outputs != inputs + 1 || cout != 0) begin
					pass = 0;
					printerror(4);
				end
			end else if (en == 1 && dir == 0 && inputs == 4'b0000) begin
				if (outputs != 4'b1001 || cout != 1) begin
					pass = 0;
					printerror(5);
				end
			end else if (en == 1 && dir == 0 && inputs > 4'b0000) begin
				if (outputs != inputs - 1 || cout != 0) begin
					pass = 0;
					printerror(6);
				end
			end
	end

	task printerror;
		input error_num;
		begin
			$display("[NOT_PASS_%1d] : en : %d, dir : %d, inputs : %d, outputs : %d, cout : %d", error_num, en, dir, inputs, outputs, cout);
		end
	endtask
	

endmodule