
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2021 14:58:16
// Design Name: 
// Module Name: modules
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
module tri_state_buffer(
    input [15:0] in,
    input enable,
    output [15:0] out
    );
    assign out = enable ? in: 16'bzzzzzzzzzzzzzzzz;
endmodule

module nand_gate(
    input input1,
    input input2,
    output out
    );
    
    assign out = ~(input1 & input2);
endmodule



module decoder(
    input enable,
    input [3:0] select,
    output [15:0] out
    );
    
    reg [15:0] out_reg;
    always @* begin
    case(select)
    4'b0000: out_reg = 16'd1; 
    4'b0001: out_reg = 16'd2; 
    4'b0010: out_reg = 16'd4;
    4'b0011: out_reg = 16'd8;
    4'b0100: out_reg = 16'd16;
    4'b0101: out_reg = 16'd32;
    4'b0110: out_reg = 16'd64;
    4'b0111: out_reg = 16'd128;
    4'b1000: out_reg = 16'd256;
    4'b1001: out_reg = 16'd512;
    4'b1010: out_reg = 16'd1024;
    4'b1011: out_reg = 16'd2048;
    4'b1100: out_reg = 16'd4096;
    4'b1101: out_reg = 16'd8192;
    4'b1110: out_reg = 16'd16384;
    4'b1111: out_reg = 16'd32768;
    

    
    endcase
    end
    
    assign out = enable == 1 ? out_reg: 16'd0 ;
    
endmodule

module decoder4_16(
    input wire[3:0] select,
    input wire enable,
    output wire [15:0] out
);
    assign out = enable? 16'd1<<select :16'd0;
endmodule


module d_latch(
    input D,
    input EN,
    output Q,
    output Qc
    );
    wire not_d;
    
    nand_gate NOT1(D,D,not_d);
    
    wire D_1, D_2;

    nand_gate NAND1(not_d,EN,D_1);
    nand_gate NAND2(D,EN,D_2);
    
    wire wire_q, wire_qc;
    nand_gate NAND3(wire_qc,D_1,wire_q);
    nand_gate NAND4(wire_q,D_2,wire_qc);
    
    assign Q = wire_q;
    assign Qc = wire_qc;
endmodule
   
module d_ff(
   input D,
   input clk,
   output Q,
   output Qc
   );
   wire q_1;
   wire not_clk;
   
   nand_gate NOT_CLOCK(clk,clk,not_clk);
   
   d_latch DL1(D,not_clk,q_1);
   d_latch DL2(q_1,clk,Q,Qc);
   
endmodule

module register_line(
input [15:0] dataIn,
input reset,
input line_select,
input CLK,
output [15:0] out
);

reg [15:0] stored_value;

always @(posedge CLK) begin
    if(line_select)begin
        stored_value = dataIn;
    end
end

always @(negedge reset) begin
    stored_value = 16'd0;
end
assign out = stored_value;
endmodule

module register_file(
input [3:0] selA,
input [3:0] selB,
input [3:0] selWrite,
input [15:0] dataIn,
input reset,
input writeEnable,
input CLK,
output [15:0] dataA,
output [15:0] dataB
);

wire [15:0] address;
decoder D0(.select(selWrite),.enable(writeEnable),.out(address));

wire [15:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15;

register_line L0(.dataIn(dataIn),.line_select(address[0]),.reset(reset),.CLK(CLK),.out(out0));
register_line L1(.dataIn(dataIn),.line_select(address[1]),.reset(reset),.CLK(CLK),.out(out1));
register_line L2(.dataIn(dataIn),.line_select(address[2]),.reset(reset),.CLK(CLK),.out(out2));
register_line L3(.dataIn(dataIn),.line_select(address[3]),.reset(reset),.CLK(CLK),.out(out3));
register_line L4(.dataIn(dataIn),.line_select(address[4]),.reset(reset),.CLK(CLK),.out(out4));
register_line L5(.dataIn(dataIn),.line_select(address[5]),.reset(reset),.CLK(CLK),.out(out5));
register_line L6(.dataIn(dataIn),.line_select(address[6]),.reset(reset),.CLK(CLK),.out(out6));
register_line L7(.dataIn(dataIn),.line_select(address[7]),.reset(reset),.CLK(CLK),.out(out7));
register_line L8(.dataIn(dataIn),.line_select(address[8]),.reset(reset),.CLK(CLK),.out(out8));
register_line L9(.dataIn(dataIn),.line_select(address[9]),.reset(reset),.CLK(CLK),.out(out9));
register_line L10(.dataIn(dataIn),.line_select(address[10]),.reset(reset),.CLK(CLK),.out(out10));
register_line L11(.dataIn(dataIn),.line_select(address[11]),.reset(reset),.CLK(CLK),.out(out11));
register_line L12(.dataIn(dataIn),.line_select(address[12]),.reset(reset),.CLK(CLK),.out(out12));
register_line L13(.dataIn(dataIn),.line_select(address[13]),.reset(reset),.CLK(CLK),.out(out13));
register_line L14(.dataIn(dataIn),.line_select(address[14]),.reset(reset),.CLK(CLK),.out(out14));
register_line L15(.dataIn(dataIn),.line_select(address[15]),.reset(reset),.CLK(CLK),.out(out15));


wire [15:0] selA_bus;
decoder D1(.select(selA),.enable(1),.out(selA_bus));

tri_state_buffer B0(out0,selA_bus[0],dataA);
tri_state_buffer B1(out1,selA_bus[1],dataA);
tri_state_buffer B2(out2,selA_bus[2],dataA);
tri_state_buffer B3(out3,selA_bus[3],dataA);
tri_state_buffer B4(out4,selA_bus[4],dataA);
tri_state_buffer B5(out5,selA_bus[5],dataA);
tri_state_buffer B6(out6,selA_bus[6],dataA);
tri_state_buffer B7(out7,selA_bus[7],dataA);
tri_state_buffer B8(out8,selA_bus[8],dataA);
tri_state_buffer B9(out9,selA_bus[9],dataA);
tri_state_buffer B10(out10,selA_bus[10],dataA);
tri_state_buffer B11(out11,selA_bus[11],dataA);
tri_state_buffer B12(out12,selA_bus[12],dataA);
tri_state_buffer B13(out13,selA_bus[13],dataA);
tri_state_buffer B14(out14,selA_bus[14],dataA);
tri_state_buffer B15(out15,selA_bus[15],dataA);


wire [15:0] selB_bus;
decoder D2(.select(selB),.enable(1),.out(selB_bus));

tri_state_buffer B16(out0,selB_bus[0],dataB);
tri_state_buffer B17(out1,selB_bus[1],dataB);
tri_state_buffer B18(out2,selB_bus[2],dataB);
tri_state_buffer B19(out3,selB_bus[3],dataB);
tri_state_buffer B20(out4,selB_bus[4],dataB);
tri_state_buffer B21(out5,selB_bus[5],dataB);
tri_state_buffer B22(out6,selB_bus[6],dataB);
tri_state_buffer B23(out7,selB_bus[7],dataB);
tri_state_buffer B24(out8,selB_bus[8],dataB);
tri_state_buffer B25(out9,selB_bus[9],dataB);
tri_state_buffer B26(out10,selB_bus[10],dataB);
tri_state_buffer B27(out11,selB_bus[11],dataB);
tri_state_buffer B28(out12,selB_bus[12],dataB);
tri_state_buffer B29(out13,selB_bus[13],dataB);
tri_state_buffer B30(out14,selB_bus[14],dataB);
tri_state_buffer B31(out15,selB_bus[15],dataB);



endmodule

module ALU(
input [15:0] srcA,
input [15:0] srcB,
input [2:0] opcode,
input CLK,
input reset,
output zeroFlag,
output [15:0] dst
);

reg [15:0] value;
reg flag_input;

always @*begin
    case(opcode)
    3'd0: begin
       value =  srcA & srcB;
       
    end
    3'd1: begin
       value =  srcA | srcB;
    end
    3'd2: begin
       value =  srcA + srcB;
       flag_input = value == 16'd0 ? 1 : 0;
      
    end
    3'd3: begin
       value =  srcA - srcB;
       flag_input = value == 16'd0 ? 1 : 0;
    
    end
    3'd4: begin
       value =  srcA ^ srcB;
    end
    3'd5: begin
       value =  srcA >> srcB;
    end
    3'd6: begin
       value =  srcA << srcB;
    end
    3'd7: begin
       value =   srcB;
    end
  
    
    endcase

end

always @(negedge reset) begin
    flag_input = 0;
end

d_ff ZF(.D(flag_input),.clk(CLK),.Q(zeroFlag));

assign dst = value;


endmodule

module instruction_decoder(
input [15:0] instruction,
output [3:0] opcode,
output [3:0] selWrite,
output [3:0] selA,
output [3:0] selB,
output [15:0] fourBitImmediate,
output [15:0] eightBitImmediate,
output writeEnable,
output isLoad,
output isImmediate,
output isBranch,
output isBranchNotEqual,
output isBranchEqual
);
assign opcode = instruction[15:12];
assign isLoad = (opcode == 4'd7) ? 1:0;
assign isImmediate = (opcode == 4'd8) | (opcode == 4'd9) | (opcode == 4'd10) ? 1:0;
assign isBranch = (opcode == 4'd13) | (opcode == 4'd14) | (opcode == 4'd15) ? 1:0;
assign isBranchNotEqual = (opcode == 4'd14) ? 1:0; 
assign isBranchEqual = (opcode == 4'd15) ? 1:0; 
assign writeEnable = (opcode < 4'd11) ? 1:0;

assign selA = (opcode < 4'd7) | (opcode == 4'd8) | (opcode == 4'd9) | (opcode == 4'd10) | (opcode == 4'd11) ? instruction[7:4] : 4'bzzzz;
//zz k?sm? kontrol edilmedi
assign selB = (opcode < 4'd7) | (opcode == 4'd11)? instruction[3:0] : 4'bzzzz;
//zz k?sm? kontrol edilmedi

assign fourBitImmediate = (opcode == 4'd8) | (opcode == 4'd9) | (opcode == 4'd10) ? {12'd0,instruction[3:0]}:16'bzzzzzzzzzzzzzzzz;
assign eightBitImmediate =(opcode == 4'd7) | (opcode == 4'd13) | (opcode == 4'd14) | (opcode == 4'd15) ?{8'd0, instruction[7:0]}:16'bzzzzzzzzzzzzzzzz;

assign selWrite = opcode < 4'd11 ? instruction[11:8]: 4'bzzzz;


endmodule

module pc_counter(

input reset,
input zeroFlag,//ALU
input CLK,
input isBranch,
input isBranchNotEqual,
input isBranchEqual,
input [7:0] immediateAddress,
output [7:0] PC
);
reg [7:0] pc;
always @(negedge reset) begin
    pc = 8'd0;
end

always @(posedge CLK) begin
    if(isBranch & isBranchNotEqual==0 & isBranchEqual ==0 ) begin
        pc = immediateAddress;
    end else if(isBranch & isBranchNotEqual==1 & isBranchEqual ==0 ) begin
        if(zeroFlag != 1) begin
            pc = pc + immediateAddress;
        end else begin
            pc = pc +1;
        end
    end else if(isBranch & isBranchNotEqual==0 & isBranchEqual ==1 ) begin
        if(zeroFlag == 1) begin
            pc = pc + immediateAddress;
        end else begin
            pc = pc +1;
        end
    end else begin
        pc = pc + 1;
    end
end

assign PC = pc;

endmodule
module ProgramMemory(
    input wire[7:0] address,
    output reg[15:0] instruction
    );
    
    reg [15:0] ROM_Data [0:255];
    
    initial begin
    $readmemh("ROM.mem",ROM_Data);
    end
    
    always @(*) begin
        instruction<=ROM_Data[address];
    end
endmodule


module computer(
    input CLK,
    input reset,
    output [15:0] INSTRUCTION,
    output [15:0] DATAA,
    output [15:0] DATAB,
    output [15:0] DST,
    output [7:0] PC,
    output [15:0] SRCB
);
wire [7:0] pc;
wire [15:0] instruction;
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
wire zeroFlag;
wire [15:0] dst;
wire [15:0] dataA;

wire [15:0] dataB;
wire [15:0] srcB;

ProgramMemory mem(pc,instruction);

instruction_decoder INS_D(.instruction(instruction),.opcode(opcode),.selWrite(selWrite),.selA(selA),.selB(selB),.eightBitImmediate(eightBitImmediate), .fourBitImmediate(fourBitImmediate),.writeEnable(writeEnable),.isLoad(isLoad),.isImmediate(isImmediate),.isBranch(isBranch),.isBranchNotEqual(isBranchNotEqual),.isBranchEqual(isBranchEqual));

register_file RF(.CLK(CLK),.reset(reset),.selA(selA),.selB(selB),.selWrite(selWrite),.dataIn(dst),.writeEnable(writeEnable),.dataA(dataA),.dataB(dataB));

assign srcB = (isLoad | isBranch) ? eightBitImmediate: (isImmediate)? fourBitImmediate:((opcode < 4'd7) | (opcode == 4'd11))? dataB:4'bzzzz;
//assign srcB = 4'h0025;
ALU alu(.srcA(dataA),.srcB(srcB),.opcode(opcode[2:0]),.CLK(CLK),.reset(reset),.zeroFlag(zeroFlag),.dst(dst));

pc_counter PC_C(.zeroFlag(zeroFlag),.reset(reset),.CLK(CLK),.isBranch(isBranch),.isBranchNotEqual(isBranchNotEqual),.isBranchEqual(isBranchEqual),.immediateAddress(eightBitImmediate[8:0]),.PC(pc));

assign SRCB = srcB;
assign DST = dst;
assign DATAA = dataA;
assign DATAB = dataB;
assign PC = pc;
assign INSTRUCTION = instruction;

endmodule

module RegisterFile(
    input wire [3:0] selA,
    input wire [3:0] selB,
    input wire [3:0] selWrite,
    input wire [15:0] data_in,
    input wire reset,
    input wire writeEnable,
    input wire clock,
    output reg [15:0] dataA,
    output reg [15:0] dataB
);
    wire[15:0] chip_select_bus;
    wire[15:0] register_outputs[15:0];
    
    decoder4_16 chipselect(selWrite,writeEnable, chip_select_bus);
    
     generate
        genvar x;
            for(x = 0; x<16; x = x + 1) 
            begin: RegFileGenerate
                register_line regLine(
                        chip_select_bus[x],
                        clock,
                        reset,
                        data_in,
                        register_outputs[x]
                        );
            end
    endgenerate
    
    always @(*) begin
        dataA <= register_outputs[selA];
        dataB <= register_outputs[selB];
    end
    
endmodule


    
