`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 03:22:54 AM
// Design Name: 
// Module Name: MP1_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MP1_top(input MCLK, RST);

    wire mtorfsel, dmwe, branch, aluinsel, rfdsel, rfwe, jump, pcsel;
    wire [2:0] alusel;
    wire [5:0] opcode, FUNCT;

    TopModule
        TM0 (.mCLK(MCLK), .RST(RST), .MtoRFSel(mtorfsel), .DMWE(dmwe), .Branch(branch), .ALUSel(alusel), .ALUInSel(aluinsel), .RFDSel(rfdsel), .RFWE(rfwe), .Jump(jump), .PCSel(pcsel),
                    .op(opcode), .funct(FUNCT));
    ControlTop
        CT0 (.OpCode(opcode), .Funct(FUNCT), 
                        .MtoRFSel(mtorfsel), .DMWE(dmwe), .Branch(branch), .ALUInSel(aluinsel), .RFDSel(rfdsel), .RFWE(rfwe), .ALUSel(alusel), .Jump(jump)); 
        
endmodule

