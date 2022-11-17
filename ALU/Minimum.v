module Minimum(In1, In2, Out);
    parameter n = 4;
    input signed [n - 1 : 0] In1, In2;
    output signed [n - 1 : 0] Out;
    assign Out = In1 < In2 ? In1 : In2;
endmodule
