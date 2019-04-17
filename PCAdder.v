module PCAdder( input [31:0] PCin,
                input rst,
                output reg [31:0] PCout);
    always @* begin
        PCout = PCin + 1;
    end
endmodule