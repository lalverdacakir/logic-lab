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
    in = 8'd10; enable = 1; #250;
    
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
    initial begin
    CLK = 0; data = 8'd20; reset = 0; line_select = 0; read_enable = 0; write_enable = 0; #50;
    CLK = 1; data = 8'd20; reset = 0; line_select = 0; read_enable = 0; write_enable = 0; #50;
    CLK = 0; data = 8'd20; reset = 0; line_select = 1; read_enable = 1; write_enable = 0; #50;
    CLK = 1; data = 8'd20; reset = 0; line_select = 0; read_enable = 0; write_enable = 0; #50;
    CLK = 0; data = 8'd20; reset = 0; line_select = 1; read_enable = 0; write_enable = 1; #50;
    CLK = 1; data = 8'd20; reset = 0; line_select = 1; read_enable = 0; write_enable = 1; #50;
     
    CLK = 0; data = 8'd20; reset = 0; line_select = 1; read_enable = 1; write_enable = 0; #50;
    CLK = 1; data = 8'd20; reset = 0; line_select = 0; read_enable = 0; write_enable = 0; #50;
    CLK = 0; data = 8'd20; reset = 1; line_select = 0; read_enable = 0; write_enable = 0; #50;
    CLK = 1; data = 8'd20; reset = 0; line_select = 0; read_enable = 0; write_enable = 0; #50;
     
    CLK = 0; data = 8'd20; reset = 0; line_select = 1; read_enable = 1; write_enable = 0; #50;
    CLK = 1; data = 8'd20; reset = 0; line_select = 0; read_enable = 0; write_enable = 0; #50;
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

initial begin

CLK = 0;data = 8'd8; address = 3'd0;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd8;chip_select = 0;reset=0;write_enable = 1;read_enable = 1;#10;
CLK = 0;data = 8'd10; address = 3'd1;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd10;chip_select = 0;reset=0;write_enable = 1;read_enable = 1;#10;
CLK = 0;data = 8'd12;address = 3'd2;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd12;chip_select = 0;reset=0;write_enable = 1;read_enable = 1;#10;
CLK = 0;data = 8'd14;address = 3'd3;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd14;chip_select = 0;reset=0;write_enable = 1;read_enable = 1;#10;
CLK = 0;data = 8'd16;address = 3'd4;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd16;chip_select = 0;reset=0;write_enable = 1;read_enable = 1;#10;
CLK = 0;data = 8'd18;address = 3'd5;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd18;chip_select = 0;reset=0;write_enable = 1;read_enable = 1;#10;
CLK = 0;data = 8'd20;address = 3'd6;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd20;chip_select = 0;reset=0;write_enable = 1;read_enable = 1;#10;
CLK = 0;data = 8'd22;address = 3'd7;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd22;chip_select = 0;reset=0;write_enable = 1;read_enable = 1;#10;

CLK = 0;chip_select = 0;reset=1;write_enable = 0;read_enable = 0;#10;
CLK = 1;chip_select = 0;reset=0;write_enable = 0;read_enable = 0;#10;
CLK = 0;data = 8'd8; address = 3'd0;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd10; address = 3'd1;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 0;data = 8'd12;address = 3'd2;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd14;address = 3'd3;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 0;data = 8'd16;address = 3'd4;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd18;address = 3'd5;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 0;data = 8'd20;address = 3'd6;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;
CLK = 1;data = 8'd22;address = 3'd7;chip_select = 1;reset=0;write_enable = 0;read_enable = 1;#10;

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

initial begin
CLK = 0; reset = 1; #50;
CLK = 1; reset = 0; #50;

CLK = 0; data = 8'd25; address = 5'd30; write_enable = 1;read_enable = 0;#50;
CLK = 1; data = 8'd25; address = 5'd30; write_enable = 1;read_enable = 0;#50;
CLK = 0; data = 8'd15; address = 5'd20; write_enable = 1;read_enable = 0;#50;
CLK = 1; data = 8'd15; address = 5'd20; write_enable = 1;read_enable = 0;#50;


CLK = 0; data = 8'd15; address = 5'd12; write_enable = 0;read_enable = 1;#50;
CLK = 1; data = 8'd15; address = 5'd12; write_enable = 0;read_enable = 1;#50;

CLK = 0; data = 8'd18; address = 5'd10; write_enable = 1;read_enable = 0;#50;
CLK = 1; data = 8'd18; address = 5'd10; write_enable = 1;read_enable = 0;#50;


CLK = 0; data = 8'd15; address = 5'd15; write_enable = 0;read_enable = 1;#50;
CLK = 1; data = 8'd15; address = 5'd15; write_enable = 0;read_enable = 1;#50;


CLK = 0; data = 8'd15; address = 5'd30; write_enable = 0;read_enable = 1;#50;
CLK = 1; data = 8'd15; address = 5'd30; write_enable = 0;read_enable = 1;#50;


CLK = 0; data = 8'd15; address = 5'd10; write_enable = 0;read_enable = 1;#50;
CLK = 1; data = 8'd15; address = 5'd10; write_enable = 0;read_enable = 1;#50;

CLK = 0; data = 8'd15; address = 5'd20; write_enable = 0;read_enable = 1;#50;
CLK = 1; data = 8'd15; address = 5'd20; write_enable = 0;read_enable = 1;#50;


end
endmodule