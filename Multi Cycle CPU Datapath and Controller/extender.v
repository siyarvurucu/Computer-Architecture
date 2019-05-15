module extender(in,out);
	input wire [5:0] in;
	output wire [7:0] out;
	wire [1:0] m;
	assign m[0] = in[5];
	assign m[1] = in[5];
	assign out = {m,in};
endmodule 
