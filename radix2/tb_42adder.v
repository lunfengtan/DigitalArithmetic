module tb_42adder();

    wire sum, carry, cout;
    reg [3:0] xin;
    reg cin;

    reg clk;

    integer x, c;

    adder42 adder42_inst(sum, carry, cout, xin, cin);

    initial begin
        clk = 0;
        forever
            #5 clk = ~clk;
    end

    initial begin
        $monitor("cin = %b, xin = %b, sum = %b, carry = %b, cout = %b", cin, xin, sum, carry, cout);
        for (c = 0; c <= 1; c = c + 1) begin
            cin = c;
            for (x = 0; x < 16; x = x + 1) begin
                xin = x;
                #10;
            end
        end
        $finish;
    end

endmodule
