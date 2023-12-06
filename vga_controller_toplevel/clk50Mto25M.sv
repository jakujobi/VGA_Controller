module clk50Mto25M(
	input logic clk50M_in,
	output logic clk25M_out
);

	always_ff@(posedge clk50M_in)
		clk25M_out <= ~clk25M_out;

endmodule
