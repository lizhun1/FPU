//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-11-30 22:01:20
//LastEditors: lizhun
//LastEditTime: 2021-11-30 22:03:35
//---------------------------------------------------
`include "products.v"
`timescale 1ns/1ps
module products_tb();
reg [7:0]   in1;
reg         in2;
reg         clk;
wire [7:0]  out;

products8 pro(in1,in2,out);

always #100 clk=~clk;
always @(posedge clk) begin
    in1<=in1+8'b1; 
    in2<=~in2;
end
initial begin
    #100
    clk=0;
    in1=8'b0;
    in2=0;
    #10000
    $stop;
end
endmodule