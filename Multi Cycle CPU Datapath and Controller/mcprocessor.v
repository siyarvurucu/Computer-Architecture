module mcprocessor(clk,reg2);

input wire clk;
wire [29:0] cable;
output wire [7:0] reg2;
reg resetpc,RESET,RUN;
	initial
		begin
			resetpc = 1; #30;
			resetpc = 0;
			RESET = 0;
			RUN = 1;
		end

wire reset;
assign reset = resetpc | RESET;
controller CU(.RESET(reset),.RUN(RUN),.OP(cable[4:0]),.ALUFlags(cable[8:5]),.CLK(clk),.PCWrite(cable[9]),.LRWrite(cable[10]),.AdrSrc(cable[11]),.MemWrite(cable[12]),
						.IRWrite(cable[13]),.RegSrc(cable[14]),.RegWrite(cable[15]),.ALUSrcB(cable[17:16]),.dataload(cable[29]),
						.ALUSrcA(cable[19:18]),.ALUCtrl(cable[22:20]),.ShFunc(cable[25:23]),.ALUSH(cable[26]),.ResultSrc(cable[28:27]));
datapath path(
	.CLK(clk),
	.RESET(reset),
	.MemWrite(cable[12]),
	.AdrSrc(cable[11]),
	.IRWrite(cable[13]),
	.RegSrc(cable[14]),
	.RegWrite(cable[15]),
	.PCWrite(cable[9]),
	.LRWrite(cable[10]),
	.ALUSH(cable[26]),
	.ALUControl(cable[22:20]),
	.ALUSrcA(cable[19:18]),
	.ALUSrcB(cable[17:16]),
	.ResultSrc(cable[28:27]),
	.ShFunc(cable[25:23]),
	.Flags(cable[8:5]),
	.OP(cable[4:0]),
	.dataload(cable[29]),
	.reg2(reg2)
);

endmodule 