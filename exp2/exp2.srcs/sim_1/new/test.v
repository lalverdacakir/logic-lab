`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2021 21:06:07
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


module part1_d_test();
    reg A,B,C,D;
    wire out;
    part1_d PART1D(.input1(A),.input2(B),.input3(C),.input4(D),.out(out));
    
     initial begin
        A =0; B =0; C=0; D=0;;#62;
        A =0; B =1; C=0; D=0; #62;
        A =1; B =0; C=0; D=0; #62;
        A =1; B =1; C=0; D=0; #62;
        A =0; B =0; C=1; D=0; #62;
        A =0; B =1; C=1; D=0; #62;
        A =1; B =0; C=1; D=0; #62;
        A =1; B =1; C=1; D=0; #62;
        A =0; B =0; C=0; D=1; #62;
        A =0; B =1; C=0; D=1; #62;
        A =1; B =0; C=0; D=1; #62;
        A =1; B =1; C=0; D=1; #62;
        A =0; B =0; C=1; D=1; #62;
        A =0; B =1; C=1; D=1; #62;
        A =1; B =0; C=1; D=1; #62;
        A =1; B =1; C=1; D=1; #62;
      end
endmodule

module part1_e_test();
    reg A,B,C,D;
    wire out;
    part1_e PART1E(.input1(A),.input2(B),.input3(C),.input4(D),.out(out));
    
     initial begin
        A =0; B =0; C=0; D=0;;#62;
        A =0; B =1; C=0; D=0; #62;
        A =1; B =0; C=0; D=0; #62;
        A =1; B =1; C=0; D=0; #62;
        A =0; B =0; C=1; D=0; #62;
        A =0; B =1; C=1; D=0; #62;
        A =1; B =0; C=1; D=0; #62;
        A =1; B =1; C=1; D=0; #62;
        A =0; B =0; C=0; D=1; #62;
        A =0; B =1; C=0; D=1; #62;
        A =1; B =0; C=0; D=1; #62;
        A =1; B =1; C=0; D=1; #62;
        A =0; B =0; C=1; D=1; #62;
        A =0; B =1; C=1; D=1; #62;
        A =1; B =0; C=1; D=1; #62;
        A =1; B =1; C=1; D=1; #62;
      end
endmodule

module part1_f_test();
    reg A,B,C,D;
    wire out;
    part1_f PARR1F(.input1(A),.input2(B),.input3(C),.input4(D),.out(out));
    
     initial begin
        A =0; B =0; C=0; D=0;;#62;
        A =0; B =1; C=0; D=0; #62;
        A =1; B =0; C=0; D=0; #62;
        A =1; B =1; C=0; D=0; #62;
        A =0; B =0; C=1; D=0; #62;
        A =0; B =1; C=1; D=0; #62;
        A =1; B =0; C=1; D=0; #62;
        A =1; B =1; C=1; D=0; #62;
        A =0; B =0; C=0; D=1; #62;
        A =0; B =1; C=0; D=1; #62;
        A =1; B =0; C=0; D=1; #62;
        A =1; B =1; C=0; D=1; #62;
        A =0; B =0; C=1; D=1; #62;
        A =0; B =1; C=1; D=1; #62;
        A =1; B =0; C=1; D=1; #62;
        A =1; B =1; C=1; D=1; #62;
      end
endmodule

module part2_a_test();
    reg A,B,C;
    wire out;
    part2_a PART2A(.input1(A),.input2(B),.input3(C),.out(out));
    
     initial begin
        A =0; B =0; C=0; #125;
        A =0; B =1; C=0; #125;
        A =1; B =0; C=0; #125;
        A =1; B =1; C=0; #125;
        A =0; B =0; C=1; #125;
        A =0; B =1; C=1; #125;
        A =1; B =0; C=1; #125;
        A =1; B =1; C=1; #125;
       
      end
endmodule
module part2_b_test();
    reg A,B,C;
    wire out;
    part2_b PART2B(.input1(A),.input2(B),.input3(C),.out(out));
    
     initial begin
        A =0; B =0; C=0; #125;
        A =0; B =1; C=0; #125;
        A =1; B =0; C=0; #125;
        A =1; B =1; C=0; #125;
        A =0; B =0; C=1; #125;
        A =0; B =1; C=1; #125;
        A =1; B =0; C=1; #125;
        A =1; B =1; C=1; #125;
       
      end
endmodule


