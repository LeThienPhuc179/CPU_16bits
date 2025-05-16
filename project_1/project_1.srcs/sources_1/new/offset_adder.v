`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 02:35:50 PM
// Design Name: 
// Module Name: offset_adder
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


module offset_adder(
    input [15:0] inp,
    input [15:0] offset,
    output reg [15:0] out
    );
    
    always @(inp, offset) begin
        out <= inp + offset + 2;
    end
endmodule
