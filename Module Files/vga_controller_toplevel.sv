module vga_controller_toplevel( 
	input logic clk50M, 
	output logic [3:0] VGA_R, VGA_G, VGA_B, 
	output logic VGA_hsync, VGA_vsync );

	logic clk25M;
	logic [9:0] COL_out, ROW_out;
	logic [3:0] vga_r_wires, vga_g_wires, vga_b_wires;
	logic [11:0] memory_address;
	
	//divide the clock to the necessary 25MHz
	clk50Mto25M clk_div(.clk50M_in(clk50M), .clk25M_out(clk25M));
	
	//VGA controller. Writes R/G/B_in to the current COL/ROW. Generates proper hsync and vsync signals to drive VGA device.
	vga_controller( .clk25M(clk25M), .R_in(vga_r_wires), .G_in(vga_g_wires), .B_in(vga_b_wires), 
								.vsync_out(VGA_vsync), .hsync_out(VGA_hsync), .R_out(VGA_R), .G_out(VGA_G), .B_out(VGA_B), 
								.COL_out(COL_out), .ROW_out(ROW_out) );
								
	vga_memory image_ROM ( .address(memory_address), .clock(clk25M), .q({vga_r_wires,vga_g_wires,vga_b_wires}));

	address_decoder(.row(ROW_out), .col(COL_out), .address(memory_address));
	
endmodule
