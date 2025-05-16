`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 09:54:02 AM
// Design Name: 
// Module Name: PC_Update_Unit
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


module PC_Update_Unit(
    input [15:0] inp_addr,
    input Jump, Branch, zero,
    input wire [3:0] opcode,
    input wire [15:0] offset,
    input wire [15:0] jump_addr,
    
    output reg [15:0] out_pc
    );
    
    wire branchSignal;
    reg [15:0] offset_shifted;
    wire [15:0] nextAddr_default;
    wire [15:0] nextAddr_branch;    
    wire [15:0] nextAddr_branchControlled;
    wire [15:0] nextAdder_jump;
    wire [15:0] nextAddr_fullControlled;
 
    
    
    
    always @(inp_addr,Jump, Branch, zero,opcode,jump_addr,nextAddr_fullControlled) begin
        out_pc <= nextAddr_fullControlled;
        offset_shifted [0] <= 1'b0;
        offset_shifted [15:1] <= offset[14:0];
    end
    
    adder2 pcAdder
    (
        .inp(inp_addr),
        .out(nextAddr_default)
    );
    
    offset_adder branchAdder
    (
        .inp(inp_addr),
        .offset(offset_shifted),
        .out(nextAddr_branch)
    );
    
    offset_adder jumpAdder
    (
        .inp(inp_addr),
        .offset(jump_addr),
        .out(nextAdder_jump)
    );
    
    BranchControl branchControlSignal
    (
        .zero(zero),
        .Branch(Branch),
        .opcode(opcode),
        .take(branchSignal)
    );
    
    mux16bit branchControlMUX
    (
        .x(branchSignal),
        .D0(nextAddr_default),
        .D1(nextAddr_branch),
        .signal(nextAddr_branchControlled)
    );
    
    mux16bit jumpMUX
    (
        .x(Jump),
        .D0(nextAddr_branchControlled),
        .D1(nextAdder_jump),
        .signal(nextAddr_fullControlled)
    );
    
endmodule
