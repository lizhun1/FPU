//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-12-01 13:32:45
//LastEditors: lizhun
//LastEditTime: 2021-12-01 14:00:05
//---------------------------------------------------
`include "mul_24bit_array.v"
`timescale 1ns/1ps
module mul24_tb();
reg [23:0] in1;
reg [23:0] in2;
reg clk;
reg  [47:0] rsu;
wire [47:0] out;

mul_24array mul(in1,in2,out);

always #1000 clk=~clk;
always @(*) begin
    rsu=in1*in2;
end
always @(posedge clk) begin
    in1=in1+24'b1; 
    in2=in2+24'b1;   
end
initial begin
    #100
    clk=0;
    in1=24'hffff00;
    in2=24'hffff00;
    #10000000
    $stop;
end
endmodule