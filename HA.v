//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-11-24 14:29:59
//LastEditors: lizhun
//LastEditTime: 2021-11-29 21:33:44
//---------------------------------------------------
module HA ( a,
            b,
            sum,
            cout);
input   a;
input   b;
output  sum;
output  cout;
assign  sum=a^b;
assign  cout=a&b;   
endmodule