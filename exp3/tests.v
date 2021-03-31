module andgate_test();
    reg input1;
    reg input2;
    wire out;

    andgate OR1(.input1(input1),.input2(input2),.out(out));

    initial begin
        input1 =0; input2 =0; #250;
        input1 =0; input2 =1; #250;
        input1 =1; input2 =0; #250;
        input1 =1; input2 =1; #250;
    end
endmodule
module andgatethreeinput_test();
    reg input1;
    reg input2;
    reg input3;
    wire out;

    andgatethreeinput AND31(.input1(input1),.input2(input2),.input3(input3),.out(out));

    initial begin
        input1 =0; input2 =0; input3=0; #125;
        input1 =0; input2 =1; input3=0;#125;
        input1 =1; input2 =0; input3=0;#125;
        input1 =1; input2 =1;  input3=0;#125;
        input1 =0; input2 =0; input3=1; #125
        input1 =0; input2 =1; input3=1;#125;
        input1 =1; input2 =0; input3=1;#125;
        input1 =1; input2 =1;  input3=1;#125;
       
    end
endmodule
module orgate_test();
    reg input1;
    reg input2;
    wire out;

    orgate OR1(.input1(input1),.input2(input2),.out(out));

    initial begin
        input1 =0; input2 =0; #250;
        input1 =0; input2 =1; #250;
        input1 =1; input2 =0; #250;
        input1 =1; input2 =1; #250;
       
    end
endmodule
module xor_test();
    reg input1;
    reg input2;
    wire out;

    xorgate XOR1(.input1(input1),.input2(input2),.out(out));

    initial begin
        input1 =0; input2 =0; #250;
        input1 =0; input2 =1; #250;
        input1 =1; input2 =0; #250;
        input1 =1; input2 =1; #250;
    end
endmodule

module notgate_test();
    reg input1;
    wire out;

    notgate not1(.input1(input1),.out(out));

    initial begin
        input1 =0; #500;
        input1 =1; #500; 
    end
endmodule
module halfadder_test();
    reg input1;
    reg input2;
    wire sum;
    wire carry;

    halfadder HA1(.input1(input1),.input2(input2),.sum(sum),.carry(carry));

    initial begin
        input1 =0; input2 =0; #250;
        input1 =0; input2 =1; #250;
        input1 =1; input2 =0; #250;
        input1 =1; input2 =1; #250;
       
    end
endmodule

module fulladder_test();
    reg input1;
    reg input2;
    reg inputc;
    wire outc;
    wire sum;

    fulladder FA1(.input1(input1),.input2(input2),.inputc(inputc),.sum(sum),.outc(outc));

    initial begin
        input1 =0; input2 =0; inputc=0; #125;
        input1 =0; input2 =1; inputc=0; #125;
        input1 =1; input2 =0; inputc=0; #125;
        input1 =1; input2 =1; inputc=0; #125;
        input1 =0; input2 =0; inputc=1; #125;
        input1 =0; input2 =1; inputc=1; #125;
        input1 =1; input2 =0; inputc=1; #125;
        input1 =1; input2 =1; inputc=1; #125;
    end
endmodule

module fulladder4bit_test();
    reg [3:0] input1;
    reg [3:0] input2;
    reg inputc;
    wire outc;
    wire [3:0] sum;

    fulladder4bit FA1(.input1(input1),.input2(input2),.inputc(inputc),.sum(sum),.outc(outc));

    initial begin
        input1 =4'd7; input2 =4'd1; inputc=0; #125;
        input1 =4'd2; input2 =4'd8; inputc=0; #125;
        input1 =4'd2; input2 =4'd3; inputc=0; #125;
        input1 =4'd14; input2 =4'd10; inputc=0; #125;
        input1 =4'd10; input2 =4'd5; inputc=0; #125;
        input1 =4'd15; input2 =4'd4; inputc=0; #125;
        input1 =4'd6; input2 =4'd5; inputc=0; #125;
        input1 =4'd8; input2 =4'd5; inputc=0; #125;
    end
endmodule

module fulladder16bit_test();
    reg [15:0] input1;
    reg [15:0] input2;
    reg inputc;
    wire outc;
    wire [15:0] sum;

    fulladder16bit FA1(.input1(input1),.input2(input2),.inputc(inputc),.sum(sum),.outc(outc));

    initial begin
        input1 =16'd29; input2 =16'd3; inputc=0; #125;
        input1 =16'd21; input2 =16'd83; inputc=0; #125;
        input1 =16'd16800; input2 =16'd16900; inputc=0; #125;
        input1 =16'd65534; input2 =16'd65100; inputc=0; #125;
        input1 =16'd202; input2 =16'd97; inputc=0; #125;
        input1 =16'd44; input2 =16'd19; inputc=0; #125;
        input1 =16'd644; input2 =16'd255; inputc=0; #125;
        input1 =16'd86; input2 =16'd572; inputc=0; #125;
    end
endmodule

module addersubstractor16bit_test();
    reg [15:0] input1;
    reg [15:0] input2;
    reg S;
    reg I;
    wire outc;
    wire borrow;
    wire overflow;
    wire [15:0] sum;

    addersubstractor16bit AS(.input1(input1),.input2(input2),.S(S),.I(I),.outc(outc),.borrow(borrow),.overflow(overflow),.sum(sum));

    initial begin
        input1 =16'd29; input2 =16'd3; S=0; I = 1 ;#125;
        input1 =16'd21; input2 =16'd83;S=0; I=0; #125;
        input1 =16'd16800; input2 =16'd16900; S=1; I= 0 ;#125;
        input1 =16'd103; input2 =16'd154; S=0; I = 1; #125;
        input1 =16'd202; input2 =16'd97; S=0; I = 0; #125;
        input1 =16'd32400; input2 =16'd32200; S=1; I = 0; #125;
        input1 =16'd6478; input2 =16'd2585; S=0; I = 1; #125;
        input1 =16'd8; input2 =16'd52; S=0; I = 1; #125;
    end
endmodule

module part7_test();

    reg [15:0] input1;
    reg [15:0] input2;
    wire [15:0] out;
    
    
    part7 P7(.input1(input1),.input2(input2),.out(out));
    initial begin
        input1 =16'd3105; input2 =16'd11275;#125;
        input1 =16'd21; input2 =16'd83;#125;
        input1 =16'd24; input2 =16'd32; #125;
        input1 =16'd16386; input2 =16'd353;#125;
        input1 =16'd202; input2 =16'd97; #125;
        input1 =16'd44; input2 =16'd9; #125;
        input1 =16'd64; input2 =16'd65535; #125;
        input1 =16'd8; input2 =16'd52; #125;
    end
    endmodule
    
    
  