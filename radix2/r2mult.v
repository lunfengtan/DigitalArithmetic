module r2mult(o_product, i_x, i_y);
    output [47:0] o_product;
    input [23:0] i_x, i_y;

    wire [23:0] r0, r1, r2, r3;
    wire [23:0] r4, r5, r6, r7;
    wire [23:0] r8, r9, r10, r11;
    wire [23:0] r12, r13, r14, r15;
    wire [23:0] r16, r17, r18, r19;
    wire [23:0] r20, r21, r22, r23;

    bitMatrixGen r0_3(r0, r1, r2, r3, i_x, i_y[3:0]);
    bitMatrixGen r4_7(r4, r5, r6, r7, i_x, i_y[7:4]);
    bitMatrixGen r8_11(r8, r9, r10, r11, i_x, i_y[11:8]);
    bitMatrixGen r12_15(r12, r13, r14, r15, i_x, i_y[15:12]);
    bitMatrixGen r16_19(r16, r17, r18, r19, i_x, i_y[19:16]);
    bitMatrixGen r20_23(r20, r21, r22, r23, i_x, i_y[23:20]);

    // Level 1, Row 1 reduction
    wire [??:0] wL1R1;
    wire [??:0] sL1R1, cL1R1;

    assign o_product[0] = r0[0];
    halfadder L1R1_b1(o_product[1], wL1R1[0], {r0[1], r1[0]});
    adder32c L1R1_b2(o_product[2], cL1R1[0], wL1R1[1], {r0[2], r1[1], r2[0]}, wL1R1[0]);
    adder42 L1R1_b3(sL1R1[0], cL1R1[0], wL1R1[2], {r0[3], r1[2], r2[1], r3[0]}, wL1R1[1]);

    adder42 L1R1_b3(sL1R1[0], cL1R1[0], wL1R1[2], {r0[3], r1[2], r2[1], r3[0]}, wL1R1[1]);

    adder42 L1R1_b3(sL1R1[0], cL1R1[0], wL1R1[2], {r0[3], r1[2], r2[1], r3[0]}, wL1R1[1]);

