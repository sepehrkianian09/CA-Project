module fourDMUX(input [1 : 0] in, input enable, output out0, out1, out2, out3);
    assign out0 = enable & ~in[1] & ~in[0];
    assign out1 = enable & ~in[1] & in[0];
    assign out2 = enable & in[1] & ~in[0];
    assign out3 = enable & in[1] & in[0];
endmodule

module eightDMUX(input [2 : 0] in, input enable, output out0, out1, out2, out3, out4, out5, out6, out7);
    assign out0 = enable & ~in[2] & ~in[1] & ~in[0];
    assign out1 = enable & ~in[2] & ~in[1] & in[0];
    assign out2 = enable & ~in[2] & in[1] & ~in[0];
    assign out3 = enable & ~in[2] & in[1] & in[0];
    assign out4 = enable & in[2] & ~in[1] & ~in[0];
    assign out5 = enable & in[2] & ~in[1] & in[0];
    assign out6 = enable & in[2] & in[1] & ~in[0];
    assign out7 = enable & in[2] & in[1] & in[0];
endmodule
