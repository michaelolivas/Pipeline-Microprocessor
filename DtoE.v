`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 04:13:08 PM
// Design Name: 
// Module Name: DtoE
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


module DtoE(input clk,
            input rfweD, mtorfselD, dmweD, branchD, aluinselD, rfdselD,
            input [2:0] aluselD,
            input [31:0] RFRD1D, RFRD2D, rtD, rdD,
            input [31:0] simmD, pcoutD,
                output reg rfweE, mtorfselE, dmweE, branchE, aluinselE, rfdselE,
                output reg [2:0] aluselE,
                output reg [31:0] RFRD1E, RFRD2E, rtE, rdE,
                output reg [31:0] simmE, pcoutE);
    always @ (posedge clk) begin             
        rfweE <= rfweD;
        mtorfselE <= mtorfselD;
        dmweE <= dmweD;
        branchE <= branchD;
        aluinselE <= aluinselD;
        rfdselE <= rfdselD;
        aluselE <= aluselD;
        RFRD1E <= RFRD1D;
        RFRD2E <= RFRD2D;
        rtE <= rtD;
        rdE <= rdD;
        simmE <= simmD;
        pcoutE <= pcoutD;
    end
    
endmodule
