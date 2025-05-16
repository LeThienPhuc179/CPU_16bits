`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:35:12 PM
// Design Name: 
// Module Name: pc_tb
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


module pc_tb;

    reg clk, reset;      //clock and reset
    reg [15:0] inp_pc;  //Input address
    wire [15:0] out_pc;  //Output address
    
    program_counter dut(
        .clk(clk),
        .reset(reset),
        .inp_pc(inp_pc),
        .out_pc(out_pc)
    );
    
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    initial begin
        
        reset = 1;
        #5;
        
        reset = 0;
        inp_pc = 16'h0000;
        #5;
        
        inp_pc = 16'h0002;
        #5;
        
        inp_pc = 16'h0002;
        #5
        
        inp_pc = 16'h0024;
        #5;
        
        inp_pc = 16'h0036;
        #5;
    end
    
endmodule
