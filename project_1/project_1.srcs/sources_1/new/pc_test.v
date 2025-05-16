`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 09:23:23 AM
// Design Name: 
// Module Name: pc_test
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


module pc_test(
    input clk, reset,      //clock and reset
    input [15:0] inp_pc,  //Input address
    output reg [15:0] out_pc  //Output address
    );

    always @(posedge clk)
    begin
    if (reset)          //If reset hit, then reset
       out_pc = 16'h0000;
    else 
       out_pc = inp_pc;
    end    
endmodule
