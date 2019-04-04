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
// CREATED		"Sun Mar 10 22:37:43 2019"

module datapath(
	mux2x1_1_select,
	Acc_ps,
	clk,
	reset,
	Acc_dir,
	Q_dir,
	alu_control,
	data,
	mux4x1_select,
	R1_out
);


input wire	mux2x1_1_select;
input wire	Acc_ps;
input wire	clk;
input wire	reset;
input wire	Acc_dir;
input wire	Q_dir;
input wire	[2:0] alu_control;
input wire	[3:0] data;
input wire	[1:0] mux4x1_select;
output wire	[3:0] R1_out;

wire	[3:0] bus_in2;
wire	[3:0] out;
wire	[3:0] SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_1;
wire	[3:0] SYNTHESIZED_WIRE_2;
wire	[3:0] SYNTHESIZED_WIRE_3;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	[3:0] SYNTHESIZED_WIRE_6;
wire	[3:0] SYNTHESIZED_WIRE_7;
wire	[0:0] SYNTHESIZED_WIRE_12;
wire	[3:0] SYNTHESIZED_WIRE_10;

assign	R1_out = SYNTHESIZED_WIRE_7;




shift_register	b2v_Acc(
	.clk(clk),
	.reset(reset),
	.load(Acc_ps),
	.dir(Acc_dir),
	.left(out[0]),
	.right(out[0]),
	.data(SYNTHESIZED_WIRE_11),
	.out(SYNTHESIZED_WIRE_3));
	defparam	b2v_Acc.W = 4;


ALU	b2v_inst(
	.A(SYNTHESIZED_WIRE_1),
	.B(SYNTHESIZED_WIRE_2),
	.control(alu_control),
	
	
	
	
	.out(SYNTHESIZED_WIRE_11));
	defparam	b2v_inst.W = 4;

assign	bus_in2 = SYNTHESIZED_WIRE_3;



mux2x1	b2v_mux2x1_1(
	.select(mux2x1_1_select),
	.bus_in1(SYNTHESIZED_WIRE_11),
	.bus_in2(bus_in2),
	.bus_out(SYNTHESIZED_WIRE_10));
	defparam	b2v_mux2x1_1.W = 4;


mux4x1	b2v_mux4x1_1(
	.bus_in1(SYNTHESIZED_WIRE_5),
	.bus_in2(SYNTHESIZED_WIRE_6),
	
	.bus_in4(SYNTHESIZED_WIRE_7),
	.select(mux4x1_select),
	.bus_out(SYNTHESIZED_WIRE_1));
	defparam	b2v_mux4x1_1.W = 4;


cvg	b2v_one(
	.bus_out(SYNTHESIZED_WIRE_6));
	defparam	b2v_one.D = 4'b0001;
	defparam	b2v_one.W = 4;


shift_register	b2v_Q(
	.clk(clk),
	.reset(reset),
	.load(SYNTHESIZED_WIRE_12),
	.dir(Q_dir),
	.left(bus_in2[0]),
	.right(SYNTHESIZED_WIRE_12),
	
	.out(out));
	defparam	b2v_Q.W = 4;


cvg	b2v_Q_ps(
	.bus_out(SYNTHESIZED_WIRE_12));
	defparam	b2v_Q_ps.D = 1'b0;
	defparam	b2v_Q_ps.W = 1;


simple_register	b2v_R0(
	.clk(clk),
	.reset(reset),
	.data(data),
	.out(SYNTHESIZED_WIRE_2));
	defparam	b2v_R0.W = 4;


simple_register	b2v_R1(
	.clk(clk),
	.reset(reset),
	.data(SYNTHESIZED_WIRE_10),
	.out(SYNTHESIZED_WIRE_7));
	defparam	b2v_R1.W = 4;


cvg	b2v_zero(
	.bus_out(SYNTHESIZED_WIRE_5));
	defparam	b2v_zero.D = 4'b0000;
	defparam	b2v_zero.W = 4;


endmodule
