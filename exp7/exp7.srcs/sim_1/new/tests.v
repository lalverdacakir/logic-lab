`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2021 15:06:37
// Design Name: 
// Module Name: tests
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decoder_test();
    reg enable;
    reg [3:0] select;
    wire [15:0] out;
    decoder D(enable,select, out);
    initial begin
    enable = 0; select = 4'b0000; #50;
    
    enable = 1; select = 4'b0000; #50;
    
    enable = 1; select = 4'b0001; #50;
    
    enable = 1; select = 4'b0010; #50;
    
    
    enable = 1; select = 4'b0011; #50;
    
    enable = 1; select = 4'b0100; #50;
    
    enable = 1; select = 4'b0101; #50;
    
    enable = 1; select = 4'b0110; #50;
    
    
    enable = 1; select = 4'b0111; #50;
    
    enable = 1; select = 4'b1000; #50;
    
    enable = 1; select = 4'b1001; #50;
    
    enable = 1; select = 4'b1010; #50;
    
    
    enable = 1; select = 4'b1011; #50;
    
    enable = 1; select = 4'b1100; #50;
    
    enable = 1; select = 4'b1101; #50;
    
    enable = 1; select = 4'b1110; #50;
    
    
    enable = 1; select = 4'b1111; #50;
    
    enable = 0; select = 4'b0000; #50;
    
    end
endmodule
module register_line_test();

reg [15:0] dataIn;
reg reset;
reg line_select;
reg CLK;
wire [15:0] out;

register_line R(dataIn,reset,line_select,CLK,out);

always #50 CLK = ~CLK;

initial begin
CLK = 0; reset = 1; #50;
reset = 0; #50;

dataIn = 16'd525; line_select = 1; #100;

dataIn = 16'd554; line_select = 0; #100;

 reset = 1; #50;
reset = 0; #50;



end

endmodule


module register_file_test();
reg [3:0] selA;
reg [3:0] selB;
reg [3:0] selWrite;
reg [15:0] dataIn;
reg reset;
reg writeEnable;
reg CLK;
wire [15:0] dataA;
wire [15:0] dataB;

register_file RF1(.selA(selA),.selB(selB), .selWrite(selWrite), .dataIn(dataIn), .reset(reset), .writeEnable(writeEnable), .CLK(CLK),.dataA(dataA),.dataB(dataB));

always #50 CLK = ~CLK;
initial begin
    CLK = 0;
    reset = 1; #50;
    reset = 0; #50;
    
    selA = 4'd0;selB=4'd0;selWrite=4'd0; dataIn=16'd10; writeEnable = 1; #50;
    selA = 4'd0;selB=4'd0;selWrite=4'd0; dataIn=16'd10; writeEnable = 1; #50;
    
    selA = 4'd0;selB=4'd0;selWrite=4'd10; dataIn=16'd20; writeEnable = 1; #50;
    selA = 4'd0;selB=4'd0;selWrite=4'd10; dataIn=16'd20; writeEnable = 1; #50;
    
    selA = 4'd10;selB=4'd0;writeEnable = 0; #100;
    
    
end

endmodule

module ALU_test();
reg [15:0] srcA;
reg [15:0] srcB;
reg [2:0] opcode;
reg CLK;
reg reset;
wire zeroFlag;
wire [15:0] dst;

ALU alu(.srcA(srcA),.srcB(srcB), .opcode(opcode),.CLK(CLK),.reset(reset),.zeroFlag(zeroFlag),.dst(dst));

always #100 CLK = ~CLK;
initial begin
CLK = 0; srcA = 16'd0; srcB = 16'd0; opcode = 0; 
reset = 1; #100;
reset = 0; #100;

srcA = 16'd10;srcB=16'd20; opcode = 3'd0; #100;
srcA = 16'd20;srcB=16'd30; opcode = 3'd1; #100;

srcA = 16'd10;srcB=16'd20; opcode = 3'd2; #100;
srcA = 16'd20;srcB=16'd30; opcode = 3'd3; #100;

srcA = 16'd10;srcB=16'd20; opcode = 3'd4; #100;
srcA = 16'd20;srcB=16'd30; opcode = 3'd5; #100;

srcA = 16'd10;srcB=16'd2; opcode = 3'd6; #100;
srcA = 16'd20;srcB=16'd1; opcode = 3'd7; #100;


end
endmodule

module pc_counter_test();

reg reset;
reg zeroFlag;//ALU
reg CLK;
reg isBranch;
reg isBranchNotEqual;
reg isBranchEqual;
reg [7:0] immediateAddress;
wire [7:0] PC;

pc_counter PCR(reset,zeroFlag,CLK,isBranch, isBranchNotEqual, isBranchEqual,immediateAddress,PC);
always #50 CLK = ~CLK;
initial begin
CLK = 0; reset = 1; #50;
reset = 0; #50;

zeroFlag = 0; isBranch = 0; isBranchNotEqual = 0; isBranchEqual = 0; immediateAddress = 8'd10; #100;
zeroFlag = 0; isBranch = 1; isBranchNotEqual = 0; isBranchEqual = 1; immediateAddress = 8'd10; #100;
zeroFlag = 0; isBranch = 1; isBranchNotEqual = 1; isBranchEqual = 0; immediateAddress = 8'd10; #100;

zeroFlag = 1; isBranch = 0; isBranchNotEqual = 0; isBranchEqual = 0; immediateAddress = 8'd10; #100;
zeroFlag = 1; isBranch = 1; isBranchNotEqual = 0; isBranchEqual = 1; immediateAddress = 8'd10; #100;
zeroFlag = 1; isBranch = 1; isBranchNotEqual = 1; isBranchEqual = 0; immediateAddress = 8'd10; #100;

end
endmodule

module computer_test();
reg CLK;
reg reset;
    wire [15:0] INSTRUCTION;
    wire [15:0] DATAA;
    wire [15:0] DATAB;
    wire [15:0] DST;
    wire [7:0] PC;
    wire [15:0] SRCB;
    
    computer C(CLK,reset,INSTRUCTION, DATAA,DATAB,DST,PC,SRCB);
    
    always #40 CLK = ~CLK;
    
    initial begin
    CLK = 0; reset = 1; #40;
    reset=0;  #40;
    end

endmodule

module instruction_decoder_test();

    reg [15:0] instruction;
    wire [3:0] opcode;
    wire [3:0] selWrite;
    wire [3:0] selA;
    wire [3:0] selB;
    wire [15:0] fourBitImmediate;
    wire [15:0] eightBitImmediate;
    wire writeEnable;
    wire isLoad;
    wire isImmediate;
    wire isBranch;
    wire isBranchNotEqual;
    wire isBranchEqual;
    
    instruction_decoder insdec(instruction,opcode, selWrite, selA,selB,fourBitImmediate,eightBitImmediate,writeEnable,isLoad,isImmediate,isBranch,isBranchNotEqual,isBranchEqual);
       
    initial begin
    
     instruction= 16'h0624; #50;
     instruction= 16'h1724; #50;
     instruction= 16'h2724; #50;
     instruction= 16'h3824; #50;
     instruction= 16'h4774; #50;
     instruction= 16'h5524; #50;
     instruction= 16'h6724; #50;
     instruction= 16'h7724; #50;
     instruction= 16'h8704; #50;
     instruction= 16'h9123; #50;
     instruction= 16'hA876; #50;
     instruction= 16'hB151; #50;
     instruction= 16'hC177; #50;
     instruction= 16'hD144; #50;
     instruction= 16'hE651; #50;
     instruction= 16'hF127; #50;
       
    end

endmodule
