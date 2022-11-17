module DataHolder(
    Clock, DevEnable,
    Enable,
    ALUOp,
    Branch,
    BranchEqual,
    ALUSrc,
    MemWrite,
    MemToReg,
    RegDst,
    RegWrite,
    Op,
    rs, rt, rd,
    shamt,
    Funct,
    Imm,
    ReadData1, ReadData2,
    nextDevEnable,
    nextEnable,
    nextALUOp,
    nextBranch,
    nextBranchEqual,
    nextALUSrc,
    nextMemWrite,
    nextMemToReg,
    nextRegDst,
    nextRegWrite,
    nextOp,
    nextrs, nextrt, nextrd,
    nextshamt,
    nextFunct,
    nextImm,
    nextReadData1, nextReadData2
);
    input Clock, DevEnable;
    input Enable;
    input [1 : 0] ALUOp;
    input Branch;
    input BranchEqual;
    input ALUSrc;
    input MemWrite;
    input MemToReg;
    input RegDst;
    input RegWrite;
    input [5 : 0] Op;
    input [4 : 0] rs, rt, rd;
    input [4 : 0] shamt;
    input [5 : 0] Funct;
    input [15 : 0] Imm;
    input [31 : 0] ReadData1, ReadData2;

    output reg nextDevEnable;
    output reg nextEnable;
    output reg [1 : 0] nextALUOp;
    output reg nextBranch;
    output reg nextBranchEqual;
    output reg nextALUSrc;
    output reg nextMemWrite;
    output reg nextMemToReg;
    output reg nextRegDst;
    output reg nextRegWrite;
    output reg [5 : 0] nextOp;
    output reg [4 : 0] nextrs, nextrt, nextrd;
    output reg [4 : 0] nextshamt;
    output reg [5 : 0] nextFunct;
    output reg [15 : 0] nextImm;
    output reg [31 : 0] nextReadData1, nextReadData2;

    always @(posedge Clock) begin
        nextDevEnable = DevEnable;
        if (DevEnable) begin
            nextEnable = Enable;
            nextALUOp = ALUOp;
            nextBranch = Branch;
            nextBranchEqual = BranchEqual;
            nextALUSrc = ALUSrc;
            nextMemWrite = MemWrite;
            nextMemToReg = MemToReg;
            nextRegDst = RegDst;
            nextRegWrite = RegWrite;
            nextOp = Op;
            nextrs = rs;
            nextrt = rt;
            nextrd = rd;
            nextshamt = shamt;
            nextFunct = Funct;
            nextImm = Imm;
            nextReadData1 = ReadData1;
            nextReadData2 = ReadData2;
        end
    end
endmodule
