module mux2x1 #(parameter W=32)(bus_in1,bus_in2,bus_out,select);

	input wire select;
	input wire [(W-1):0] bus_in1, bus_in2;
	output wire [(W-1):0] bus_out;
	
	assign bus_out = select ? bus_in2 : bus_in1;
	
endmodule
	