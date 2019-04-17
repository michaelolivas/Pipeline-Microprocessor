module RegisterFile (input clk, we, rst,
                        input [4:0] RFRA1, RFRA2, RFWA, 
                            input signed [31:0] RFWD,
                                output reg signed [31:0] RFRD1, RFRD2);
                            
    reg [31:0] Registers [0:31];
    
	always@(posedge clk or posedge rst) begin
	   if (rst == 1'b1) begin
            Registers[0] = 0;
       end
       else if (we == 1'b1) Registers[RFWA] = RFWD;
	end

    always @* begin
	   RFRD1 = Registers[RFRA1];
	   RFRD2 = Registers[RFRA2];
	end
endmodule