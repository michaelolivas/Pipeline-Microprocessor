`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 02:43:21 AM
// Design Name: 
// Module Name: PCBranch
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


module PCBranch #(parameter WL = 1)
                (input [WL - 1:0] SImm,
                input [WL - 1:0] PCAdder,
                    output [WL:0] PCBranch);
                    
    assign PCBranch = SImm + PCAdder;
    
endmodule
