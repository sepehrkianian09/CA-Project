module nBitUnsignedAddSubber(A, B, Add, Cin, Unsigned, Result, Cout);
    parameter n = 4;
    input[n - 1 : 0] A, B;
    input Add, Cin, Unsigned;
    output[n - 1 : 0] Result;
    output Cout;
    wire [n : 0] res;
    assign res = A + Cin + (Add ? B : (-B));
    assign Result = res[n - 1 : 0];
    assign Cout = Unsigned ? (res[n]) : ((A[n - 1] & B[n - 1] & (~res[n - 1]))|((~A[n - 1]) & (~B[n - 1]) & res[n - 1]));
endmodule
