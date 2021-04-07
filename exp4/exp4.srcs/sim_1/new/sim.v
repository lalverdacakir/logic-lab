`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2021 22:52:57
// Design Name: 
// Module Name: sim
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


module sr_latch_test();
    reg S,R;
    wire q,qc;
    sr_latch SR(S,R,q,qc);
    
    initial begin
        S = 0; R= 0; #250;
        S = 0; R= 1; #250;
        S = 1; R= 0; #250;
        S = 1; R= 1; #250;
    end
endmodule

module sr_latch_with_en_test();
    reg S,R,EN;
    wire q,qc;
    sr_latch_with_en SR(S,R,EN,q,qc);
    
    initial begin
        S = 1; R= 0; EN = 1; #125;
        S = 0; R= 0; EN = 0; #125;
        S = 0; R= 1; EN = 0; #125;
        S = 1; R= 0; EN = 0; #125;
        S = 1; R= 1; EN = 0; #125;
        S = 0; R= 0; EN = 1; #125;
        S = 0; R= 1; EN = 1; #125;
        
        S = 1; R= 1; EN = 1; #125;
    end
endmodule

module check_rising_edge_test();

    reg clk, clk_rev;
    wire out;
    
    check_rising oo(clk,clk_rev,out);
    
    initial begin
    clk = 0; clk_rev = 1; #250;
    clk = 1; clk_rev = 0; #250;
    clk = 1; clk_rev = 1; #250;
    clk = 0; clk_rev = 0; #250;
    end
 endmodule
 
 module dff_test();
 
    reg D, CLK;
    
    wire Q,Qc;
    
    d_ff DFF(D,CLK,Q,Qc);
    
    initial begin
    CLK = 0; D=0; #125;
    CLK = 1; D=0; #125;
    CLK = 0; D=1; #125;
    CLK = 1; D=1; #125;
    CLK = 0; D = 0; #125;
    CLK = 1; D= 1; #125;
    CLK = 0; D = 0; #125;
    CLK = 0; D = 0; #125;
    
    end
    endmodule

module d_latch_test();
//1/2 frequency
reg D, EN;
wire Q,Qc;

d_latch DL(D,EN,Q,Qc);

initial begin
EN = 1;D = 1;#125;
EN = 1; D = 0; #125;
EN = 0; D = 0; #125;
EN = 0; D = 1; #125;
end
endmodule
module part4_test();
reg load;
reg clk;
reg [15:0] in;
wire out;
part4 p(load,clk,in,out);

initial begin
load = 1; clk = 0; in = 16'b1111111111100000; #60;
load = 1; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000; #60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000; #60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000; #60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000; #60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000; #60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000; #60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000; #60;
load = 0; clk = 0; in = 16'b1111111111100000;#60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
load = 0; clk = 0; in = 16'b1111111111100000; #60;
load = 0; clk = 1; in = 16'b1111111111100000;#60;
end

endmodule
