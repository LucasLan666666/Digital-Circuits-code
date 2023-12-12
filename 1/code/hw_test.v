`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/31 01:48:30
// Design Name: 
// Module Name: hw_test
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


module hw_test();

    reg [31:0] in;
    wire [4:0] out;
    
    hw instance_hw(
        .in(in),
        .out(out)
    );
    
    initial begin
      in = 32'h1;
    end
    
    always begin
        #2;
        in = $random() % 2^32;
    end

endmodule
