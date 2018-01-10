`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2017 20:36:48
// Design Name: 
// Module Name: drawcon
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


module drawcon(
    input clk,
    input [10:0] paddle_x,
    input [9:0]  paddle_y,
    input [10:0] ball_x,
    input [9:0] ball_y,
    input [10:0] draw_x,
    input [9:0]  draw_y,
    output reg [3:0] draw_r,
    output reg [3:0] draw_g,
    output reg [3:0] draw_b
    );
    
    
    //border
    always @(*)
    begin
        if ((draw_x >=0 && draw_x < 10) || (draw_x >= 1430 && draw_x <= 1440) || (draw_y >= 0 && draw_y <= 10) || (draw_y >= 890 && draw_y <= 900))
        begin
            draw_r <= 4'b0000;
            draw_g <= 4'b1111;
            draw_b <= 4'b0000;
        end
        else
        begin
            draw_r <= 4'b0000;
            draw_g <= 4'b0000;
            draw_b <= 4'b0000;
        end
        
         if ((draw_x >= paddle_x && draw_x <= paddle_x + 120) && (draw_y >= paddle_y && draw_y <= paddle_y + 10))
              begin
                   draw_r <= 4'b0000;
                   draw_g <= 4'b1111;
                   draw_b <= 4'b0000;
              end
              
              if ((draw_x >= ball_x && draw_x <= ball_x + 24) && (draw_y >= ball_y && draw_y <= ball_y + 24))
                      begin
                          draw_r <= 4'b0000;
                          draw_g <= 4'b1111;
                          draw_b <= 4'b0000;
                      end
    end

    
    reg [3:0] ball_r;
    reg [3:0] ball_g;
    reg [3:0] ball_b;
    
//    always @(*)
//    begin
//        if (blk_r != 0 || blk_g != 0 || blk_b != 0)
//        begin
//            draw_r <= blk_r;
//            draw_g <= blk_g;
//            draw_b <= blk_b;
//        end
//         else
//        begin
//            draw_r <= bg_r;
//            draw_g <= bg_g;
//            draw_b <= bg_b;
//        end
//    end
endmodule
