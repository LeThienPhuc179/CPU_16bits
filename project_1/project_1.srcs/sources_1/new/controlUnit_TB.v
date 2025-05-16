`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 02:18:02 PM
// Design Name: 
// Module Name: controlUnit_TB
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


module controlUnit_TB;

    reg [15:0] instruction;
    wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump;
    wire [1:0] ALUOp;
    
    Control_Unit dut(
        .instruction(instruction),
        .RegDst(RegDst),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .Jump(Jump),
        .ALUOp(ALUOp)
    );
    
    initial begin
    
        instruction <= 16'h0000;
        #5;
        
        instruction <= 16'h3014;
        #5;
        
        instruction <= 16'h2010;
        #5;
    
    end
    
endmodule
