`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/31 02:00:33
// Design Name: 
// Module Name: hw
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


module hw(
  input [31:0] in,
  output [4:0] out
);

reg [4:0] i;

always @(*) begin
    for(i=0; in[i]==0; i=i+1) begin
    end
end

assign out=i;

endmodule
