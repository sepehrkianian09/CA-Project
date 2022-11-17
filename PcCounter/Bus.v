module twoBitBusInput(input in0, in1, output [1 : 0] out);
    assign out[0] = in0;
    assign out[1] = in1;
endmodule

module eightBitBusOutput(input[7 : 0] in, output out0, out1, out2, out3, out4, out5, out6, out7);
	assign out0 = in[0];
	assign out1 = in[1];
	assign out2 = in[2];
	assign out3 = in[3];
	assign out4 = in[4];
	assign out5 = in[5];
	assign out6 = in[6];
	assign out7 = in[7];
endmodule

module eightBitBusInput(input in0, in1, in2, in3, in4, in5, in6, in7, output [7 : 0]out);
	assign out[0] = in0;
	assign out[1] = in1;
	assign out[2] = in2;
	assign out[3] = in3;
	assign out[4] = in4;
	assign out[5] = in5;
	assign out[6] = in6;
	assign out[7] = in7;
endmodule

module thirtyTwoBitBusOutput(input [31 : 0] in, output [7 : 0] out0, out1, out2, out3);
    assign out0 = in[1 * 8 - 1 : 0 * 8];
    assign out1 = in[2 * 8 - 1 : 1 * 8];
    assign out2 = in[3 * 8 - 1 : 2 * 8];
    assign out3 = in[4 * 8 - 1 : 3 * 8];
endmodule

module thirtyTwoBitBusInput(output [31 : 0] out, input [7 : 0] in0, in1, in2, in3);
    assign out[1 * 8 - 1 : 0 * 8] = in0;
    assign out[2 * 8 - 1 : 1 * 8] = in1;
    assign out[3 * 8 - 1 : 2 * 8] = in2;
    assign out[4 * 8 - 1 : 3 * 8] = in3;
endmodule
