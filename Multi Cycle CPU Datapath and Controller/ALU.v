module ALU #(parameter W=32)(control, A, B, out, N, Z, C, V);
	input wire [(W-1):0] A,B;
	output reg [(W-1):0] out;
	input wire [2:0] control;
	output reg N,Z,C,V;
   wire [(W-1):0] B_comp, A_comp;
	assign B_comp = ~B+1;
	assign A_comp = ~A+1;
	always @(*)
		begin
			case(control)
			0:   
				 {C,out} = A + B ;
			1:   
				 {C,out} = A + B_comp;
			2:
				 {C,out} = B + A_comp;
			3:
				 out = ~(A ^ B);
			4:
				 out = A & B;
			5:
				 out = A | B;
			6:
				 out = A ^ B;
			7:
				 out = 8'b00000000;
				 
			endcase
		N = out[W-1];
		Z = (out==0);
		V = (control==2'b00) ? (A[W-1] ~^ B[W-1]) & (A[W-1] ^ out[W-1]):
			 (control==2'b01) ? (A[W-1] ~^ B_comp[W-1]) & (A[W-1] ^ out[W-1]):
			 (control==2'b10) ? (A_comp[W-1] ~^ B[W-1]) & (A_comp[W-1] ^ out[W-1]):
			 0;
		if(control>2) 
			C = 0; 
		end
	
endmodule  