module clock_divisor(clk13, clk16, clk25, clk);
input clk;
output clk13;
output clk16;
output clk25;

reg [24:0] num;
wire [24:0] next_num;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk13 = num[12];
assign clk16 = num[15];
assign clk25 = num[24];
endmodule
