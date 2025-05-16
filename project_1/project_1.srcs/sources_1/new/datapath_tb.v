`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2025 04:21:15 PM
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb;

    reg clk;
    reg reset;
    
    wire RegDst_out, Branch_out, MemRead_out, MemtoReg_out, MemWrite_out, ALUSrc_out, RegWrite_out, Jump_out;
    wire [1:0] ALUOp_out;
    wire [15:0] addr;
    wire [15:0] instruction;
    
    wire [15:0] operand1;
    wire [15:0] operand2;
    wire [15:0] result_out;

    
    datapath dut(
        .clk(clk),
        .reset(reset),
        
        .RegDst_out(RegDst_out),
        .Branch_out(Branch_out),
        .MemRead_out(MemRead_out),
        .MemtoReg_out(MemtoReg_out),
        .MemWrite_out(MemWrite_out),
        .ALUSrc_out(ALUSrc_out),
        .RegWrite_out(RegWrite_out),
        .Jump_out(Jump_out),
        .ALUOp_out(ALUOp_out),
        
        .addr(addr),
        .instruction(instruction),
        
        .operand1_out(operand1),
        .operand2_out(operand2),
        .result_out(result_out)
    );
    
    always begin
        clk = 0;
        #1;
        clk = 1;
        #1;
    end
    
    initial begin
        
        reset = 1;
        #2;
        
        reset = 0;
        #1;
        
        #1;
        
        
    end
    
endmodule
