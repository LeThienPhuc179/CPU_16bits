`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 11:15:43 AM
// Design Name: 
// Module Name: signext_tb
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


module signext_tb;

    reg [3:0] inp;
    wire [15:0] out;
    
    sign_extension dut (
        .inp(inp),
        .out(out)
    );
    
    initial begin
    
        inp <= 4'b0000;
        #5;
        
        inp <= 4'b1010;
        #5;
        
        inp <= 4'b0110;
        #5;
    
    end

endmodule
