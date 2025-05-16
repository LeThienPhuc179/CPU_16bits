`timescale 1ns / 1ps

module im_tb();
    
    reg [15:0] addr = 16'h0000;
    wire [15:0] instruction;
    
    
    instruction_memory dut (
        .addr (addr),
        .instr (instruction)
    );
    
    initial begin
   
    addr <= 16'h0002;
    #10;
        
    addr <= 16'h0004;
    #10;
        
    addr <= 16'h0006;
    #10;
        
    addr <= 16'h0008;
    #10;
    end 
endmodule
