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
    enable = 0; select = 4'b0000; #250;
    
    enable = 1; select = 4'b0000; #250;
    
    enable = 0; select = 4'b0010; #250;
    
    enable = 1; select = 4'b0010; #250;
    
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

always #50 CLK = ~CLK;
initial begin
CLK = 0; srcA = 16'd0; srcB = 16'd0; opcode = 0; 
reset = 1; #50;
reset = 0; #50;

srcA = 16'd10;srcB=16'd20; opcode = 3'd0; #50;
srcA = 16'd20;srcB=16'd30; opcode = 3'd1; #50;

srcA = 16'd10;srcB=16'd20; opcode = 3'd2; #50;
srcA = 16'd20;srcB=16'd30; opcode = 3'd3; #50;

srcA = 16'd10;srcB=16'd20; opcode = 3'd4; #50;
srcA = 16'd20;srcB=16'd30; opcode = 3'd5; #50;

srcA = 16'd10;srcB=16'd2; opcode = 3'd6; #50;
srcA = 16'd20;srcB=16'd1; opcode = 3'd7; #50;


end
endmodule

