`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2021 17:03:43
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
module or_gate(
input input1,
input input2,
output out
);

assign out = input1 | input2;
endmodule

module and_gate(
input input1,
input input2,
output out
);
assign out = input1 & input2;

endmodule 


module nand_gate_2_input(
    input input1,
    input input2,
    output out
    );
    
    assign out = ~(input1 & input2);
endmodule
module nand_gate_3_input(
    input input1,
    input input2,
    input input3,
    output out
    );
    
    assign out = ~(input1 & input2 & input3);
endmodule

module latch(
    input input1,
    input input2,
    output Q,
    output Qc
);
    wire wire_q, wire_qc;
   
    
    nand_gate_2_input NAND3(wire_qc,input1,wire_q);
    nand_gate_2_input NAND4(wire_q,input2,wire_qc);
    
    assign Q = wire_q;
    assign Qc = wire_qc;
    
endmodule

module jk_ff(
    input J,
    input K,
    input CLK,
    output Q,
    output Qc
    );
    
    wire not_clk;
    wire slave_input_1,slave_input_2;
    wire slave_output,slave_output_c;
    
    wire master_input_1,master_input_2;
    wire master_output,master_ourput_c;
    nand_gate_2_input NOT1(CLK,CLK,not_clk);
   
    nand_gate_3_input NAND1(J,slave_output_c,CLK,master_input_1);
    nand_gate_3_input NAND2(K,slave_output,CLk,master_input_2);
    
    latch M(master_input_1,master_input2,master_output,master_output_c);
    
    nand_gate_2_input NAND3(master_output,not_clk,slave_input_1);
    nand_gate_3_input NAND4(master_output_c,not_clk,slave_input_2);
    
    latch S(slave_input_1,slave_input_2,slave_output,slave_output_c);
    
    assign Q = slave_output;
    assign Qc = slave_output_c;
    
    
    
    
 endmodule
 
 module t_ff(
    input T,
    input CLK,
    output Q,
    output Qc
    );
    
    jk_ff JK(T,T,CLK,Q,Qc);
    
    endmodule
    
    module part1(
    input A,
    input B,
    output Z
    );
    
    wire C,D,J,K,T,E,Q0,Q0_c,Q1,Q1_c;
    
    nand_gate_2_input NAND1(A,B,C);
    or_gate OR1(A,B,D);
    
    or_gate OR2(Q0,C,J);
    or_gate OR3(C,Q1_c,K);
    
    and_gate AND1(D,Q1_c,T);
    
    jk_ff JKFF(J,K,CLK,Q0,Q0_c);
    
    t_ff TFF(T,CLK,Q1,Q1_c);
    
    and_gate AND2(Q0_c, C, E);
    
    or_gate OR4(Q1_c, E,Z);
    
    endmodule
    