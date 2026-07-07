module rtl(a,b,out);
	input [1:0] a,b;
	output [3:0] out;

	wire w1,w2;

	halfadder HA1(.carry(w1),.a(a[1]),.b(b[0]));
	halfadder HA2(.carry(w2),.a(a[0]),.b(b[1]));

	halfadder HA3(.sum(out[1]),.carry(out[3]),.a(w1),.b(w2));

	assign out[0] = b[0] & a[0];
	assign out[2] = a[1] & b[1] & ~out[0];

endmodule
