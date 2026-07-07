module rtl (
    input        clk,
    input        rst,
    input  [1:0] sel,
    output reg   out
);

reg [2:0] count;

always @(posedge clk)
begin
    if (rst)
        count <= 0;
    else
    begin
        case(sel)

            // F/2
            2'b00:
                if(count == 1)
                    count <= 0;
                else
                    count <= count + 1;

            // F/5
            2'b01,
            2'b10:
                if(count == 4)
                    count <= 0;
                else
                    count <= count + 1;

            // F/4
            2'b11:
                if(count == 3)
                    count <= 0;
                else
                    count <= count + 1;

        endcase
    end
end

always @(*)
begin
    case(sel)

        // F/2, 50%
        2'b00:
            out = (count < 1);

        // F/5, 40%
        2'b01:
            out = (count < 2);

        // F/5, 60%
        2'b10:
            out = (count < 3);

        // F/4, 50%
        2'b11:
            out = (count < 2);

        default:
            out = 0;

    endcase
end

endmodule
