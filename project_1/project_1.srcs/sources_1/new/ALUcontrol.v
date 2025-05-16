`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 05:39:47 AM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(
    input [1:0] ALUop,

    output reg [2:0] control
    );
    
    always @(ALUop) 
    case(ALUop)
        0: control <= 0;        //ADD
        1: control <= 1;        //SUB
        2: control <= 2;
        3: control <= 3;
    endcase
endmodule
