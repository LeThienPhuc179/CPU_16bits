`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:55:03 PM
// Design Name: 
// Module Name: adder2
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


module adder2(
    input [15:0] inp,
    output reg [15:0] out
    );
    
    always @(inp) begin
        out <= inp + 2;
    end
    
endmodule