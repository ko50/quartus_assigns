module m_7seg_for_decimal(input [3:0] in, output [7:0] out1, output out2);
	function [7:0] decord;
		input [3:0] num;

		begin
			 case (num)
				4'h0:        decord = 8'b11000000;  // 0
				4'h1:        decord = 8'b11111001;  // 1
				4'h2:        decord = 8'b10100100;  // 2
				4'h3:        decord = 8'b10110000;  // 3
				4'h4:        decord = 8'b10011001;  // 4
				4'h5:        decord = 8'b10010010;  // 5
				4'h6:        decord = 8'b10000010;  // 6
				4'h7:        decord = 8'b11111000;  // 7
				4'h8:        decord = 8'b10000000;  // 8
				4'h9:        decord = 8'b10011000;  // 9
				default:     decord = 8'b11111111;  // LED OFF
			endcase
		end
	endfunction

	assign out1 = (in < 10) ? 8'b11000000 : 8'b11111001;  // 1 or 0
	assign out2 = decord(in);
endmodule
