
`timescale 1ns/1ps

module judge_tb();
	reg [31:0] a1;
	reg [31:0] b1;
	reg en1;
	reg clk;
	//reg rst;
	reg [1:0] flag1;
	reg hidea1;
	reg hideb1;
	
	judge judge(
	.a(a1),
	.b(b1),
	.en(en1),
	.flag(flag1),
	.hidea(hidea1),
	.hideb(hideb1)
	);
	
	always #100 clk=~clk;

	initial begin
		en1=0;
		clk=0;
		a1=32'b11111111100000000000000000000000;
		b1=32'b10000000000000000000000000000001;
		#100
		en1=1;
		#100
		a1=32'b11111111100000000000000000000001;
		#100
		a1=32'b10000000000000000000000000000000;
		#100
		a1=32'b10100100000010010000100101000000;
		#20000
		$stop;
		end
	endmodule
	
		