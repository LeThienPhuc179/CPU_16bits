`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 03:06:18 PM
// Design Name: 
// Module Name: BranchControl_TB
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


module BranchControl_TB;

    reg zero;
    reg Branch;
    reg [3:0] opcode;
    wire take;

    BranchControl dut (
        .zero(zero),
        .Branch(Branch),
        .opcode(opcode),
        .take(take)
    );
    
    
    initial begin
        
        opcode = 4'b0100;
        zero = 1;
        Branch = 1;
        #5;
        
        zero = 0;
        #5;
        
        zero = 1;
        Branch = 0;
        #5;
        
        opcode = 4'b1010;
        #5;
        
    end

endmodule
