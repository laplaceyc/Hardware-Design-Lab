`timescale 1ns / 1ps


module lab2_2_t;
	
    reg clk;
    reg reset,en,dir;
    reg [3:0] preBCD;
    wire [3:0] BCD;

    wire cout;
    
    reg pass;


    lab2_2 bcd2 (.clk(clk), .reset(reset), .en(en), .dir(dir), .BCD(BCD), .cout(cout));
    
	initial begin	        
            $monitor("%5dns : en : %d, dir : %d, preBCD : %d, BCD : %d, cout : %d", $time, en, dir, preBCD, BCD, cout);
            clk =1'b0;            
            en = 0;
            dir = 1;
            reset = 0;
            pass = 1;
        #25
            reset = 1;
        #120
			reset = 0;
            dir = 0;
        #120
            en = 1;
        #120
            dir = 1;
        #120
            
            if (pass == 1)
                $display("-------------------------\n     -----[PASS]-----     \n-------------------------");
            $finish;
    end       
          
    
    always begin
        #5  preBCD = BCD;
            clk = ~ clk;           
    end
    
	always @ (negedge clk) begin
        #1
        if(reset == 1) begin
            if(BCD != 0) begin      
                printerror(0);
            end
        end    
        else begin                
            if (en == 0 && (BCD != preBCD || cout != 0)) begin                
                printerror(1);
            end else if (en == 1 && preBCD >= 4'b1010) begin
                if (BCD != 4'b0000 || cout != 0) begin        
                    printerror(2);
                end
			end else if (en == 1 && dir == 1 && preBCD == 4'b1001) begin
                    if (BCD != 4'b0000 || cout != 0) begin                 
                        printerror(3);
                    end
                end else if(en == 1 && dir ==1 && preBCD == 4'b1000) begin
                    if(BCD != 4'b1001 || cout != 1 )begin                      
                        printerror(4);
                    end
                end else if (en == 1 && dir == 1 && preBCD < 4'b1000) begin
                    if (BCD != preBCD + 1 || cout != 0) begin                        
                        printerror(5);
                    end
                end else if (en == 1 && dir == 0 && preBCD == 4'b0000) begin
                    if (BCD != 4'b1001 || cout != 0) begin
                        printerror(6);
                    end
                end else if (en == 1 && dir ==0 && preBCD == 4'b0001) begin
                    if (BCD != 4'b0000 || cout != 1) begin
                        printerror(7);
                    end
                end else if (en == 1 && dir == 0 && preBCD > 4'b0000) begin
                    if (BCD != preBCD - 1 || cout != 0) begin
                        printerror(8);
                    end
                end
        end
    end
        
        
    
	task printerror;
		input [3:0] error_num;
		begin
			pass=0;
			$display("[NOT_PASS_%1d] : reset : %d, en : %d, dir : %d, preBCD : %d, BCD : %d, cout : %d", error_num, reset, en, dir, preBCD, BCD, cout);
		end
	endtask
	

endmodule