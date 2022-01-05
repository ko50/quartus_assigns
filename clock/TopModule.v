module TopModule(
	//////////// CLOCK //////////
	input 		          		CLK1,
	input 		          		CLK2,
	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,
	//////////// Push Button //////////
	input 		     [1:0]		BTN,
	//////////// LED //////////
	output		     [9:0]		LED,
	//////////// SW //////////
	input 		     [9:0]		SW

	);

	wire [4:0] button;
	wire [4:0] hour;
	wire [4:0] min;
	wire [4:0] sec;
	wire [1:0] setter_step;  // 0~3
	wire timer_enable;

	m_chattering cht1(CLK1, ~BTN[0], button);
	always @(posedge BTN[0]) begin
		if (setter_step == 2'b11) setter_step = 2'b0;
		else assign setter_step = setter_step + 1;
	end

	assign timer_enable = (setter_step == 0) ? 1 : 0;

	m_setter set1(setter_step, SW[4:0], hour, min, sec);
	m_clock c1(CLK1, timer_enable, hour, min, sec);

	// --- Display part ---
	wire [7:0] hour_7seg_1;
	wire [7:0] hour_7seg_2;
	wire [7:0] min_7seg_1;
	wire [7:0] min_7seg_2;
	wire [7:0] sec_7seg_1;
	wire [7:0] sec_7seg_2;

	m_7seg_for_decimal ss1(hour, hour_7seg_1, hour_7seg_2);
	m_7seg_for_decimal ss2(min, min_7seg_1, min_7seg_2);
	m_7seg_for_decimal ss3(sec, sec_7seg_1, sec_7seg_2);

	assign LED[7:4] = in1;
	assign LED[3:0] = in2;

	assign HEX0 = sec_7seg_2;
	assign HEX1 = sec_7seg_1;
	assign HEX2 = min_7seg_2;
	assign HEX3 = min_7seg_1;
	assign HEX4 = hour_7seg_2;
	assign HEX5 = hour_7seg_1;
endmodule
