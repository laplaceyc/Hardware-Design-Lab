module PlayerCtrl (
	input clk,
	input reset,
	input ibeatSpeed,
	input music,
	input play_pause,
	input loop,
	output reg in_pause,
	output reg [7:0] ibeat
);
parameter BEATLEAGTH_LONG = 127;
parameter BEATLEAGTH_SHORT = 63;
parameter STOP = 2'd0;
parameter PLAY = 2'd1;
parameter PAUSE = 2'd2;

reg [1:0] state, next_state;
reg [7:0] next_ibeat;
reg last_music;
reg end_of_music;
wire [7:0] beatLength;
wire change_music;

assign change_music = (last_music != music) ? 1'b1: 1'b0;
assign beatLength = (music) ? BEATLEAGTH_SHORT: BEATLEAGTH_LONG;

always @(*) begin 
	if (ibeat >= beatLength)
		end_of_music = 1;
	else 
		end_of_music = 0;
end

always @ (posedge clk or posedge reset) begin
    if(reset)
        state <= STOP;
    else
        state <= next_state;
end

always @(posedge ibeatSpeed or posedge reset) begin
    last_music <= music;
    if(reset || change_music)
        ibeat <= 0;
    else
        ibeat <= next_ibeat;
end

always @ (*) begin
    case(state)
    STOP: begin
        in_pause = 1;
        if(play_pause) begin
            next_state = PLAY;
            next_ibeat = ibeat;
        end else begin
            next_state = STOP;
            next_ibeat = 0;
        end
    end
    PLAY: begin
        in_pause = 0;
        if (end_of_music && !loop)begin
            next_state = STOP;
            next_ibeat = 0;
        end else if (end_of_music && loop)begin
            next_state = PLAY;
            next_ibeat = 0;
        end else if (play_pause) begin
            next_state = PAUSE;
            next_ibeat = ibeat;
        end else begin
            next_state = PLAY;
            next_ibeat = ibeat + 1;    
        end
    end
    PAUSE: begin
        in_pause = 1;    
        if(play_pause) begin
            next_state = PLAY;
            next_ibeat = ibeat;
        end else begin
            next_state = PAUSE;
            next_ibeat = ibeat;
        end
    end
    default: begin
        if(play_pause) begin
            next_state = PLAY;
            next_ibeat = ibeat;
        end else begin
            next_state = STOP;
            next_ibeat = 0;
        end
    end
    endcase
end
endmodule