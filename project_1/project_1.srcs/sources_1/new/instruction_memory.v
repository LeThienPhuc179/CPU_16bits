`timescale 1ns / 1ps

module instruction_memory(
    input wire [15:0] addr,
    output reg [15:0] instr
    );

    reg [7:0] instruction_memory [254:0];
    
    initial begin
        $readmemh("instruction_mem.mem",instruction_memory);
    end
    
    always @(addr) 
    begin
        instr[7:0] <= instruction_memory[addr+1];
        instr[15:8] <= instruction_memory[addr];
    end
    
endmodule
