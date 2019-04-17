module PC (input [31:0] PCnext,
            input clk,
                output reg [31:0] PCout);
    
    initial PCout = 0;
    
    always @(posedge clk) begin
            PCout = PCnext;
    end

endmodule