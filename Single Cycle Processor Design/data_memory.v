module data_memory(clk,WE,WD,A,RD);
input wire clk,WE;
input wire [31:0] WD;
input wire [4:0] A;
output wire [31:0] RD;
//wire we[31:0];
//wire [31:0] init[31:0];
reg [31:0] init[31:0];

initial
		begin
		$readmemb("datainit.tv", init);
	end
	
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
