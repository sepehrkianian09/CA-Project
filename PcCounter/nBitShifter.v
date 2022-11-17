module shiftTwo(in, out);
    parameter n = 32;
    input[n - 1 : 0] in;
    output [n - 1 : 0] out;
    assign out[0] = 0;
    assign out[1] = 0;
    assign out[n - 1 : 2] = in[n - 3 : 0];
endmodule


module mix(pc, shifter, out);
    input [31 : 0] pc;
    input [27 : 0] shifter;
    output [31 : 0] out;
    assign out[31 : 28] = pc[31 : 28];
    assign out[27 : 0] = shifter;
endmodule
