module data_memory(clk,WE,WD,A,RD);
input wire clk,WE;
input wire [31:0] WD;
input wire [4:0] A;
output wire [31:0] RD;
//wire we[31:0];
//wire [31:0] init[31:0];
reg [31:0] init[31:0];

//assign we[0] = (~A[0]) & (~A[1]) & (~A[2]) & (~A[3]) & (~A[4]);
//assign we[1] = (A[0]) & (~A[1]) & (~A[2]) & (~A[3]) & (~A[4]);
//assign we[2] = (~A[0]) & (A[1]) & (~A[2]) & (~A[3]) & (~A[4]);
//assign we[3] = (A[0]) & (A[1]) & (~A[2]) & (~A[3]) & (~A[4]);
//assign we[4] = (~A[0]) & (~A[1]) & (A[2]) & (~A[3]) & (~A[4]);
//assign we[5] = (A[0]) & (~A[1]) & (A[2]) & (~A[3]) & (~A[4]);
//assign we[6] = (~A[0]) & (A[1]) & (A[2]) & (~A[3]) & (~A[4]);
//assign we[7] = (A[0]) & (A[1]) & (A[2]) & (~A[3]) & (~A[4]);
//assign we[8] = (~A[0]) & (~A[1]) & (~A[2]) & (A[3]) & (~A[4]);
//assign we[9] = (A[0]) & (~A[1]) & (~A[2]) & (A[3]) & (~A[4]);
//assign we[10] = (~A[0]) & (A[1]) & (~A[2]) & (A[3]) & (~A[4]);
//assign we[11] = (A[0]) & (A[1]) & (~A[2]) & (A[3]) & (~A[4]);
//assign we[12] = (~A[0]) & (~A[1]) & (A[2]) & (A[3]) & (~A[4]);
//assign we[13] = (A[0]) & (~A[1]) & (A[2]) & (A[3]) & (~A[4]);
//assign we[14] = (~A[0]) & (A[1]) & (A[2]) & (A[3]) & (~A[4]);
//assign we[15] = (A[0]) & (A[1]) & (A[2]) & (A[3]) & (~A[4]);
//assign we[16] = (~A[0]) & (~A[1]) & (~A[2]) & (~A[3]) & (A[4]);
//assign we[17] = (A[0]) & (~A[1]) & (~A[2]) & (~A[3]) & (A[4]);
//assign we[18] = (~A[0]) & (A[1]) & (~A[2]) & (~A[3]) & (A[4]);
//assign we[19] = (A[0]) & (A[1]) & (~A[2]) & (~A[3]) & (A[4]);
//assign we[20] = (~A[0]) & (~A[1]) & (A[2]) & (~A[3]) & (A[4]);
//assign we[21] = (A[0]) & (~A[1]) & (A[2]) & (~A[3]) & (A[4]);
//assign we[22] = (~A[0]) & (A[1]) & (A[2]) & (~A[3]) & (A[4]);
//assign we[23] = (A[0]) & (A[1]) & (A[2]) & (~A[3]) & (A[4]);
//assign we[24] = (~A[0]) & (~A[1]) & (~A[2]) & (A[3]) & (A[4]);
//assign we[25] = (A[0]) & (~A[1]) & (~A[2]) & (A[3]) & (A[4]);
//assign we[26] = (~A[0]) & (A[1]) & (~A[2]) & (A[3]) & (A[4]);
//assign we[27] = (A[0]) & (A[1]) & (~A[2]) & (A[3]) & (A[4]);
//assign we[28] = (~A[0]) & (~A[1]) & (A[2]) & (A[3]) & (A[4]);
//assign we[29] = (A[0]) & (~A[1]) & (A[2]) & (A[3]) & (A[4]);
//assign we[30] = (~A[0]) & (A[1]) & (A[2]) & (A[3]) & (A[4]);
//assign we[31] = (A[0]) & (A[1]) & (A[2]) & (A[3]) & (A[4]);

initial
		begin
		$readmemb("datainit.tv", init);
	end

//generate
//	genvar i;
//	for(i=0; i<32;i=i+1) begin : generator
//			register_WE #32 register(clk,1'b0,WE&we[i],WD,init[i],init[i]);
//	end
//endgenerate

//register_WE #32 register0(clk,1'b0,WE&we[0],WD,init[0],init[0]);
//register_WE #32 register1(clk,1'b0,WE&we[1],WD,init[1],init[1]);
//register_WE #32 register2(clk,1'b0,WE&we[2],WD,init[2],init[2]);
//register_WE #32 register3(clk,1'b0,WE&we[3],WD,init[3],init[3]);
//register_WE #32 register4(clk,1'b0,WE&we[4],WD,init[4],init[4]);
//register_WE #32 register5(clk,1'b0,WE&we[5],WD,init[5],init[5]);
//register_WE #32 register6(clk,1'b0,WE&we[6],WD,init[6],init[6]);
//register_WE #32 register7(clk,1'b0,WE&we[7],WD,init[7],init[7]);
//register_WE #32 register8(clk,1'b0,WE&we[8],WD,init[8],init[8]);
//register_WE #32 register9(clk,1'b0,WE&we[9],WD,init[9],init[9]);
//register_WE #32 register10(clk,1'b0,WE&we[10],WD,init[10],init[10]);
//register_WE #32 register11(clk,1'b0,WE&we[11],WD,init[11],init[11]);
//register_WE #32 register12(clk,1'b0,WE&we[12],WD,init[12],init[12]);
//register_WE #32 register13(clk,1'b0,WE&we[13],WD,init[13],init[13]);
//register_WE #32 register14(clk,1'b0,WE&we[14],WD,init[14],init[14]);
//register_WE #32 register15(clk,1'b0,WE&we[15],WD,init[15],init[15]);
//register_WE #32 register16(clk,1'b0,WE&we[16],WD,init[16],init[16]);
//register_WE #32 register17(clk,1'b0,WE&we[17],WD,init[17],init[17]);
//register_WE #32 register18(clk,1'b0,WE&we[18],WD,init[18],init[18]);
//register_WE #32 register19(clk,1'b0,WE&we[19],WD,init[19],init[19]);
//register_WE #32 register20(clk,1'b0,WE&we[20],WD,init[20],init[20]);
//register_WE #32 register21(clk,1'b0,WE&we[21],WD,init[21],init[21]);
//register_WE #32 register22(clk,1'b0,WE&we[22],WD,init[22],init[22]);
//register_WE #32 register23(clk,1'b0,WE&we[23],WD,init[23],init[23]);
//register_WE #32 register24(clk,1'b0,WE&we[24],WD,init[24],init[24]);
//register_WE #32 register25(clk,1'b0,WE&we[25],WD,init[25],init[25]);
//register_WE #32 register26(clk,1'b0,WE&we[26],WD,init[26],init[26]);
//register_WE #32 register27(clk,1'b0,WE&we[27],WD,init[27],init[27]);
//register_WE #32 register28(clk,1'b0,WE&we[28],WD,init[28],init[28]);
//register_WE #32 register29(clk,1'b0,WE&we[29],WD,init[29],init[29]);
//register_WE #32 register30(clk,1'b0,WE&we[30],WD,init[30],init[30]);
//register_WE #32 register31(clk,1'b0,WE&we[31],WD,init[31],init[31]);


always @(posedge clk)
	begin
		if(WE)
			begin
				init[A] = WD;
			end
	end

mux32x1 #32 muxing(init[0],init[1],init[2],init[3],
						init[4],init[5],init[6],init[7],
						init[8],init[9],init[10],init[11],
						init[12],init[13],init[14],init[15],
						init[16],init[17],init[18],init[19],
						init[20],init[21],init[22],init[23],
						init[24],init[25],init[26],init[27],
						init[28],init[29],init[30],init[31],
						RD,A);

endmodule