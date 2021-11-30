//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-11-24 14:31:36
//LastEditors: lizhun
//LastEditTime: 2021-11-29 21:27:57
//---------------------------------------------------
module FA ( a,
            b,
            cin,
            sum,
            cout);
input   a;
input   b;
input   cin;
output  sum;
output  cout; 
wire    a;
wire    b;
wire    cin;
wire    sum;
wire    cout;
assign sum=a^b^cin;
assign cout=a&b|a&cin|b&cin;
endmodule