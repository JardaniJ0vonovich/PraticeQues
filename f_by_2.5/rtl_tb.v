module rtl_tb();
	reg clk,rst;
	wire out;

	parameter timeperiod = 10;

	rtl DUT(.clk(clk),.rst(rst),.out(out));

	always
		begin
			clk = 1'b0;
			#(timeperiod/2);
			clk = 1'b1;
			#(timeperiod/2);
		end

	task reset;
		begin
			@(negedge clk)
			rst = 1'b1;
			@(negedge clk)
			rst = 1'b0;
		end
	endtask

	initial
		begin
			reset;
			#100;
			$finish;
		end

	initial
		begin
			$dumpfile("waveform.vcd");
			$dumpvars(0,rtl_tb);
		end

endmodule


