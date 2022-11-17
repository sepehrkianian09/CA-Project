module CpuStarter(Instruction, ProgramStart, Clock, End);
    input Clock, ProgramStart;
    input[31 : 0] Instruction;
    output End;

    localparam START = 0, EXECUTE = 1;
    reg state;

    assign End = !state;

    initial begin
        state <= 0;
    end

    always @(posedge Clock) begin
        if (state) begin    // For Execute
            if (Instruction[31:26] == 6'b111111) begin      // Op == 111111 Means Its The End
                state <= START;
            end
        end
        else begin
            if (ProgramStart) begin
                state <= EXECUTE;
            end
        end
    end
endmodule
