module tb_register_WE();
	reg clk, reset, WE;
	reg [7:0] data;
	wire[7:0] out;
	reg [7:0] out_expected;
	reg [5:0] vectornum, errors; // bookkeeping variables
	reg [17:0] testvectors[7:0]; // array of testvectors
	
	register_WE #8 dut(clk,reset,WE,data,out);
	
	// generate clock
	always // no sensitivity list, so it always executes
	begin
		clk = 0; #20; clk = 1; #20;
	end
	
	initial
		begin
		$readmemb("testvector_registerWE.tv", testvectors);
		vectornum = 0; errors = 0;
		//reset = 1; #30; 
		reset = 0;
	end
	
	always @(negedge clk)
		begin
	   {reset,WE,data,out_expected} = testvectors[vectornum];
		end
	// check results on falling edge of clk
	always @(posedge clk)
		begin
		#1;if (out !== out_expected) 			
		begin		
			$display("Error: reset = %b , WE = %b, data= %b ", reset,WE,data);
			$display(" outputs = %b (%b expected)",out,out_expected);
			errors = errors + 1;	//if there is an error increase error
		end
	// increment array index and read next testvector
	vectornum = vectornum + 1;
	if (vectornum == 4'b1000) begin //after testing 8 different inputs finish.
		$display("%d tests completed with %d errors",vectornum, errors);
		$stop;
	end
	end
endmodule  