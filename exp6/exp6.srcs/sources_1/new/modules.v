`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 22:09:24
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


module not_gate(
    input in,
    output out
    );
    assign out = ~in;
endmodule

module tri_state_buffer(
    input [7:0] in,
    input enable,
    output [7:0] out
    );
    assign out = enable ? in: 8'bzzzzzzzz;
endmodule
    
module part1(
input [7:0] data1,
input [7:0] data2,
input select,
output [7:0] out
);
wire [7:0] bus;
wire not_select;

not_gate NOT1(select,not_select);

tri_state_buffer O1(data1,not_select, bus);
tri_state_buffer O2(data2,select, bus);

assign out = bus;

endmodule


module part2(
input [7:0] data1,
input [7:0] data2,
input select,
output [7:0] out1,
output [7:0] out2

);
wire [7:0] bus;
wire [7:0] output1;
wire [7:0] output2;
wire not_select;

not_gate NOT1(select,not_select);

tri_state_buffer O1(data1,not_select, bus);
tri_state_buffer O2(data2,select, bus);


tri_state_buffer O3(bus,not_select, output1);
tri_state_buffer O4(bus,select, output2);

assign out1 = output1;
assign out2 = output2;

endmodule

module part3(
input [7:0] data,
input reset,
input line_select,
input read_enable,
input write_enable,
input CLK,
output [7:0] out
);

reg [7:0] stored_value;

always @(posedge CLK) begin
    if(line_select && write_enable)begin
        stored_value = data;
    end
end

always @(negedge reset) begin
    stored_value = 8'd0;
end
assign out = (read_enable==1'b1 && line_select == 1'b1) ? stored_value : 8'bzzzzzzzz;



endmodule

module part4(
input [7:0] data,
input [2:0] address,
input chip_select,
input reset,
input read_enable,
input write_enable,
input CLK,
output [7:0] out
);
reg [7:0] line_select;
always @* begin
    if(chip_select == 1) begin
    case(address)
        3'b000 : line_select = 8'b00000001; 
        3'b001 : line_select = 8'b00000010; 
        3'b010 : line_select = 8'b00000100; 
        3'b011 : line_select = 8'b00001000; 
        3'b100 : line_select = 8'b00010000; 
        3'b101 : line_select = 8'b00100000; 
        3'b110 : line_select = 8'b01000000; 
        3'b111 : line_select = 8'b10000000; 

    endcase
    end else begin
    line_select = 8'd0;
    end
end

wire [7:0] out0,out1,out2,out3,out4,out5,out6,out7;

part3 L0(data,reset,line_select[0],read_enable,write_enable,CLK,out0);
part3 L1(data,reset,line_select[1],read_enable,write_enable,CLK,out1);
part3 L2(data,reset,line_select[2],read_enable,write_enable,CLK,out2);
part3 L3(data,reset,line_select[3],read_enable,write_enable,CLK,out3);
part3 L4(data,reset,line_select[4],read_enable,write_enable,CLK,out4);
part3 L5(data,reset,line_select[5],read_enable,write_enable,CLK,out5);
part3 L6(data,reset,line_select[6],read_enable,write_enable,CLK,out6);
part3 L7(data,reset,line_select[7],read_enable,write_enable,CLK,out7);


tri_state_buffer B0(out0,line_select[0],out);
tri_state_buffer B1(out1,line_select[1],out);
tri_state_buffer B2(out2,line_select[2],out);
tri_state_buffer B3(out3,line_select[3],out);
tri_state_buffer B4(out4,line_select[4],out);
tri_state_buffer B5(out5,line_select[5],out);
tri_state_buffer B6(out6,line_select[6],out);
tri_state_buffer B7(out7,line_select[7],out);








endmodule

module part5(
input [7:0] data,
input [4:0] address,
input reset,
input read_enable,
input write_enable,
input CLK,
output [7:0] out
);
reg [3:0]chip_select ;
reg [2:0] line_select;

always @* begin
    line_select = address[2:0];
    case(address[4:3])
        2'b00 : chip_select = 4'b0001; 
        2'b01 : chip_select = 4'b0010; 
        2'b10 : chip_select = 4'b0100; 
        2'b11 : chip_select = 4'b1000; 
    endcase
end

wire [7:0] out0,out1,out2,out3;

part4 L0(data,line_select,chip_select[0],reset,read_enable,write_enable,CLK,out0);
part4 L1(data,line_select,chip_select[1],reset,read_enable,write_enable,CLK,out1);
part4 L2(data,line_select,chip_select[2],reset,read_enable,write_enable,CLK,out2);
part4 L3(data,line_select,chip_select[3],reset,read_enable,write_enable,CLK,out3);

tri_state_buffer B0(out0,chip_select[0],out);
tri_state_buffer B1(out1,chip_select[1],out);
tri_state_buffer B2(out2,chip_select[2],out);
tri_state_buffer B3(out3,chip_select[3],out);
endmodule

module part6(
input [31:0] data,
input [4:0] address,
input reset,
input read_enable,
input write_enable,
input CLK,
output [31:0] out
);



wire [7:0] out0,out1,out2,out3;

part5 L0(data[31:24],address,reset,read_enable,write_enable,CLK,out0);
part5 L1(data[23:16],address,reset,read_enable,write_enable,CLK,out1);
part5 L2(data[15:8],address,reset,read_enable,write_enable,CLK,out2);
part5 L3(data[7:0],address,reset,read_enable,write_enable,CLK,out3);

assign out = {out0, out1, out2, out3};

endmodule