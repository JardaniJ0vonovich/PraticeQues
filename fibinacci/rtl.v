module rtl(clk,rst,out);
	input clk,rst;
	output reg [7:0]  out;

	reg [7:0] q,q_prev_state;

	always @(posedge clk)
		begin
			if(rst)
				begin
					q <= 1;
					q_prev_state <= 1;
					out <= 1;
				end

			else
				begin
					out <= q + q_prev_state;
					q_prev_state <= q;
					q <= q + q_prev_state;
				end
					
		end
endmodule

	
