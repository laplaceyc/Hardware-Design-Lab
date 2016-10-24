module debounce (pb_debounced, pb, clk);

  output    pb_debounced; // signal of a pushbutton after being debounced
  input     pb;           // signal from a pushbutton 
  input     clk;          
  
  reg [3:0] shift_reg;    // use shift_reg to filter pushbutton bounce 

  always @(posedge clk) 
    begin
      shift_reg[3:1] <= shift_reg[2:0];
      shift_reg[0] <= pb;
    end

  //assign pb_debounced = ((shift_reg == 4'b0000) ? 1'b0 : 1'b1);
  assign pb_debounced = ((shift_reg == 4'b1111) ? 1'b1 : 1'b0);

endmodule