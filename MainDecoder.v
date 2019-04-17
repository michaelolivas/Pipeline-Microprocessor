module MainDecoder( input [5:0] Opcode,
							output reg MtoRFSel, 
							output reg DMWE,
							output reg Branch,
							output reg ALUInSel, 
							output reg RFDSel, 
							output reg RFWE,
							output reg [1:0] ALUOp,
							output reg Jump);
							
	reg [8:0] control_output; 
	
    initial Jump = 0; 
	always @(*) begin 
		case (Opcode) 
		6'b100011: control_output <= 9'b101001000;  // LW
		6'b101011: control_output <= 9'b001010000; // SW
		6'b000100: control_output <= 9'b000100010; // Beq 
		6'b000000: control_output <= 9'b110000100; // R-type 
		6'b001000: control_output <= 9'b101000000; // addi  
		6'b000010: control_output <= 9'b000000001; // Jump 
		default: control_output <= 9'bxxxxxxxx0;
		endcase
	end 
	
	// Assign Opcode to the respective multiplexers and write enables. 
	always@*
	{ RFWE, RFDSel, ALUInSel, Branch, DMWE, MtoRFSel, ALUOp [1:0], Jump } = control_output [8:0] ;

endmodule