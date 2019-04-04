module adder #(parameter W=32)(A,B,out);
	input wire [(W-1):0] A,B;
	output wire [(W-1):0] out;
	assign out = A + B;
endmodule 