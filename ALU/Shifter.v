module Shifter(In, shamt, toRight, Out);
    parameter n = 4;
    input[n - 1 : 0] In;
    input[$clog2(n) - 1 : 0] shamt;
	 input toRight;
    output[n - 1 : 0] Out;
    assign Out = toRight ? (In >> shamt) : (In << shamt);
endmodule
