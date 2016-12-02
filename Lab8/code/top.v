module top(
   input clk,
   input rst,
   input en,
   input dir,
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   output hsync,
   output vsync
    );
    wire db_en,one_en,db_rst;
    wire [11:0] data;
    wire clk_25MHz;
    wire clk_22;
    wire clk_16;
    wire [16:0] pixel_addr;
    wire [11:0] pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480

  assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;
  
  debounce db(db_en,en,clk_16);
  debounce db2(db_rst,rst,clk_16);

     clock_divisor clk_wiz_0_inst(
      .clk(clk),
      .clk1(clk_25MHz),
      .clk22(clk_22),
      .clk16(clk_16)
    );

    mem_addr_gen mem_addr_gen_inst(
    .clk(clk_22),
    .rst(db_rst),
    .en(db_en),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt),
    .dir(dir),
    .pixel_addr(pixel_addr)
    );
     
 
    blk_mem_gen_0 blk_mem_gen_0_inst(
      .clka(clk),
      .wea(0),
      .addra(pixel_addr),
      .dina(data[11:0]),
      .douta(pixel)
    ); 

    vga_controller   vga_inst(
      .pclk(clk_25MHz),
      .reset(db_rst),
      .hsync(hsync),
      .vsync(vsync),
      .valid(valid),
      .h_cnt(h_cnt),
      .v_cnt(v_cnt)
    );
      
endmodule
