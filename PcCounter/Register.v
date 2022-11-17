module Register(In, Enable, Reset, Clk, Out);
    parameter n = 32;
    parameter INIT_VALUE = 0;
    input[n - 1: 0] In;
    input Enable, Reset, Clk;
    output reg [n - 1 : 0] Out;
    initial begin
        Out <= INIT_VALUE;
    end
    always @(posedge Clk) begin
        if (!Reset) begin
            Out <= 0;
        end
        else if (!Enable) begin
            Out <= In;
        end
    end
endmodule
