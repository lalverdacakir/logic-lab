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
module nandgate_3(
    input  input1,
    input  input2,
    input  input3,
    output  out
    );
    assign out = ~(input1 & input2 & input3);
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

module andgatethreeinput(
    input  input1,
    input  input2,
    input  input3,
    output  out
    );
    assign out = input1 & input2 & input3;
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
    input input1,//a
    input input2,//b
    input input3,//c
    input input4, //d
    output out
    );
    wire araKablo1;
    notgate NOT1(.input1(input3),.out(araKablo1));//not c
    m81 MUX1(.D0(1),.D1(1),.D2(0),.D3(araKablo1),.D4(1),.D5(0),.D6(1),.D7(araKablo1),.S0(input4),.S1(input2),.S2(input1),.out(out));
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

module d38(a,b,c,d0,d1,d2,d3,d4,d5,d6,d7);
    input a,b,c;
    output d0,d1,d2,d3,d4,d5,d6,d7;

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
    andgatethreeinput AND2(.input1(nota), .input2(notb), .input3(c), .out(d1));
    andgatethreeinput AND3(.input1(nota), .input2(b), .input3(notc), .out(d2));
    andgatethreeinput AND4(.input1(nota), .input2(b), .input3(c), .out(d3));
    andgatethreeinput AND5(.input1(a), .input2(notb), .input3(notc), .out(d4));
    andgatethreeinput AND6(.input1(a), .input2(notb), .input3(c), .out(d5));
    andgatethreeinput AND7(.input1(a), .input2(b), .input3(notc), .out(d6));
    andgatethreeinput AND8(.input1(a), .input2(b), .input3(c), .out(d7));

endmodule

module part2_a(
    input input1,
    input input2,
    input input3,
    output out
    );
    wire d0,d1,d2,d3,d4,d5,d6,d7;
    wire araKablo1;
    d38 DECODER1(.a(input1),.b(input2),.c(input3),.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7));
    orgate OR1(.input1(d1),.input2(d3),.out(araKablo1));
    orgate OR2(.input1(araKablo1),.input2(d6),.out(out));
 endmodule
 
 module part2_b(
    input input1,
    input input2,
    input input3,
    output out
    );
    wire d3,d4,d7;
    wire araKablo1;
    d38 DECODER1(.a(input1),.b(input2),.c(input3),.d3(d3),.d4(d4),.d7(d7));
    orgate OR1(.input1(d3),.input2(d7),.out(araKablo1));
    orgate OR2(.input1(araKablo1),.input2(d4),.out(out));
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