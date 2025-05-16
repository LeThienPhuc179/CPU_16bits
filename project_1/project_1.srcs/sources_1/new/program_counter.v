`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2025 03:40:44 AM
// Design Name: 
// Module Name: program_counter
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



module program_counter( 
    input clk, reset,      //clock and reset
    input [15:0] inp_pc,  //Input address
    output reg [15:0] out_pc  //Output address
    );


    always @(posedge clk)
    begin
        if (reset)          //If reset hit, then reset
           out_pc <= 16'h0000;
        else
           out_pc <= inp_pc;
    end
    
    
endmodule
