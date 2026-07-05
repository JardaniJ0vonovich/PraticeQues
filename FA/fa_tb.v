module fa_tb();
reg [3:0] a,b,c;
wire [3:0] sum;
wire carry;
integer i;

full_adder DUT(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));

always@(*)
begin
	a=4'b1010;
	b=4'b0101;
	c=1'b1;
end

initial
begin
       $dumpfile("waveform.vcd");
       $dumpvars(0,fa_tb);
       $monitor("value of a=%b,b=%b,c_in=%b,sum=%b,carry=%b", a,b,c,sum,carry);
end

endmodule                   
