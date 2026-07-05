module counter_tb();
	reg [6:0] in;
	reg ld,rst,clk;
	wire [6:0] out;

	counter DUT(.in(in),.ld(ld),.rst(rst),.clk(clk),.out(out));

	always
		begin
			clk = 1'b0;
			#5;
			clk = 1'b1;
			#5;
		end

	task reset;
		begin
			@(negedge clk)
			rst = 1'b1;
			@(negedge clk)
			rst = 1'b0;
		end
	endtask

	task load(input [6:0] a);
		begin
			@(negedge clk)
			ld = 1'b1;
			in = a;
			@(negedge clk)
			ld = 1'b0;
			in = 7'b0;
		end
	endtask

	initial
		begin
			reset;
			#20;
			load(7'd76);
			#70;
			$finish;
		end

	initial
		begin
			$dumpfile("waveform.vcd");
			$dumpvars(0,counter_tb);
		end
endmodule
