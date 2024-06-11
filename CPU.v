`timescale 1ns/1ns

module CPU (
    clk, RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, branch, Instruction, current_pc, read_data1, read_data2, sx_out, mux32bit_2, result_mux32bit_1, alu_out, data_mem_out, next_pc 
);
input clk;
output RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, branch;
output wire [31:0] Instruction, current_pc, read_data1, read_data2, sx_out, mux32bit_2, result_mux32bit_1, alu_out, data_mem_out, next_pc;
wire [15:0] constant;
output wire [5:0] opcode;
wire [4:0] Rd, Rt, Rs, result_mux5bit;
wire [1:0] ALU_op;

program_counter prog_count(next_pc, clk, current_pc);
iMemory iMemory(current_pc, Instruction);
Decoder decod(Instruction, opcode, Rd, Rt, Rs, constant);
Controller cont(opcode, constant[5:0], RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, ALU_op, branch);
MUX_5bit M5bit(RegDst, Rt, Rd, result_mux5bit);
RegFile RF(Rs, Rt, result_mux5bit, mux32bit_2, RegWrite, read_data1, read_data2);
sign_extend sx(constant, sx_out);
MUX_32bit M32bit1(ALU_Src, read_data2, sx_out, result_mux32bit_1);
alu alu(read_data1, result_mux32bit_1, ALU_op, alu_out, z);
data_memory dmem(MemWrite ,MemRead ,read_data2, alu_out, data_mem_out);
MUX_32bit M32bit2(MemToReg, alu_out ,data_mem_out, mux32bit_2);

wire [31:0] added_jump, pc_plus_one;
assign pc_plus_one = current_pc + 1;
assign added_jump = pc_plus_one + sx_out;

MUX_32bit MUX32bit3((branch & z), pc_plus_one, added_jump, next_pc);

endmodule

module CPU_tb;
reg clk;

wire RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, branch;
wire [31:0] Instruction, current_pc, read_data1, read_data2, sx_out, mux32bit_2, result_mux32bit_1, alu_out, data_mem_out, next_pc;

CPU cpu (clk, RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, branch, Instruction, current_pc, read_data1, read_data2, sx_out, mux32bit_2, result_mux32bit_1, alu_out, data_mem_out, next_pc);
integer i;
initial begin
    $dumpfile("the_cpu.vcd");
    $dumpvars(0, CPU_tb);
    clk = 0;
    for (i = 0; i < 18; i = i + 1) begin
        #50 clk = ~clk;
    end
end
endmodule