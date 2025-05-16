`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 04:58:55 AM
// Design Name: 
// Module Name: register_file
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

module register_file(
    input clk, reset,
    input regWrite,
    
    input wire [3:0] read_reg1,
    input wire [3:0] read_reg2,
    input wire [3:0] write_reg,
    input wire [15:0] write_data,
    
    output reg [15:0] read_data1,
    output reg [15:0] read_data2
    );
    
    integer i;
    reg [15:0] register_file [15:0];
    

    always @(*) begin
        read_data1 = register_file[read_reg1];
        read_data2 = register_file[read_reg2];
    end
    always @(negedge clk) begin
        if (reset == 1) begin
            for (i = 0; i < 16; i = i + 1) begin
                register_file[i] <= 16'h0000;
            end
        end
                         //Why Negative Edge? Read and Write cannot happen at the same time, hence read on a posedge and write on a negedge.
        if (regWrite == 1) begin
            register_file[write_reg] <= write_data;
        end
    end
    
endmodule
