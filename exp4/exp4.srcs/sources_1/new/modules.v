`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2021 22:28:00
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

module nand_gate(
    input input1,
    input input2,
    output out
    );
    
    assign out = ~(input1 & input2);
endmodule

module buffer(
    input input1,
    output out
    );
    wire wire1;
    nand_gate NAND1(input1,input1,wire1);
    nand_gate NAND2(wire2,wire2,out);
    
    endmodule

module xor_gate(
    input a,
    input b,
    output out
    );
    
    wire not_a,not_b,wire1,wire2;
    
    nand_gate NOTA(a,a,not_a);
    nand_gate NOTB(b,b,not_b);
    
    nand_gate NAND1(a,not_b,wire1);
    nand_gate NAND2(not_a,b,wire2);
    
    nand_gate NAND3(wire1,wire2,out);
endmodule
module and_gate(input a,input b, output out);
    wire wire1;
    nand_gate n(a,b,wire1);
    nand_gate n1(wire1,wire1,out);
    
    endmodule
module check_rising(input CLK,input CLK_prev, output out);
    wire xor_res;
    
    xor_gate XOR1(CLK,CLK_prev,xor_res);
    and_gate AND(xor_res,CLK,out);
endmodule

module sr_latch(
    input S,
    input R,
    output Q,
    output Qc 
    );
    wire wire_q, wire_qc;
    nand_gate NAND1(wire_qc,S,wire_q);
    nand_gate NAND2(wire_q,R,wire_qc);
    
    assign Q = wire_q;
    assign Qc = wire_qc;
  
endmodule

module sr_latch_with_en(
    input S,
    input R,
    input EN,
    output Q,
    output Qc
);
    wire S_n, R_n;
    wire wire1,wire2;

    nand_gate NAND1(R,EN,wire1);
    nand_gate NAND2(S,EN,wire2);
    
    nand_gate NOT1(wire1,wire1,S_n);
    nand_gate NOT2(wire2,wire2,R_n);
    
    wire wire_q, wire_qc;
    nand_gate NAND3(wire_qc,S_n,wire_q);
    nand_gate NAND4(wire_q,R_n,wire_qc);
    
    assign Q = wire_q;
    assign Qc = wire_qc;
    
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
    wire wire1,wire2;

    nand_gate NAND1(not_d,EN,wire1);
    nand_gate NAND2(D,EN,wire2);
    
    nand_gate NOT2(wire1,wire1,D_1);
    nand_gate NOT3(wire2,wire2,D_2);
    
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
   wire clk_prev;
   wire rs;
   check_rising RS(clk,clk_prev,rs);
   d_latch(D,rs,Q,Qc);
   
   buffer BUF(clk,clk_prev);
   
endmodule
   
   
   