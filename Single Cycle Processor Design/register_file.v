module register_file(CLK,A1,A2,A3,WE3,WD3,R15,RD1,RD2);
input CLK, WE3;
input [3:0] A1, A2, A3;
input [31:0]  WD3, R15;
output [31:0] RD1, RD2;
wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15, o10,o11,o12,o13,o20,o21,o22,o23; 
wire [15:0] we;
reg reset;

assign we[0] = ~A3[3] & ~A3[2] & ~A3[1] & ~A3[0] & WE3; 
assign we[1] = ~A3[3] & ~A3[2] & ~A3[1] &  A3[0] & WE3; 
assign we[2] = ~A3[3] & ~A3[2] &  A3[1] & ~A3[0] & WE3; 
assign we[3] = ~A3[3] & ~A3[2] &  A3[1] &  A3[0] & WE3; 
assign we[4] = ~A3[3] &  A3[2] & ~A3[1] & ~A3[0] & WE3; 
assign we[5] = ~A3[3] &  A3[2] & ~A3[1] &  A3[0] & WE3; 
assign we[6] = ~A3[3] &  A3[2] &  A3[1] & ~A3[0] & WE3; 
assign we[7] = ~A3[3] &  A3[2] &  A3[1] &  A3[0] & WE3; 
assign we[8] =  A3[3] & ~A3[2] & ~A3[1] & ~A3[0] & WE3; 
assign we[9] =  A3[3] & ~A3[2] & ~A3[1] &  A3[0] & WE3; 
assign we[10] = A3[3] & ~A3[2] &  A3[1] & ~A3[0] & WE3; 
assign we[11] = A3[3] & ~A3[2] &  A3[1] &  A3[0] & WE3; 
assign we[12] = A3[3] &  A3[2] & ~A3[1] & ~A3[0] & WE3; 
assign we[13] = A3[3] &  A3[2] & ~A3[1] &  A3[0] & WE3; 
assign we[14] = A3[3] &  A3[2] &  A3[1] & ~A3[0] & WE3; 
assign we[15] = A3[3] &  A3[2] &  A3[1] &  A3[0] & WE3;

initial 
	begin
		reset = 1;
		#30;
		reset = 0;
	end	

register_WE R0(.clk(CLK), .reset(reset), .WE(we[0]), .data(WD3), .out(r0));
register_WE R1(.clk(CLK), .reset(reset), .WE(we[1]), .data(WD3), .out(r1));
register_WE R2(.clk(CLK), .reset(reset), .WE(we[2]), .data(WD3), .out(r2));
register_WE R3(.clk(CLK), .reset(reset), .WE(we[3]), .data(WD3), .out(r3));
register_WE R4(.clk(CLK), .reset(reset), .WE(we[4]), .data(WD3), .out(r4));
register_WE R5(.clk(CLK), .reset(reset), .WE(we[5]), .data(WD3), .out(r5));
register_WE R6(.clk(CLK), .reset(reset), .WE(we[6]), .data(WD3), .out(r6));
register_WE R7(.clk(CLK), .reset(reset), .WE(we[7]), .data(WD3), .out(r7));
register_WE R8(.clk(CLK), .reset(reset), .WE(we[8]), .data(WD3), .out(r8));
register_WE R9(.clk(CLK), .reset(reset), .WE(we[9]), .data(WD3), .out(r9));
register_WE R10(.clk(CLK), .reset(reset), .WE(we[10]), .data(WD3), .out(r10));
register_WE R11(.clk(CLK), .reset(reset), .WE(we[11]), .data(WD3), .out(r11));
register_WE R12(.clk(CLK), .reset(reset), .WE(we[12]), .data(WD3), .out(r12));
register_WE R13(.clk(CLK), .reset(reset), .WE(we[13]), .data(WD3), .out(r13));
register_WE R14(.clk(CLK), .reset(reset), .WE(we[14]), .data(WD3), .out(r14));
register_WE R15_reg(.clk(CLK), .reset(reset), .WE(1), .data(R15), .out(r15));
mux4x1 m10(.bus_in1(r0),.bus_in2(r1),.bus_in3(r2),.bus_in4(r3),.select(A1[1:0]),.bus_out(o10));
mux4x1 m11(.bus_in1(r4),.bus_in2(r5),.bus_in3(r6),.bus_in4(r7),.select(A1[1:0]),.bus_out(o11));
mux4x1 m12(.bus_in1(r8),.bus_in2(r9),.bus_in3(r10),.bus_in4(r11),.select(A1[1:0]),.bus_out(o12));
mux4x1 m13(.bus_in1(r12),.bus_in2(r13),.bus_in3(r14),.bus_in4(r15),.select(A1[1:0]),.bus_out(o13));
mux4x1 m14(.bus_in1(o10),.bus_in2(o11),.bus_in3(o12),.bus_in4(o13),.select(A1[3:2]),.bus_out(RD1));
mux4x1 m20(.bus_in1(r0),.bus_in2(r1),.bus_in3(r2),.bus_in4(r3),.select(A2[1:0]),.bus_out(o20));
mux4x1 m21(.bus_in1(r4),.bus_in2(r5),.bus_in3(r6),.bus_in4(r7),.select(A2[1:0]),.bus_out(o21));
mux4x1 m22(.bus_in1(r8),.bus_in2(r9),.bus_in3(r10),.bus_in4(r11),.select(A2[1:0]),.bus_out(o22));
mux4x1 m23(.bus_in1(r12),.bus_in2(r13),.bus_in3(r14),.bus_in4(r15),.select(A2[1:0]),.bus_out(o23));
mux4x1 m24(.bus_in1(o20),.bus_in2(o21),.bus_in3(o22),.bus_in4(o23),.select(A2[3:2]),.bus_out(RD2));
endmodule
