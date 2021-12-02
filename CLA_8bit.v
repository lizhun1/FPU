//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-12-01 11:45:25
//LastEditors: lizhun
//LastEditTime: 2021-12-01 12:40:40
//---------------------------------------------------
module CLA8 (a,b,cin,sum,cout);

input   [7:0]   a;
input   [7:0]   b;
input           cin;
output  [7:0]   sum;
output          cout;

wire    [7:0]   a;
wire    [7:0]   b;
wire            cin;
wire    [7:0]   sum;
wire            cout;

wire    [7:0]   g;//生成
wire    [7:0]   p;//传播
wire    [7:0]   pcout;
wire    [8:0]   pcin;

genvar i;
generate
    for(i=0;i<8;i=i+1)
        begin: gp
            and g1(g[i],a[i],b[i]);
            or  g2(p[i],a[i],b[i]);            
        end
endgenerate
//进位输入
assign pcin[0]=cin;
//八个全加器
genvar k;
generate
    for(k=0;k<8;k=k+1)
        begin: fa
           FA fa(a[k],b[k],pcin[k],sum[k],pcout[k]);
        end
endgenerate
//超前进位的逻辑
genvar j;
generate
    for(j=0;j<8;j=j+1)
        begin: carry
            assign pcin[j+1]=g[j]|(p[j]&pcin[j]);
        end
endgenerate
//进位输出
assign cout=pcin[8];

endmodule