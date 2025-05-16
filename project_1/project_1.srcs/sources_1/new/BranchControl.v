module BranchControl(
    input zero,
    input Branch,
    input [3:0] opcode,
    
    output reg take
);

    always @(Branch,zero,opcode)
    begin
        if (opcode == 4'b0100) begin  //bne
            take <= Branch & zero;
        end else if (opcode == 4'b0101) begin //beq
            take <= Branch & ~zero;
        end else begin
            take <= 1'b0;
        end
    end

endmodule