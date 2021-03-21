`timescale 1ns / 1ps

module andgate(
    input  input1,
    input  input2,
    output  out
    );
    assign out = input1 & input2;
endmodule


module notgate(
    input input1,
    output out);


    assign out = ~input1;
endmodule

module orgate(
    input  input1,
    input input2,
    output  out
    );

    assign out = input1 | input2;
endmodule
module nandgate(
    input  input1,
    input  input2,
    output  out
    );
    assign out = ~(input1 & input2);
endmodule

module m81(
    input D0,
    input D1,
    input D2,
    input D3,
    input D4,
    input D5,
    input D6,
    input D7,
    input S0,
    input S1,
    input S2,
    output out
    );

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
    andgatefourinput AND2 (.input1(D1), .input2(S0), .input3(araKablo2), .input4(araKablo3), .out(araKablo5)) ;
    andgatefourinput AND3 (.input1(D2), .input2(araKablo1), .input3(S1), .input4(araKablo3), .out(araKablo6)) ;
    andgatefourinput AND4 (.input1(D3), .input2(S0), .input3(S1), .input4(araKablo3), .out(araKablo7)) ;
    andgatefourinput AND5 (.input1(D4), .input2(S2), .input3(araKablo1), .input4(araKablo2), .out(araKablo8)) ;
    andgatefourinput AND6 (.input1(D5), .input2(S0), .input3(araKablo2), .input4(S2), .out(araKablo9)) ;
    andgatefourinput AND7 (.input1(D6), .input2(S1), .input3(S2), .input4(araKablo1), .out(araKablo10)) ;
    andgatefourinput AND8 (.input1(D7), .input2(S0), .input3(S1), .input4(S2), .out(araKablo11)) ;

    orgateeightinput OR1(araKablo4,araKablo5,araKablo6,araKablo7,araKablo8,araKablo9,araKablo10,araKablo11, out);
endmodule

module andgate(
    input  input1,
    input  input2,
    output  out
    );
    assign out = input1 & input2;
endmodule

module andgatefourinput(
    input  input1,
    input  input2,
    input  input3,
    input  input4,
    output  out
    );
    assign out = input1 & input2 & input3 & input4;
endmodule

module notgate(
    input input1,
    output out);


    assign out = ~input1;
endmodule

module orgate(
    input  input1,
    input input2,
    output  out
    );
    assign out = input1 | input2;
endmodule

module orgateeightinput(
    input  input1,
    input input2,
    input input3,
    input input4,
    input input5,
    input input6,
    input input7,
    input input8,

    output  out
    );
    assign out = input1 | input2 | input3 |input4 |input5 |input6 |input7 |input8;
endmodule

module part1_d(
    input  input1, //a
    input  input2, //b
    input  input3, //c
    input  input4, //d
    output  out
    );
    
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

module part1_e(
    input  input1, //a
    input  input2, //b
    input  input3, //c
    input  input4, //d
    output  out
    );
    
    wire  araKablo1;//a'
    wire  araKablo2;//b'
    wire  araKablo3;//c'
    wire  araKablo4;//d'

    wire  araKablo5; // b|d
    wire  araKablo6; // b|c'|d
    wire  araKablo7; // a|d'
    wire  araKablo8; // a'|b'
    wire  araKablo9; //  (b|c'|d) | (a|d')

    notgate NOT1(.input1(input1), .out(araKablo1)); // a'
    notgate NOT2(.input1(input2), .out(araKablo2)); // b'
    notgate NOT3(.input1(input3), .out(araKablo3)); // c'
    notgate NOT4(.input1(input4), .out(araKablo4)); // d'

    nandgate NAND1(.input1(input2),.input2(input4),.out(araKablo5)); //b|d
    nandgate NAND2(.input1(araKablo5),.input2(araKablo3),.out(araKablo6)); //b|c'|d
    nandgate NAND3(.input1(input1),.input2(araKablo4),.out(araKablo7)); //a|d'
    nandgate NAND4(.input1(araKablo1),.input2(araKablo2),.out(araKablo8)); //a'|b'
    nandgate NAND5(.input1(araKablo6),.input2(araKablo7),.out(araKablo9)); // (b|c'|d) | (a|d')
    nandgate NAND6(.input1(araKablo9),.input2(araKablo8),.out(out)); // (b|c'|d) | (a|d') | (a'|b')

endmodule

module part1_f(
    input input1,//a
    input input2,//b
    input input3,//c
    input input4, //d
    output out
    );
    wire araKablo1;
    notgate NOT1(.input1(input3),.out(araKablo1));//not c
    m81 MUX1(.D0(1),.D1(1),.D2(0),.D3(araKablo1),.D4(1),.D5(0),.D6(1),.D7(araKablo1),.S0(input1),.S1(input2),.S2(input4),.out(out));
endmodule 
    