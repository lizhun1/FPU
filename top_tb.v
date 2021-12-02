`include "fpu_top.v"
`timescale 1ns/1ps


module top_tb();
reg [31:0] in1;
reg [31:0] in2;
reg clk;
reg  [31:0] rsu;
wire [31:0] out;
reg flag_out;

fpu_top top(clk,en,in1,in2,out,flag_out);

always #1000 clk=~clk;
always @(*) begin
    rsu=in1*in2;
end
always @(posedge clk) begin
    in1=in1+24'b1; 
    in2=in2+24'b1;   
end
initial begin
    #100
    clk=0;
    in1=24'hffff00;
    in2=24'hffff00;
    #10000000
    $stop;
end
endmodule