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
//LastEditTime: 2021-11-24 14:35:38
//---------------------------------------------------
module FA (
    input a,b,cin,
	output sum,cout
);
wire s1,m1,m2,m3;
xor(s1,a,b);
xor(sum,s1,cin);
and(m1,a,b);
and(m2,a,cin);
and(m3,b,cin);
or(m1,m2,m3);  
endmodule