`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2025 03:41:10 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input wire clk, read, write,
    input wire [15:0] addr,    
    input wire [15:0] wData,   
    output reg [15:0] rData    
);
    
    reg [7:0] dataMem[0:1023]; 
    
    initial begin
        $readmemh("data_memory.mem", dataMem);
    end
    
    always @(*) begin
        if (read == 1) begin
            rData[7:0] <= dataMem[addr + 1];          
            rData[15:8] <= dataMem[addr];  
        end
    end
    always @(negedge clk) begin 
        if (write == 1) begin
            dataMem[addr] <= wData[15:8];            
            dataMem[addr+1] <= wData[7:0];
        end
    end
    
endmodule
