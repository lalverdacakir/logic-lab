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
module not_gate(
input input1,
output out
);
assign out = ~input1;

endmodule

module or_gate(
input input1,
input input2,
output out
);

assign out = input1 | input2;
endmodule

module xor_gate(
input input1,
input input2,
output out
);

assign out = (~input1 & input2) | (input1 & ~input2);
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

module d_latch(
    input D,
    input EN,
    output Q,
    output Qc
    );
    wire not_d;
    
    not_gate NOT1(D,not_d);
    
    wire D_1, D_2;

    nand_gate_2_input NAND1(not_d,EN,D_1);
    nand_gate_2_input NAND2(D,EN,D_2);
    
    wire wire_q, wire_qc;
    nand_gate_2_input NAND3(wire_qc,D_1,wire_q);
    nand_gate_2_input NAND4(wire_q,D_2,wire_qc);
    
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
   
   not_gate NOT_CLOCK(clk,not_clk);
   
   d_latch DL1(D,not_clk,q_1);
   d_latch DL2(q_1,clk,Q,Qc);
   
endmodule




module jk_ff(
    input J,
    input K,
    input CLK,
    input reset,
    output Q,
    output Qc
    );
    
    wire D, wire_q,wire_qc,or_in_1,or_in_2,not_k;
    wire temp,not_reset;
    not_gate NOTK(K,not_k);
    and_gate AND1(J, wire_qc, or_in_1);
    and_gate AND2(not_k,wire_q, or_in_2);
    
    or_gate OR1(or_in_1,or_in_2,temp);
    
    not_gate NOTR(reset,not_reset);
    and_gate AND3(not_reset,temp,D);
    d_ff DFF(D,CLK,wire_q,wire_qc);
    
    assign Q = wire_q;
    assign Qc = wire_qc;
    

 endmodule
 
 module t_ff(
    input T,
    input CLK,
    input reset,
    output Q,
    output Qc
    );
    wire wire_q,wire_qc;
    wire D,temp;
    wire not_reset;
    
    not_gate NOT1(reset,not_reset);
    
    xor_gate XOR(wire_q,T,temp);
    and_gate AND(temp,not_reset,D);
    d_ff DFF(D,CLK,wire_q,wire_qc);
    
    assign Q = wire_q;
    assign Qc = wire_qc;
    endmodule
    
    module part1(
    input A,
    input B,
    input CLK,
    input reset,
    
    output Z);
    
    wire C,D,J,K,T,E;
    wire q0,q0_c,q1,q1_c;
    nand_gate_2_input NAND1(A,B,C);
    
    or_gate OR2(C,q0,J);
    or_gate OR3(C,q1_c,K);
    
    jk_ff JK(J,K,CLK,reset,q0,q0_c);
    
    or_gate OR1(A,B,D);
    and_gate AND1(D,q1_c,T);
    
    
    t_ff TFF(T,CLK,reset,q1,q1_c);
    
    and_gate AND2(C,q0_c,E);
    
    or_gate OR4(E,q1_c,Z);
    
    endmodule
    
    module part3(
        input [15:0] in,
        input load,
        input CLK,
        input direction,
        input [2:0] inc_dec,
        input clear,
        output [15:0] out
        );
        
        reg [15:0] register;
        
        always @(posedge CLK)
        begin 
            if(clear == 0) begin
                register = 16'd0;
            end
            else begin
                if(load==0) begin
                    register = in;
                end
                else begin
                    if(direction == 1) begin
                    
                        register = register + inc_dec;
                     end
                     else begin
                        register = register - inc_dec;
                     end 
                end
           end
      end
      
      assign out = register;
      
      endmodule
    
    module part4_counter1(
    input init,
    input CLK,
    output reg [15:0] out
    );
    
    reg load,clear;
    reg [15:0] in;
    
    wire direction;
    assign direction = 1;
    
    wire [2:0] inc_dec;
    assign inc_dec = 3'd2;
    
    wire [15:0] temp;
    
     always @(posedge CLK) begin
        if(init == 0) begin
            load = 0;
            clear = 1;
            in = 16'd0;
        end else if(out == 16'd40) begin
            out = 16'd0;
            in = 16'd2;
            load = 0;
            clear = 1;
        end else begin
            load = 1;
            clear = 1;
            out = temp;
        end
            
     end
     
     part3 C1(in,load,CLK,direction,inc_dec,clear,temp);
    
    
    endmodule
    
    
module part4_counter2(
    input init,
    input CLK,
    output reg [15:0] out
    );
    
    reg load,clear;
    reg [15:0] in;
    
    wire direction;
    assign direction = 1;
    
    wire [2:0] inc_dec;
    assign inc_dec = 3'd3;
    
    wire [15:0] temp;
    
     always @(posedge CLK) begin
        if(init == 0) begin
            load = 0;
            clear = 1;
            in = 16'd350;
        end else if(out == 16'd371) begin
            out = 16'd350;
            in = 16'd353;
            load = 0;
            clear = 1;
        end else begin
            load = 1;
            clear = 1;
            out = temp;
        end
            
     end
     
     part3 C2(in,load,CLK,direction,inc_dec,clear,temp);
    
    
    endmodule
    
    module part4_counter3(
    input init,
    input CLK,
    output reg [15:0] out
    );
    
    reg load,clear;
    reg [15:0] in;
    
    wire direction;
    assign direction = 0;
    
    wire [2:0] inc_dec;
    assign inc_dec = 3'd4;
    
    wire [15:0] temp;
    
     always @(posedge CLK) begin
        if(init == 0) begin
            load = 0;
            clear = 1;
            in = 16'd93;
        end else if(out == 16'd5) begin
            out = 16'd93;
            in = 16'd89;
            load = 0;
            clear = 1;
        end else begin
            load = 1;
            clear = 1;
            out = temp;
        end
            
     end
     
     part3 C2(in,load,CLK,direction,inc_dec,clear,temp);
    
    
    endmodule
    
    
        
    module part4_counter4(
    input init,
    input CLK,
    output reg [15:0] out
    );
    
    reg load,clear;
    reg [15:0] in;
    
    wire direction;
    assign direction = 1;
    
    wire [2:0] inc_dec;
    assign inc_dec = 3'd1;
    
    wire [15:0] temp;
    
     always @(posedge CLK) begin
        if(init == 0) begin
            load = 0;
            clear = 1;
            in = 16'd22525;
        end else if(out == 16'd22535) begin
            out = 16'd22525;
            in = 16'd22526;
            load = 0;
            clear = 1;
        end else begin
            load = 1;
            clear = 1;
            out = temp;
        end
            
     end
     
     part3 C2(in,load,CLK,direction,inc_dec,clear,temp);
    
    
    endmodule