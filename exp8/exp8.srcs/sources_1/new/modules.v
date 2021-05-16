`timescale 1ns / 1ps

module CharDecoder(
    input [7:0] char,
    output [25:0] decodedChar
    );
    integer difference;
    reg [26:0] out;
    always @* begin
        difference = char - 65;
        out = 26'd1;
        out = out << difference;
    end
    
    assign decodedChar = out;
endmodule


module CharEncoder(
    input [25:0] decodedChar,
    output [7:0] char
);
    reg [25:0] in;
    integer count;
    always @* begin
        count = 8'd0;
        in = decodedChar;
        for(count = 0; count< 26 && in!=26'd1 && in != 26'd0;count= count+1) begin
                in = in >> 1;
        end
    end
    
    assign char = count + 65;
endmodule

module CircularRightShift(
    input [25:0] data,
    input [4:0] shiftAmount,
    output [25:0] out
);
    integer i,j;
    
    reg [25:0] o,in;
always @(*)
begin
    in = data;
    for(j = 0;j<shiftAmount;j=j+1) begin
        o = in; 
        o[25] = in[0]; 
        for (i=0; i<25; i=i+1)
        begin
            o[i] = in[i+1];
        end
        in = o;
    end
end
assign out = o;

endmodule

module CircularLeftShift(
    input [25:0] data,
    input [4:0] shiftAmount,
    output [25:0] out
);
    integer i,j;
    
    reg [25:0] o,in;
always @(*)
begin
    in = data;
    for(j = 0;j<shiftAmount;j=j+1) begin
        o = in;
        o[0] = in[25];
        for (i=0; i<25; i=i+1)
        begin
            o[i+1] = in[i];
        end
        in = o;
    end
end
assign out = o;

endmodule   

module CaesarEncryption(
    input [7:0] plainChar,
    input [4:0] shiftCount,
    output [7:0] chipherChar
);
    assign chipherChar = (plainChar - 65 + shiftCount)%26 + 65;
   

endmodule
module CaesarDecryption(
    input [7:0] chiperChar,
    input [4:0] shiftCount,
    output [7:0] decryptedChar
    
);
    assign decryptedChar = (chiperChar-65-shiftCount+  26)%26 + 65;
endmodule

module CaesarEnvironment(
    input [7:0] plainChar,
    input [4:0] shiftCount,
    output [7:0] chipherChar,
    output [7:0] decryptedChar
    
);
    
    CaesarEncryption CE(plainChar,shiftCount,chipherChar);
    CaesarDecryption CD(chipherChar,shiftCount,decryptedChar);
endmodule

module VigenereEncryption(
    input [7:0] plainChar,
    input [79:0] keyInput,
    input load,
    input CLK,
    output [7:0] chiperChar
);
    reg [7:0] temp;
    reg [79:0] keyRegister;
    always@(posedge load) begin
        keyRegister = keyInput;
    end
    always@(posedge CLK) begin
        if(load == 0)begin
            temp = keyRegister[79:72];
            keyRegister = keyRegister << 8;
            keyRegister[7:0] = temp;
        end
        
    end
    
    assign chiperChar =  (plainChar-65 + keyRegister[79:72]-65)%26 + 65;
        

endmodule

module VigenereDecryption(
    input [7:0] chipherChar,
    input [79:0] keyInput,
    input load,
    input CLK,
    output [7:0] decryptedChar
);
    reg [7:0] temp;
    reg [7:0] out;
    reg [79:0] keyRegister;
    always@(posedge load) begin
        keyRegister = keyInput;
    end
    always@(posedge CLK) begin
        if(load == 0)begin
            temp = keyRegister[79:72];
            keyRegister = keyRegister << 8;
            keyRegister[7:0] = temp;
        end
        
    end
    assign decryptedChar = (chipherChar - keyRegister[79:72] + 26)%26 + 65;

endmodule


module VigenereEnvironment(
    input [7:0] plainChar,
    input [79:0] keyInput,
    input load,
    input CLK,
    output [7:0] chipherChar,
    output [7:0] decryptedChar
    
);
    
    VigenereEncryption VE(plainChar,keyInput,load,CLK,chipherChar);
    VigenereDecryption VD(chipherChar,keyInput,load,CLK,decryptedChar);
    
endmodule