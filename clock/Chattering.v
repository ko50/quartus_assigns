module m_chattering(input clk,input sw_in,output sw_out);
	reg [15:0] cnt;	//16bit counter
	reg swreg;			//Switch Latch
	wire iclk;			//1/65536 clock
	
	assign sw_out=swreg;
	
	//16bit Counter
	always @(posedge clk) begin
		cnt=cnt+1;
	end
	assign iclk=cnt[15];	//clock for chattering inhibit
	
	//switch latch 
	always @(posedge iclk) begin
		swreg=sw_in;
	end

endmodule

module m_counter(input clk, output [3:0] q, input res);
	reg [3:0] counter;
	
	always @(posedge clk or negedge res)begin
		if(res==1'b0)begin
			counter=4'h0;
		end
		else if(counter==4'hf)begin
			counter=4'h0;
		end
		else begin
			counter=counter+1;
		end
	end
	assign q=counter;
endmodule

