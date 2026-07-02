module tb;

reg clk;
reg rst;
reg ld;
reg up_down;
reg [7:0] in;
wire [7:0] out;

// DUT Instantiation
rtl dut (
    .clk(clk),
    .rst(rst),
    .ld(ld),
    .up_down(up_down),
    .in(in),
    .out(out)
);

// Clock Generation (10 ns period)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, tb);

    // Initialize
    rst     = 1;
    ld      = 0;
    up_down = 0;
    in      = 8'h00;

    // Apply reset
    #12 rst = 0;

    // Load 25
    @(posedge clk);
    ld = 1;
    in = 8'd25;

    @(posedge clk);
    ld = 0;

    // Count UP for 5 clocks
    up_down = 0;
    repeat(5) @(posedge clk);

    // Count DOWN for 5 clocks
    up_down = 1;
    repeat(5) @(posedge clk);

    // Load another value
    @(posedge clk);
    ld = 1;
    in = 8'd250;

    @(posedge clk);
    ld = 0;

    // Count UP for 3 clocks
    up_down = 1;
    repeat(3) @(posedge clk);

    #200;
    $finish;
end

endmodule
