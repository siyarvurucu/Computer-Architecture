module tb_registerfile4();
	reg clk, reset, WE;
	reg [7:0] data;
	wire[7:0] out1,out2;
	reg [7:0] out1_expected,out2_expected;
	reg [1:0] addr_input,addr_out1,addr_out2;
	
	reg [5:0] vectornum, errors; // bookkeeping variables
	reg [31:0] testvectors[7:0]; // array of testvectors
	
	register_file4 #8 dut(clk,reset,WE,addr_input,addr_out1,addr_out2,data,out1,out2);
	
	// generate clock
	always // no sensitivity list, so it always executes
	begin
		clk = 0; #20; clk = 1; #20;
	end
	
	initial
		begin
		$readmemb("testvector_registerfile4.tv", testvectors);
		vectornum = 0; errors = 0;
		//reset = 1; #30; 
		reset = 0;
	end
	
	always @(negedge clk)
		begin
	   {reset,WE,addr_input,addr_out1,addr_out2,data,out1_expected,out2_expected} = testvectors[vectornum];
		end
	// check results on falling edge of clk
	always @(posedge clk)
		begin
		#1;if (out1 !== out1_expected | out2 !== out2_expected) 			
		begin		
			$display("Error: reset = %b , WE = %b, addr_input = %b ", reset,WE,addr_input);
			$display("Error: addr_out1 = %b , addr_out2 = %b, data = %b ", addr_out1,addr_out2,data);
			$display(" outputs = %b - %b (%b - %b expected)",out1,out2,out1_expected,out2_expected);
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