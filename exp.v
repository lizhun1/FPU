//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-12-02 11:35:56
//LastEditors: lizhun
//LastEditTime: 2021-12-04 23:16:13
//---------------------------------------------------
// `include "CLA_8bit.v"
module exp_cac(expa,expb,cin,expc,oom,vec);
input [7:0] expa;
input [7:0] expb;
input       cin;
output [7:0] expc;
output vec;//溢出方向
output oom;//溢出标志
wire [7:0] expa;   
wire [7:0] expb;   
wire [7:0] expc; 
wire [7:0] inexpa;
wire [7:0] inexpb; 
wire [7:0] inexpc;
wire cin;
wire cout;
assign inexpa={~expa[7],expa[6:0]};
assign inexpb={~expb[7],expb[6:0]};
CLA8 cla(inexpa,inexpb,cin,inexpc,cout);
assign oom=(inexpa[7]^inexpc[7])&(inexpb[7]^inexpc[7]);//c的符号位与ab都相反时溢出
assign vec=~inexpc[7];
assign expc={~inexpc[7],inexpc[6:0]};
endmodule