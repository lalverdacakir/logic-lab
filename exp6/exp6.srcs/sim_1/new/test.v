`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2021 22:14:38
// Design Name: 
// Module Name: test
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


module not_gate_test();
    reg in;
    wire out;
    not_gate NOT(in,out);
    initial begin
    in = 0; #500;
    in = 1; #500;
    end
endmodule
module tri_state_buffer_test();
    reg [7:0] in;
    reg enable;
    wire [7:0] out;
    
    tri_state_buffer B(in,enable,out);
    
    initial begin
    in = 8'd10; enable = 0; #250;
    in = 8'd10; enable = 0; #250;
    in = 8'd10; enable = 1; #250;
    in = 8'd20; enable = 1; #250;
    
    end
    
    endmodule
    
module part1_test();
    reg [7:0] data1;
    reg [7:0] data2;
    reg select;
    wire [7:0] out;
    part1 P1(data1,data2,select,out);
    initial begin
    data1 = 8'd21; data2 = 8'd10; select = 1; #500;
    data1 = 8'd21; data2 = 8'd10; select = 0; #500;
    end
endmodule

module part2_test();
    reg [7:0] data1;
    reg [7:0] data2;
    reg select;
    wire [7:0] out1;
    wire [7:0] out2;
    part2 P2(data1,data2,select,out1,out2);
    initial begin
    data1 = 8'd21; data2 = 8'd10; select = 1; #500;
    data1 = 8'd21; data2 = 8'd10; select = 0; #500;
    end
endmodule


module part3_test();
    reg [7:0] data;
    reg reset,line_select,read_enable,write_enable,CLK;
    wire [7:0] out;
    part3 P3(data,reset,line_select,read_enable,write_enable,CLK,out);
   
    always #50 CLK = ~CLK;
    initial begin
    CLK=0; data = 8'd0; line_select = 0; read_enable = 0; write_enable = 0;
    reset = 1; #50;
    reset = 0; #50; //reseting
    
    data = 8'd20; line_select = 1; read_enable = 0; write_enable = 1; #50;
    data = 8'd20; line_select = 1; read_enable = 0; write_enable = 1; #50;
    //line select and write enable is hihg -> writing data
    
    line_select = 1; read_enable = 1; write_enable = 0; #50;
    line_select = 1; read_enable = 1; write_enable = 0; #50;
    //line select and write enable is high -> reading data
    
    
    line_select = 0; read_enable = 0; write_enable = 0; #50;
    line_select = 0; read_enable = 0; write_enable = 0; #50;
    //line select and read enable is low-> output zzzz
     
    reset = 1; #50;
    reset = 0; #50;
    //reseting
    
    
    line_select = 1; read_enable = 1; write_enable = 0; #50;
    line_select = 1; read_enable = 1; write_enable = 0; #50;
    //line select and write enable is high -> reading data
    
    data = 8'd0;reset=0; line_select = 0; read_enable = 0; write_enable = 0;
    end
endmodule

module part4_test();


reg [7:0] data;
reg [2:0] address;
reg chip_select;
reg reset;
reg read_enable;
reg write_enable;
reg CLK;
wire [7:0] out;

part4 P4(data,address,chip_select,reset,read_enable,write_enable,CLK,out);
always #10 CLK = ~CLK;
initial begin

CLK = 0; data = 8'd0; address = 3'd0; chip_select = 0; read_enable = 0; write_enable = 0;
reset = 1; #10;
reset = 0; #10;
//resetting

data = 8'd8; address = 3'd0; chip_select = 1;write_enable = 1; #20;//selecting and writing 8 to 0

data = 8'd4; address = 3'd1; chip_select = 1;write_enable = 1; #20;//selecting and writing 4 to 1

data = 8'd32; address = 3'd2; chip_select = 1;write_enable = 1; #20;//selecting and writing 32 to 2

data = 8'd16; address = 3'd3; chip_select = 1; write_enable = 1; #20;//selecting and writing 16 to 3

data = 8'd45; address = 3'd4; chip_select = 1; write_enable = 1; #20;//selecting and writing 45 to 4

data = 8'd13; address = 3'd5; chip_select = 1; write_enable = 1; #20;//selecting and writing 13 to 5

data = 8'd24; address = 3'd6; chip_select = 1; write_enable = 1; #20;//selecting and writing 24 to 6


data = 8'd20;address = 3'd7; chip_select = 1; write_enable = 1; #20;//selecting writing 30 to 7


write_enable = 0; data = 8'd0;


address = 3'd0; chip_select = 1; read_enable = 1; #20;//selcting and reading 0;

address = 3'd1; chip_select = 1; read_enable = 1; #20; //selcting reading 1;

address = 3'd2; chip_select = 1; read_enable = 1; #20; //selecting and reading 2;

address = 3'd3; chip_select = 1;read_enable = 1; #20;  //selecting and reading 3;

address = 3'd4; chip_select = 1; read_enable = 1; #20;  //selecting and reading 4;

address = 3'd5; chip_select = 1; read_enable = 1; #20;  //selecting and reading 5;

address = 3'd6; chip_select = 1; read_enable = 1; #20;  //selecting and reading 6;

address = 3'd7; chip_select = 1; read_enable = 1; #20;  //selecting and reading 7;

reset = 1; #10;
reset = 0; #10;
//resetting

address = 3'd0; chip_select = 1; read_enable = 1; #20;//selcting and reading 0;

address = 3'd1; chip_select = 1; read_enable = 1; #20; //selcting reading 1;

address = 3'd2; chip_select = 1; read_enable = 1; #20; //selecting and reading 2;

address = 3'd3; chip_select = 1;read_enable = 1; #20;  //selecting and reading 3;

address = 3'd4; chip_select = 1; read_enable = 1; #20;  //selecting and reading 4;

address = 3'd5; chip_select = 1; read_enable = 1; #20;  //selecting and reading 5;

address = 3'd6; chip_select = 1; read_enable = 1; #20;  //selecting and reading 6;

address = 3'd7; chip_select = 1; read_enable = 1; #20;  //selecting and reading 7;

end

endmodule

module part5_test();
reg [7:0] data;
reg [4:0] address;
reg reset;
reg read_enable;
reg write_enable;
reg CLK;
wire [7:0] out;

part5 P5(data,address,reset,read_enable,write_enable,CLK,out);

always #50 CLK = ~CLK;
initial begin
CLK = 0; data= 8'd0; address = 5'd00; write_enable = 0; read_enable = 0;
reset = 1; #50;
reset = 0; #50;

data = 8'd25; address = 5'd30; write_enable = 1;#100;

data = 8'd15; address = 5'd20; write_enable = 1;#100;

write_enable = 0;
address = 5'd12; read_enable = 1;#100;

read_enable = 0;
data = 8'd18; address = 5'd10; write_enable = 1;#100;


write_enable = 0;
address = 5'd15; read_enable = 1;#100;
write_enable = 0;
address = 5'd30; read_enable = 1;#100;
write_enable = 0;
address = 5'd10; read_enable = 1;#100;

read_enable = 0;address = 5'd0;


end
endmodule

module part6_test();
reg [31:0] data;
reg [4:0] address;
reg reset;
reg read_enable;
reg write_enable;
reg CLK;
wire [31:0] out;

part6 P6(data,address,reset,read_enable,write_enable,CLK,out);

always #50 CLK = ~CLK;
initial begin
CLK = 0; data = 32'd0; address = 5'd0; write_enable = 0; read_enable=0;
reset = 1; #50;
reset = 0; #50;

data = 32'd23030; address = 5'd00; write_enable = 1;#100;

data = 32'd223030; address = 5'd20; write_enable = 1;#100;

data = 32'd2254030; address = 5'd80; write_enable = 1;#100;

write_enable = 0;#50;

address = 5'd00; read_enable = 1; #100;
address = 5'd20; read_enable = 1; #100;
address = 5'd80; read_enable = 1; #100;
address = 5'd100; read_enable = 1; #100;

read_enable = 0; address = 5'd0;

end
endmodule

module test();
reg [7:0] data;
reg [4:0] address;
reg reset;
reg read_enable;
reg write_enable;
reg CLK;
wire [7:0] out;

part5 P5(data,address,reset,read_enable,write_enable,CLK,out);

always #50 CLK = ~CLK;
initial begin
CLK = 0; data= 8'd0; address = 5'd00; write_enable = 0; read_enable = 0;
reset = 1; #50;
reset = 0; #50;

data = 8'd25; address = 5'd25; write_enable = 1;#100;

data = 8'd15; address = 5'd20; write_enable = 1;#100;

data = 8'd54; address = 5'd80; write_enable = 1;#100;

write_enable = 0; #100;
address = 5'd0; read_enable = 1;#100;
address = 5'd20; read_enable = 1;#100;
address = 5'd80; read_enable = 1;#100;
address = 5'd25; read_enable = 1;#100;




read_enable = 0;address = 5'd0;


end
endmodule