`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/23 17:50:11
// Design Name: 
// Module Name: add_4
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


module add_4(
    //input/output signals and defination
    input [3:0] in_0,
    input [3:0] in_1,
    input cin,
    output [3:0] out,
    output cout
    );
    
    // assignment statement
    assign {cout, out} = in_0 + in_1 + cin;
    
endmodule
