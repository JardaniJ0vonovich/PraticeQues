module rtl(clk,rst,in,ld,up_down,out);
	input clk,rst,up_down,ld;
	output reg [7:0] out;
	input [7:0] in;


	always @(posedge clk)
	begin
		if(rst)
		begin
			out <= 8'b0;
		end
		else if(ld == 1)
			out <= in;
		else if (up_down == 0)
			out <= out + 1'b1;
	        else if (up_down == 1)
			out <= out - 1'b1;
	end
endmodule
