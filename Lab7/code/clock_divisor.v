module clock_divisor(clk16, clk);
input clk;
output clk16;
reg [15:0] num;
wire [15:0] next_num;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk16 = num[15];
endmodule
