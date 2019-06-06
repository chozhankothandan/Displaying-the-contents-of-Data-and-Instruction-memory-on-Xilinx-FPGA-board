`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2019 01:48:07
// Design Name: 
// Module Name: slowclk
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


module slowclk(input clk,reset,output reg [15:0]led);
reg[31:0]INSTR_MEM[0:127];
reg[31:0]DATA_CONST_MEM[0:127];
reg[8:0]i;

    initial begin
    //----------------------------------------------------------------
    // Instruction Memory
    //----------------------------------------------------------------
                INSTR_MEM[0] = 32'hE59F11F8; 
                INSTR_MEM[1] = 32'hE59F21F8; 
                INSTR_MEM[2] = 32'hE59F3200; 
                INSTR_MEM[3] = 32'hE5924000; 
                INSTR_MEM[4] = 32'hE5814000; 
                INSTR_MEM[5] = 32'hE2533001; 
                INSTR_MEM[6] = 32'h1AFFFFFB; 
                INSTR_MEM[7] = 32'hEAFFFFFE; 
                for(i = 8; i < 128; i = i+1) begin 
                    INSTR_MEM[i] = 32'h0; 
                end
                i = 0;
    
    //----------------------------------------------------------------
    // Data (Constant) Memory
    //----------------------------------------------------------------
                DATA_CONST_MEM[0] = 32'h00000C00; 
                DATA_CONST_MEM[1] = 32'h00000C04; 
                DATA_CONST_MEM[2] = 32'h00000C08; 
                DATA_CONST_MEM[3] = 32'h00000C0C; 
                DATA_CONST_MEM[4] = 32'h00000006; 
                DATA_CONST_MEM[5] = 32'hABCD1234; 
                DATA_CONST_MEM[6] = 32'h6C6C6548; 
                DATA_CONST_MEM[7] = 32'h6F57206F; 
                DATA_CONST_MEM[8] = 32'h21646C72; 
                DATA_CONST_MEM[9] = 32'h00212121; 
                for(i = 10; i < 128; i = i+1) begin 
                    DATA_CONST_MEM[i] = 32'h0; 
                end
                i = 0;
    end
    
   always@(posedge clk)
    begin                   
      if(reset)
       begin
          i = 0;
          //led =0;
        end
      else
        i = i + 1;
    end
       
    always @(i)
    begin
      if(i[8])
        begin
          if (i[0] ) 
           begin
                 led = DATA_CONST_MEM[i[7:1]][15:0];
            end
        else
           begin
                 led = DATA_CONST_MEM[i[7:1]][31:16];
           end    
        end
else
    begin
        if(i[0])
            begin
                led = INSTR_MEM[i[7:1]][15:0];  
            end
        else 
            begin
                led = INSTR_MEM[i[7:1]][31:16];
            end
    end
   end
endmodule    