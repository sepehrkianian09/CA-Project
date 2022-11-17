module ControlHazardDetectionUnit(Clock, Jump, Branch, Op, outJump, outBranch, stall);
    input Clock;
    input Jump, Branch;
    input [5 : 0] Op;

    output outJump, outBranch;
    output stall;

    assign outJump = state[1] ? (0) : (state[0] ? (1) : (Jump));
    assign outBranch = state[1] ? (Branch) : (state[0] ? (1) : (Branch));
    assign stall = state != 2'b00;

    reg[1 : 0] state = 2'b00;

    always @(posedge Clock) begin
        if ( state == 2'b00 ) begin
            if ( Op == 4 || Op == 5 ) begin            // Branch
                state <= 2'b01;
            end
        end
        else if ( state == 2'b01 ) begin
            state <= 2'b10;
        end
        else if ( state == 2'b10 ) begin
            state <= 2'b00;
        end
        else begin
            state <= 2'b00;
        end
    end
endmodule
