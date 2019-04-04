module tb_shiftregister();
	reg clk, reset, load, dir, left, right;
	reg [7:0] data;
	wire[7:0] out;
	reg [7:0] out_expected;
	reg [5:0] vectornum, errors; // bookkeeping variables
	reg [20:0] testvectors[5:0]; // array of testvectors
	
	shift_register #8 dut(clk,reset,load,dir,data,left,right,out);
	
	// generate clock
	always // no sensitivity list, so it always executes
	begin
		clk = 0; #20; clk = 1; #20;
	end
	
	initial
		begin
		$readmemb("testvector_shiftregister.tv", testvectors);
		vectornum = 0; errors = 0;
		//reset = 1; #30; 
		reset = 0;
	end
	
	always @(negedge clk)
		begin
	   {reset,load,dir,left,right,data,out_expected} = testvectors[vectornum];
		end
	// check results on falling edge of clk
	always @(posedge clk)
		begin
		#1;if (out !== out_expected) 			
		begin		
			$display("Error: reset = %b , load = %b,dir = %b,left = %b, right = %b, data= %b ", reset,load,dir,left,right,data);
			$display(" outputs = %b (%b expected)",out,out_expected);
			errors = errors + 1;	//if there is an error increase error
		end
	// increment array index and read next testvector
	vectornum = vectornum + 1;
	if (vectornum == 4'b0110) begin //after testing 6 different inputs finish.
		$display("%d tests completed with %d errors",vectornum, errors);
		$stop;
	end
	end
endmodule  