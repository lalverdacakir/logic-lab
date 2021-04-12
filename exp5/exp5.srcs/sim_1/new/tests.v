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
reg J,K,CLK;
wire q,qc;

jk_ff JK(J,K,CLK,q,qc);

initial begin
    A = 0; B = 0; #250;
    A = 0; B = 1; #250;
    A = 1; B = 0; #250;
    A = 1; B = 1; #250;
  end


endmodule