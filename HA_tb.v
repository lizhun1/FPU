//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-11-30 21:57:13
//LastEditors: lizhun
//LastEditTime: 2021-11-30 21:57:14
//---------------------------------------------------
`include "HA.v"
`timescale 1ns/1ps
module ha_tb();
reg [1:0] in;
reg clk;
wire sum,cout;

HA ha(in[0],in[1],sum,cout);

always #100 clk=~clk;
always @(posedge clk) begin
    in=in+2'b01;    
end
initial begin
    #100
    clk=0;
    in=2'b00;
    #10000
    $stop;
end
endmodule