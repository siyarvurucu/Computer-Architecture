module cvg #(parameter W=32 , D=32'h0000)(bus_out);
	output wire [(W-1):0] bus_out;
	assign bus_out = D;
	
endmodule 