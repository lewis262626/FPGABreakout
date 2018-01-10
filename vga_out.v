`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2017 14:17:05
// Design Name: 
// Module Name: vga_out
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


module vga_out(
    input clkgen,
    input [3:0] red_val,
    input [3:0] green_val,
    input [3:0] blue_val,
    output [3:0] pix_r,
    output [3:0] pix_g,
    output [3:0] pix_b,
    output hsync,
    output vsync,
    output reg [10:0] cur_x =0,
    output reg [9:0] cur_y =0
    );
    
    reg [10:0] hcount = 0;
    reg [9:0] vcount = 0;
    
    always @(posedge clkgen)
    begin
        if (hcount == 1903)
        begin
            hcount <=0;
            if (vcount == 931)
                vcount <= 0;
             else
                vcount <= vcount + 1;
         end
         else
            hcount <= hcount + 1;
            
      if ((383 <hcount) & (hcount < 1824) & (30 <vcount) & (vcount < 931))
      begin
        cur_x <= hcount - 383;
        cur_y <= vcount - 30;
      end
      end
    
    
            
    
    assign hsync = (hcount <= 151 && hcount >= 0) ? 1'b0 : 1'b1;
    assign vsync = (vcount <= 2 && vcount >= 0) ? 1'b1 : 1'b0;
    
    
    // now setting pixel values using assign statements
    assign pix_r = ((hcount >= 384) && (hcount <= 1823) && (vcount >= 31) && (vcount <= 930)) ? red_val : 4'b0000;
    assign pix_g = ((hcount >= 384) && (hcount <= 1823) && (vcount >= 31) && (vcount <= 930)) ? green_val : 4'b0000;
    assign pix_b = ((hcount >= 384) && (hcount <= 1823) && (vcount >= 31) && (vcount <= 930)) ? blue_val : 4'b0000;
    
endmodule
