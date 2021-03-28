`timescale 1ns / 1ps

module andgate(
    input  input1, //first input
    input  input2, //second input
    output  out //output
    );
    assign out = input1 & input2; 
    // get the and of the inputs and assign the reuslt to out
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
    output carry
);
    xorgate xor1(.input1(input1), .input2(input2), .out(sum));
    andgate and1(.input1(input1), .input2(input2), .out(carry));
endmodule

module fulladder(
    input input1,
    input input2,
    input inputc,
    output outc,
    output sum
);
    wire araKablo1;//first sum
    wire araKablo2; //first carry
    wire araKablo3; // second carry

    halfadder ha1( .input1(input1), .input2(input2), .sum(araKablo1), .carry(araKablo2));
    halfadder ha2( .input1(araKablo1), .input2(inputc), .sum(sum), .carry(araKablo3));
    xorgate xor1(.input1(araKablo2), .input2(araKablo3), .out(outc));
endmodule


module fulladder4bit(
    input [3:0] input1,
    input [3:0] input2,
    input inputc,
    output outc,
    output [3:0] sum
);
    wire [2:0] araKablo;

    fulladder fa1( .input1(input1[0]),  .input2(input2[0]), .inputc(inputc), .outc(araKablo[0]), .sum(sum[0])  );
    fulladder fa2( .input1(input1[1]),  .input2(input2[1]), .inputc(araKablo[0]), .outc(araKablo[1]), .sum(sum[1])  );
    fulladder fa3( .input1(input1[2]),  .input2(input2[2]), .inputc(araKablo[1]), .outc(araKablo[2]), .sum(sum[2])  );
    fulladder fa4( .input1(input1[3]),  .input2(input2[3]), .inputc(araKablo[2]), .outc(araKablo[outc]), .sum(sum[3])  );

endmodule



module fulladder16bit(
    input [15:0] input1,
    input [15:0] input2,
    input inputc,
    output outc,
    output [15:0] sum
);
    wire [2:0] araKablo;

    fulladderfourbit fafour1( .input1(input1[3:0]),  .input2(input2[3:0]), .inputc(inputc), .outc(araKablo[0]), .sum(sum[3:0])  );
    fulladderfourbit fafour2( .input1(input1[7:4]),  .input2(input2[7:4]), .inputc(araKablo[0]), .outc(araKablo[1]), .sum(sum[7:4])  );
    fulladderfourbit fafour3( .input1(input1[11:8]),  .input2(input2[11:8]), .inputc(araKablo[1]), .outc(araKablo[2]), .sum(sum[11:8])  );
    fulladderfourbit fafour4( .input1(input1[15:12]),  .input2(input2[15:12]), .inputc(araKablo[2]), .outc(araKablo[outc]), .sum(sum[15:12])  );

endmodule


module xorla(
    input [15:0] input1,
    input I,
    output [15:0] out
    );

    xorgate XOR0(.input1(input1[0]),.input2(I),.out(out[0]));
    xorgate XOR1(.input1(input1[1]),.input2(I),.out(out[1]));
    xorgate XOR2(.input1(input1[2]),.input2(I),.out(out[2]));
    xorgate XOR3(.input1(input1[3]),.input2(I),.out(out[3]));
    xorgate XOR4(.input1(input1[4]),.input2(I),.out(out[4]));
    xorgate XOR5(.input1(input1[5]),.input2(I),.out(out[5]));
    xorgate XOR6(.input1(input1[6]),.input2(I),.out(out[6]));
    xorgate XOR7(.input1(input1[7]),.input2(I),.out(out[7]));
    xorgate XOR8(.input1(input1[8]),.input2(I),.out(out[8]));
    xorgate XOR9(.input1(input1[9]),.input2(I),.out(out[9]));
    xorgate XOR10(.input1(input1[10]),.input2(I),.out(out[10]));
    xorgate XOR11(.input1(input1[11]),.input2(I),.out(out[11]));
    xorgate XOR12(.input1(input1[12]),.input2(I),.out(out[12]));
    xorgate XOR13(.input1(input1[13]),.input2(I),.out(out[13]));
endmodule 
module addersubstractor16bit(
    input S,
    input I,
    input [15:0] input1,
    input [15:0] input2,
    output [15:0] sum,
    output borrow,
    output overflow,
    output outc
);
    wire [15:0] araKablo1;
    xorla XOR1(.input1(input2),.I(I),.out(araKablo1));
    fulladder16bit fa1(.input1(input1),.input2(araKablo1),.inputc(I),.outc(outc),.sum(sum));

    //borrow logic

    


    andgatethreeinput AND5(.input1(S), .input2(araKablo6), .input3(araKablo11), .out(araKablo13));
    andgatethreeinput AND6(.input1(S), .input2(I), .input3(araKablo12), .out(araKablo14));
    
    orgate OR3(.input1(araKablo13), .input2(araKablo14), .out(overflow));

    andgatethreeinput AND7(.input1(I),.input2(araKablo5),.input3(outc),.out(borrow));
endmodule



