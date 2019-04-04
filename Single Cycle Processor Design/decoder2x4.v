module decoder2x4(x,y); 
	input  wire [1:0] x;
	output wire [3:0] y;
	
	assign y[0]= (~x[1]) & (~x[0]);
	assign y[1]= (~x[1]) & x[0];
	assign y[2]= x[1] & (~ x[0]);
	assign y[3]= x[1] & x[0];

endmodule 