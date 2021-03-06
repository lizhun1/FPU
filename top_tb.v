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
//LastEditTime: 2021-12-04 17:13:21
//---------------------------------------------------
`include "top.v"
`timescale 1ns/1ps


module top_tb();
reg [31:0] in1;
reg [31:0] in2;
reg         clk;
wire [31:0] out;
wire flag_out;
wire oom;
wire vec;
reg [31:0] rsu;
// class float;
//     bit sign;
//     bit [7:0] exp;
//     bit [22:0] m;
// endclass

fpu_top top(in1,in2,out,flag_out,oom,vec);

always #100 clk=~clk;
always @(*) begin
    rsu=in1*in2;
end
// always @(posedge clk) begin
//     in1=in1+24'b1; 
//     in2=in2+24'b1;   
// end
initial begin
    #100
    clk=0;
    in1=32'b0_10000001_01010101010101010101010;
    in2=32'b0_10000001_01010101010101010101010;
    #10000000
    $stop;
end
endmodule