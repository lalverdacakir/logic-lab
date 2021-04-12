`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2021 17:35:00
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


module and_test();
reg A,B;
wire out;

and_gate AND(A,B,out);

initial begin
    A = 0; B = 0; #250;
    A = 0; B = 1; #250;
    A = 1; B = 0; #250;
    A = 1; B = 1; #250;
  end


endmodule

module or_test();
reg A,B;
wire out;

or_gate OR(A,B,out);

initial begin
    A = 0; B = 0; #250;
    A = 0; B = 1; #250;
    A = 1; B = 0; #250;
    A = 1; B = 1; #250;
  end


endmodule

module nand_2_input_test();
reg A,B;
wire out;

nand_gate_2_input NAND(A,B,out);

initial begin
    A = 0; B = 0; #250;
    A = 0; B = 1; #250;
    A = 1; B = 0; #250;
    A = 1; B = 1; #250;
  end


endmodule
module nand_3_input_test();
reg A,B;
wire out;

nand_gate_3_input NAND(A,B,out);

initial begin
    A = 0; B = 0; #250;
    A = 0; B = 1; #250;
    A = 1; B = 0; #250;
    A = 1; B = 1; #250;
  end


endmodule

module jk_ff_test();
reg J,K,CLK,reset;
wire q,qc;

jk_ff JK(J,K,CLK,reset,q,qc);

initial begin
    CLK = 0; J = 0; K = 1;reset=1; #50;
    CLK = 1; J = 0; K = 1;reset=1; #50;
    //reset
    CLK = 0; J = 0; K = 0;reset=0; #50;
    CLK = 1; J = 0; K = 0;reset=0; #50;
    //previous state
    CLK = 0; J = 1; K = 0;reset=0; #50;
    CLK = 1; J = 1; K = 0;reset=0; #50;
    //set to one
    CLK = 0; J = 1; K = 1;reset=0; #50;
    CLK = 1; J = 1; K = 1;reset=0; #50;
    //toggle
    CLK = 0; J = 1; K = 1;reset=0; #50;
    CLK = 1; J = 1; K = 1;reset=0; #50;
    //toggle
    CLK = 0; J = 1; K = 1;reset=0; #50;
    CLK = 1; J = 1; K = 1;reset=0; #50;
    //toggle
    CLK = 0; J = 0; K = 0;reset=0; #50;
    CLK = 1; J = 0; K = 0;reset=0; #50;
    //previous state
    CLK = 0; J = 0; K = 1;reset=0; #50;
    CLK = 1; J = 0; K = 1;reset=0; #50;
    //set to 0
    CLK = 0; J = 0; K = 0;reset=0; #50;
    CLK = 1; J = 0; K = 0;reset=0; #50;
    //previous state
    CLK = 0; J = 1; K = 0;reset=0; #50;
    CLK = 1; J = 1; K = 0;reset=0; #50;
    //set to ones
  end


endmodule

module tff_test();
reg T, CLK,reset;
wire q,qc;

t_ff TFF(T,CLK,reset,q,qc);
initial begin
    CLK = 0; T=0; reset = 1; #100;
    CLK = 1; T=0; reset = 1; #100;
    //reset
    CLK = 0; T=0; reset = 0; #100;
    CLK = 1; T=0; reset = 0;#100;
    //current
    CLK = 0; T=1; reset = 0;#100;
    CLK = 1; T=1; reset = 0;#100;
    //toggle
    CLK = 0; T=1;reset = 0; #100;
    CLK = 1; T=1; #100;
    //toggle
    CLK = 0; T=0;reset = 0; #100;
    CLK = 1; T=0;reset = 0; #100;
    //current
    
     CLK = 0; T=1;reset = 0; #100;
    CLK = 1; T=1; reset = 0;#100;
    //toggle
    
    
  end
endmodule

module part1_test();

reg A,B,reset,CLK;
wire Z;

part1 P(A,B,CLK,reset,Z);

initial begin
    CLK = 0; A=0;B=0; reset = 1; #50;
    CLK = 1; A=0;B=0; reset = 1; #50;
    
    CLK = 0; A=0;B=0; reset = 0; #50;
    CLK = 1; A=0;B=0; reset = 0;#50;
    
    CLK = 0; A=0;B=1; reset = 0; #50;
    CLK = 1; A=0;B=1; reset = 0;#50;
    
    CLK = 0; A=0;B=0; reset = 0; #50;
    CLK = 1; A=0;B=0; reset = 0;#50;
    CLK = 0; A=1;B=0; reset = 0; #50;
    CLK = 1; A=1;B=0; reset = 0;#50;
    
    
    
    CLK = 0; A=1;B=1; reset = 0; #50;
    CLK = 1; A=1;B=1; reset = 0;#50;
    
    
  end
endmodule

module part3_test();
reg [15:0] in;
reg load,direction,clk,clear;
reg [3:0] inc_dec;

wire [15:0] out;

part3 P3(in,load,clk,direction,inc_dec,clear,out);

initial begin


clk = 0; clear = 0; load = 1;#10;
clk = 1; clear = 0; load = 1;#10;

clk = 0; clear = 1; in = 16'hffff; load = 0; #10 ;
clk = 1; clear = 1; in = 16'hffff; load = 0; #10;

clk = 0; clear = 1; load = 1; direction = 0; inc_dec = 3'd3;#10;
clk = 1; clear = 1; load = 1; direction = 0; inc_dec = 3'd3;#10;

clk = 0; clear = 1;load = 1; direction = 0; inc_dec = 3'd3;#10;
clk = 1; clear = 1;load = 1; direction = 0; inc_dec = 3'd3;#10;

clk = 0; clear = 1; load = 1; direction = 0; inc_dec = 3'd3;#10;
clk = 1; clear = 1; load = 1; direction = 0; inc_dec = 3'd3;#10;

clk = 0; clear = 0; load = 1; direction = 0;#10;
clk = 1; clear = 0; load = 1; direction = 0;#10;

clk = 0; clear = 1; in = 16'd0; load = 0; #10;
clk = 1; clear = 1; in = 16'd0; load = 0; #10;


clk = 0; clear = 1; load = 1; direction = 0; inc_dec = 3'd7;#10;
clk = 1; clear = 1; load = 1; direction = 0; inc_dec = 3'd7;#10;

clk = 0; clear = 1; load = 1; direction = 0; inc_dec = 3'd7;#10;
clk = 1; clear = 1; load = 1; direction = 0; inc_dec = 3'd7;#10;

end

endmodule


module part4_c1_test();
reg init;
reg CLK;
wire [15:0] out;

part4_counter1 counter(init,CLK,out);

initial begin
    CLK = 0;init = 0; #10;
    CLK = 1; init = 0; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
     CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
     CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    
end
endmodule

module part4_c2_test();
reg init;
reg CLK;
wire [15:0] out;

part4_counter2 counter(init,CLK,out);

initial begin
    CLK = 0;init = 0; #10;
    CLK = 1; init = 0; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
     CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
     CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    
end
endmodule

module part4_c3_test();
reg init;
reg CLK;
wire [15:0] out;

part4_counter3 counter(init,CLK,out);

initial begin
    CLK = 0;init = 0; #10;
    CLK = 1; init = 0; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
     CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
     CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    
end
endmodule


module part4_c4_test();
reg init;
reg CLK;
wire [15:0] out;

part4_counter4 counter(init,CLK,out);

initial begin
    CLK = 0;init = 0; #10;
    CLK = 1; init = 0; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
     CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
     CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    CLK = 0;init = 1; #10;
    CLK = 1; init = 1; #10;
    
    
end
endmodule