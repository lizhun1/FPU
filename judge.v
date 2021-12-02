module judge(a,b,en,flag,hidea,hideb);
	input [31:0] a;
	input [31:0] b;
	input en;
	output reg [1:0] flag;//00:infinity  01:NaN  10:0  11:normal compute
	output reg hidea;
	output reg hideb;
	 
	wire sa,sb,sout;
	wire [7:0] ea,eb;
	wire [22:0] ma,mb;

	assign ea = a[30:23];
	assign eb = b[30:23];
	assign ma = a[22:0];
	assign mb = b[22:0];

	always @(*)	begin 
		if (!en) begin
			flag = 2'b01;
			end
		else if ((ea==8'b11111111)&(ma==23'b00000000000000000000000)) begin
			flag = 2'b00;
			end
		else if((eb==8'b11111111)&(mb==23'b00000000000000000000000)) begin
			flag = 2'b00;
			end
		else if((ea==8'b11111111)|(eb==8'b11111111)) begin
			flag = 2'b01;
			end
		else if((ea==8'b00000000)&(ma==23'b00000000000000000000000)) begin
			flag = 2'b10;
			end
		else if((eb==8'b00000000)&(mb==23'b00000000000000000000000)) begin
		  flag = 2'b10;
		  end
		else flag = 2'b11;
		end

  always @(*) begin
    if (ea==8'b00000000) begin
      hidea = 0;
      end
    else
      hidea = 1;
    end
    
  always @(*) begin
    if (eb==8'b00000000) begin
      hideb = 0;
      end
    else
      hideb = 1;
    end 
			
endmodule	



