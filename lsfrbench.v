`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2017 01:35:55
// Design Name: 
// Module Name: lsfrbench
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


module lsfrbench(

    );
    
    reg clk = 0;
    
  always
  begin
  
  
    #1 clk <= ~clk;
  end
  
  reg [10:0] x_out;
  reg [9:0] y_out;
    
    lsfrr tb1(
              .clk(clk),
              .x_loc(x_out),
              .y_loc(y_out)
              );
endmodule
