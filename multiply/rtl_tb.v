module rtl_tb();
	reg [1:0] a,b;
	wire [3:0] out;

	integer i,j;

	rtl DUT(.a(a),.b(b),.out(out));

	initial
		begin
			for(i=0;i<4;i=i+1)
				begin
					for(j=0;j<4;j=j+1)
						begin
							a=i;
							b=j;
							#10;
						end
				end
			#100;
			$finish;
		end
	initial
		begin
			$dumpfile("waveform.vcd");
			$dumpvars(0,rtl_tb);
		end
endmodule
