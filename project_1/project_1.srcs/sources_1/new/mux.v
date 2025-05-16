`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 10:15:45 PM
// Design Name: 
// Module Name: mux
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


module mux16bit(
    input wire x,
    input wire [15:0] D0,
    input wire [15:0] D1,
    output reg  [15:0] signal
    );
    
    initial begin
        signal <= 16'h0000;
    end
    
    always @(x,D0,D1) begin
    
        if (x == 0) begin
            signal <= D0;
        end
        
        if (x == 1) begin
            signal <= D1;
        end 
        
    end
endmodule
