//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-11-30 21:37:17
//LastEditors: lizhun
//LastEditTime: 2021-11-30 21:55:08
//---------------------------------------------------
`include "FA.v"
`timescale 1ns/1ps
module fa_tb();
reg [2:0] in;
reg clk;
wire sum,cout;

FA fa(in[0],in[1],in[2],sum,cout);

always #100 clk=~clk;
always @(posedge clk) begin
    in=in+3'b001;    
end
initial begin
    #100
    clk=0;
    in=3'b000;
    #10000
    $stop;
end
endmodule