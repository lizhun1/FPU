//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is a fpu for my course
//version: 1.0
//Author: lizhun
//Date: 2021-11-24 14:26:11
//LastEditors: lizhun
//LastEditTime: 2021-11-30 22:15:30
//---------------------------------------------------
`include "products.v"
`include "HA.v"
`include "FA.v"
module mul_8array(a,b,c);

input   [7:0]  a;
input   [7:0]  b;
output  [15:0]  c;

wire    [7:0]  a;
wire    [7:0]  b;
wire    [15:0]  c;
wire    [7:0]  pp    [7:0];//部分积
wire    [67:0]  psum;       //部分和
wire    [67:0]  pcout;      //部分进位
//部分积
genvar i;
generate 
    for(i=0;i<8;i=i+1)
        begin: p1
            products p(a,b[i],pp[i]);
        end
endgenerate
//第一列
assign c[0]=pp[0][0];
//第二列
HA ha1(pp[1][0],pp[0][1],psum[0],pcout[0]);

assign c[1]=psum;
//第三列
FA fa1(pp[0][2],pp[1][1],pp[2][0],psum[1],pcout[1]);

HA ha2(psum[1],pcout[0],psum[2],pcout[2]);

assign c[2]=psum[2];
//第四列
FA fa2(pp[0][3],pp[1][2],pcout[1],psum[3],pcout[3]);
FA fa3(pp[2][1],pp[3][0],pcout[2],psum[4],pcout[4]);

HA ha3(psum[3],psum[4],psum[5],pcout[5]);

assign c[3]=psum[5];
//第五列
FA fa4(pp[0][4],pp[1][3],pcout[3],psum[6],pcout[6]);
FA fa5(pp[2][2],pp[3][1],pcout[4],psum[7],pcout[7]);
HA ha4(pp[4][0],pcout[5],psum[8],pcout[8]);

FA fa6(psum[6],psum[7],psum[8],psum[9],pcout[9]);

assign c[4]=psum[9];
//第六列
FA fa7(pp[0][5],pp[1][4],pcout[6],psum[10],pcout[10]);
FA fa8(pp[2][3],pp[3][2],pcout[7],psum[11],pcout[11]);
FA fa9(pp[4][1],pp[5][0],pcout[8],psum[12],pcout[12]);

FA fa10(psum[10],psum[11],psum[12],psum[13],pcout[13]);

HA ha5(psum[13],pcout[9],psum[14],pcout[14]);

assign c[5]=psum[14];
//第七列
FA fa11(pp[0][6],pp[1][5],pcout[10],psum[15],pcout[15]);
FA fa12(pp[2][4],pp[3][3],pcout[11],psum[16],pcout[16]);
FA fa13(pp[4][2],pp[5][1],pcout[12],psum[17],pcout[17]);
FA fa14(pp[6][0],pcout[13],pcout[14],psum[18],pcout[18]);

FA fa15(psum[15],psum[16],psum[17],psum[19],pcout[19]);

HA ha6(psum[19],psum[18],psum[20],pcout[20]);

assign c[6]=psum[20];
//第八列
FA fa16(pp[0][7],pp[1][6],pcout[15],psum[21],pcout[21]);
FA fa17(pp[2][5],pp[3][4],pcout[16],psum[22],pcout[22]);
FA fa18(pp[4][3],pp[5][2],pcout[17],psum[23],pcout[23]);
FA fa19(pp[6][1],pp[7][0],pcout[18],psum[24],pcout[24]);
HA ha7(pcout[19],pcout[20],psum[25],pcout[25]);

FA fa20(psum[21],psum[22],psum[23],psum[26],pcout[26]);
HA ha8(psum[24],psum[25],psum[27],pcout[27]);

HA ha9(psum[26],psum[27],psum[28],pcout[28]);

assign c[7]=psum[28];
//第九列
FA fa21(pp[1][7],pp[2][6],pcout[21],psum[29],pcout[29]);
FA fa22(pp[3][5],pp[4][4],pcout[22],psum[30],pcout[30]);
FA fa23(pp[5][3],pp[6][2],pcout[23],psum[31],pcout[31]);
FA fa24(pp[7][1],pcout[24],pcout[25],psum[32],pcout[32]);
FA fa25(pcout[26],pcout[27],pcout[28],psum[33],pcout[33]);

FA fa26(psum[29],psum[30],psum[31],psum[34],pcout[34]);
HA ha10(psum[32],psum[33],psum[35],pcout[35]);

HA ha11(psum[34],psum[35],psum[36],pcout[36]);

assign c[8]=psum[36];
//第十列
FA fa27(pp[2][7],pp[3][6],pcout[29],psum[37],pcout[37]);
FA fa28(pp[4][5],pp[5][4],pcout[30],psum[38],pcout[38]);
FA fa29(pp[6][3],pp[7][2],pcout[31],psum[39],pcout[39]);
FA fa30(pcout[32],pcout[33],pcout[34],psum[40],pcout[40]);
HA ha12(pcout[35],pcout[36],psum[41],pcout[41]);

FA fa31(psum[37],psum[38],psum[39],psum[42],pcout[42]);
HA ha13(psum[40],psum[41],psum[43],pcout[43]);

HA ha14(psum[42],psum[43],psum[44],pcout[44]);

assign c[9]=psum[44];
//第十一列
FA fa32(pp[3][7],pp[4][6],pcout[37],psum[45],pcout[45]);
FA fa33(pp[5][5],pp[6][4],pcout[38],psum[46],pcout[46]);
FA fa34(pp[7][3],pcout[39],pcout[40],psum[47],pcout[47]);
FA fa35(pcout[41],pcout[42],pcout[43],psum[48],pcout[48]);

FA fa36(psum[45],psum[46],psum[47],psum[49],pcout[49]);
HA ha15(psum[48],pcout[44],psum[50],pcout[50]);

HA ha16(psum[49],psum[50],psum[51],pcout[51]);

assign c[10]=psum[51];
//第十二列
FA fa37(pp[4][7],pp[5][6],pcout[45],psum[52],pcout[52]);
FA fa38(pp[6][5],pp[7][4],pcout[46],psum[53],pcout[53]);
FA fa39(pcout[47],pcout[48],pcout[49],psum[54],pcout[54]);
HA ha17(pcout[50],pcout[51],psum[55],pcout[55]);

FA fa40(psum[52],psum[53],psum[54],psum[56],pcout[56]);

HA ha18(psum[56],psum[55],psum[57],pcout[57]);

assign c[11]=psum[57];
//第十三列
FA fa41(pp[5][7],pp[6][6],pcout[52],psum[58],pcout[58]);
FA fa42(pp[7][5],pcout[53],pcout[54],psum[59],pcout[59]);
FA fa43(pcout[55],pcout[56],pcout[57],psum[60],pcout[60]);

FA fa44(psum[58],psum[59],psum[60],psum[61],pcout[61]);

assign c[12]=psum[58];
//第十四列
FA fa45(pp[6][7],pp[7][6],pcout[58],psum[62],pcout[62]);
FA fa46(pcout[59],pcout[60],pcout[61],psum[63],pcout[63]);

HA ha19(psum[62],psum[63],psum[64],pcout[64]);

assign c[13]=psum[64];
//第十五列
FA fa47(pcout[62],pcout[63],pcout[64],psum[65],pcout[65]);

HA ha20(psum[65],pp[7][7],psum[66],pcout[66]);

assign c[14]=psum[66];
//第十六列
HA ha21(pcout[65],pcout[66],psum[67],pcout[67]);

assign c[15]=psum[67];
// //第17列
// assign c[16]=pcout[67];

endmodule