module simple_register #(parameter W=32)(clk, reset, data, out);
	input clk;
	input wire [(W-1):0] data;
	input wire reset;
	output reg [(W-1):0] out;
	
	always @(posedge clk)
		out = (reset==1) ? 0 : data;
endmodule 