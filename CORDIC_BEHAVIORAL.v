// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2020 16:34:12
// Design Name: 
// Module Name: CORDIC_BEHAVIORAL
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


module CORDIC_BEHAVIORAL(in,in2,mode,clk,x_prev,y_prev,z_prev);
input in,mode,clk,in2;
output x_prev,y_prev,z_prev;
reg signed [31:0] x_prev,y_prev,z_prev,E,check,x_new,y_new,z_new;
reg signed [63:0] x_temp,y_temp;
reg temp;
wire[31:0] in,in2;
wire[2:0] mode;
integer i,d;
integer mu;
initial
begin
    i=0;
    x_temp=0;
    y_temp=0;
end
always@(posedge clk)
begin
    if(i==0)
    begin
        case(mode)
            0:
            begin
                x_prev = 32'b00000000000000001001101101110100;
                y_prev = 32'b00000000000000000000000000000000;
                z_prev=in;
                mu=1;
            end
            1:
            begin
                x_prev = 32'b00000000000000010000000000000000;
                z_prev = 32'b00000000000000000000000000000000;
                y_prev = in;
                mu=1;
            end
            2:
            begin
                mu=0;
                y_prev = 32'b00000000000000000000000000000000;
                x_prev=in;
                z_prev=in2;
            end
            3:
            begin
                mu=0;
                z_prev = 32'b00000000000000000000000000000000;
                x_prev=in;
                y_prev=in2;
            end
            4,5:temp=1;
        endcase
    end
    if(temp==1)
    begin
        case(mode)
            4:
            begin
                i=1;
                mu=-1;
                x_prev = 32'b00000000000000010011010100011110;
                y_prev = 0;
                z_prev = in;
            end
            5:
            begin
                i=1;
                mu=-1;
                x_prev = 32'b00000000000000010000000000000000;
                z_prev = 32'b00000000000000000000000000000000;
                y_prev = in;
            end
        endcase
        temp=0;
    end
    if(i<10)
    begin
        case(mode)
            0,1:
            begin
                case(i)
                    0 : E = 32'b00000000001011010000000000000000;
                    1 : E = 32'b00000000000110101001000010100111;
                    2 : E = 32'b00000000000011100000100101000111;
                    3 : E = 32'b00000000000001110010000000000001;
                    4 : E = 32'b00000000000000111001001110001010;
                    5 : E = 32'b00000000000000011100101000110111;
                    6 : E = 32'b00000000000000001110010100101010;
                    7 : E = 32'b00000000000000000111001010010110;
                    8 : E = 32'b00000000000000000011100101001011;
                    9 : E = 32'b00000000000000000001110010100101;
                endcase
            end
            2,3:
            begin
                case(i)
                    0 : E = 32'b00000000000000010000000000000000;
                    1 : E = 32'b00000000000000001000000000000000;
                    2 : E = 32'b00000000000000000100000000000000;
                    3 : E = 32'b00000000000000000010000000000000;
                    4 : E = 32'b00000000000000000001000000000000;
                    5 : E = 32'b00000000000000000000100000000000;
                    6 : E = 32'b00000000000000000000010000000000;
                    7 : E = 32'b00000000000000000000001000000000;
                    8 : E = 32'b00000000000000000000000100000000;
                    9 : E = 32'b00000000000000000000000010000000;
                endcase
            end
            4,5:
            begin
                case(i)
                    1 : E = 32'b00000000000000001000110010011111;
                    2 : E = 32'b00000000000000000100000101100010;
                    3 : E = 32'b00000000000000000010000000101011;
                    4 : E = 32'b00000000000000000001000000000101;
                    5 : E = 32'b00000000000000000000100000000000;
                    6 : E = 32'b00000000000000000000010000000000;
                    7 : E = 32'b00000000000000000000001000000000;
                    8 : E = 32'b00000000000000000000000100000000;
                    9 : E = 32'b00000000000000000000000010000000;
                endcase
            end
        endcase   
        case(mode)
            0,2,4:check = z_prev;
            1,3,5:check = -y_prev;
        endcase
        if(check>0)
            d = 1;
        else
            d = -1;  
        x_temp = (mu * d * y_prev)>>>i;
        y_temp = (d * x_prev)>>>i;
        x_new = x_prev - x_temp[31:0];
        y_new = y_prev + y_temp[31:0];
        z_new = z_prev - d * E;
        x_prev = x_new;
        y_prev = y_new;
        z_prev = z_new;
        i = i + 1;
    end
end
endmodule
