//1/5000000 PreScaler
module m_prescale5M(input clk,output c_out);
	reg [22:0] cnt;
	wire wcout;
	
	assign wcout=(cnt==23'd4999999) ? 1'b1 : 1'b0;
	assign c_out=wcout;
	
	always @(posedge clk) begin
		if(wcout==1'b1)
			cnt=0;
		else
			cnt=cnt+1;
	end
endmodule

//m_timer module
module m_timer(input clk,output [9:0] sec);

	reg [3:0] dcnt;
	wire [9:0] wsec;
	wire c1;	//Carry data
	//1/5000000 PreScaler
	m_prescale5M u0(clk,c1);
	
	//decimal counter
	always @(posedge clk) begin
		if(c1==1'b1) begin
			if(dcnt==4'd9)
				dcnt=0;
			else
				dcnt=dcnt+1;
		end
	end
	
	//decorder
	assign wsec[0]=(dcnt==4'd0) ? 1'b1 : 1'b0;
	assign wsec[1]=(dcnt==4'd1) ? 1'b1 : 1'b0;
	assign wsec[2]=(dcnt==4'd2) ? 1'b1 : 1'b0;
	assign wsec[3]=(dcnt==4'd3) ? 1'b1 : 1'b0;
	assign wsec[4]=(dcnt==4'd4) ? 1'b1 : 1'b0;
	assign wsec[5]=(dcnt==4'd5) ? 1'b1 : 1'b0;
	assign wsec[6]=(dcnt==4'd6) ? 1'b1 : 1'b0;
	assign wsec[7]=(dcnt==4'd7) ? 1'b1 : 1'b0;
	assign wsec[8]=(dcnt==4'd8) ? 1'b1 : 1'b0;
	assign wsec[9]=(dcnt==4'd9) ? 1'b1 : 1'b0;
	
	assign sec=wsec;
endmodule
