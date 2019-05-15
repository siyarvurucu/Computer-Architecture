module barrel_shifter(A,func,out);
	input wire [7:0] A;
	input wire [2:0] func;
	output reg [7:0] out;
	
	always @(*)
		begin
			case(func)
			3'b000:
				out = {A[6:0],A[7]};
			3'b001:
				out = {A[0],A[7:1]};
			3'b010:
				out = {A[6:0],1'b0};
			3'b011:
				out = {1'b0,A[7:1]};
			3'b100:
				out = {A[7],A[7:1]};
			default:
				out = A[7:0];
			endcase
		end
endmodule

			
				
	
	