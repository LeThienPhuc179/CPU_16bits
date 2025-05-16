`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2025 01:31:34 PM
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb;

    reg clk, reset;
    reg regWrite;
    
    reg [3:0] read_reg1;
    reg [3:0] read_reg2;
    reg [3:0] write_reg;
    reg [15:0] write_data;
    
    wire [15:0] read_data1;
    wire [15:0] read_data2;

    register_file dut (
        .clk(clk),
        
        .regWrite(regWrite),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        
        .read_data1(read_data1),
        .read_data2(read_data2)
        
    );

    always begin
        clk = 1;
        #1;
        clk = 0;
        #1;
    end
    
    initial begin
        reset <= 1;
        regWrite <= 0;
        #5;
        
        reset <= 0;
        read_reg1 <= 4'b0000;
        read_reg2 <= 4'b0001;
        #5;
        
        regWrite <= 1;
        write_reg <= 4'b0000;
        write_data <= 16'hAAAA;
        #5;
        
        regWrite <= 0;
        #5;
    end
    

endmodule
