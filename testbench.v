`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2017 14:53:10
// Design Name: 
// Module Name: testbench
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


module testbench(

    );
    
    reg clk = 0;
    wire [3:0] pix_r;
    wire [3:0] pix_g;
    wire [3:0] pix_b;
    wire hsync;
    wire vsync;
    wire cur_x;
    wire cur_y;
    always
    begin
        #1 clk = ~clk;
    end
    
    game_top vga1(.clk(clk),
     .pix_r(pix_r),
     .pix_g(pix_g),
     .pix_b(pix_b),
     .hsync(hsync),
     .vsync(vsync));
     
endmodule
