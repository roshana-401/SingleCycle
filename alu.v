`timescale 1ns/1ns

module alu(
        input [31:0] a, b,
        input [1:0] alu_sel,
        output [31:0] alu_out,
        // Flags:
        output Z
    );
    reg [31:0] alu_Result;
    assign alu_out = alu_Result;
    // Making the flags:
    //zero out
    assign Z = (alu_Result == 32'b00000000) ? 1'b1:1'b0;
    //negative out
    //carry out
    always @(*) begin
        case (alu_sel) 
                    // Arithmatic:
            4'b0000: //add
                alu_Result = a + b;
            4'b0001: //sub
                alu_Result = a - b;
                    // Logical:
            4'b0010: //and
                alu_Result = a & b;
            4'b0011: //or
                alu_Result = a | b;
            default: alu_Result = a + b;
        endcase
    end
endmodule


// module alu_tb;
//     reg [31:0] a, b;
//     reg [1:0] alu_sel;
//     wire [31:0] alu_out;
//     wire Z;

//     alu alu_test(a, b, alu_sel, alu_out, Z);
//     initial begin
//         $dumpfile("alu.vcd");
//         $dumpvars(0, alu_tb);

//         a=20;
//         b=20;
//         alu_sel=1;
//         #6;

//         a=100;
//         b=60;
//         alu_sel=0;
//         #6;

//         a=-70;
//         b=-60;
//         alu_sel=0;
//         #6;        

//         a=-70;
//         b=100;
//         alu_sel=1;
//         #6;

//         a=100;
//         b=50;
//         alu_sel=1;
//         #6;       

//         a=10;
//         b=20;
//         alu_sel=2;
//         #6;

//         a=10;
//         b=20;
//         alu_sel=3;
//         #6;

//     end
// endmodule
