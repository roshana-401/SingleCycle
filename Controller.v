module Controller(
    opcode,
    func,
    RegDst,
    ALU_Src,
    MemToReg,
    RegWrite,
    MemRead,
    MemWrite,
    ALU_op,
    Branch
);
    input [5:0] opcode;
    input [5:0] func;
    output reg RegDst;
    output reg ALU_Src;
    output reg MemToReg;
    output reg RegWrite;
    output reg MemRead;
    output reg MemWrite;
    output reg Branch;
    output reg [1:0] ALU_op;


    always @(opcode or func)
    begin
        if (opcode==6'd0)begin
            if(func==6'd0)begin
                RegDst = 1;
                ALU_Src = 0; 
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALU_op = 2'd0;
            end
            else if(func==6'd1)begin
                RegDst = 1;
                ALU_Src = 0; 
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALU_op = 2'd1;
            end
            else if(func==6'd2)begin
                RegDst = 1;
                ALU_Src = 0; 
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALU_op = 2'b10;
            end
            else if(func==6'd3)begin
                RegDst = 1;
                ALU_Src = 0; 
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALU_op = 2'd3;
            end
        end
        else if(opcode==6'd1)begin
            RegDst = 0;
            ALU_Src = 1; 
            MemToReg = 1;
            RegWrite = 1;
            MemRead = 1;
            MemWrite = 1;
            Branch = 0;
            ALU_op = 2'd0;
        end
        else if(opcode==6'd2)begin
            RegDst = 0;
            ALU_Src = 1; 
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 1;
            Branch = 0;
            ALU_op = 2'd0;
        end
        else if(opcode==6'd3)begin
            RegDst = 0;
            ALU_Src = 0; 
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 1;
            ALU_op = 2'd1;
        end
    end
endmodule

// module TestController;

//     reg [5:0] opcode;
//     reg [5:0] func;
//     wire RegDst;
//     wire ALU_Src;
//     wire MemToReg;
//     wire RegWrite;
//     wire MemRead;
//     wire MemWrite;
//     wire Branch;
//     wire [1:0] ALU_op;    

//     Controller controll(.opcode(opcode),.func(func),.RegDst(RegDst),.ALU_Src(ALU_Src),.MemToReg(MemToReg),.RegWrite(RegWrite),.MemRead(MemRead),.MemWrite(MemWrite),.Branch(Branch),.ALU_op(ALU_op));
//     initial
//     begin
//         opcode = 6'd0;
//         func = 6'd2;

//         #10;

//         opcode = 6'd1;

//         #10;

//         opcode = 6'd2;

//         #10;
//         opcode = 6'd3;

//         #10;
//         opcode = 6'd0;
//         func = 6'd0;

//         #10;

//         opcode = 6'd0;
//         func = 6'd3;

//         #10;

//         opcode = 6'd0;
//         func = 6'd1;

//     end

// endmodule