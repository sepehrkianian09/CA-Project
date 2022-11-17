module fourBitMultiplexer(in, select, out);
    parameter MuxWidth = 32;
        input [4 * MuxWidth - 1 : 0] in;
        output [MuxWidth - 1 : 0] out;
        input [1 : 0] select;
        assign out = select[1] ? (select[0] ? (in[4 * MuxWidth - 1 : 3 * MuxWidth]) : (in[3 * MuxWidth - 1 : 2 * MuxWidth])) : (select[0] ? (in[2 * MuxWidth - 1 : 1 * MuxWidth]) : (in[MuxWidth - 1 : 0]));
endmodule

module eightBitMultiplexer(in, select, out);
    parameter MuxWidth = 32;
    input [8 * MuxWidth - 1 : 0] in;
    output [MuxWidth - 1 : 0] out;
    input [2 : 0] select;
    assign out = select[2] ? (select[1] ? (select[0] ? (in[8 * MuxWidth - 1 : 7 * MuxWidth]) : (in[7 * MuxWidth - 1 : 6 * MuxWidth])) : (select[0] ? (in[6 * MuxWidth - 1 : 5 * MuxWidth]) : (in[5 * MuxWidth - 1 : 4 * MuxWidth]))) : (select[1] ? (select[0] ? (in[4 * MuxWidth - 1 : 3 * MuxWidth]) : (in[3 * MuxWidth - 1 : 2 * MuxWidth])) : (select[0] ? (in[2 * MuxWidth - 1 : 1 * MuxWidth]) : (in[1 * MuxWidth - 1 : 0])));
endmodule
