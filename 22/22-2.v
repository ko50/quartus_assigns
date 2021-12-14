module assign22_2(sw0, sw1, led);
    input sw0, sw1;
    output [5:0] led;

    assign led[0] = sw0 & sw1;
    assign led[1] = sw0 | sw1;
    assign led[2] = ~sw0;
    assign led[3] = ~(sw0 & sw1);
    assign led[4] = ~(sw0 | sw1);
    assign led[5] = sw0 ^ sw1;
endmodule
