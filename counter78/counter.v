module counter(in,ld,rst,clk,out);
	input rst,clk,ld;
	output reg [6:0] out;
	input [6:0] in;

	always @(posedge clk)
		begin
			if (rst)
				out <= 7'd75;
			else if (ld)
				out <= in;
			else if (out == 7'd78)
				out <= 7'd75;
			else
				out <= out + 1'd1;
		end
endmodule
