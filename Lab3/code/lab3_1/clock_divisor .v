module clock_divisor(clk26, clk);

input clk;
output clk26;

reg [25:0] num;
wire [25:0] next_num;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk26 = num[25];
endmodule
