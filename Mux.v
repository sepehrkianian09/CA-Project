module twoBitMux(Zero, One, Select, Out);
    parameter n = 1;
    input Select;
    input [n - 1 : 0] Zero, One;
    output [n - 1 : 0] Out;
    assign Out = Select ? One : Zero;
endmodule


module fourBitMux(Zero, One, Two, Three, Select, Out);
    parameter n = 1;
    input [1 : 0] Select;
    input [n - 1 : 0] Zero, One, Two, Three;
    output [n - 1 : 0] Out;
    assign Out = Select[1] ? (Select[0] ? Three : Two) : (Select[0] ? One : Zero);
endmodule
