module Normalize(mul_out,fraction_out);

input[47:0] mul_out;
output reg[23:0] fraction_out;

always@(*)
	begin
		if (mul_out == 48'b00000000000000000000000)   //结果为0的情况
			begin
				fraction_out = 23'b0;
			end
			else 
				begin
					if (mul_out[47] == 1)    //若最高为1，则整数部分出现了10或11，需进行移位规则化
						begin
							fraction_out = mul_out>>1;  //左归
						end
					else
						begin
						fraction_out = mul_out;  //最高位为0则不需要规则化
						end
					if (mul_out[22] == 0) 
						begin
							fraction_out[22:0] = mul_out[45:23];
						end
					else
						begin
						  fraction_out[22:0] = mul_out[45:23] + 1'b1;  //就近舍入
						end
				end

	end

endmodule
