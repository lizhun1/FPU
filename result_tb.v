`timescale 1ns/1ps
`define clk_period 200

module result_tb();
	reg s;
	reg [7:0] e;
	reg [22:0] m;
	reg clk;
	reg [1:0] flag_in;
	reg oom;
	wire flag_out;
	wire [31:0] c;
	
	result result(
	.s(s),
	.e(e),
	.m(m),
	.flag_in(flag_in),
	.oom(oom),
	.c(c),
	.flag_out(flag_out)
	);
	
	always #(`clk_period/2) clk = ~clk;
	always #(2*`clk_period) s = ~s;
	always #(10*`clk_period) flag_in<=flag_in+1'b1;
	initial begin
		clk=0;s=0;flag_in=2'b00;oom=0;
		e=8'b0;m=23'b0;
		#100 e=8'b00000010;
		#100 m=23'b00000000000000000000001;oom=1'b1;
		#(`clk_period) oom=0;
		#(11*`clk_period) e=8'b00000111;m=23'b00000000000101000000001;
		#(2*`clk_period) oom=1'b1;
		#(2*`clk_period) oom=0;
		#(15*`clk_period) oom=1'b1;
		#(2*`clk_period) oom=0;
		#(50*`clk_period)
		$stop;
		end
	endmodule
		
		