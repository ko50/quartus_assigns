module m_setter (input [1:0] step, input [4:0] sw, output [4:0] hour, output [4:0] min, output [4:0] sec);
    wire [4:0] value;

    assign value = (sw < 5'd60) ? sw : 0;
    begin
        if (step == 2'b01) assign hour = value;
        else if (step == 2'b10) assign min = value;
        else if (step == 2'b11) assign sec = value;
    end
endmodule
