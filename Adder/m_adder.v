module m_adder(input [3:0] in1, input [3:0] in2, output [4:0] out);
	wire o5, o4, o3, o2, o1;
	wire up4_1, up4_2, up3_1, up3_2, up2_1, up2_2, up1;
	
	m_1bit_adder a1(in1[0], in2[0], o1, up1);

	m_1bit_adder a2(in1[1], in2[1], o2, up2);

	m_1bit_adder a3(in1[0], in2[0], o3, up3);

	m_1bit_adder a4(in1[0], in2[0], o4, up4);

	m_1bit_adder a5(in1[0], in2[0], o1, up1);
endmodule

module m_1bit_adder(input a, input b, output out, output cnt_up);
	assign out = a + b;
	assign cnt_up = a ^ b;
endmodule