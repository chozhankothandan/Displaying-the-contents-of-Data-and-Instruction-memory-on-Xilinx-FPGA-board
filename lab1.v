`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2019 23:48:14
// Design Name: 
// Module Name: lab1
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


module lab1(input BTNU,BTNC,reset,clk,output [15:0]led);
        wire [31:0] cntr;
        wire clk_slow;
        clock inst_fclk(clk,reset,cntr);                  
        mux inst_mux(BNTU_q,cntr,clk_slow);
        dff inst_bntu(clk,BTNU,BNTU_q);
        dff inst_bntc(clk,BTNC,BNTC_q); 
        slowclk inst_sclk(clk_g,reset,led);
        assign clk_g = clk_slow & ~BNTC_q; 
endmodule
