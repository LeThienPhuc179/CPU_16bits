`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:45:04 PM
// Design Name: 
// Module Name: data_mem_tb
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


module data_mem_tb;

    reg clk;
    reg read; 
    reg write;
    reg [15:0] addr;
    reg[15:0] wData;
    wire [15:0] rData;
    
    data_mem dut(
    .clk (clk),
    .read (read),
    .write (write),
    .addr (addr),
    .wData (wData),
    .rData (rData)
    );
    
    always begin
        clk = 1;
        #1 ;
        clk = 0; 
        #1;
    end 
    
    initial begin
        
        read = 1;
        write = 0;
        #1;
        
        addr = 16'h0000;
        #5;
        
        addr = 16'h0002;
        #5;
        
        addr = 16'h0004;
        #5;
        
        read = 0;
        write = 1;
        #1;
        
        addr = 16'h0000;
        wData = 16'hAAAA;
        #5;
        
        addr = 16'h0002;
        wData = 16'hDEAD;
        #5;
        
        addr = 16'h0004;
        wData = 16'hBEEF;
        #5;
        
        addr = 16'h0006;
        wData = 16'h5555;
        #5;
        
        read = 1;
        write = 0;
        #1;
        
        addr = 16'h0000;
        #5;
        
        addr = 16'h0002;
        #5;
        
        addr = 16'h0004;
        #5;
        
        addr = 16'h0006;
        #5;
        
    end

endmodule
