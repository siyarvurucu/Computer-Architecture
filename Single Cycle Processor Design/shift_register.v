module shift_register #(parameter W=32)(clk, reset, load, dir, data,left,right,out);
	input clk;
	input wire reset, load, dir;
	input wire [(W-1):0] data;
	input wire left,right;
	output reg [(W-1):0] out;
	
	always @(posedge clk)
		out = reset ? 0 : load ? data: dir ? {left,out[W-1:1]} : {out[W-2:0],right};
endmodule 