//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-12-02 10:54:41
//LastEditors: lizhun
//LastEditTime: 2021-12-04 16:37:35
//---------------------------------------------------

`timescale 1ns/1ps

module judge_tb();
	reg [31:0] a;
	reg [31:0] b;
	reg clk;
	//reg rst;
	wire [1:0] flag;
	wire hidea;
	wire hideb;
	
	judge judge(
	.a(a),
	.b(b),
	.flag(flag),
	.hidea(hidea),
	.hideb(hideb)
	);
	
	always #100 clk=~clk;

	initial begin
		clk=0;
		a=32'b11111111100000000000000000000000;
		b=32'b10000000000000000000000000000001;
		#100
		a=32'b11111111100000000000000000000001;
		#100
		a=32'b10000000000000000000000000000000;
		#100
		a=32'b10100100000010010000100101000000;
		#100
		b=32'b00000000000000000000000000000000;
		#2000
		$stop;
		end
	endmodule
	
		