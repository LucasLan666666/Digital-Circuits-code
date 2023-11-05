`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/24 11:11:48
// Design Name: 
// Module Name: test_add_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_add_1();

reg a;
reg b;
reg in_carry;
wire sum;
wire out_carry;

add_1 instance_add_1 (
    .in_0(a),
    .in_1(b),
    .cin(in_carry),
    .out(sum),
    .cout(out_carry)
);

initial begin
    a = 1'h1;
    b = 1'h0;
    in_carry = 1'b0;
end

always begin
    #2;
    a = $random() % 2;
    b = $random() % 2;
    in_carry = $random() % 2;
end
endmodule
