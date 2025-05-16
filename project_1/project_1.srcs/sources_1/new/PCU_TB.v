`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2025 09:57:58 AM
// Design Name: 
// Module Name: PCU_TB
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


module PCU_TB;

    reg [15:0] inp_addr ;     //clock and reset
    reg Jump, Branch, zero;
    reg [3:0] opcode;
    reg [15:0] offset;
    reg [15:0] jump_addr;

    wire [15:0] out_pc;  //Output address
    
    
    PC_Update_Unit dut(
        .inp_addr(inp_addr),
        .Jump(Jump),
        .Branch(Branch),
        .zero(zero),
        .opcode(opcode),
        .offset(offset),
        .jump_addr(jump_addr),

        .out_pc(out_pc)
    );
    
    initial begin
    
    inp_addr = 16'h0000;
    Jump = 0;
    Branch = 0;
    zero = 0;
    opcode = 4'b0000;
    offset = 16'h00024;
    jump_addr = 16'hAAAA;
    #1;

    Branch = 1;
    zero = 1;
    opcode = 4'b0100;
    inp_addr = 16'h0000;
    #1;
    
    Branch = 0;
    zero = 0;
    opcode = 4'b0000;
    #1;
    
    Branch = 1;
    zero = 0;
    opcode = 4'b0101;
    #2;
    
    Branch = 0;
    zero = 0;
    opcode = 4'b0000;
    #1;
    
    Jump = 0;
    #1;
    
    Jump = 1;
    #2;
    
    Jump = 0;
    #1;
    
    end
    
endmodule
