module ThirtyTwoBitMux(in0, in1, in2, in3, select, out);
    input [1 : 0] select;
    input [31 : 0] in0, in1, in2, in3;
    output [31 : 0] out;
    assign out = select[1] ? (select[0] ? in3 : in2) : (select[0] ? in1 : in0);
endmodule
