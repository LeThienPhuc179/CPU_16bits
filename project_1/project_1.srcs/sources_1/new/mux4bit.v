`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 09:24:41 AM
// Design Name: 
// Module Name: mux4bit
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


module mux4bit(
    input wire sel,
    input wire [3:0] A,
    input wire [3:0] B,
    output reg [3:0] S
    );
    
    
    always @(sel,A,B) begin
    
        if (sel == 0) begin
            S <= A;
        end
        
        if (sel == 1) begin
            S <= B;
        end 
        
    end
    
endmodule
