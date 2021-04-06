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
