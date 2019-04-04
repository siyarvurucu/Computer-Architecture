module instr_mem #(parameter W=6)(PC,out);
parameter N = 2**W;
input [(W-1):0] PC;
output wire [31:0] out; 

reg [31:0] registers[(N-1):0];

initial
	begin
	$readmemb("raminit.txt", registers);
end

assign out = registers[PC];

endmodule 