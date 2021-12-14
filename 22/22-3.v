module assign22_3(clk, res, led);
    input clk, res;
    output [3:0] led;

    reg [3:0] led;

    always @(posedge clk or negedge res)begin
        if(res == 1'b0)
            led <= 4'd0;
        else if(led == 4'd9)
            led <= 4'd0;
        else
            led <= led + 4'd1;
    end
endmodule
