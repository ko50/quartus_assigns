module m_clock(input clk, output [7:0] hour, output [7:0] min, output [7:0] sec);
	reg cnt;
	
	m_timer t1(clk, cnt);
endmodule