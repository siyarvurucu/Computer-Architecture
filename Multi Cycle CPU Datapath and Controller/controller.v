module controller(OP,ALUFlags,CLK,RUN,RESET,PCWrite,LRWrite,AdrSrc,MemWrite,IRWrite,dataload,
						RegSrc,RegWrite,ALUSrcB,ALUSrcA,ALUCtrl,ShFunc,ALUSH,ResultSrc);
						
	input wire [4:0] OP;
	input wire [3:0] ALUFlags;
	input wire CLK,RUN,RESET;
	output wire LRWrite,AdrSrc,IRWrite,RegSrc,ALUSH,dataload;
	output wire [1:0] ALUSrcA,ALUSrcB,ResultSrc;
	output wire [2:0] ALUCtrl,ShFunc;
	output wire PCWrite,MemWrite,RegWrite;
	reg [3:0] flags;
	reg [3:0] state = 4'b0000;
	wire Z,NZ,CS,CC,UN,cond;
	
	// Assigns
	assign cond = (state[3]&~state[2]&~state[1]&state[0]);
	assign UN = (OP[4]&~OP[3]&~OP[2]);
	assign Z = (OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0]&flags[2]);
	assign NZ = (OP[4]&~OP[3]&OP[2]&~OP[1]&OP[0]&~flags[2]);
	assign CS = (OP[4]&~OP[3]&OP[2]&OP[1]&~OP[0]&flags[1]);
	assign CC = (OP[4]&~OP[3]&OP[2]&OP[1]&OP[0]&~flags[1]);
	
	assign LRWrite = (state[3]&~state[2]&state[1]&~state[0]);
	assign AdrSrc = state[2] | state[1];
	assign IRWrite = (~state[3]&~state[2]&~state[1]&~state[0]);
	assign dataload = IRWrite | (~state[3]&~state[2]&state[1]&~state[0]);
	assign RegSrc = (~state[1]&~state[0]) | (~state[3]&state[1]&state[0]);
	
	assign ALUSrcA[0] = state[1];
	assign ALUSrcA[1] = (~state[3]&~state[2]);
	
	assign ALUSrcB[0] = state[2]&~state[0];
	assign ALUSrcB[1] = (~state[3]&~state[2]);
	
	assign ALUCtrl = (state[3:0]==4'b0101) ? OP[2:0] : 3'b000;
	
	assign ShFunc = OP[2:0];
	
	assign ALUSH = (~state[3]&state[2]&state[1]&state[0]);
	
	assign ResultSrc[0] = state[2] | (~state[3]&state[1]) | (state[3]&~state[1]&state[0]);
	assign ResultSrc[1] = (state[3]&state[1]&state[0]) | (~state[3]&~state[2]&~state[1]);
	assign PCWrite = RUN&((~state[3]&~state[2]&~state[1]&~state[0])|(state[3]&state[1]&state[0]&~state[2])
							|(cond&(Z | NZ | CS | CC | UN)));
	assign MemWrite = (~state[3]&state[2]&~state[1]&~state[0]);
	assign RegWrite = (state[3]&~state[1]&~state[0]) | (~state[3]&~state[2]&state[1]&state[0]);
	
	always @(posedge CLK,posedge RESET)
		begin
		if(RESET)
			state <= 4'b0000;
		else
			begin
			case(state)
		
			4'b0000:
				begin
					if(RUN)
						state <= 4'b0001;	// Decode
				end
			4'b0001:
				begin
					case(OP)
					5'b11000:			// LDR Direct
						state<=4'b0010;
						
					5'b11010:	// STR
						state<=4'b0100;
						
					5'b00000,5'b00001,5'b00101,5'b00110,5'b00100,5'b00111:	// execR
						state<=4'b0101;
						
					5'b11001:	// LDR Imm
						state<=4'b0110;
						
					5'b01000,5'b01001,5'b01010,5'b01011,5'b01100:	// shifts
						state<=4'b0111;
						
					5'b10000,5'b10100,5'b10101,5'b10110,5'b10111:	// B
						state<=4'b1001;
						
					5'b10001,5'b10010:   // BL
						state<=4'b1010;
						
					5'b11111: 	// END
						state<=4'b1111;
					endcase
				end
						
			4'b0010:
				state<=4'b0011;
				
			4'b0101:
				begin
					flags = ALUFlags;
					state<=4'b1000;
				end
			4'b0110,4'b0111:
				state<=4'b1000;
			
			4'b1010:
				begin
					if(OP[1])
						state <=4'b1011;
					else 
						state<=4'b1001;
				end
			4'b1111:   // END state
				;
			default:
				state<=4'b0000;
			endcase
			end
		end
		
endmodule 