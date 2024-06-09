module MUX_32bit(
    control,
    inputOne,
    inputTwo,
    result
);
    input control;
    input [31:0] inputOne;
    input [31:0] inputTwo;
    output [31:0] result;
    
    reg [31:0] result;
    always @(*)
    begin
        case(control)
            1'b0:
                result=inputOne;
            
            1'b1:
                result=inputTwo;
        endcase
    end

endmodule
module MUX_8bit(
    control,
    inputOne,
    inputTwo,
    result
);
    input control;
    input [7:0] inputOne;
    input [7:0] inputTwo;
    output [7:0] result;
    
    reg [7:0] result;
    
    always @(*)
    begin
        case(control)
            1'b0:
                result=inputOne;
            
            1'b1:
                result=inputTwo;
        endcase
    end

endmodule
module MUX_5bit(
    control,
    inputOne,
    inputTwo,
    result
);
    input control;
    input [4:0] inputOne;
    input [4:0] inputTwo;
    output [4:0] result;
   
    reg [4:0] result;
    always @(*)
    begin
        case(control)
            1'b0:
                result=inputOne;
            
            1'b1:
                result=inputTwo;
        endcase
    end

endmodule

module testMux;

    reg control;
    reg [4:0] inputOne;
    reg [4:0] inputTwo;
    wire [4:0] result;

    reg [7:0] inputOne_8;
    reg [7:0] inputTwo_8;
    wire [7:0] result_8;

    reg [31:0] inputOne_32;
    reg [31:0] inputTwo_32;
    wire [31:0] result_32;

    MUX_5bit Bit_5(.control(control),.inputOne(inputOne),.inputTwo(inputTwo),.result(result));
    initial
    begin
        control = 0;
        inputOne = 5'd4;
        inputTwo = 5'd5;
        #10; 

        control = 1;

        #10;
    end
    MUX_8bit Bit_8(.control(control),.inputOne(inputOne_8),.inputTwo(inputTwo_8),.result(result_8));

    initial
    begin
        control = 0;
        inputOne_8 = 8'd4;
        inputTwo_8 = 8'd5;
        #10;

        control = 1;

        #10;
    end
    MUX_32bit Bit_32(.control(control),.inputOne(inputOne_32),.inputTwo(inputTwo_32),.result(result_32));
    initial
    begin
        control = 0;
        inputOne_32 = 32'd4;
        inputTwo_32 = 32'd5;
        #10;

        control = 1;

        #10;
    end


endmodule
