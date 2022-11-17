module eightBusOutput(a0, a1, a2, a3, a4, a5, a6, a7, out);
    parameter inputWidth = 1;
    input [inputWidth - 1 : 0] a0, a1, a2, a3, a4, a5, a6, a7;
    output [8 * inputWidth - 1 : 0] out;
    assign out[inputWidth - 1 : 0] = a0;
    assign out[2 * inputWidth - 1 : 1 * inputWidth] = a1;
    assign out[3 * inputWidth - 1 : 2 * inputWidth] = a2;
    assign out[4 * inputWidth - 1 : 3 * inputWidth] = a3;
    assign out[5 * inputWidth - 1 : 4 * inputWidth] = a4;
    assign out[6 * inputWidth - 1 : 5 * inputWidth] = a5;
    assign out[7 * inputWidth - 1 : 6 * inputWidth] = a6;
    assign out[8 * inputWidth - 1 : 7 * inputWidth] = a7;
endmodule

module fourEightBusOutput(a0, a1, a2, a3, out);
    parameter inputWidth = 1;
    input [inputWidth - 1 : 0] a0, a1, a2, a3;
    output [4 * inputWidth - 1 : 0] out;
    assign out[inputWidth - 1 : 0] = a0;
    assign out[2 * inputWidth - 1 : 1 * inputWidth] = a1;
    assign out[3 * inputWidth - 1 : 2 * inputWidth] = a2;
    assign out[4 * inputWidth - 1 : 3 * inputWidth] = a3;
endmodule

module eightBusInput(input [7 : 0]in, output out0, out1, out2, out3, out4, out5, out6, out7);
    assign out0 = in[0];
    assign out1 = in[1];
    assign out2 = in[2];
    assign out3 = in[3];
    assign out4 = in[4];
    assign out5 = in[5];
    assign out6 = in[6];
    assign out7 = in[7];
endmodule

module fourEightBusInput(input [31 : 0] out, output [7 : 0] a0, a1, a2, a3);
    assign a0 = out[7 : 0];
    assign a1 = out[15 : 8];
    assign a2 = out[23 : 16];
    assign a3 = out[31 : 24];
endmodule

module middleSeparator(input [4 : 0] in, output [2 : 0] firstOut, output [1 : 0] secondOut);
    assign firstOut = in[2 : 0];
    assign secondOut = in[4 : 3];
endmodule
