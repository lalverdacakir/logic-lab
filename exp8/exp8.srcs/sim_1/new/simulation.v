`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.05.2021 23:45:51
// Design Name: 
// Module Name: simulation
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


module CharDecoder_test();

    reg [7:0] char;
    wire [25:0] decodedChar;
    
    CharDecoder CD(char,decodedChar);
    initial begin
        char = 8'd65;#250; 
        char = 8'd80;#250; 
        char = 8'd90;#250; 
        char = 8'd84;#250; 
    
    end
endmodule

module CharEncoder_test();
    reg [25:0] decodedChar;
    wire [7:0] char;
    
    CharEncoder CE(decodedChar,char);
    initial begin
        decodedChar = 26'h0000020; #250;
        decodedChar = 26'h0000400; #250;
        decodedChar = 26'h0020000; #250;
        decodedChar = 26'h2000000; #250;
    
    end
endmodule


module CircularRightShift_test();

    reg [25:0] data;
    reg [4:0] shiftAmount;
    wire [25:0] out;
    
    CircularRightShift CRS(data,shiftAmount,out);
    initial begin
        data = 26'd65;shiftAmount = 5'd5;#250; 
        data = 26'd80;shiftAmount = 5'd3;#250; 
        data = 26'd90;shiftAmount = 5'd10;#250; 
        data = 26'd84;shiftAmount = 5'd26;#250; 
    
    end
endmodule

module CircularLeftShift_test();
    reg [25:0] data;
    reg [4:0] shiftAmount;
    wire [25:0] out;
    
    CircularLeftShift CLS(data,shiftAmount,out);
    initial begin
        data = 26'd65;shiftAmount = 5'd5;#250; 
        data = 26'd80;shiftAmount = 5'd3;#250; 
        data = 26'd90;shiftAmount = 5'd10;#250; 
        data = 26'd84;shiftAmount = 5'd26;#250; 
    
    end
endmodule

module CaesarEncryption_test();
    reg [7:0] plainChar;
    reg [4:0] shiftCount;
    wire [7:0] chipherChar;
    
    CaesarEncryption CE(plainChar,shiftCount,chipherChar);
    initial begin
        plainChar = "A";shiftCount = 5'd3;#250; 
        plainChar = "F";shiftCount = 5'd3;#250; 
        plainChar = "X";shiftCount = 5'd3;#250; 
        plainChar = "X";shiftCount = 5'd5;#250; 
    
    end
endmodule

module CaesarDecryption_test();
    reg [7:0] chipherChar;
    reg [4:0] shiftCount;
    wire [7:0] decryptedChar;
    
    CaesarDecryption CD(chipherChar,shiftCount,decryptedChar);
    initial begin
        chipherChar = "E";shiftCount = 5'd3;#250; 
        chipherChar = "H";shiftCount = 5'd3;#250; 
        chipherChar = "J";shiftCount = 5'd3;#250; 
        chipherChar = "A";shiftCount = 5'd29;#250; 
    
    end
endmodule

module CaesarEnvironment_test();
    reg [7:0] plainChar;
    reg [4:0] shiftCount;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;
    

    CaesarEnvironment CE(plainChar,shiftCount,chipherChar,decryptedChar);
    initial begin
        plainChar = "A";shiftCount = 5'd3;#250; 
        plainChar = "F";shiftCount = 5'd3;#250; 
        plainChar = "X";shiftCount = 5'd3;#250; 
        plainChar = "X";shiftCount = 5'd5;#250; 
    
    end
endmodule

module VigenereEnvironment_test();
    reg [7:0] plainChar;
    reg [79:0] keyInput;
    reg load;
    reg CLK;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;
    

    VigenereEnvironment VE(plainChar,keyInput,load,CLK,chipherChar,decryptedChar);
    always #50 CLK = ~CLK;
    initial begin
        CLK = 0; plainChar = 0;load = 0;keyInput ="KADIROZLEM";#50; 
        load = 1;plainChar = "I";keyInput ="KADIROZLEM";#50; 
        
        load = 0;plainChar = "I";#50;
        plainChar = "S";#100;
        plainChar = "T";#100;
        plainChar = "A";#100;
        plainChar = "N";#100;
        plainChar = "B";#100;
        plainChar = "U";#100;
        plainChar = "L";#100;
        plainChar = "T";#100;
        plainChar = "E";#100;
        plainChar = "C";#100;
        plainChar = "H";#100;
        plainChar = "N";#100;
        plainChar = "I";#100;
        plainChar = "C";#100;
        
 
    end
endmodule

module CaesarEnvironment_test();
    reg [7:0] plainChar;
    reg [4:0] shiftCount;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;
    

    CaesarEnvironment CE(plainChar,shiftCount,chipherChar,decryptedChar);
    initial begin
        plainChar = "A";shiftCount = 5'd3;#250; 
        plainChar = "F";shiftCount = 5'd3;#250; 
        plainChar = "X";shiftCount = 5'd3;#250; 
        plainChar = "X";shiftCount = 5'd5;#250; 
    
    end
endmodule
module CaesarEnvironment_test();
    reg [7:0] plainChar;
    reg [4:0] shiftCount;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;
    

    CaesarEnvironment CE(plainChar,shiftCount,chipherChar,decryptedChar);
    initial begin
        plainChar = "A";shiftCount = 5'd3;#250; 
        plainChar = "F";shiftCount = 5'd3;#250; 
        plainChar = "X";shiftCount = 5'd3;#250; 
        plainChar = "X";shiftCount = 5'd5;#250; 
    
    end
endmodule


module VigenereEncryption_test();
    reg [7:0] plainChar;
    reg [79:0] keyInput;
    reg load;
    reg CLK;
    wire [7:0] chipherChar;

    VigenereEncryption VE(plainChar,keyInput,load,CLK,chipherChar);
    always #25 CLK = ~CLK;
    initial begin
        CLK = 0; plainChar = 0;load = 0;keyInput ="KADIROZLEM";#25; 
        load = 1;plainChar = "I";keyInput ="KADIROZLEM";#25; 
        
        load = 0;plainChar = "I";#25;
        plainChar = "S";#50;
        plainChar = "T";#50;
        plainChar = "A";#50;
        plainChar = "N";#50;
        plainChar = "B";#50;
        plainChar = "U";#50;
        plainChar = "L";#50;
        plainChar = "T";#50;
        plainChar = "E";#50;
        plainChar = "C";#50;
        plainChar = "H";#50;
        plainChar = "N";#50;
        plainChar = "I";#50;
        plainChar = "C";#50;
        
        plainChar = "";#50;
        
 
    end
endmodule
module VigenereDecryption_test();
    reg [7:0] chipherChar;
    reg [79:0] keyInput;
    reg load;
    reg CLK;
    wire [7:0] decryptedChar;
    

    VigenereDecryption VD(chipherChar,keyInput,load,CLK,decryptedChar);
    always #25 CLK = ~CLK;
    initial begin
        CLK = 0; chipherChar = 0;load = 0;keyInput ="KADIROZLEM";#25; 
        load = 1;chipherChar = "S";keyInput ="KADIROZLEM";#25; 
        
        load = 0;chipherChar = "S";#25;
        chipherChar = "S";#50;
        chipherChar = "W";#50;
        chipherChar = "I";#50;
        chipherChar = "E";#50;
        chipherChar = "P";#50;
        chipherChar = "T";#50;
        chipherChar = "W";#50;
        chipherChar = "X";#50;
        chipherChar = "Q";#50;
        chipherChar = "M";#50;
        chipherChar = "H";#50;
        chipherChar = "Q";#50;
        chipherChar = "Q";#50;
        chipherChar = "T";#50;
        chipherChar = "";#50;
        
 
    end
endmodule

module VigenereEnvironment_test();
    reg [7:0] plainChar;
    reg [79:0] keyInput;
    reg load;
    reg CLK;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;
    

    VigenereEnvironment VE(plainChar,keyInput,load,CLK,chipherChar,decryptedChar);
    always #25 CLK = ~CLK;
    initial begin
        CLK = 0; plainChar = 0;load = 0;keyInput ="KADIROZLEM";#25; 
        load = 1;plainChar = "I";keyInput ="KADIROZLEM";#25; 
        
        load = 0;plainChar = "I";#25;
        plainChar = "S";#50;
        plainChar = "T";#50;
        plainChar = "A";#50;
        plainChar = "N";#50;
        plainChar = "B";#50;
        plainChar = "U";#50;
        plainChar = "L";#50;
        plainChar = "T";#50;
        plainChar = "E";#50;
        plainChar = "C";#50;
        plainChar = "H";#50;
        plainChar = "N";#50;
        plainChar = "I";#50;
        plainChar = "C";#50;
        plainChar = "";#50;
        
 
    end
endmodule
