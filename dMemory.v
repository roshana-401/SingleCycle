`timescale 1ns/1ns

module data_memory(write, read, write_data, address, read_data);
input wire write, read;
input wire [31:0] write_data, address;
output reg [31:0] read_data;

reg [31:0] dMemory [255:0];

always @(*) begin
    if (write) 
        dMemory[address] = write_data;
end
always @(*) begin
   if(read)
    read_data = dMemory[address];
end
initial begin
    dMemory[0] = 32'b00000000000000000000000000001001;
    dMemory[1] = 32'b00000000000000000000000000001001;
    dMemory[2] = 32'b00000000000000000000000000001001;
    dMemory[3] = 32'b00000000000000000000000000001001;
end
endmodule

// module test;
// reg write;
// reg [31:0] write_data, address;
// wire [31:0] read_data;

// data_memory dmem(write, write_data, address, read_data);

// initial begin
//     $dumpfile("dMemory.vcd");
//     $dumpvars(0, test);
//     #10;
//     write = 1;
//     #5 write_data = 32'b00000001000010011000000000100100;
//     #5 address = 32'b00000000000000000000000000000001;
//     #10;
//     write = 0;
//     #5 write_data = 32'b00000001000010011000000000100101;
//     #5 address = 32'b00000000000000000000000000000001;
//     #10;
// end
// endmodule
