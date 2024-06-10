`timescale 1ns/1ns

module iMemory (input [31:0] pc_in,
                input clk,
                output reg [31:0] Instruction);

reg [31:0] Memory [255:0];
reg [31:0] pc;

always @(posedge clk) begin
    pc = pc_in;
    Instruction[31:0] = Memory[pc];
end
initial begin
    Memory[0] = 32'b00000000000000010000000000000000;
    Memory[1] = 32'b00000100001000010001000000000000;
    Memory[2] = 32'b00000000010000010001100000000001;
    pc = 0;
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

//     #10 pc = 0;
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