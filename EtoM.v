`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 04:30:15 PM
// Design Name: 
// Module Name: EtoM
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


module EtoM(input clk,
            input rfweE, mtorfselE, dmweE, branchE, zeroE,
            input [31:0] aluoutE, dmdinE,
            input [4:0] rtdE,
            input [31:0] pcbranchE,
                output reg rfweM, mtorfselM, dmweM, branchM, zeroM,
                output reg [31:0] aluoutM, dmdinM,
                output reg [4:0] rtdM,
                output reg [31:0] pcbranchM);

    always @(posedge clk) begin
        rfweM <= rfweE;
        mtorfselM <= mtorfselE;
        dmweM <= dmweE;
        branchM <= branchE;
        zeroM <= zeroE;
        aluoutM <= aluoutE;
        dmdinM <= dmdinE;
        rtdM <= rtdE;
        pcbranchM <= pcbranchE;
    end
    
endmodule
