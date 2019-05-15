module id_memory(clk,WE,WD,A,RD);
input wire clk,WE;
input wire [7:0] WD;
input wire [5:0] A;
output wire [13:0] RD;
wire [13:0] muxout1;
wire [13:0] muxout2;
reg [13:0] init[63:0];

initial
		begin
		$readmemb("sumofarray.tv", init);
	end


always @(posedge clk)
	begin
		if(WE)
			begin
				init[A][7:0] = WD;
			end
	end

mux32x1 #14 muxmem1(init[0],init[1],init[2],init[3],
						init[4],init[5],init[6],init[7],
						init[8],init[9],init[10],init[11],
						init[12],init[13],init[14],init[15],
						init[16],init[17],init[18],init[19],
						init[20],init[21],init[22],init[23],
						init[24],init[25],init[26],init[27],
						init[28],init[29],init[30],init[31],
						muxout1,A[4:0]);
mux32x1 #14 muxmem2(init[32],init[33],init[34],init[35],
						init[36],init[37],init[38],init[39],
						init[40],init[41],init[42],init[43],
						init[44],init[45],init[46],init[47],
						init[48],init[49],init[50],init[51],
						init[52],init[53],init[54],init[55],
						init[56],init[57],init[58],init[59],
						init[60],init[61],init[62],init[63],
						muxout2,A[4:0]);

mux2x1 #14 muxmemout(muxout1,muxout2,RD,A[5]);

endmodule