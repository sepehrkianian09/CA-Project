module Memory(instructionReadReg, dataReadReg, readInstruction, readData,
    writeInstructionReg, writeDataReg, writeInstruction, writeData,
    writeInstructionEnable, writeDataEnable, Clk);

    parameter wordNumber = 64;
    parameter n = 32;
    parameter m = 6;

    input Clk;
    input[m - 1 : 0] instructionReadReg, dataReadReg;
    output[n - 1 : 0] readInstruction, readData;

    input[m - 1 : 0] writeInstructionReg, writeDataReg;
    input[n - 1 : 0] writeInstruction, writeData;
    input writeInstructionEnable, writeDataEnable;

    reg [n - 1 : 0] numbers [wordNumber - 1 : 0];

    assign readInstruction = numbers[instructionReadReg];               // At Top -> Instructions
    assign readData = numbers[wordNumber - 1 - dataReadReg];            // At Bottom -> Data

    integer i = 0;
    initial begin
        // For Fibonacci
        numbers[0] <= 32'b100010_00000_00000_0000000000000000;   // Lw S0, S0(0)         (S0 = Mem[0](n))
        numbers[1] <= 32'b001000_00010_00010_0000000000000001;   // Addi S2, S2, 1       (S2 (F1) = 1, S1 (F0) = 0)
        numbers[2] <= 32'b001001_00000_00000_0000000000000001;   // L1: Subi S0, S0, 1   (S0 -= 1)
        numbers[3] <= 32'b000000_00010_00001_00011_00000_100000; // Add S3, S2, S1       (S3 = S2 + S1 -> Fn+1 = Fn + Fn-1)
        numbers[4] <= 32'b001000_00010_00001_0000000000000000;   // Addi S1, S2, 0       (S1 = S2 -> Fn-1 = Fn)
        numbers[5] <= 32'b001000_00011_00010_0000000000000000;   // Addi S2, S3, 0       (S2 = S3 -> Fn = Fn+1)
        numbers[6] <= 32'b101011_00000_00001_0000000000000000;   // SW S1, S0(0)         (Mem[0] = S1(Fn))
        numbers[7] <= 32'b000100_00111_00000_1111111111111010;   // BNE S0, S4, L1       (If S2 != S4 (0), Then Branch L1)
        numbers[8] <= 32'b111111_00000_00000_0000000000000000;   // End Of The Program (OP=6'b111111)

        // For Testing Without Hazard
//        numbers[0] <= 32'b100010_00000_00000_0000000000000000;   // Lw S0, S0(0)         (S0 = Mem[0](n))
//        numbers[1] <= 32'b000010_0000000000000000000000000001;      // Jump 1
//        numbers[2] <= 32'b000100_00111_00000_0000000000000010;   // BNE S0, S4, L1       (If S2 != S4 (0), Then Branch L1)
//        numbers[3] <= 32'b001000_00010_00010_0000000000000001;   // Addi S2, S2, 1       (S2 (F1) = 1, S1 (F0) = 0)
//        numbers[4] <= 32'b001000_00001_00001_0000000000000001;   // Addi S1, S1, 1       (S2 (F1) = 1, S1 (F0) = 0)
//        numbers[5] <= 32'b000000_00000_00000_00000_00000_100000; // Add S0, S0, S0
//        numbers[6] <= 32'b001000_00001_00001_0000000000000001;   // Addi S1, S1, 1       (S2 (F1) = 1, S1 (F0) = 0)
//        numbers[7] <= 32'b001000_00001_00001_0000000000000001;   // Addi S1, S1, 1       (S2 (F1) = 1, S1 (F0) = 0)
//        numbers[8] <= 32'b001000_00001_00001_0000000000000001;   // Addi S1, S1, 1       (S2 (F1) = 1, S1 (F0) = 0)
//        numbers[9] <= 32'b001000_00001_00001_0000000000000001;   // Addi S1, S1, 1       (S2 (F1) = 1, S1 (F0) = 0)
//        numbers[10] <= 32'b001000_00001_00001_0000000000000001;   // Addi S1, S1, 1       (S2 (F1) = 1, S1 (F0) = 0)
//        numbers[11] <= 32'b101011_00100_00000_0000000000000000;     // Sw S0, S4(0)
//        numbers[12] <= 32'b111111_00000_00000_0000000000000000;   // End Of The Program (OP=6'b111111)
        numbers[wordNumber - 1] <= 16;                                       // n = 16 (Because Of First Input Increases);
        for(i = 9; i < wordNumber - 1; i = i + 1) begin
            numbers[i] <= 0;
        end
    end

    always @(posedge Clk) begin
        if (writeInstructionEnable)
            numbers[writeInstructionReg] <= writeInstruction;
        if (writeDataEnable)
            numbers[wordNumber - 1 - writeDataReg] <= writeData;
    end
endmodule
