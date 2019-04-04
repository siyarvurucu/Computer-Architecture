module barrel_shifter(A,dir,Imm,out);
	input wire [31:0] A;
	input wire [4:0] Imm;
	input wire dir;
	output reg [31:0] out;
	
	always @(*)
		begin
			if(dir) out=A>>Imm;
			else out = A<<Imm;
		end
endmodule

			
				
	
	