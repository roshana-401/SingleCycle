`timescale 1ns/1ns

module CPU (
    clk, RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, branch, Instruction, pc, ReadData1, read_data1, read_data2, sx_out, mux32bit_2, result_mux32bit_1, alu_out, data_mem_out 
);
input clk;
output RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, branch;
output wire [31:0] Instruction, pc, ReadData1, read_data1, read_data2, sx_out, mux32bit_2, result_mux32bit_1, alu_out, data_mem_out;
wire [15:0] constant;
output wire [5:0] opcode;
wire [4:0] Rd, Rt, Rs, result_mux5bit;
wire [1:0] ALU_op;


iMemory iMemory(pc, clk, Instruction);
Decoder decod(Instruction, opcode, Rd, Rt, Rs, constant);
Controller cont(opcode, constant[5:0], RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, ALU_op, Branch);
MUX_5bit M5bit(RegDst, Rt, Rd, result_mux5bit);
RegFile RF(Rs, Rt, result_mux5bit, mux32bit_2, RegWrite, read_data1, read_data2);
sign_extend sx(constant, sx_out);
MUX_32bit M32bit1(ALU_Src, read_data2, sx_out, result_mux32bit_1);
alu alu(read_data1, result_mux32bit_1, ALU_op, alu_out, z);
data_memory dmem(MemWrite ,MemRead ,read_data2, alu_out, data_mem_out);
MUX_32bit M32bit2(MemToReg,alu_out ,data_mem_out, mux32bit_2);

wire [31:0] next_pc;
assign next_pc = pc + 1;

wire [31:0] added_jump;
assign added_jump = next_pc + sx_out;

MUX_32bit MUX32bit3((branch & z), next_pc, added_jump, pc);

endmodule

module CPU_tb;
reg clk;
initial begin
    clk = 0;
end
wire RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, branch;
wire [31:0] Instruction, pc, ReadData1, read_data1, read_data2, sx_out, mux32bit_2, result_mux32bit_1, alu_out, data_mem_out;

CPU cpu (clk, RegDst, ALU_Src, MemToReg, RegWrite, MemRead, MemWrite, branch, Instruction, pc, ReadData1, read_data1, read_data2, sx_out, mux32bit_2, result_mux32bit_1, alu_out, data_mem_out);
integer i;
initial begin
    $dumpfile("the_cpu.vcd");
    $dumpvars(0, CPU_tb);
    for (i = 0; i < 10; i = i + 1) begin
        #50 clk = ~clk;
    end
end
endmodule