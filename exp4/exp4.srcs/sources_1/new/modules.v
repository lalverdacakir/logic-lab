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


module and_gate(input a,input b, output out);
    wire wire1;
    nand_gate n(a,b,wire1);
    nand_gate n1(wire1,wire1,out);
    
endmodule



module sr_latch(
    input S,
    input R,
    output Q,
    output Qc 
    );
    wire wire_q, wire_qc;
    wire not_s,not_r;
    
    nand_gate NOTS(S,S,not_s);
    nand_gate NOTR(R,R,not_r);
    nand_gate NAND1(wire_qc,not_s,wire_q);
    nand_gate NAND2(wire_q,not_r,wire_qc);
    
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

    nand_gate NAND1(R,EN,S_n);
    nand_gate NAND2(S,EN,R_n);
    
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
   
 module part4(
     input LOAD,
     input CLK,
     input wire [15:0] in,
     output reg out
     );
     reg [15:0] outp;
     reg msb;
     always @(posedge CLK)
     begin 
        if(LOAD) begin
            outp = in;
            out = in[15];
        end
        
        else begin
            msb = outp[15];
            outp = outp<<1;
            outp[0] = msb;
            out = msb;
        end
      end
      
endmodule
        
   