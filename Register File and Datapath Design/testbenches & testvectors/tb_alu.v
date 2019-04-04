module tb_alu();
	reg clk, reset;
	reg [7:0] A;
	reg [7:0] B;
	reg [2:0] control;
	wire [3:0] flags;
	wire [7:0] out;
	reg [3:0] flags_expected;
	reg [7:0] out_expected;
	reg [5:0] vectornum, errors; // bookkeeping variables
	reg [30:0] testvectors[14:0]; // array of testvectors
	
	ALU #8 dut(control,A,B,out,flags[3],flags[2],flags[1],flags[0]);
	
	always // no sensitivity list, so it always executes
		begin
		clk = 1; #5; clk = 0; #5;
	end
	
	initial
		begin
		$readmemb("testvector_alu.tv", testvectors);
		vectornum = 0; errors = 0;
		//reset = 1; #30; 
		reset = 0;
	end
	
	always @(posedge clk)
		begin
		#1; {control,A,B,flags_expected,out_expected} = testvectors[vectornum];
		end
	// check results on falling edge of clk
	always @(negedge clk)
		if (~reset) begin // skip during reset

		if (out !== out_expected) begin
			$display("Error: inputs = control: %b , A: %b, B: %b, NZCV: %b", control,A,B,flags);
			$display(" outputs = %b (%b expected)",out,out_expected);
			errors = errors + 1;	//if there is an error increase error
		end
		
		if (flags !== flags_expected) begin
			$display("Error: inputs = control: %b , A: %b, B: %b, NZCV: %b", control,A,B,flags);
			$display(" flags(NZCV) = %b (%b expected)",flags,flags_expected);
			errors = errors + 1;	//if there is an error increase error
		end
	// increment array index and read next testvector
	vectornum = vectornum + 1;
	if (vectornum == 4'b1111) begin //after testing 15 different inputs finish.
		$display("%d tests completed with %d errors",vectornum, errors);
		$stop;
	end
	end
endmodule  
