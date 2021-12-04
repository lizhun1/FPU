//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-11-30 22:24:10
//LastEditors: lizhun
//LastEditTime: 2021-12-04 18:01:45
//---------------------------------------------------
// `include "mul_8bit_array.v"
module mul_24array(a,b,c);
input   [23:0]  a;
input   [23:0]  b;
output  [47:0]  c;
wire    [23:0]  a;
wire    [23:0]  b;
wire    [47:0]  c;
    
wire    [15:0]  pp  [8:0];
wire    [17:0]   pcout;
wire    [7:0]   psum    [17:0];
wire            czero;
wire    [7:0]   szero;  
genvar i,j;
generate
    for(i=0;i<3;i=i+1)
        begin: fix
        for(j=0;j<3;j=j+1)
            begin: p2
                mul_8array mul(a[(i*8+7):(i*8)],b[(j*8+7):(j*8)],pp[i*3+j]);
            end
        end
endgenerate
//常量
assign czero=1'b0;
assign szero=8'b0;
//第一个八列
assign c[7:0]=pp[0][7:0];
//第二个八列
CLA8 cla0(pp[0][15:8],pp[1][7:0],czero,psum[0],pcout[0]);

CLA8 cla1(pp[3][7:0],psum[0],czero,psum[1],pcout[1]);

assign c[15:8]=psum[1];
//第三个八列
CLA8 cla2(pp[1][15:8],pp[2][7:0],pcout[0],psum[2],pcout[2]);
CLA8 cla3(pp[3][15:8],pp[4][7:0],pcout[1],psum[3],pcout[3]);

CLA8 cla4(psum[2],psum[3],czero,psum[4],pcout[4]);

CLA8 cla5(psum[4],pp[6][7:0],czero,psum[5],pcout[5]);

assign c[23:16]=psum[5];
//第四个八列
CLA8 cla6(pp[2][15:8],pp[4][15:8],pcout[2],psum[6],pcout[6]);
CLA8 cla7(pp[5][7:0],pp[6][15:8],pcout[3],psum[7],pcout[7]);

CLA8 cla8(psum[6],pp[7][7:0],pcout[4],psum[8],pcout[8]);

CLA8 cla9(psum[8],psum[7],pcout[5],psum[9],pcout[9]);

assign c[31:24]=psum[9];
//第五个八列
CLA8 cla10(pp[5][15:8],pp[7][15:8],pcout[6],psum[10],pcout[10]);

CLA8 cla11(pp[8][7:0],psum[10],pcout[7],psum[11],pcout[11]);
CLA8 cla12(szero,psum[11],pcout[8],psum[12],pcout[12]);
CLA8 cla13(szero,psum[12],pcout[9],psum[13],pcout[13]);

assign c[39:32]=psum[13];
//第六个八列
CLA8 cla14(pp[8][15:8],szero,pcout[10],psum[14],pcout[14]);
CLA8 cla15(psum[14],szero,pcout[11],psum[15],pcout[15]);
CLA8 cla16(psum[15],szero,pcout[12],psum[16],pcout[16]);
CLA8 cla17(psum[16],szero,pcout[13],psum[17],pcout[17]);

assign c[47:40]=psum[17];
endmodule