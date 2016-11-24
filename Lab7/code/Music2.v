//
//
//
//

`define NMBfH 32'd932 //
`define NMAH 32'd880 //
`define NMGH 32'd784 //
//`define NMGsH 32'd830 //
//`define NMFsH 32'd740 //
`define NMFH 32'd698 //
`define NMEH 32'd659 //
`define NMDH 32'd587 //
//`define NMCsH 32'd554 // 
`define NMB 32'd494 // 
`define NMA 32'd440 //
//`define NMGs 32'd415 //
//`define NMFs 32'd370 // 

`define NM0 32'd20000 //slience (over freq.)

module Music (
	input [7:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		8'd0: tone = `NM0;
		8'd1: tone = `NM0;
		8'd2: tone = `NMGH;
		8'd3: tone = `NMGH;
		
		8'd4: tone = `NMAH;
		8'd5: tone = `NMFH;
		8'd6: tone = `NM0;
		8'd7: tone = `NM0;
		
		8'd8: tone = `NMGH;
		8'd9: tone = `NMGH;
		8'd10: tone = `NMGH;
		8'd11: tone = `NMGH;
		
		8'd12: tone = `NMGH;
		8'd13: tone = `NMGH;
		8'd14: tone = `NMGH;
		8'd15: tone = `NMGH;
		
///////////////////////////////////////////////

		8'd16: tone = `NM0;
		8'd17: tone = `NM0;
		8'd18: tone = `NMBfH;
		8'd19: tone = `NMBfH;
		
		8'd20: tone = `NMAH;
		8'd21: tone = `NMFH;
		8'd22: tone = `NM0;
		8'd23: tone = `NM0;
		
		8'd24: tone = `NMGH;
		8'd25: tone = `NMGH;
		8'd26: tone = `NMGH;
		8'd27: tone = `NMGH;
		
		8'd28: tone = `NMGH;
		8'd29: tone = `NMGH;
		8'd30: tone = `NMGH;
		8'd31: tone = `NMGH;
		
///////////////////////////////////////////////

	
		default : tone = `NM0;
	endcase
end

endmodule