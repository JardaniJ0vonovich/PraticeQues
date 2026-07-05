module rtl(clk,rst,out);
	input clk,rst;
	output out;
	reg [2:0] count;

	always @(posedge clk or negedge clk)
		begin
			if (rst)
				count <= 1'b0;
			else if (count == 4)
				count <= 0;
			else
				count <= count + 1;
		end

	assign out = (count == 0);
endmodule
