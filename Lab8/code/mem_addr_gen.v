module mem_addr_gen(
   input clk,
   input rst,
   input en,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input dir,
   output [16:0] pixel_addr
   );
    
  reg [8:0] position;
  reg pause;
  //assign pixel_addr = ((h_cnt>>1)+320*(v_cnt>>1)+ position*320 )% 76800;  //640*480 --> 320*240 
  assign pixel_addr = ((((h_cnt>>1)+position)%320) + 320*(v_cnt>>1) );  //640*480 --> 320*240
  
   
   always @(posedge en or posedge rst)begin
        if(rst)
            pause<=1;
        else 
            pause<=~pause;
   end

   always @ (posedge clk or posedge rst) begin
      if(rst)begin
          position <= 0;
       end else if(pause==0) begin
            if(dir == 1 && position>0)begin //
                position <= position - 1;
            end else if (dir == 1 && position==0)begin
                position <= 319;
            end else if (dir == 0 && position==319)begin
                position <= 0;
            end else if (dir == 0 && position<319)begin
                position <= position + 1;
            end else begin
                position <= position;   
            end           
       end else begin // position == 1
           position <= position;    
       end
   end
    
endmodule
