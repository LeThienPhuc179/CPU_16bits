`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 04:04:24 PM
// Design Name: 
// Module Name: adder2_tb
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


module adder2_tb;

    reg [15:0] inp;
    wire [15:0] out;
    
    adder2 dut (
        .inp(inp),
        .out(out)
    );
    
    initial begin
        inp = 16'h0000;
        #5;
        
        inp = 16'h0024;
        #5;
        
        inp = 16'hFF04;
        #5;
        
        inp = 16'h0036;
        #5;
    end
    

endmodule