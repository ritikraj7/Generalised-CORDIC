`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2020 21:37:50
// Design Name: 
// Module Name: testbenchCORDIC
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


module testbenchCORDIC;
  reg clk;
  reg [2:0]mode;
  //integer mode; 
  reg[31:0] in,in2;
  wire[31:0] x,y,z;
  CORDIC_BEHAVIORAL r1(in,in2,mode,clk,x,y,z);
  initial 
  begin
    clk=1'b1;
 end
  always 
    #10 clk=~clk; 
  initial 
    begin
       mode = 3'b000;
        in = 32'b00000000000111100000000000000000;
        /*
         mode = 3'b001;
        in = 32'b00000000000000010000000000000000;
        
        mode = 3'b010;
        in=32'b00000000000111100000000000000000;
        in2= 32'b00000000000000100000000000000000;
        
        mode = 3'b011;
        in=32'b00000000000111100000000000000000;
        in2= 32'b00000000000000100000000000000000;
        
        mode = 3'b100;
        in = 32'b00000000000000010000000000000000;
        
        mode = 3'b101;
        in = 32'b00000000000000001000000000000000;*/
      #300 $finish;
    end
initial
    $monitor("X=  ",x," Y= ",y," Z= ",z); 
endmodule
   
