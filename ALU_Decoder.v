module ALU_Decoder( input [1:0] ALUOp,
						  input [5:0] Funct,
						  output [2:0] ALUSel
						  );
	reg [2:0] control; 
	always @(*) begin
		case (ALUOp)			   // I-TYPE
			2'b00: control <= 3'b000; // Add
			2'b01: control <= 3'b001; // Sub
			default: case (Funct)		  // R-TYPE
				6'b100000: control <= 3'b000; // Add 
				6'b100010: control <= 3'b001; // Sub
				6'b100100: control <= 3'b010; // And 
				6'b100101: control <= 3'b011; // Or
				6'b101010: control <= 3'b100; // Slt
				6'b000000: control <= 3'b101; // sll
				6'b000100: control <= 3'b110; //sllv
				6'b000111: control <= 3'b111; //srav
			endcase 
		endcase
	end
	assign ALUSel = control; 
endmodule