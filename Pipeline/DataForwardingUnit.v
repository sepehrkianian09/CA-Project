module DataForwardingUnit(Enable, DmOp, DmDs, IfRs, IfRt, RrRs, RrRt,
    SelectBitForDmCalcs,
    SelectBitForDmRrRead,
    SelectBitForDmRrRead2,
    SelectBitForDmCalcsRead,
    SelectBitForDmCalcsRead2);

    input Enable;
    input [5 : 0] DmOp;
    input [4 : 0] DmDs;
    input [4 : 0] IfRs, IfRt, RrRs, RrRt;
    output SelectBitForDmCalcs,
           SelectBitForDmRrRead,
           SelectBitForDmRrRead2,
           SelectBitForDmCalcsRead,
           SelectBitForDmCalcsRead2;

    wire ifItsForDataHazard;
    assign ifItsForDataHazard = DmOp == 34 | DmOp == 0 | DmOp == 8 | DmOp == 9 | DmOp == 10 | DmOp == 12 | DmOp == 14;

    assign SelectBitForDmCalcs = Enable & ifItsForDataHazard & (DmOp == 34);
    assign SelectBitForDmRrRead = Enable & ifItsForDataHazard & (DmDs == IfRs);
    assign SelectBitForDmRrRead2 = Enable & ifItsForDataHazard & (DmDs == IfRt);
    assign SelectBitForDmCalcsRead = Enable & ifItsForDataHazard & (DmDs == RrRs);
    assign SelectBitForDmCalcsRead2 = Enable & ifItsForDataHazard & (DmDs == RrRt);
endmodule
