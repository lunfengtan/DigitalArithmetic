module recoder(sign, one, two, yp1, y0, yn1);

	output sign, one, two;
	input yp1, y0, yn1;
	
	assign sign = yp1;
	assign one = y0 ^ yn1;
	assign two = (yp1 & ~y0 & ~yn1) | (~yp1 & y0 & yn1);
	
endmodule


module multipleGen(out, x, sign, one, two);
// produce one row of 25bits
	output [24:0] out;
	input [23:0] x;
	input sign, one, two;
	
	assign out = sign ?
				 {	one ? ~{x[23], x} :
				 	(two ? ~{x, 1'b0} : ~0})
				 	:
				 {	one ? {x[23], x} :
				 	(two ? {x, 1'b0} : 0});
endmodule


module r4BitMatrixGen(o0, o1, o2, o3, i0, i1, i2, i3);

	output [26:0] o0;	// 25 width + s' + s
	output [24:0] o1, o2, o3;	// 25 width
	output ca, cb, cc, cd, sa, sb, sc, sd;
	input [24:0] i0, i1, i2, i3;
	
	assign o0 = {~i0[24], i0[24], i0[24:0]};
	assign o1 = {~i1[24], i1[23:0]};
	assign o2 = {~i2[24], i2[23:0]};
	assign o3 = {~i3[24], i3[23:0]};
	
endmodule
