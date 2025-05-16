`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2025 02:16:07 PM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb;

    reg [15:0] a, b; 
    reg [2:0] control; 
    wire [15:0] result; 
    wire zero; 
    wire neg;

    alu dut (
        .a(a),
        .b(b),
        .control(control),
        .result(result),
        .zero(zero),
        .neg(neg)
    );
    
    initial begin
   
    control <= 2'b00;
    a <= 16'h0001;
    b <= 16'h0001;
    #10;
    
    control <= 2'b00;
    a <= 16'hFF0F;
    b <= 16'h0011;
    #10;
    
    control <= 2'b01;
    a <= 16'h0005;
    b <= 16'h0001;
    #10;
    
    control <= 2'b01;
    a <= 16'h0005;
    b <= 16'h0011;
    #10;
    
    control <= 2'b10;
    a <= 16'hFFFF;
    b <= 16'h0FF0;
    #10;
    
    control <= 2'b11;
    a <= 16'hFFFF;
    b <= 16'h0004;
    #10;
    
    end 

endmodule
