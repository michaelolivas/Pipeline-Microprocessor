`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 04:43:29 PM
// Design Name: 
// Module Name: MtoW
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


module MtoW(inout clk,
            input rfweM, mtorfselM,
            input [31:0] aluoutM, dmrdM,
            input [4:0] rtdM,
                output reg rfweW, mtorfselW,
                output reg [31:0] aluoutW, dmrdW,
                output reg [4:0] rtdW);

    always @(posedge clk) begin
        rfweW <= rfweM;
        mtorfselW <= mtorfselM;
        aluoutW <= aluoutM;
        dmrdW <= dmrdM;
        rtdW <= rtdM;
    end
    
endmodule
