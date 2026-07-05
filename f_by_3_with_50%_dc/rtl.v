module rtl(rst,clk,out);
	input clk,rst;
	output out;

	reg [1:0] count;
	reg q,x;

	always @(posedge clk)
		begin
			if (rst)
				begin
					q  <= 1'b0;
					count <= 1'b0;
				end
			else if (count == 1'b0)
				begin
					q <= 1'b0;
					count <= count + 1'b1;
				end
			else if (count == 1'b1)
				begin
					q <= 1'b1;
					count <= count + 1'b1;
				end
			else
				begin
					q <= 1'b1;
					count <= 1'b0;
				end
		end

	always@ (negedge clk)
		begin
			if(rst)
				x <= 1'b0;
			else 
				x <= q;
		end

	assign out = x & q;

endmodule
