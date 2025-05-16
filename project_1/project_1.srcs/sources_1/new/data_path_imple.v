`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2025 06:16:24 PM
// Design Name: 
// Module Name: datapath
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


module datapath_impl(
    input clk,reset,
    
    output wire [15:0] result_out
);

   
    //PC SIGNALS
    wire [15:0] new_addr;
    wire [15:0] current_addr;

    //Flags: RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump
    //       ALUOp, ALUControl
    
    wire RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump;
    wire [1:0] ALUOp;
    wire [2:0] ALUControl;
    
    //Instruction SIGNALS
    wire [15:0] fetch_instruction;
    
    //JUMP ADDRESS FOR THE SAKE OF SIMPLICITY
    reg [15:0] jump_addr;
    
    //Register File SIGNALS
    wire [15:0] operand1; //data1
    wire [15:0] operand2; //data2
    wire [3:0] destReg;
    wire [15:0] w_data;
    
    //ALU SIGNALS
    wire [15:0] alu_result;
    wire [15:0] alu_operand2;
    
    wire zero;
    wire neg;
    
    //Memory SIGNALS
    wire [15:0] r_data;
    
    //IMMEDIATE DATA
    wire [15:0] immediate;
    
    //Testing SIGNALS
   
    assign result_out = operand1;
    
    
    
    
    //Tester Stuff
    always @(current_addr, fetch_instruction) begin
        jump_addr[0] <= 1'b0;
        jump_addr[12:1] <= fetch_instruction[11:0];
        jump_addr[15:13] <= 3'b000;
    end
    
    //INSTRUCTION MEMORY STUFF
    
    program_counter PC(
        .clk(clk),
        .reset(reset),
        .inp_pc(new_addr),
        .out_pc(current_addr)
    );
    
    PC_Update_Unit PC_UP(
        .inp_addr(current_addr),
        .opcode(fetch_instruction[15:12]),
        .Jump(Jump),
        .Branch(Branch),
        .zero(zero),
        .offset(immediate),
        .jump_addr(jump_addr),
        .out_pc(new_addr)
    );
    
    instruction_memory im(
        .addr(current_addr),
        .instr(fetch_instruction)
    );
    
    //CONTROL UNIT
    //          INPUT: fetch_instruction
    //          OUTPUT: ALUOp, RegDst, Branch, 
    //                  MemRead, MemtoReg, MemWrite, ALUSrc, 
    //                  RegWrite,Jump
    
    Control_Unit controlSignal(
        .instruction(fetch_instruction),
        .ALUOp(ALUOp),
        .RegDst(RegDst),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .Jump(Jump)
    );
    
    //Register File, USED SIGNALS: RegDst
    
    mux4bit rdSel(
        .sel(RegDst),
        .A(fetch_instruction[7:4]),
        .B(fetch_instruction[11:8]),
        
        .S(destReg)
    );
    
    register_file regfile(
        .clk(clk),
        .reset(reset),
        .regWrite(RegWrite),
        
        .read_reg1(fetch_instruction[11:8]),
        .read_reg2(fetch_instruction[7:4]),
        .write_reg(destReg),
        .write_data(w_data),
        
        .read_data1(operand1),
        .read_data2(operand2)
    );
    
    
    // ALU SIGNAL:
    
    ALUcontrol controlSIGNAL(
        .ALUop(ALUOp),
        .control(ALUControl)
    );
    
    alu aluUnit(
        .a(operand1),
        .b(alu_operand2),
        .control(ALUControl),
        .result(alu_result),
        .zero(zero),
        .neg(neg)
    );
    
    // DataMemory, SIGNALS USED MemWrite, MemtoReg, MemRead
    data_mem memory(
        .clk(clk),
        .addr(alu_result),
        .read(MemRead),
        .write(MemWrite),
        .wData(operand2),
        .rData(r_data)
    );
    
    //MUXES for [ALU/MEMORY to Reg] 
    //          and [operand2/immediate to ALU]
        // SIGNALS USED: ALUSrc
    mux16bit RegtoALU(
        .x(ALUSrc),
        .D0(operand2),
        .D1(immediate),
        .signal(alu_operand2)
    );
    
        // SIGNALS USED: MemtoReg
    mux16bit MemorytoReg(
        .x(MemtoReg),
        .D0(alu_result),
        .D1(r_data),
        .signal(w_data)
    );
    
    //SIGN EXTENTION
    
    sign_extension signEXT(
        .inp(fetch_instruction[3:0]),
        .out(immediate)
    );
    
endmodule
