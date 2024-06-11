`timescale 1ns/1ns

module iMemory (input [31:0] pc_in,
                output [31:0] Instruction);

reg [31:0] Memory [255:0];

assign Instruction[31:0] = Memory[pc_in];

initial begin
    Memory[0] = 32'b00000100000000010000000000000000; // lw R1, 0(R0)
    Memory[1] = 32'b00000000001000010001000000000000; // add R2, R1, R1
    Memory[2] = 32'b00000000010000010001100000000001; // sub R3, R2, R1
    Memory[3] = 32'b00000000001000100010000000000010; // and R4, R1, R2
    Memory[4] = 32'b00000000001000100010100000000011; // or R5, R1, R2
    Memory[5] = 32'b00001000000001010000000000000001; // sw R5, 1(R0)
    Memory[6] = 32'b00001100011000011111111111111001; // beq R3, R1, 0
end

endmodule

// module test;
// reg [31:0] pc;
// wire [31:0] Instruction;
// reg clk;
// iMemory mem(pc, clk, Instruction);
// initial begin
//     $dumpfile("iMemory.vcd");
//     $dumpvars(0, test);

//     #10;
//     clk = 0;
//     clk = 1;
//     #10 pc = 1;
//     clk = 0;
//     clk = 1;
//     #10 pc = 2;
//     clk = 0;
//     clk = 1;
//     #10;
// end
// endmodule