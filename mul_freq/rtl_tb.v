module tb;

reg clk;
reg rst;
reg [1:0] sel;
wire out;

rtl dut (
    .clk(clk),
    .rst(rst),
    .sel(sel),
    .out(out)
);

// Clock generation (10 ns period)
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb);

    rst = 1;
    sel = 2'b00;

    #20;
    rst = 0;

    // F/2, 50%
    sel = 2'b00;
    #100;

    // F/5, 40%
    sel = 2'b01;
    #100;

    // F/5, 60%
    sel = 2'b10;
    #100;

    // F/4, 50%
    sel = 2'b11;
    #100;

    $finish;
end

endmodule
