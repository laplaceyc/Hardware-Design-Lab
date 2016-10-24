module clock_divisor(sel_clk, clk_out, clk);
input clk, sel_clk;
output clk_out;

reg [25:0] num;
wire [25:0] next_num;

assign clk_out = (sel_clk) ? clk19 : clk26;

always @(posedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk26 = num[25];
assign clk19 = num[18];
endmodule
