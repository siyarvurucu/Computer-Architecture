module register_file(CLK,A1,A2,A3,WE3,WD3,RD1,RD2,PCWrite,LRWrite,PC,reset,reg2);
input CLK, WE3,PCWrite,LRWrite,reset;
input [2:0] A1, A2, A3;
input [7:0]  WD3;
output [7:0] RD1, RD2, PC, reg2;
wire [7:0] r0,r1,r2,r3,r4,r5,r6,r7,o10,o11,o20,o21; 
wire [7:0] we;

assign we[0] = ~A3[2] & ~A3[1] & ~A3[0] & WE3; 
assign we[1] = ~A3[2] & ~A3[1] &  A3[0] & WE3; 
assign we[2] = ~A3[2] &  A3[1] & ~A3[0] & WE3; 
assign we[3] = ~A3[2] &  A3[1] &  A3[0] & WE3; 
assign we[4] = A3[2] & ~A3[1] & ~A3[0] & WE3; 
assign we[5] = A3[2] & ~A3[1] &  A3[0] & WE3; 
assign we[6] = (A3[2] &  A3[1] & ~A3[0] & WE3)|LRWrite; 
assign we[7] = (A3[2] &  A3[1] &  A3[0] & WE3)|PCWrite; 
assign PC = r7;
assign reg2 = r2;

//initial 
//	begin
//		reset = 1;
//		#30;
//		reset = 0;
//	end	

register_WE R0(.clk(CLK), .reset(reset), .WE(we[0]), .data(WD3), .out(r0));
register_WE R1(.clk(CLK), .reset(reset), .WE(we[1]), .data(WD3), .out(r1));
register_WE R2(.clk(CLK), .reset(reset), .WE(we[2]), .data(WD3), .out(r2));
register_WE R3(.clk(CLK), .reset(reset), .WE(we[3]), .data(WD3), .out(r3));
register_WE R4(.clk(CLK), .reset(reset), .WE(we[4]), .data(WD3), .out(r4));
register_WE R5(.clk(CLK), .reset(reset), .WE(we[5]), .data(WD3), .out(r5));
register_WE R6(.clk(CLK), .reset(reset), .WE(we[6]), .data(WD3), .out(r6));
register_WE R7(.clk(CLK), .reset(reset), .WE(we[7]), .data(WD3), .out(r7));

mux4x1 m10(.bus_in1(r0),.bus_in2(r1),.bus_in3(r2),.bus_in4(r3),.select(A1[1:0]),.bus_out(o10));
mux4x1 m11(.bus_in1(r4),.bus_in2(r5),.bus_in3(r6),.bus_in4(r7),.select(A1[1:0]),.bus_out(o11));
mux2x1 m14(.bus_in1(o10),.bus_in2(o11),.select(A1[2]),.bus_out(RD1));

mux4x1 m20(.bus_in1(r0),.bus_in2(r1),.bus_in3(r2),.bus_in4(r3),.select(A2[1:0]),.bus_out(o20));
mux4x1 m21(.bus_in1(r4),.bus_in2(r5),.bus_in3(r6),.bus_in4(r7),.select(A2[1:0]),.bus_out(o21));
mux2x1 m24(.bus_in1(o20),.bus_in2(o21),.select(A2[2]),.bus_out(RD2));
endmodule
