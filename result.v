module result(s,e,m,flag_in,oom,c,flag_out);
	input s;
	input [7:0] e;
	input [22:0] m;
	input [1:0] flag_in;
	//input clk,rst;
	input oom;
	output reg [31:0]c;
	output reg flag_out;
	
	always @(*) begin
		case(flag_in)
			2'b00:begin
				c[31] = s;
				c[30:0] = 31'b11111111_00000000000000000000000;
				flag_out = 1'b1;
				end
			2'b01:begin
				c = 32'b0;
				flag_out = 0;
				end
			2'b10:begin
				c[31] = s;
				c[30:0] = 31'b0;
				flag_out = 1'b1;
				end
			2'b11:begin
				if (oom==1'b1) begin
					flag_out =0;
					c=32'b0;
					end
				else begin
					c[31] = s;
					c[30:23] = e;
					c[22:0] = m;
					flag_out = 1'b1;
					end
				end
			endcase
		end
endmodule
	
	
	