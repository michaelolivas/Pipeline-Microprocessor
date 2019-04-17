module SignExtend( input [15:0] a, 
						 output [31:0] signImm );
						
	assign signImm = { {16{a[15]}}, a };


endmodule