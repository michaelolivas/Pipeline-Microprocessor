module TopModule(input mCLK, RST,
                 input MtoRFSel,
                 input DMWE,
                 input Branch,
                 input [2:0] ALUSel,
                 input ALUInSel,
                 input RFDSel,
                 input RFWE,
                 input Jump,
                 input PCSel,
                    output [5:0] op,
                    output [5:0] funct);
    wire PCRST, zero;
    wire jumpD;
    wire rfweE, mtorfselE, dmweE, branchE, aluinselE, rfdselE, jumpE;
    wire rfweM, mtorfselM, dmweM, branchM, zeroM, jumpM;
    wire rfweW, mtorfselW;
    wire [2:0] aluselE;
    wire [4:0] RFRA1, RFRA2, RFWA, rtd, rtdM, rtdW;
    wire [4:0] rtE, rdE;
    wire [31:0] pc_next, pc_nextD, pc_nextE, pc_nextM, pc_out, pcp;
    wire [31:0] inst, instrD;
    wire [31:0] PCAdderOut, PCBranch, outMux1, PCBranchM;
    wire signed [31:0] ALUIn1, ALUIn1E, ALUIn2, aluOUT, aluOUTM, aluOUTW, ALUDM, DMdin, dmOUT, dmOUTW, SImm, SImmE, rfrd2, rfwd, RFRD2E, RFRD2M;
    wire [15:0] Imm;
    wire [4:0] rs, rd, rt, shamt;
    wire [25:0] Jaddr;
    wire [31:0] PCJump;

    assign op = instrD[31:26];
    assign funct = instrD[5:0];
    assign rd = instrD[15:11];
    assign rs = instrD[25:21];
    assign rt = instrD[20:16];
    assign shamt = instrD[10:6];
    assign Imm = instrD[15:0];
    assign Jaddr = instrD[25:0];
    assign PCJump = {pc_next[31:26], Jaddr};
    
    mux21 #(.WL(32))
        M1 (.sel(PCSel), .a(PCBranchM), .b(pc_next), .out(outMux1));
    mux21 #(.WL(32))
        jumpM2 (.sel(Jump), .a(PCJump), .b(outMux1), .out(pcp));
    PC 
        PC0 (.PCnext(pcp), .clk(mCLK), .PCout(pc_out));
    PCAdder
        PCA0 (.PCin(pc_out), .rst(RST), .PCout(pc_next));
    InstructionMem 
        IM0 (.x(pc_out), .data(inst));
    FtoD
        FD0 (.clk(mCLK), .instr(inst), .pcout(pc_next), .instrD(instrD), .pcoutD(pc_nextD));
    RegisterFile 
        RF0 (.clk(mCLK), .we(rfweW), .rst(RST), .RFRA1(rs), .RFRA2(rt), .RFWA(rtdW), .RFWD(ALUDM), .RFRD1(ALUIn1), .RFRD2(DMdin));
    SignExtend 
        SE0 (.a(Imm), .signImm(SImm));
    DtoE
        DE0 (.clk(mCLK), .rfweD(RFWE), .mtorfselD(MtoRFSel), .dmweD(DMWE), .branchD(Branch), .aluinselD(ALUInSel), .rfdselD(RFDSel),
             .aluselD(ALUSel), .RFRD1D(ALUIn1), .RFRD2D(DMdin), .rtD(rt), .rdD(rd), .simmD(SImm), .pcoutD(pc_nextD),
                .rfweE(rfweE), .mtorfselE(mtorfselE), .dmweE(dmweE), .branchE(branchE), .aluinselE(aluinselE), .rfdselE(rfdselE), .aluselE(aluselE),
                .RFRD1E(ALUIn1E), .RFRD2E(RFRD2E), .rtE(rtE), .rdE(rdE), .simmE(SImmE), .pcoutE(pc_nextE));
    ALUnit 
        ALU0 (.SrcA(ALUIn1E), .SrcB(ALUIn2), .SHAMT(shamt), .ALUControl(aluselE), .ZeroFlag(zero), .ALUResult(aluOUT));
    mux21 #(.WL(5))
        rtdM3 (.sel(rfdselE), .a(rdE), .b(rtE), .out(rtd));
    mux21 #(.WL(32))
        aluM4 (.sel(aluinselE), .a(SImmE), .b(RFRD2E), .out(ALUIn2));
    PCBranch #(.WL(32))
        PCB0 (.SImm(SImmE), .PCAdder(pc_nextE), .PCBranch(PCBranch));
    EtoM
        EM0 (.clk(mCLK), .rfweE(rfweE), .mtorfselE(mtorfselE), .dmweE(dmweE), .branchE(branchE), .zeroE(zero), .aluoutE(aluOUT), .dmdinE(RFRD2E), .rtdE(rtd), .pcbranchE(PCBranch),
                .rfweM(rfweM), .mtorfselM(mtorfselM), .dmweM(dmweM), .branchM(branchM), .zeroM(zeroM), .aluoutM(aluOUTM), .dmdinM(RFRD2M), .rtdM(rtdM), .pcbranchM(PCBranchM));
    DataMemory #(.xw(32), .dw(32)) 
        DM0 (.x(aluOUTM), .WE(dmweM), .clk(mCLK), .dataIn(RFRD2M), .data(dmOUT));
    AndGate
        A0 (.Branch(branchM), .Zero(zeroM), .PCSel(PCSel));
    MtoW
        MW0 (.clk(mCLK), .rfweM(rfweM), .mtorfselM(mtorfselM), .aluoutM(aluOUTM), .dmrdM(dmOUT), .rtdM(rtdM),
                .rfweW(rfweW), .mtorfselW(mtorfselW), .aluoutW(aluOUTW), .dmrdW(dmOUTW), .rtdW(rtdW));
    mux21 #(.WL(32))
        dmoutM5 (.sel(mtorfselW), .a(dmOUTW), .b(aluOUTW), .out(ALUDM));
         
endmodule
