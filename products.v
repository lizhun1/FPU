//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-11-29 19:48:59
//LastEditors: lizhun
//LastEditTime: 2021-11-30 18:17:59
//---------------------------------------------------
module products8 (   a,
                    b,
                    c);
input   [7:0]  a;
input           b;
output  [7:0]  c;
wire    [7:0]  a;
wire            b;
wire    [7:0]  c;
genvar i;
generate
    for(i=0;i<8;i=i+1)
        begin:products
            and a1(c[i],a[i],b);
        end
endgenerate
endmodule