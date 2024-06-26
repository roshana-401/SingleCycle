module Decoder(
    instruction,
    opcode,
    Rd,
    Rt,
    Rs,
    constant
);
    input [31:0] instruction;
    output [5:0] opcode;
    output [4:0] Rd;
    output [4:0] Rt;
    output [4:0] Rs;
    output [15:0] constant;

    assign opcode = instruction[31:26];
    assign Rs = instruction[25:21];
    assign Rt = instruction[20:16];
    assign Rd = instruction[15:11];
    assign constant = instruction[15:0];

endmodule


// module testtttt;

//     wire [5:0] opcode;
//     wire [4:0] Rd;
//     wire [4:0] Rt;
//     wire [4:0] Rs;
//     wire [15:0] constant;
//     reg [31:0] instruction;

//     Decoder decod(.instruction(instruction),.opcode(opcode),.Rd(Rd),.Rt(Rt),.Rs(Rs),.constant(constant));
//     initial
//     begin
//         instruction = 32'b00000001000010011000000000100100;
//         #10;
//         instruction = 32'b00000001000010011001000000100010;
//         #10;
//     end
   
// endmodule

