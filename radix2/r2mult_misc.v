module adder42(o_sum, o_carry, cout, i_op, cin);
    output o_sum;
    output o_carry;
    output cout;
    input [3:0] i_op;
    input cin;

    wire w_xor1, w_xor2, w_xor3;
    wire w_mux1;

    assign w_xor1 = i_op[1] ^ i_op[0];
    assign w_xor2 = i_op[3] ^ i_op[2];
    assign w_xor3 = w_xor1 ^ w_xor2;

    assign cout = w_xor2 ? i_op[1] : i_op[3];
    assign o_sum = w_xor3 ^ cin;
    assign o_carry = w_xor3 ? cin : i_op[0];

endmodule

module adder32c(o_sum, o_carry, cout, i_op, cin);
    output o_sum, o_carry;
    output cout;
    input [2:0] i_op;
    input cin;

    wire s1, s2;

    assign s1 = i_op[1] ^ i_op[0];
    assign s2 = i_op[2] ^ s1; 
    
    assign cout = (i_op[1] & i_op[0]) | (s1 & i_op[2]);
    assign o_sum = s2 ^ cin;
    assign o_carry = s2 & cin;
    
endmodule

module halfadder(o_sum, o_carry, i_op);
    output o_sum, o_carry;
    input [1:0] i_op;

    assign o_sum = i_op[1] ^ i_op[0];
    assign o_carry = i_op[1] & i_op[0];

endmodule

module bitMatrixGen(o0, o1, o2, o3, x, y);
    output [23:0] o0, o1, o2, o3;
    input [23:0] x;
    input [3:0] y;

    assign o0 = {{~{x[23] & y[0]}}, {{23{y[0]}} & x[22:0]}};
    assign o1 = {{~{x[23] & y[1]}}, {{23{y[1]}} & x[22:0]}};
    assign o2 = {{~{x[23] & y[2]}}, {{23{y[2]}} & x[22:0]}};
    assign o3 = {{~{~x[23] & y[3]}}, {{23{y[3]}} & ~x[22:0]}};
    
endmodule
