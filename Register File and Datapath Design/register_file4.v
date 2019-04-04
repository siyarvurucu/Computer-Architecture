module register_file4 #(parameter W=32)(clk,reset,WE,addr_input,addr_out1,addr_out2,data,out1,out2);
	input clk;
	input wire reset,WE;
	input wire [1:0] addr_input,addr_out1,addr_out2;
	input wire [(W-1):0] data;
	wire [3:0] decoder_WE;
	wire [(W-1):0] reg_out[3:0];
	output wire [(W-1):0] out1,out2;
	
	decoder2x4 decoder_inselect(addr_input,decoder_WE);
	register_WE #W register0(clk,reset,WE&decoder_WE[0],data,reg_out[0]);
	register_WE #W register1(clk,reset,WE&decoder_WE[1],data,reg_out[1]);
	register_WE #W register2(clk,reset,WE&decoder_WE[2],data,reg_out[2]);
	register_WE #W register3(clk,reset,WE&decoder_WE[3],data,reg_out[3]);
	mux4x1 #W mux_outselect1(reg_out[0],reg_out[1],reg_out[2],reg_out[3],out1,addr_out1);
	mux4x1 #W mux_outselect2(reg_out[0],reg_out[1],reg_out[2],reg_out[3],out2,addr_out2);
	
endmodule
	