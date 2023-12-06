module vga_controller( 	
	input logic clk25M, 
	input logic [3:0] R_in, G_in, B_in, 
	
	output logic vsync_out, hsync_out, 
	output logic [3:0] R_out, G_out, B_out, 
	output logic [9:0] COL_out, ROW_out );

	//create two finite state machines: one for column/hsync, one for row/vsync
	
endmodule
