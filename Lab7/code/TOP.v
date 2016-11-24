`define BEAT_FREQ 32'd8 //one beat=0.125sec

module TOP (
	input clk,
	input reset,
	input music,
	input play_pause,
	input mute,
	input [1:0]speed,
	input [1:0]quality,
	input loop,
	output pmod_1,
	output pmod_2,
	output pmod_4
);
wire [31:0] freq, freq_1, freq_2;
wire [7:0] ibeatNum;
wire beatFreq, in_pause;

reg [31:0] freq_speed;
reg [9:0] duty;

assign freq = (music) ? freq_2: freq_1;
assign pmod_2 = 1'b0;	//no gain(6dB)
assign pmod_4 = ~(mute|in_pause);	//turn-on

always @ (*) begin
    case(quality) 
        2'd0: duty = 10'd512;
        2'd1: duty = 10'd384;
        2'd2: duty = 10'd256;
        2'd3: duty = 10'd128;
        default: duty = 10'd512;  
    endcase
end

always @ (*) begin
    case(speed)
        2'd0: freq_speed = `BEAT_FREQ;
        2'd1: freq_speed = `BEAT_FREQ*0.5;
        2'd2: freq_speed = `BEAT_FREQ*1.5;
        2'd3: freq_speed = `BEAT_FREQ*2;
        default: freq_speed = `BEAT_FREQ;
    endcase
end

clock_divisor clk_div( .clk16(clk16), 
                       .clk(clk)
);

debounce db( .pb_debounced(play_pause_db), 
             .pb(play_pause), 
             .clk(clk16)
);

onepulse op( .PB_single_pulse(play_pause_pulse), 
             .clock(clk), 
             .PB_debounced(play_pause_db)
);

//Generate beat speed
PWM_gen btSpeedGen ( .clk(clk), 
					 .reset(reset),
					 .freq(freq_speed),
					 .duty(10'd512), 
					 .PWM(beatFreq)
);
	
//manipulate beat
PlayerCtrl playerCtrl_00 ( .clk(clk),
						   .reset(reset),
						   .ibeatSpeed(beatFreq),
						   .music(music),
						   .play_pause(play_pause_pulse),
						   .loop(loop),
						   .in_pause(in_pause),
						   .ibeat(ibeatNum)
);	
	
//Generate variant freq. of tones
Music music00 ( .ibeatNum(ibeatNum),
				.tone(freq_1)
);

Music2 music01( .ibeatNum(ibeatNum),
				.tone(freq_2)
); 

// Generate particular freq. signal
PWM_gen toneGen ( .clk(clk), 
				  .reset(reset), 
				  .freq(freq),
				  .duty(duty), 
				  .PWM(pmod_1)
);
endmodule