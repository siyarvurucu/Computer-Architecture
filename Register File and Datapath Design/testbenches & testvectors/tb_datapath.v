module tb_datapath();
	reg clk, reset;
	reg [3:0] data;
	wire[3:0] R1_out;
	reg [3:0] out_expected;
	reg mux2x1_1_select,Acc_ps,Acc_dir,Q_dir;
	reg [2:0] alu_control;
	reg [1:0] mux4x1_select;
	reg [5:0] vectornum, errors; // bookkeeping variables
	reg [17:0] testvectors[16:0]; // array of testvectors
	
	datapath dut(mux2x1_1_select,
					Acc_ps,
					clk,
					reset,
					Acc_dir,
					Q_dir,
					alu_control,
					data,
					mux4x1_select,
					R1_out);
	
	// generate clock
	always // no sensitivity list, so it always executes
	begin
		clk = 0; #20; clk = 1; #20;
	end
	
	initial
		begin
		$readmemb("testvector_datapath.tv", testvectors);
		vectornum = 0; errors = 0;
		//reset = 1; #30; 
		reset = 0;
	end
	
	always @(negedge clk)
		begin
	   {reset,mux2x1_1_select,Acc_ps,Acc_dir,Q_dir,alu_control,data,mux4x1_select,out_expected} = testvectors[vectornum];
		end
	// check results on falling edge of clk
	always @(posedge clk)
		begin
		#1;if (R1_out !== out_expected) 			
		begin		
			$display("Error: mux2x1_1_select=%b,Acc_ps=%b,alu_control=%b, data=%b", mux2x1_1_select,Acc_ps,alu_control,data);
			$display(" outputs = %b (%b expected)",R1_out,out_expected);
			errors = errors + 1;	//if there is an error increase error
		end
	// increment array index and read next testvector
	vectornum = vectornum + 1;
	if (vectornum == 5'b10001) begin //after testing 8 different inputs finish.
		$display("%d tests completed with %d errors",vectornum, errors);
		$stop;
	end
	end
endmodule  