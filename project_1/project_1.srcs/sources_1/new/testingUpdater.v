`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 09:03:08 AM
// Design Name: 
// Module Name: testingUpdater
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


module testingUpdater(
    input clk,
    input reset,
    input [15:0] input_addr,
    input Jump,
    input Branch,
    input zero,
    input wire [15:0] offset,
    input wire [15:0] jump_addr,
    input wire [3:0] opcode,
    
    output  reg [15:0] current_addr,
    output reg [15:0] output_addr
    );
    
    wire [15:0] cur_addr;
    
    always @(cur_addr) begin
        current_addr = cur_addr;
    end
    
    PC_stuff pc_test(
        .clk(clk),
        .reset(reset),
        .inp_pc(input_addr),
        
        .out_pc(cur_addr)
    );
    
    PC_Update_Unit PC_Up(
        .inp_addr(cur_addr),
        .Jump(Jump),
        .Branch(Branch),
        .zero(zero),
        .offset(offset),
        .jump_addr(jump_addr),
        
        .out_pc(output_addr)
    );
    
endmodule
