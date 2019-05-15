// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
// CREATED		"Wed May 15 04:10:27 2019"

module datapath(
	CLK,
	RESET,
	MemWrite,
	AdrSrc,
	IRWrite,
	RegSrc,
	RegWrite,
	PCWrite,
	LRWrite,
	ALUSH,
	dataload,
	ALUControl,
	ALUSrcA,
	ALUSrcB,
	ResultSrc,
	ShFunc,
	Flags,
	OP,
	reg2
);


input wire	CLK;
input wire	RESET;
input wire	MemWrite;
input wire	AdrSrc;
input wire	IRWrite;
input wire	RegSrc;
input wire	RegWrite;
input wire	PCWrite;
input wire	LRWrite;
input wire	ALUSH;
input wire	dataload;
input wire	[2:0] ALUControl;
input wire	[1:0] ALUSrcA;
input wire	[1:0] ALUSrcB;
input wire	[1:0] ResultSrc;
input wire	[2:0] ShFunc;
output wire	[3:0] Flags;
output wire	[4:0] OP;
output wire	[7:0] reg2;

wire	[3:0] Flags_ALTERA_SYNTHESIZED;
wire	[13:0] out;
wire	[7:0] outpc;
wire	[13:0] RD;
wire	rst;
wire	[7:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	[2:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;
wire	[7:0] SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[7:0] SYNTHESIZED_WIRE_11;
wire	[7:0] SYNTHESIZED_WIRE_12;
wire	[7:0] SYNTHESIZED_WIRE_13;
wire	[7:0] SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	[7:0] SYNTHESIZED_WIRE_18;
wire	[7:0] SYNTHESIZED_WIRE_20;
wire	[7:0] SYNTHESIZED_WIRE_30;





ALU	b2v_aloo(
	.A(SYNTHESIZED_WIRE_0),
	.B(SYNTHESIZED_WIRE_1),
	.control(ALUControl),
	.N(Flags_ALTERA_SYNTHESIZED[3]),
	.Z(Flags_ALTERA_SYNTHESIZED[2]),
	.C(Flags_ALTERA_SYNTHESIZED[1]),
	.V(Flags_ALTERA_SYNTHESIZED[0]),
	.out(SYNTHESIZED_WIRE_26));
	defparam	b2v_aloo.W = 8;


register_file	b2v_inst1(
	.CLK(CLK),
	.WE3(RegWrite),
	.PCWrite(PCWrite),
	.LRWrite(LRWrite),
	.reset(rst),
	.A1(out[5:3]),
	.A2(SYNTHESIZED_WIRE_2),
	.A3(out[8:6]),
	.WD3(SYNTHESIZED_WIRE_25),
	.PC(SYNTHESIZED_WIRE_28),
	.RD1(SYNTHESIZED_WIRE_18),
	.RD2(SYNTHESIZED_WIRE_30),
	.reg2(reg2));


register_WE	b2v_inst10(
	.clk(CLK),
	.reset(rst),
	.WE(dataload),
	.data(RD[7:0]),
	.out(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst10.W = 8;


cvg	b2v_inst14(
	.bus_out(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst14.D = 8'b00000001;
	defparam	b2v_inst14.W = 8;


register_WE	b2v_inst15(
	.clk(CLK),
	.reset(rst),
	.WE(SYNTHESIZED_WIRE_4),
	.data(SYNTHESIZED_WIRE_5),
	.out(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst15.W = 8;


mux4x1	b2v_inst16(
	.bus_in1(SYNTHESIZED_WIRE_6),
	.bus_in2(SYNTHESIZED_WIRE_7),
	.bus_in3(SYNTHESIZED_WIRE_26),
	
	.select(ResultSrc),
	.bus_out(SYNTHESIZED_WIRE_25));
	defparam	b2v_inst16.W = 8;

assign	SYNTHESIZED_WIRE_29 =  ~rst;

assign	SYNTHESIZED_WIRE_4 =  ~rst;


extender	b2v_inst20(
	.in(out[5:0]),
	.out(SYNTHESIZED_WIRE_10));


mux4x1	b2v_inst21(
	.bus_in1(SYNTHESIZED_WIRE_27),
	.bus_in2(SYNTHESIZED_WIRE_10),
	.bus_in3(SYNTHESIZED_WIRE_11),
	
	.select(ALUSrcB),
	.bus_out(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst21.W = 8;


mux4x1	b2v_inst22(
	.bus_in1(SYNTHESIZED_WIRE_12),
	.bus_in2(SYNTHESIZED_WIRE_13),
	.bus_in3(SYNTHESIZED_WIRE_28),
	
	.select(ALUSrcA),
	.bus_out(SYNTHESIZED_WIRE_0));
	defparam	b2v_inst22.W = 8;


cvg	b2v_inst23(
	.bus_out(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst23.D = 8'b00000000;
	defparam	b2v_inst23.W = 8;


mux2x1	b2v_inst4(
	.select(AdrSrc),
	.bus_in1(SYNTHESIZED_WIRE_28),
	.bus_in2(SYNTHESIZED_WIRE_25),
	.bus_out(outpc));
	defparam	b2v_inst4.W = 8;


register_WE	b2v_inst6(
	.clk(CLK),
	.reset(rst),
	.WE(SYNTHESIZED_WIRE_29),
	.data(SYNTHESIZED_WIRE_18),
	.out(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst6.W = 8;


mux2x1	b2v_inst7(
	.select(ALUSH),
	.bus_in1(SYNTHESIZED_WIRE_26),
	.bus_in2(SYNTHESIZED_WIRE_20),
	.bus_out(SYNTHESIZED_WIRE_5));
	defparam	b2v_inst7.W = 8;


mux2x1	b2v_inst8(
	.select(RegSrc),
	.bus_in1(out[2:0]),
	.bus_in2(out[8:6]),
	.bus_out(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst8.W = 3;


register_WE	b2v_inst9(
	.clk(CLK),
	.reset(rst),
	.WE(SYNTHESIZED_WIRE_29),
	.data(SYNTHESIZED_WIRE_30),
	.out(SYNTHESIZED_WIRE_27));
	defparam	b2v_inst9.W = 8;


register_WE	b2v_IR(
	.clk(CLK),
	.reset(rst),
	.WE(IRWrite),
	.data(RD),
	.out(out));
	defparam	b2v_IR.W = 14;


id_memory	b2v_mem(
	.clk(CLK),
	.WE(MemWrite),
	.A(outpc[5:0]),
	.WD(SYNTHESIZED_WIRE_30),
	.RD(RD));


barrel_shifter	b2v_shifter(
	.A(SYNTHESIZED_WIRE_27),
	.func(ShFunc),
	.out(SYNTHESIZED_WIRE_20));

assign	Flags = Flags_ALTERA_SYNTHESIZED;
assign	rst = RESET;
assign	OP[4:0] = out[13:9];

endmodule
