`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/24 11:07:57
// Design Name: 
// Module Name: add_1
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


module add_1( out, cout, in_0, in_1, cin); 
input   in_0, in_1, cin;
output  out, cout;
wire w1, w2, w3, w4;

xor ( w1, in_0, in_1),
    ( out, w1, cin);
and ( w2, in_0, in_1),
    ( w3, in_0, cin),
    ( w4, in_1, cin);
or  ( cout, w2, w3, w4); 

endmodule
