module m_clock(input clk, input enable, output [4:0] hour, output [4:0] min, output [4:0] sec);
	reg sec;

	m_timer t1(clk, sec);
	always @(posedge sec) begin
		if (enable != 1'b0) begin
			if (sec == 5'd60) begin
				min = min + 1;
				sec = 5'b0;
			end
			
			if (min == 5'd60) begin
				hour = hour + 1;
				min = 5'b0;
			end
			
			if (hour == 4'd24) begin
				hour = 4'b0;
			end
		end
	end
endmodule
