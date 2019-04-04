module basic_computer(clk);
	input wire clk;
	wire [26:0] kablo;
	reg resetpc;
	initial
		begin
			resetpc = 1; #30;
			resetpc = 0;
		end
	
	//cmd,rA,ALUFlags,PCSrc,RegSrc,RegWrite,ALUSrc,ShiftDir,MemtoReg,ALUCtrl,MemWrite,Flags
	
	controller CU(.clk(clk),.cmd(kablo[3:0]),.rA(kablo[7:4]),.ALUFlags(kablo[11:8]),.PCSrc(kablo[12]),
						.RegSrc(kablo[13]),.RegWrite(kablo[14]),.ALUSrc(kablo[15]),.ShiftDir(kablo[16]),
						.MemtoReg(kablo[18:17]),.ALUCtrl(kablo[21:19]),.MemWrite(kablo[22]),.Flags(kablo[26:23]));
	
	datapath DP(.CLK(clk),.RegWrite(kablo[14]),.MemWrite(kablo[22]),.PCSrc(kablo[12]),
					.RegSrc(kablo[13]),.ShiftDir(kablo[16]),.ALUSrc(kablo[15]),.PCReset(resetpc),.ALUControl(kablo[21:19]),
					.MemtoReg(kablo[18:17]),.ALUFlags(kablo[11:8]),.cmd(kablo[3:0]),.rA(kablo[7:4]));
					
endmodule 