module pc_plus_4(from_pc , next_to_pc);
	input [31:0] from_pc;
	output [31:0] next_to_pc;

	assign next_to_pc = from_pc + 4;
endmodule
