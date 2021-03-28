`timescale 1ns / 1ps

module andgate(
    input  input1, //first input
    input  input2, //second input
    output  out //output
    );
    assign out = input1 & input2; 
    // get the and of the inputs and assign the reuslt to out
endmodule

module notgate(
    input input1,
    output out);


    assign out = ~input1;
endmodule

module orgate(
    input  input1, //first input
    input input2, // second input
    output  out //output
    );

    assign out = input1 | input2;
    //get the or of the inputs and assign to output
endmodule

module xorgate(
    input  input1, //first input
    input  input2, //second input
    output  out //output
    );
    assign out = (~input1 | ~input2) & (input1 | input2);
endmodule

module halfadder(
    input input1,
    input input2,
    output sum,
    output carry,
);
    xorgate xor1(.input1(input1), .input2(input2), .out(sum));
    andgate and1(.input1(input1), .input2(input2), .out(carry));
endmodule

module fulladder(
    input input1,
    input input2,
    input inputc,
    output outc,
    output sum,
);
    wire araKablo1;//first sum
    wire araKablo2; //first carry
    wire araKablo3; // second carry

    halfadder ha1( .input1(input1), .input2(input2), .sum(araKablo1), .carry(araKablo2));
    halfadder ha2( .input1(araKablo1), .input2(inputc), .sum(sum), .carry(araKablo3));
    xorgate xor1(.input1(araKablo2), .input2(araKablo3), .out(outc));
endmodule


module fulladderfourbit(
    input [3:0] input1,
    input [3:0] input2,
    input inputc,
    output outc,
    output [3:0] sum,
);
    wire [2:0] araKablo;

    fulladder fa1( .input1(input1[0]),  .input2(input2[0]), .inputc(inputc), .outc(araKablo[0]), .sum(sum[0])  );
    fulladder fa2( .input1(input1[1]),  .input2(input2[1]), .inputc(araKablo[0]), .outc(araKablo[1]), .sum(sum[1])  );
    fulladder fa3( .input1(input1[2]),  .input2(input2[2]), .inputc(araKablo[1]), .outc(araKablo[2]), .sum(sum[2])  );
    fulladder fa4( .input1(input1[3]),  .input2(input2[3]), .inputc(araKablo[2]), .outc(araKablo[outc]), .sum(sum[3])  );

endmodule



module fulladdersixteenbit(
    input [15:0] input1,
    input [15:0] input2,
    input inputc,
    output outc,
    output [15:0] sum,
);
    wire [2:0] araKablo;

    fulladderfourbit fafour1( .input1(input1[3:0]),  .input2(input2[3:0]), .inputc(inputc), .outc(araKablo[0]), .sum(sum[3:0])  );
    fulladderfourbit fafour2( .input1(input1[7:4]),  .input2(input2[7:4]), .inputc(araKablo[0]), .outc(araKablo[1]), .sum(sum[7:4])  );
    fulladderfourbit fafour3( .input1(input1[11:8]),  .input2(input2[11:8]), .inputc(araKablo[1]), .outc(araKablo[2]), .sum(sum[11:8])  );
    fulladderfourbit fafour4( .input1(input1[15:12]),  .input2(input2[15:12]), .inputc(araKablo[2]), .outc(araKablo[outc]), .sum(sum[15:12])  );

endmodule






module andgatefourinput(
//inputs
    input  input1,
    input  input2,
    input  input3,
    input  input4,
   //output
    output  out
    );
    assign out = input1 & input2 & input3 & input4;
    //get and of the 4 inputs
endmodule

module andgatethreeinput(
//inputs
    input  input1,
    input  input2,
    input  input3,
    //output
    output  out
    );
    assign out = input1 & input2 & input3;
    //get and of the 3 inputs and assign it to output
endmodule



module orgateeightinput(
//inputs
    input  input1,
    input input2,
    input input3,
    input input4,
    input input5,
    input input6,
    input input7,
    input input8,
//output
    output  out
    );
    //get or of all the inputs assign it to output
    assign out = input1 | input2 | input3 |input4 |input5 |input6 |input7 |input8;
endmodule



module part1_e(
//inputs
    input  input1, //a
    input  input2, //b
    input  input3, //c
    input  input4, //d
    //output
    output  out
    );
    //middle wires to connect components
    wire  araKablo1;//a'
    wire  araKablo2;//b'
    wire  araKablo3;//c'
    wire  araKablo4;//d'

    wire  araKablo5; // b|c'|d
    wire  araKablo6; // a|d'
    wire  araKablo7; // a'|b'

    nandgate NOT1(.input1(input1),.input2(input1), .out(araKablo1)); // a'
    nandgate NOT2(.input1(input2),.input2(input2), .out(araKablo2)); // b'
    nandgate NOT3(.input1(input3),.input2(input3), .out(araKablo3)); // c'
    nandgate NOT4(.input1(input4),.input2(input4), .out(araKablo4)); // d'

    nandgate_3 NAND1(.input1(input2),.input2(araKablo3),.input3(input4),.out(araKablo5)); //b|c'|d
    nandgate NAND3(.input1(input1),.input2(araKablo4),.out(araKablo6)); //a|d'
    nandgate NAND4(.input1(araKablo1),.input2(araKablo2),.out(araKablo7)); //a'|b'
    nandgate_3 NAND5(.input1(araKablo5),.input2(araKablo6),.input3(araKablo7),.out(out)); //(b|c'|d)|(a|d')|(a'|b')

endmodule

module part1_f(
//inputs
    input input1,//a
    input input2,//b
    input input3,//c
    input input4, //d
   //output
    output out
    );
    //wire to connect components
    wire araKablo1;
    notgate NOT1(.input1(input3),.out(araKablo1));//not c
    m81 MUX1(.D0(1),.D1(1),.D2(0),.D3(araKablo1),.D4(1),.D5(0),.D6(1),.D7(araKablo1),.S0(input4),.S1(input2),.S2(input1),.out(out));
    //multiplexer
endmodule 

module m81(
//inputs
    input D0,
    input D1,
    input D2,
    input D3,
    input D4,
    input D5,
    input D6,
    input D7,
    //selection inputs
    input S0,
    input S1,
    input S2,
    //output
    output out
    );
//middle wires to connect components
    wire araKablo1;// SO'
    wire araKablo2;// S1'
    wire araKablo3;// S2'
    wire araKablo4;
    wire araKablo5;
    wire araKablo6;
    wire araKablo7;
    wire araKablo8;
    wire araKablo9;
    wire araKablo10;
    wire araKablo11;

    notgate NOT1(.input1(S0), .out(araKablo1)); // SO'
    notgate NOT2(.input1(S1), .out(araKablo2)); // S1'
    notgate NOT3(.input1(S2), .out(araKablo3)); // S2'
    andgatefourinput AND1 (.input1(araKablo1), .input2(araKablo2), .input3(araKablo3), .input4(D0), .out(araKablo4)) ;
    //s0's1's2'd0
    andgatefourinput AND2 (.input1(D1), .input2(S0), .input3(araKablo2), .input4(araKablo3), .out(araKablo5)) ;
    //s0s1's2'd1
    andgatefourinput AND3 (.input1(D2), .input2(araKablo1), .input3(S1), .input4(araKablo3), .out(araKablo6)) ;
    //s0's1s2'd2
    andgatefourinput AND4 (.input1(D3), .input2(S0), .input3(S1), .input4(araKablo3), .out(araKablo7)) ;
    //s0s1s2'd3
    andgatefourinput AND5 (.input1(D4), .input2(S2), .input3(araKablo1), .input4(araKablo2), .out(araKablo8)) ;
    //s0's1's2d4
    andgatefourinput AND6 (.input1(D5), .input2(S0), .input3(araKablo2), .input4(S2), .out(araKablo9)) ;
    //s0s1's2d5
    andgatefourinput AND7 (.input1(D6), .input2(S1), .input3(S2), .input4(araKablo1), .out(araKablo10)) ;
    //s0's1s2d6
    andgatefourinput AND8 (.input1(D7), .input2(S0), .input3(S1), .input4(S2), .out(araKablo11)) ;
    //s0s1s3d7

    orgateeightinput OR1(araKablo4,araKablo5,araKablo6,araKablo7,araKablo8,araKablo9,araKablo10,araKablo11, out);
    //or of the results of ands
endmodule

module d38(
    input a,
    input b,
    input c,
    output d0,
    output d1,
    output d2,
    output d3,
    output d4,
    output d5,
    output d6,
    output d7);
//wires to connect components
    wire nota;// a'
    wire notb;// b'
    wire notc;// c'
    wire araKablo4;
    wire araKablo5;
    wire araKablo6;
    wire araKablo7;
    wire araKablo8;
    wire araKablo9;
    wire araKablo10;
    wire araKablo11;

    notgate NOT1(.input1(a), .out(nota)); // a'
    notgate NOT2(.input1(b), .out(notb)); // b'
    notgate NOT3(.input1(c), .out(notc)); // c'
    
    andgatethreeinput AND1(.input1(nota), .input2(notb), .input3(notc), .out(d0));
    //a'b'c'
    andgatethreeinput AND2(.input1(nota), .input2(notb), .input3(c), .out(d1));
    //a'b'c
    andgatethreeinput AND3(.input1(nota), .input2(b), .input3(notc), .out(d2));
    //a'bc'
    andgatethreeinput AND4(.input1(nota), .input2(b), .input3(c), .out(d3));
    //a'bc
    andgatethreeinput AND5(.input1(a), .input2(notb), .input3(notc), .out(d4));
    //ab'c'
    andgatethreeinput AND6(.input1(a), .input2(notb), .input3(c), .out(d5));
    //ab'c
    andgatethreeinput AND7(.input1(a), .input2(b), .input3(notc), .out(d6));
    //abc'
    andgatethreeinput AND8(.input1(a), .input2(b), .input3(c), .out(d7));
    //abc

endmodule

module part2_a(
//inputs
    input input1,
    input input2,
    input input3,
    //output
    output out
    );
    //wires to connect components
    wire d0,d1,d2,d3,d4,d5,d6,d7;
    wire araKablo1;
    d38 DECODER1(.a(input1),.b(input2),.c(input3),.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7));
    //decoder
    orgate OR1(.input1(d1),.input2(d3),.out(araKablo1)); //a'b'c + a'bc = a'c (distibutivity)
    orgate OR2(.input1(araKablo1),.input2(d6),.out(out));//a'c + abc'
 endmodule
 
 module part2_b(
 //inputs
    input input1,
    input input2,
    input input3,
    //output
    output out
    );
    //wires to connect
    wire d3,d4,d7;
    wire araKablo1;
    d38 DECODER1(.a(input1),.b(input2),.c(input3),.d3(d3),.d4(d4),.d7(d7));
    //decoder
    orgate OR1(.input1(d3),.input2(d7),.out(araKablo1));//a'bc + abc = bc (dist)
    orgate OR2(.input1(araKablo1),.input2(d4),.out(out));//bc + ab'c'
 endmodule
 
 module part1_d(
 //inputs
    input  input1, //a
    input  input2, //b
    input  input3, //c
    input  input4, //d
    //output
    output  out
    );
    //wires to connect components
    wire  araKablo1;//a'
    wire  araKablo2;//b'
    wire  araKablo3;//c'
    wire  araKablo4;//d'
    wire  araKablo5; //bd
    wire  araKablo6; //bc'd
    wire  araKablo7; //ad'
    wire  araKablo8; //a'b'
    wire araKablo9; //bc'd+ad'

    notgate NOT1(.input1(input1), .out(araKablo1)); // a'
    notgate NOT2(.input1(input2), .out(araKablo2)); // b'
    notgate NOT3(.input1(input3), .out(araKablo3)); // c'
    notgate NOT4(.input1(input4), .out(araKablo4)); // d'

    andgate AND1(.input1(input2),.input2(input4),.out(araKablo5)); //bd
    andgate AND2(.input1(araKablo5),.input2(araKablo3),.out(araKablo6)); //bc'd
    andgate AND3(.input1(input1),.input2(araKablo4),.out(araKablo7)); //ad'
    andgate AND4(.input1(araKablo1),.input2(araKablo2),.out(araKablo8)); //a'b'

    orgate OR1(.input1(araKablo6),.input2(araKablo7),.out(araKablo9)); // bc'd + ad'
    orgate OR2(.input1(araKablo9),.input2(araKablo8),.out(out)); // bc'd + ad' + a'b'

endmodule