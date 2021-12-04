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
//LastEditTime: 2021-12-05 00:02:56
//---------------------------------------------------
module Normalize(mul_out,fraction_out,ecout);

input	[47:0] 	mul_out;
output 	[22:0] 	fraction_out;
output  		ecout;
reg 	[22:0] 	fraction_out;
wire 			ecout;
wire	[47:0] 	mul_out;
assign ecout=mul_out[47];
always@(*)
	begin
		if (mul_out == 48'h000000000000)   //结果为0的情况
			begin
				fraction_out = 23'b0;
			end
		else 
			begin
				if (mul_out[47] == 1)    //若最高为1，则整数部分出现了10或11，需进行移位规则化
					begin
						if (mul_out[22] == 0) 
							begin
								fraction_out[22:0] = mul_out[46:24];
							end
						else
							begin
								fraction_out[22:0] =mul_out[46:24] + 23'b1;  //就近舍入
							end
					end
				else
					begin
						if (mul_out[22] == 0) 
						begin
							fraction_out[22:0] = mul_out[45:23];
						end
					else
						begin
							fraction_out[22:0] =mul_out[45:23] + 23'b1;  //就近舍入
						end
					end
			end

	end

endmodule
