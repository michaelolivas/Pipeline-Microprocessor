`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 04:03:12 PM
// Design Name: 
// Module Name: FtoD
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


module FtoD(input [31:0] instr, pcout,
            input clk, jump,
                output reg [31:0] instrD, pcoutD,
                output reg jumpD);
            
    always @(posedge clk) begin
        instrD <= instr;
        pcoutD <= pcout;
        jumpD <= jump;
    end
        
endmodule
