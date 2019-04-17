`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 01:26:22 AM
// Design Name: 
// Module Name: InstructionMem
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


module InstructionMem (input [31:0] x,
                        output [31:0] data);
    reg [31:0] mem [31:0];
    
    initial begin
        $readmemb("Instructions.mem", mem);
    end
    
    assign data = mem[x];                 

endmodule