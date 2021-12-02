`include "judge.v"
`include "mul_24bit_array.v"
`include "normalize.v"
`include "result.v"

module fpu_top(
    input clk,
    input en,
    input a,
    input b,
    output reg [31:0]c,
    output reg flag_out
);

judge judge(
    a,b,en,
    flag,hidea,hideb
);

mul_24bit_array mul(
    a,b,
    c
);

normalize norm(
    mul_out,
    fraction_out
);

result result(
    s,e,m,flag_in,clk,rst,
    c,flag_out
);


endmodule