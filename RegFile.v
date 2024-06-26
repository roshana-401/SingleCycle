`timescale 1ns/1ns

module RegFile(
    Read_Reg1,
    Read_Reg2,
    Write_Reg,
    Write_Data,
    RegWrite,
    ReadData1,
    ReadData2
);
    //inputs and outputs
    input wire [4:0] Read_Reg1;
    input wire [4:0] Read_Reg2;
    input wire [4:0] Write_Reg;
    input wire [31:0] Write_Data;
    input wire RegWrite;
    output reg [31:0] ReadData1;
    output reg [31:0] ReadData2;

    //Registers
    reg [31:0] Register [31:0];

    integer i;

    initial
    begin
        for (i=0 ; i<=31 ; i=i+1)
        begin
            Register[i]=32'd0;
        end

    end

    always @(*)
    begin
        if (RegWrite) #1 Register[Write_Reg]=Write_Data;
        ReadData1 = Register[Read_Reg1];
        ReadData2 = Register[Read_Reg2];
    end
    always @(*) Register[0] = 32'd0;
endmodule

// module testRegFile;
//     reg [4:0] Read_Reg1;
//     reg [4:0] Read_Reg2;
//     reg [4:0] Write_Reg;
//     reg [31:0] Write_Data;
//     reg RegWrite;
//     wire [31:0] ReadData1;
//     wire [31:0] ReadData2;

//     RegFile testReg(.Read_Reg1(Read_Reg1),.Read_Reg2(Read_Reg2),.Write_Reg(Write_Reg),.Write_Data(Write_Data),.RegWrite(RegWrite),.ReadData1(ReadData1),.ReadData2(ReadData2));

//     initial
//     begin
//         RegWrite = 0;
//         Read_Reg1 = 5'd10;
//         Read_Reg2 = 5'd11;
//         Write_Reg = 5'd11;
//         Write_Data= 5'd13;    
        
//         #10;
//         RegWrite = 1; 
        
//         #10; 


//     end




// endmodule

