//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-12-04 17:00:22
//LastEditors: lizhun
//LastEditTime: 2021-12-04 17:02:43
//---------------------------------------------------
`include "exp.v"
`timescale 1ns/1ps
module exp_tb();
reg [7:0] in1;
reg [7:0] in2;
reg       clk;
wire [7:0] out;
wire oom;
wire vec;
// class float;
//     bit sign;
//     bit [7:0] exp;
//     bit [22:0] m;
// endclass

exp p(in1,in2,out,oom,vec);

always #100 clk=~clk;
always @(posedge clk) begin
    in1=in1+8'b1; 
    in2=in2+8'b1;   
end
initial begin
    #100
    clk=0;
    in1=8'b1;
    in2=8'b1;
    #10000000
    $stop;
end
endmodule