module mux32x1 #(parameter W=32)(bus_in0,bus_in1,bus_in2,bus_in3,
											bus_in4,bus_in5,bus_in6,bus_in7,
											bus_in8,bus_in9,bus_in10,bus_in11,
											bus_in12,bus_in13,bus_in14,bus_in15,
											bus_in16,bus_in17,bus_in18,bus_in19,
											bus_in20,bus_in21,bus_in22,bus_in23,
											bus_in24,bus_in25,bus_in26,bus_in27,
											bus_in28,bus_in29,bus_in30,bus_in31,										
											bus_out,select);

	input wire [4:0] select;
	input wire [(W-1):0] bus_in0,bus_in1,bus_in2,bus_in3,
											bus_in4,bus_in5,bus_in6,bus_in7,
											bus_in8,bus_in9,bus_in10,bus_in11,
											bus_in12,bus_in13,bus_in14,bus_in15,
											bus_in16,bus_in17,bus_in18,bus_in19,
											bus_in20,bus_in21,bus_in22,bus_in23,
											bus_in24,bus_in25,bus_in26,bus_in27,
											bus_in28,bus_in29,bus_in30,bus_in31;
	output wire [(W-1):0] bus_out;
	
	assign bus_out = (select==5'b00000) ? bus_in0:
						  (select==5'b00001) ? bus_in1:
						  (select==5'b00010) ? bus_in2:
						  (select==5'b00011) ? bus_in3:
						  (select==5'b00100) ? bus_in4:
						  (select==5'b00101) ? bus_in5:
						  (select==5'b00110) ? bus_in6:
						  (select==5'b00111) ? bus_in7:
						  (select==5'b01000) ? bus_in8:
						  (select==5'b01001) ? bus_in9:
						  (select==5'b01010) ? bus_in10:
						  (select==5'b01011) ? bus_in11:
						  (select==5'b01100) ? bus_in12:
						  (select==5'b01101) ? bus_in13:
						  (select==5'b01110) ? bus_in14:
						  (select==5'b01111) ? bus_in15:
						  (select==5'b10000) ? bus_in16:
						  (select==5'b10001) ? bus_in17:
						  (select==5'b10010) ? bus_in18:
						  (select==5'b10011) ? bus_in19:
						  (select==5'b10100) ? bus_in20:
						  (select==5'b10101) ? bus_in21:
						  (select==5'b10110) ? bus_in22:
						  (select==5'b10111) ? bus_in23:
						  (select==5'b11000) ? bus_in24:
						  (select==5'b11001) ? bus_in25:
						  (select==5'b11010) ? bus_in26:
						  (select==5'b11011) ? bus_in27:
						  (select==5'b11100) ? bus_in28:
						  (select==5'b11101) ? bus_in29:
						  (select==5'b11110) ? bus_in30:
						  (select==5'b11111) ? bus_in31:
						  0;
endmodule
	