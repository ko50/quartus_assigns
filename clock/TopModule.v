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

	wire [3:0] in1;
	wire [3:0] in2;
	wire [4:0] result;
	assign in1 = SW[7:4];
	assign in2 = SW[3:0];

	m_adder a1(in1, in2, result);

	wire [7:0] in1_7seg;
	wire [7:0] in2_7seg;
	wire [7:0] result1_7seg;
	wire [7:0] result2_7seg;

	m_seven_segment ss1(in1, in1_7seg);
	m_seven_segment ss2(in2, in2_7seg);
	m_seven_segment ss3({3'b0, result[4]}, result1_7seg);
	m_seven_segment ss4(result[3:0], result2_7seg);
	
	assign LED[7:4] = in1;
	assign LED[3:0] = in2;
	assign HEX0 = result2_7seg;
	assign HEX1 = result1_7seg;
	assign HEX2 = in2_7seg;
	assign HEX3 = in1_7seg;
	assign HEX4 = 8'hff;
	assign HEX5 = 8'hff;
	
endmodule
