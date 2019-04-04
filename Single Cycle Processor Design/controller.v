module controller(clk,cmd,rA,ALUFlags,PCSrc,RegSrc,RegWrite,ALUSrc,ShiftDir,MemtoReg,ALUCtrl,MemWrite,Flags);
	input wire clk;
	input wire [3:0] cmd,rA,ALUFlags;
	output wire PCSrc,RegSrc,RegWrite,ALUSrc,ShiftDir,MemWrite;
	output wire [2:0] ALUCtrl;
	output wire [1:0] MemtoReg;
	wire r15,cmp;
	
	output reg [3:0] Flags;
	// CMDs
//	0000 ADD
//	0001 SUB
//	0010 AND
//	0011 ORR
//	0100 LSL
//	0101 LSR
//	0110 CMP
//	0111 STR
//	1000 LDR
	
	assign r15 = &rA;							   // Destination r15?
	assign PCSrc = ~(RegWrite & r15);		   // RegWrite & Dest r15? It's Branch
	assign RegSrc = cmd[2];  					// RegSrc is set in STR,CMP command x for shifts and load
	assign RegWrite = ~(cmd[2]&cmd[1]);		// RegWrite is zero for STR and CMP
	assign ShiftDir = cmd[0];					// 0 for LSL, 1 for LSR, X for anything else
	assign ALUSrc = cmd[3] | (cmd[2]&~cmd[1]) | (cmd[2]&cmd[0]); // Set for Shift and Memory OPs, zero for others
																					 // Mad karnaugh map skillz!
	assign MemtoReg[0] = ~ALUSrc;				// 01 for ALU, 10 for Shifter, 00 for DataMem; as source to registers
	assign MemtoReg[1] = ALUSrc&~cmd[3];
	
	assign MemWrite = RegSrc;
	
	assign ALUCtrl[0] = ~cmd[2] & cmd[0];
	assign ALUCtrl[1] = cmd[2]&~cmd[0];
	assign ALUCtrl[2] = ~cmd[2] & cmd[1];
	
	assign cmp = cmd[2]&cmd[1]&~cmd[0]; 
	
	always @(negedge cmp)
		begin
		Flags[3:0] = ALUFlags[3:0];
		end
endmodule
	 
		 
