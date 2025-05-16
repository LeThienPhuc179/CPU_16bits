`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 09:09:18 AM
// Design Name: 
// Module Name: UpdateTB
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


module UpdateTB;

    reg  clk;
    reg  reset;
    reg  [15:0] input_addr;
    reg  Jump;
    reg  Branch;
    reg  zero;
    reg  [15:0] offset;
    reg  [15:0] jump_addr;
    reg  [3:0] opcode;
    
    wire [15:0] current_addr;
    wire [15:0] output_addr;
    
    testingUpdater dut(
        .clk(clk),
        .reset(reset),
        .input_addr(input_addr),
        .Jump(Jump),
        .Branch(Branch),
        .zero(zero),
        .offset(offset),
        .jump_addr(jump_addr),
        .opcode(opcode),
        .current_addr(current_addr),
        .output_addr(output_addr)
    );

    always begin
        clk = 1;
        #1 ;
        clk = 0; 
        #1;
    end 
    
    initial begin
    
        reset = 0;
        input_addr = 16'h0000;
        Jump = 0;
        Branch = 0;
        zero = 0;
        offset = 16'h0000;
        jump_addr = 16'h0000;
        opcode = 4'b0000;
        #1;
    
    end
    
endmodule
