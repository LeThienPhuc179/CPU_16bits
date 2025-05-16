`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 04:21:32 PM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;

    reg [15:0] D0;
    reg [15:0] D1;
    reg x;
    wire [15:0] signal;
    
    mux16bit dut(
        .D0 (D0),
        .D1 (D1),
        .x (x),
        .signal(signal)
    );
    
    
    initial begin 
        D0 <= 16'h0123;
        D1 <= 16'h0022;
        #5;
        x <= 1;
        #5;
        x <= 0;
        #5;
    end
endmodule

