module controller(output reg [15:0]LED,
			      input clk,
			      input reset);
			  
reg [3:0]count;
reg flag; 
reg [1:0]dir;

parameter LOW  = 2'b00;
parameter UP   = 2'b01;
parameter DOWN = 2'b10;
parameter HIGH = 2'b11;



always@(posedge clk or posedge reset)begin;
    if(reset)begin
        LED <= 15'b0;
        count <= 4'd8;
        dir = UP;
    end else begin
        LED[count] <= ~LED[count];
        case(dir)
            UP:begin
                    count <= count + 1'd1;
                    if(count == 4'd14)begin
                        dir <= HIGH;
                    end
                 end
            DOWN:begin
                    count <= count - 1'd1;
                    if(count == 4'd1)begin
                        dir <= LOW;
                    end
                 end
            HIGH:begin
                     count <= count;
                     dir   <= DOWN;
                  end
            LOW:begin
                     count <= count;
                     dir   <= UP;
                  end
            default:    dir <= UP;
        endcase
    end    
end


endmodule
