module rtl(in,clk,rst,wr,rd,out);
	input clk,wr,rd,rst;
	input [7:0] in;
	output reg [7:0] out;

	integer i;

	reg [3:0] wr_addr;
	reg [7:0] mem [0:15];

	always@(posedge clk)
		begin
			if(rst)
				begin
					out <= 8'b0;
					for(i=0;i<16;i=i+1)
						mem[i] <= 8'b0;
					wr_addr <= 4'b0;
				end
			else if (wr == 1 && rd == 0)
				begin
					mem[wr_addr] <= in;
					wr_addr <= wr_addr + 1;
				end
			else if (wr == 0 && rd == 1)
				begin
					wr_addr <= wr_addr - 1;
					out <= mem[wr_addr-1];
				end
			else if (wr == 1 && rd == 1)
				begin
					mem[wr_addr-1] <= in;
					out <= mem[wr_addr-1];
				end
		end
endmodule
