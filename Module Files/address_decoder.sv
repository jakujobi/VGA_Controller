module address_decoder( 
	input logic [9:0] row, col, 
	output logic [11:0] address 
);

	assign address = ((row/12'd10) * 12'd64) + (col/12'd10);

endmodule
