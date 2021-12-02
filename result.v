module result(s,e,m,clk,rst,flag_in,,flag_out,c);

	input s;
	input [7:0] e;
	input [22:0] m;
	input [1:0] flag_in;
	input clk,rst;
	output reg [31:0]c;
	output reg flag_out;
	
	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			c = 32'b0;
			flag_out = 0;
			end
		else begin
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
					c[31] = s;
					c[30:23] = e;
					c[22:0] = m;
					flag_out = 1'b1;
					end
			endcase
		end
	end
endmodule
	
	
	