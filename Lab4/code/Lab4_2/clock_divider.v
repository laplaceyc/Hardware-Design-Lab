module clock_divider(clk13, clk25, clk);
input clk;
output clk25;
output clk13;

reg [24:0] num;
wire [24:0] next_num;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1;
assign clk25 = num[24];
assign clk13 = num[12];
endmodule
