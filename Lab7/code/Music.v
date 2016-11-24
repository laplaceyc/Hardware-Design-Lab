
`define NMBL  32'd247 // B LOW
`define NMCs  32'd277 // C sharp
`define NME   32'd330 // E
`define NMFs  32'd370 // F sharp
`define NMGs  32'd415 // G sharp
`define NMA   32'd440 // A
`define NMB   32'd494 // B
`define NMCsH 32'd554 // C sharp HIGH
`define NM0   32'd20000 //slience (over freq.)

module Music (
	input [7:0] ibeatNum,	
	output reg [31:0] tone
);

always @(*) begin
	case (ibeatNum)		// 1/4 beat
		8'd0 : tone = `NME;	
		8'd1 : tone = `NME;
		8'd2 : tone = `NME;
		8'd3 : tone = `NME;
		8'd4 : tone = `NMCs;
		8'd5 : tone = `NMCs;
		8'd6 : tone = `NMBL;
		8'd7 : tone = `NMBL;
		
		8'd8 : tone = `NME;
		8'd9 : tone = `NME;
		8'd10 : tone = `NME;
		8'd11 : tone = `NME;
		8'd12 : tone = `NMCs;
		8'd13 : tone = `NMCs;
		8'd14 : tone = `NMBL;
		8'd15 : tone = `NMBL;
/////////////////////////////////////////////////
		
		8'd16 : tone = `NM0;
		8'd17 : tone = `NM0;
		8'd18 : tone = `NMGs;
		8'd19 : tone = `NMGs;
		8'd20 : tone = `NMGs;
		8'd21 : tone = `NMGs;
		8'd22 : tone = `NMFs;
		8'd23 : tone = `NMFs;
		
		8'd24 : tone = `NME;
		8'd25 : tone = `NM0;
		8'd26 : tone = `NME;
		8'd27 : tone = `NME;
		8'd28 : tone = `NMFs;
		8'd29 : tone = `NMFs;
		8'd30 : tone = `NMFs;
		8'd31 : tone = `NMFs;
////////////////////////////////////////////
		
		8'd32 : tone = `NME;
		8'd33 : tone = `NME;
		8'd34 : tone = `NME;
		8'd35 : tone = `NME;
		8'd36 : tone = `NMCs;
		8'd37 : tone = `NMCs;
		8'd38 : tone = `NMBL;
		8'd39 : tone = `NMBL;
		
		8'd40 : tone = `NME;
		8'd41 : tone = `NME;
		8'd42 : tone = `NME;
		8'd43 : tone = `NME;
		8'd44 : tone = `NMCs;
		8'd45 : tone = `NMCs;
		8'd46 : tone = `NMBL;
		8'd47 : tone = `NMBL;
/////////////////////////////////////////////////
		
		8'd48 : tone = `NM0;
		8'd49 : tone = `NM0;
		8'd50 : tone = `NMGs;
		8'd51 : tone = `NMGs;
		8'd52 : tone = `NMGs;
		8'd53 : tone = `NMGs;
		8'd54 : tone = `NMFs;
		8'd55 : tone = `NMFs;
		
		8'd56 : tone = `NME;
		8'd57 : tone = `NME;
		8'd58 : tone = `NME;
		8'd59 : tone = `NME;
		8'd60 : tone = `NMFs;
		8'd61 : tone = `NMFs;
		8'd62 : tone = `NMFs;
		8'd63 : tone = `NMFs;
///////////////////////////////////////////////////
		
		8'd64 : tone = `NME;
		8'd65 : tone = `NME;
		8'd66 : tone = `NME;
		8'd67 : tone = `NME;
		8'd68 : tone = `NMCs;
		8'd69 : tone = `NMCs;
		8'd70 : tone = `NMBL;
		8'd71 : tone = `NMBL;
		
		8'd72 : tone = `NME;
		8'd73 : tone = `NME;
		8'd74 : tone = `NME;
		8'd75 : tone = `NME;
		8'd76 : tone = `NM0;
		8'd77 : tone = `NM0;
		8'd78 : tone = `NMB;
		8'd79 : tone = `NMB;
/////////////////////////////////////////////////
		
		8'd80 : tone = `NMB;
		8'd81 : tone = `NM0;
		8'd82 : tone = `NMB;
		8'd83 : tone = `NMB;
		8'd84 : tone = `NMB;
		8'd85 : tone = `NMB;
		8'd86 : tone = `NMCsH;
		8'd87 : tone = `NMCsH;
		
		8'd88 : tone = `NMGs;
		8'd89 : tone = `NM0;
		8'd90 : tone = `NMGs;
		8'd91 : tone = `NM0;
		8'd92 : tone = `NMFs;
		8'd93 : tone = `NM0;
		8'd94 : tone = `NMFs;
		8'd95 : tone = `NM0;
///////////////////////////////////////////////////
		
		8'd96 : tone = `NME;
		8'd97 : tone = `NME;
		8'd98 : tone = `NMFs;
		8'd99 : tone = `NMFs;
		8'd100 : tone = `NMGs;
		8'd101 : tone = `NMGs;
		8'd102 : tone = `NMA;
		8'd103 : tone = `NMA;
		
		8'd104 : tone = `NMB;
		8'd105 : tone = `NMB;
		8'd106 : tone = `NMA;
		8'd107 : tone = `NMA;
		8'd108 : tone = `NMGs;
		8'd109 : tone = `NMGs;
		8'd110 : tone = `NMFs;
		8'd111 : tone = `NMFs;
/////////////////////////////////////////////////
		
		8'd112 : tone = `NME;
		8'd113 : tone = `NME;
		8'd114 : tone = `NMGs;
		8'd115 : tone = `NMGs;
		8'd116 : tone = `NMB;
		8'd117 : tone = `NMB;
		8'd118 : tone = `NMGs;
		8'd119 : tone = `NMGs;
		
		8'd120 : tone = `NMB;
		8'd121 : tone = `NMB;
		8'd122 : tone = `NMB;
		8'd123 : tone = `NM0;
		8'd124 : tone = `NMB;
		8'd125 : tone = `NMB;
		8'd126 : tone = `NMB;
		8'd127 : tone = `NM0;
///////////////////////////////////////////////////

		default : tone = `NM0;
	endcase
end

endmodule
		
		
		
		