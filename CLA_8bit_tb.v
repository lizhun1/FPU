//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-12-01 12:12:09
//LastEditors: lizhun
//LastEditTime: 2021-12-01 12:43:47
//---------------------------------------------------
`include "CLA_8bit.v"
`timescale 1ns/1ps
module CLA8_tb();
reg [7:0]   in1;
reg [7:0]   in2;
reg         cin;
reg         clk;
wire [7:0]  out;
wire        cout;  
CLA8 CLA(in1,in2,cin,out,cout);

always #100 clk=~clk;
always @(posedge clk) begin
    in1=in1+8'b1; 
    in2=in2+8'b1;   
end
initial begin
    #100
    clk=0;
    in1=8'hf0;
    in2=8'hf0;
    cin=1;
    #10000000
    $stop;
end
endmodule