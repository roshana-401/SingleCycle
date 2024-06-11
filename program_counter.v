module program_counter(next_pc, clk, current_pc);
input [31:0] next_pc;
input clk;
output [31:0] current_pc;
reg [31:0] pc;
integer i;
initial begin
    pc = 0;
end

always @(posedge clk) begin
    for ( i = 0; i < 32; i=i+1) begin
        if (next_pc[i] === 1'bx) $display("x detected");
        else pc = next_pc;
    end
end

assign current_pc = pc;
endmodule

// module pc_tb;
// reg [31:0] pc_in;
// reg clk;
// wire [31:0] pc_out;
// program_counter prog_count(pc_in, clk, pc_out);

// initial begin
//     $dumpfile("pc.vcd");
//     $dumpvars(0, pc_tb);
//     clk = 0;
//     #5 clk = 1;
//     #10 pc_in = 0;
//     #5 clk = 0;
//     #5 clk = 1;
//     #10 pc_in = 1;
//     #5 clk = 0;
//     #5 clk = 1;
//     #10 pc_in = 2;
//     #5 clk = 0;
//     #5 clk = 1;
//     #10 pc_in = 3;
//     #5 clk = 0;
//     #5 clk = 1;
// end
// endmodule