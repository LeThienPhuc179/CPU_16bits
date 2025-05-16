`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 06:45:42 AM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(
    input [15:0] instruction,
    
    output reg [1:0] ALUOp,
    output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump
    );
    
    initial begin
        ALUOp <= 2'b00;
        RegDst <= 0;
        Branch <= 0;
        MemRead <= 0;
        MemtoReg <= 0;
        MemWrite <= 0;
        ALUSrc <= 0;
        RegWrite <= 0;
        Jump <= 0;
    end
    
    always @(*)
    begin
        case (instruction[15:12])
            4'b0000 : begin
                RegDst <= 1;
                ALUSrc <= 0;
                MemtoReg <= 0;
                RegWrite <= 1;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 0;
                Jump <= 0;
                case (instruction[3:0])
                    4'b0000: //Add Instruction
                        ALUOp <= 2'b00;
                    4'b0001: //Subtract Instruction
                        ALUOp <= 2'b01;
                    4'b0010: //And Instruction
                        ALUOp <= 2'b10;
                    4'b0011: //Left Shift Instruction
                        ALUOp <= 2'b11;
                    default: 
                        ALUOp <= 2'b00;
                endcase
            end
            4'b0001 : begin //lw 
                RegDst <= 0;
                ALUSrc <= 1;
                MemtoReg <= 1;
                RegWrite <= 1;
                MemRead <= 1;
                MemWrite <= 0;
                Branch <= 0;
                Jump <= 0;
                ALUOp <= 2'b00;
            end
            4'b0010 : begin //sw
                RegDst <= 0;
                ALUSrc <= 1;
                MemtoReg <= 0;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 1;
                Branch <= 0;
                Jump <= 0;
                ALUOp <= 2'b00;
            end
            4'b0011 : begin //addi
                RegDst <= 1;
                ALUSrc <= 1;
                MemtoReg <= 0;
                RegWrite <= 1;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 0;
                Jump <= 0;
                ALUOp <= 2'b00;
            end
            4'b0100 : begin //beq
                RegDst <= 0;
                ALUSrc <= 0;
                MemtoReg <= 0;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 1;
                Jump <= 0;
                ALUOp <= 2'b01;
            end
            4'b0101 : begin //bne
                RegDst <= 0;
                ALUSrc <= 0;
                MemtoReg <= 0;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 1;
                Jump <= 0;
                ALUOp <= 2'b01;
            end
            4'b0110 : begin //jump
                RegDst <= 0;
                ALUSrc <= 0;
                MemtoReg <= 0;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 0;
                Jump <= 1;
                ALUOp <= 2'b00;
            end
            default: begin
                RegDst <= 1;
                ALUSrc <= 0;
                MemtoReg <= 0;
                RegWrite <= 1;
                MemRead <= 0;
                MemWrite <= 0;
                Branch <= 0;
                Jump <= 0;
                ALUOp <= 2'b00;
            end
        endcase
    end
endmodule
