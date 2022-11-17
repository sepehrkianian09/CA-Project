module ThreeInputOneOutput(input zero, One, Two, output[2 : 0] out);
    assign out[0] = zero;
    assign out[1] = One;
    assign out[2] = Two;
endmodule
