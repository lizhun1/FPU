//---------------------------------------------------
//COPYRIGHT (C) 2021, lizhun, Fudan University
//lizhun    email:21212020102@m.fudan.edu.cn
//Fudan University        www.fudan.edu.cn              
//-----------------------------------------
//Descripttion: this is 
//version: 1.0
//Author: lizhun
//Date: 2021-12-02 10:54:41
//LastEditors: lizhun
//LastEditTime: 2021-12-05 00:01:14
//---------------------------------------------------
// `include "judge.v"
// `include "mul_24bit_array.v"
// `include "normalize.v"
// `include "result.v"
// `include "exp.v"

module fpu_top(
    a,
    b,
    c,
    flag_out,
    oom,
    vec);

input wire [31:0]   a;
input wire [31:0]   b;
output wire [31:0]   c;
output wire          flag_out;
output wire         oom; 
output wire         vec;   

wire        [23:0]  ha;
wire        [23:0]  hb;
wire        [7:0]  expa;
wire        [7:0]  expb;
wire        [7:0]  expc;
wire                hidea;
wire                hideb;
wire        [1:0]      flag;      
wire        [47:0]  mul_out;
wire        [22:0]  fraction_out;
wire                om;
wire                vc;
wire                s;
wire                cout;  
judge jde(      a,
                b,
                flag,
                hidea,
                hideb);//判断输入是否规范
assign s=a[31]^b[31];//符号位结果
exp_cac ex(expa,expb,cout,expc,om,vc);//计算阶码和溢出
assign  expa=a[30:23];
assign  expb=b[30:23];
assign  ha[23]=hidea;
assign  ha[22:0]=a[22:0];
assign  hb[23]=hideb;
assign  hb[22:0]=b[22:0];
assign  oom=om;
assign  vec=vc;
mul_24array mul(ha,hb,mul_out);//计算尾数

Normalize norm(mul_out,fraction_out,cout);//尾数规格化



result result(s,expc,fraction_out,flag,om,c,flag_out);//根据计算结果确认结果


endmodule