module rtl(clk,rst,out1,out2,out3);
	input clk,rst;
	output out2;
	output out1,out3;

	reg [2:0] count,count1,count2;

	always @(posedge clk or negedge clk)
		begin
			if (rst)
				count <= 1'b0;
			else if (count == 4)
				count <= 0;
			else
				count <= count + 1;
		end

	assign out1 = (count < 2);

	
	always @(posedge clk)
		begin
			if (rst)
				count1 <= 1'b0;
			else if (count1 == 4)
				count1 <= 0;
			else
				count1 <= count1 + 1;
		end

	assign out2 = (count1 < 2);

	
	always @(posedge clk)
		begin
			if (rst)
				count2 <= 1'b0;
			else if (count2 == 4)
				count2 <= 0;
			else
				count2 <= count2 + 1;
		end
	assign out3 = (count2 < 1);

endmodule
