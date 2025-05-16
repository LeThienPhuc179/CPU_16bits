`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 04:32:18 AM
// Design Name: 
// Module Name: alu
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


module alu(
    input [15:0] a, b,  //16 bit inputs
    input [2:0] control, // Mux control
    output reg [15:0] result, //16 bit output
    output reg zero,   //Zero output, should be simple     
    output reg neg
    );
    always@(a,b,control)
    begin
        case(control) // Checks to see what control func is selected
            0: result <= a + b;      //ADD
            1: result <= b - a;      // SUB
            2: result <= a << b;    //SLL
            3: result <= a & b;    // AND
            
        endcase   
    end
    
    always@(result)
        begin
        
        if (result == 0)
            zero = 1'b1;
        else
            zero = 1'b0;    
        
        if (result[15] == 1)
            neg = 1'b1;
        else 
            neg = 1'b0;

    end
        
endmodule
