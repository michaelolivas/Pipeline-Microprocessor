`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 01:49:36 AM
// Design Name: 
// Module Name: ControlTop
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


module ControlTop(input [5:0] OpCode,
                    input [5:0] Funct,
                        output MtoRFSel, 
							output DMWE,
							output Branch,
							output ALUInSel, 
							output RFDSel, 
							output RFWE,
							output [2:0] ALUSel,
							output Jump);
							
    wire [1:0] ALUOp;

    MainDecoder
        MD0 (.Opcode(OpCode), .MtoRFSel(MtoRFSel), .DMWE(DMWE), .Branch(Branch), .ALUInSel(ALUInSel), 
                    .RFDSel(RFDSel), .RFWE(RFWE), .ALUOp(ALUOp), .Jump(Jump));
    ALU_Decoder
        ALUD0 (.ALUOp(ALUOp), .Funct(Funct), .ALUSel(ALUSel));
endmodule
