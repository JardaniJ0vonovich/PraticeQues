module sumorcarry(a,b,cin,sum,carry);
input [3:0] a,b;
input cin;
output [3:0] sum;
wire [2:0] c;
output carry;
wire [3:0] w;

xor xor1(w,cin,b);

full_adder fa1(.a(a[0]),.b(w[0]),.c(cin),.sum(sum[0]),.carry(c[0]));
full_adder fa2(.a(a[1]),.b(w[1]),.c(c[0]),.sum(sum[1]),.carry(c[1]));
full_adder fa3(.a(a[2]),.b(w[2]),.c(c[1]),.sum(sum[2]),.carry(c[2]));
full_adder fa4(.a(a[3]),.b(w[3]),.c(c[2]),.sum(sum[3]),.carry(carry));

endmodule
