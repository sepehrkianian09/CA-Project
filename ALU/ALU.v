module ALU(Opcode, in1, in2, shamt, out, OverFlow, Zero, Sign);
    parameter n = 32;
	 parameter m = 5;
    input[n - 1 : 0] in1, in2;
    input[m - 1 : 0] shamt;
    input[2 : 0] Opcode;
    output wire [n - 1 : 0] out;
    output OverFlow, Zero, Sign;
    wire [n - 1 : 0] addOut, shiftOut, nandOut, sltOut, MinOut;
    nBitUnsignedAddSubber #(.n(n)) adder(.A(in1), .B(in2), .Add(~Opcode[0]), .Result(addOut), .Cout(OverFlow), .Cin(0), .Unsigned(0));
    Shifter #(.n(n)) shifter(.In(in1), .shamt(shamt), .toRight(~Opcode[0]), .Out(shiftOut));
    Nander #(.n(n)) nander(.in1(in1), .in2(in2), .out(nandOut));
    SetLessThan #(.n(n)) setLt(.In1(in1), .In2(in2), .Out(sltOut));
    Minimum #(.n(n)) getMin(.In1(in1), .In2(in2), .Out(MinOut));
    assign Zero = out == 0;
    assign out = Opcode[2] ? (Opcode[1] ? MinOut : (Opcode[0] ? sltOut : nandOut)) : (Opcode[1] ? shiftOut : addOut);
endmodule
