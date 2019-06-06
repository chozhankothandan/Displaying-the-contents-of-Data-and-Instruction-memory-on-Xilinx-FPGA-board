`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2019 00:52:06
// Design Name: 
// Module Name: clock
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
////////////////// ////////////////////////////////////////////////////////////////


module clock(input clk,reset,output reg [31:0]cntr);
always@(posedge clk)
begin
    if(reset)
        cntr <= 0;
    else
        cntr <= cntr + 1;
end
endmodule
