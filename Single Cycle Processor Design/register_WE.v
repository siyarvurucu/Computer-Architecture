module register_WE #(parameter W=32)(clk, reset, WE, data, out,init);
	input clk;
	input wire [(W-1):0] data,init;
	input wire reset, WE;
	output reg [(W-1):0] out;
	initial
		begin
			out = init;
		end
	
	
	always @(posedge clk)
		out = (reset==1) ? 0 : WE ? data:out;
endmodule 