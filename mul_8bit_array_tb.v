//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-11-30 21:58:56
//LastEditors: lizhun
//LastEditTime: 2021-12-01 14:51:25
//---------------------------------------------------
`include "mul_8bit_array.v"
`timescale 1ns/1ps
module mul8_tb();
reg [7:0] in1;
reg [7:0] in2;
reg clk;
wire [15:0] out;

mul_8array mul(in1,in2,out);

always #100 clk=~clk;
// always @(posedge clk) begin
//     in1=in1+8'b1; 
//     in2=in2+8'b1;   
// end
initial begin
    #100
    clk=0;
    in1=8'hff;
    in2=8'hde;
    #10000000
    $stop;
end
endmodule