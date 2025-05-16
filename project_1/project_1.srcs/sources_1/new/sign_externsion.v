`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 11:10:00 AM
// Design Name: 
// Module Name: sign_externsion
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


module sign_extension(
    input [3:0] inp,
    output reg [15:0] out
    );
    
    always @(inp) begin
        out[3:0] = inp;
        if (inp[3] == 1) begin   
            out[15:4] <= 12'hFFF;
        end else if (inp[3] == 0) begin
            out[15:4] <= 12'h000;
        end
    end
    
endmodule
