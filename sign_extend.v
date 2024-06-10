module sign_extend(input [15:0] in_val, output [31:0] out);
assign out = (in_val[15]) ? {16'b1111111111111111, in_val} : {16'b0000000000000000, in_val};
endmodule

// module test;
// reg [15:0] in_val;
// wire [31:0] out;

// sign_extend shiftl2(in_val, out);

// initial begin
//     $dumpfile("sign_extend.vcd");
//     $dumpvars(0, test);
//     #10 in_val = 16'b1000000000111110;
//     #10 in_val = 16'b0000000100001001;
// end
// endmodule