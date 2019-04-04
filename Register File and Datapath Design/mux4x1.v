module mux4x1 #(parameter W=32)(bus_in1,bus_in2,bus_in3,bus_in4,bus_out,select);

	input wire [1:0] select;
	input wire [(W-1):0] bus_in1, bus_in2, bus_in3, bus_in4;
	output wire [(W-1):0] bus_out;
	
	assign bus_out = (select==2'b00) ? bus_in1:
						  (select==2'b01) ? bus_in2:
						  (select==2'b10) ? bus_in3:
						  (select==2'b11) ? bus_in4:
						  0;
		
endmodule
	