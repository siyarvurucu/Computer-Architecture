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
// CREATED		"Mon Mar 25 00:53:07 2019"

module datapath(
	CLK,
	RegWrite,
	MemWrite,
	PCSrc,
	RegSrc,
	ShiftDir,
	ALUSrc,
	PCReset,
	ALUControl,
	MemtoReg,
	ALUFlags,
	cmd,
	rA
);


input wire	CLK;
input wire	RegWrite;
input wire	MemWrite;
input wire	PCSrc;
input wire	RegSrc;
input wire	ShiftDir;
input wire	ALUSrc;
input wire	PCReset;
input wire	[2:0] ALUControl;
input wire	[1:0] MemtoReg;
output wire	[3:0] ALUFlags;
output wire	[3:0] cmd;
output wire	[3:0] rA;

wire	[3:0] ALUFlags_ALTERA_SYNTHESIZED;
wire	[31:0] aluOut;
wire	[31:0] Imm;
wire	[31:0] out;
wire	[31:0] pcOut;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_6;
wire	[31:0] SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	[31:0] SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;





ALU	b2v_ALU(
	.A(SYNTHESIZED_WIRE_16),
	.B(SYNTHESIZED_WIRE_1),
	.control(ALUControl),
	.N(ALUFlags_ALTERA_SYNTHESIZED[3]),
	.Z(ALUFlags_ALTERA_SYNTHESIZED[2]),
	.C(ALUFlags_ALTERA_SYNTHESIZED[1]),
	.V(ALUFlags_ALTERA_SYNTHESIZED[0]),
	.out(aluOut));
	defparam	b2v_ALU.W = 32;


mux2x1	b2v_Bmux(
	.select(ALUSrc),
	.bus_in1(SYNTHESIZED_WIRE_17),
	.bus_in2(Imm),
	.bus_out(SYNTHESIZED_WIRE_1));
	defparam	b2v_Bmux.W = 32;


data_memory	b2v_DataMem(
	.clk(CLK),
	.WE(MemWrite),
	.A(aluOut[4:0]),
	.WD(SYNTHESIZED_WIRE_17),
	.RD(SYNTHESIZED_WIRE_4));


extender	b2v_EXT(
	.in(out[11:0]),
	.out(Imm));


mux4x1	b2v_inst15(
	.bus_in1(SYNTHESIZED_WIRE_4),
	.bus_in2(aluOut),
	.bus_in3(SYNTHESIZED_WIRE_5),
	
	.select(MemtoReg),
	.bus_out(SYNTHESIZED_WIRE_19));
	defparam	b2v_inst15.W = 32;


adder	b2v_inst7(
	.A(pcOut),
	.B(SYNTHESIZED_WIRE_6),
	.out(SYNTHESIZED_WIRE_18));
	defparam	b2v_inst7.W = 32;


adder	b2v_inst8(
	.A(SYNTHESIZED_WIRE_18),
	.B(SYNTHESIZED_WIRE_8),
	.out(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst8.W = 32;


mux2x1	b2v_inst9(
	.select(PCSrc),
	.bus_in1(SYNTHESIZED_WIRE_19),
	.bus_in2(SYNTHESIZED_WIRE_18),
	.bus_out(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst9.W = 32;


instr_mem	b2v_InstMem(
	.PC(pcOut[5:0]),
	.out(out));
	defparam	b2v_InstMem.W = 6;


simple_register	b2v_PC(
	.clk(CLK),
	.reset(PCReset),
	.data(SYNTHESIZED_WIRE_11),
	.out(pcOut));
	defparam	b2v_PC.W = 32;


cvg	b2v_plus4(
	.bus_out(SYNTHESIZED_WIRE_6));
	defparam	b2v_plus4.D = 32'b00000000000000000000000000000001;
	defparam	b2v_plus4.W = 32;


cvg	b2v_plus5(
	.bus_out(SYNTHESIZED_WIRE_8));
	defparam	b2v_plus5.D = 32'b00000000000000000000000000000001;
	defparam	b2v_plus5.W = 32;


register_file	b2v_RegisterFile(
	.CLK(CLK),
	.WE3(RegWrite),
	.A1(out[19:16]),
	.A2(SYNTHESIZED_WIRE_12),
	.A3(out[15:12]),
	.R15(SYNTHESIZED_WIRE_13),
	.WD3(SYNTHESIZED_WIRE_19),
	.RD1(SYNTHESIZED_WIRE_16),
	.RD2(SYNTHESIZED_WIRE_17));


mux2x1	b2v_RegSource(
	.select(RegSrc),
	.bus_in1(out[3:0]),
	.bus_in2(out[15:12]),
	.bus_out(SYNTHESIZED_WIRE_12));
	defparam	b2v_RegSource.W = 4;


barrel_shifter	b2v_shifter(
	.dir(ShiftDir),
	.A(SYNTHESIZED_WIRE_16),
	.Imm(Imm[4:0]),
	.out(SYNTHESIZED_WIRE_5));

assign	ALUFlags = ALUFlags_ALTERA_SYNTHESIZED;
assign	cmd[3:0] = out[24:21];
assign	rA[3:0] = out[15:12];

endmodule
