module Nander(in1, in2, out);
    parameter n = 4;
    input[n - 1 : 0] in1, in2;
    output reg[n - 1 : 0] out;
    integer i = 0;
    always @* begin
        for(i = 0; i < n; i = i + 1) begin
            out[i] = ~(in1[i] & in2[i]);
        end
    end
endmodule
