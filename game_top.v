`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2017 14:54:35
// Design Name: 
// Module Name: game_top
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


module game_top(
    input clk,
    input b1,
    input b2,
    input b3,
    input b4,
    output [3:0] pix_r,
    output [3:0] pix_g,
    output [3:0] pix_b,
    output hsync,
    output vsync
                );
                
     wire clkgen;
     
             
    wire [3:0] pixval_red;
    wire [3:0] pixval_green;
    wire [3:0] pixval_blue;
    
    wire clk_out; // this is the clk to use!!!

  clk_wiz_1 clock
   (
   .clk_out2(clk_out),
    // Clock out ports
    .clk_out1(clkgen),     // output clk_out1
   // Clock in ports
    .clk_in1(clk));      // input clk_in1
// INST_TAG_END ------ End INSTANTIATION Template ---------

    wire clk_60hz;
    clk_div_60hz c1(
                    .clk_in(clk_out),
                    .clk_out(clk_60hz)
                    );
     wire [10:0] pipe_x;
     wire [9:0] pipe_y;
     lsfrr l1(
               .gameclk(clk_60hz),
               .y_loc(pipe_y)
               );
               
       
       
    wire [10:0] cur_x;
    wire [9:0] cur_y;

    vga_out v1(.clkgen(clkgen),
                .red_val(pixval_red),
                .green_val(pixval_green),
                .blue_val(pixval_blue),
                .cur_x(cur_x),
                .cur_y(cur_y),
                .pix_r(pix_r),
                .pix_b(pix_b),
                .pix_g(pix_g),
                .hsync(hsync),
                .vsync(vsync)
                ); 
                
       reg [10:0] paddle_x = 700;
       reg [9:0] paddle_y = 850;
       
       reg [10:0] ball_x = 100;
       reg [9:0] ball_y = 200;
       

     drawcon dc(
                 .clk(clk),   
                 .draw_x(cur_x),
                 .draw_y(cur_y),
                 .paddle_x(paddle_x),
                 .paddle_y(paddle_y),
                 .ball_x(ball_x),
                 .ball_y(ball_y),
                 .draw_r(pixval_red),
                 .draw_g(pixval_green),
                 .draw_b(pixval_blue)  
                 );  
                 
    always @(posedge clk_60hz)
    begin
        if (b1)
            paddle_x <= paddle_x + 10;
        if (b2)
            paddle_x <= paddle_x - 10;
        if (b3)
            paddle_x <= paddle_x + 10;
            
        if (ball_x <= 10 || ball_x >= 1430 || ball_y <= 15 || ball_y >= 900)
        begin
            ball_x <= 100;
            ball_y <= 200;
        end
        
        if (paddle_x <= 10)
        begin
            paddle_x <= paddle_x + 10;
        end
        else if (paddle_y <= 10)
            paddle_y <= paddle_y + 10;
        else if (paddle_x >= 1300)
        begin
            paddle_x <= paddle_x - 10;
        end
        
        else if (paddle_y >= 890)
            paddle_y <= paddle_y - 10;
        
        if (ball_x > paddle_x && ball_x + ball_x > paddle_x && ball_y > paddle_y + paddle_y && ball_y + ball_y < paddle_y)
            ball_y <= ball_y - 500;
        else
            ball_y <= ball_y + 10;
    end                 
endmodule