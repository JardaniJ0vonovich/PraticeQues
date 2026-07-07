module rtl(n,rst,out);
	input n,rst;
	output reg out;
	
	reg [((2**n)-1):0] i;
	reg [(n-1):0] sel;

	always @(*)
		begin
			if(rst)
				out = 1'b0;
			else
				out = i[sel];
		end
endmodule
