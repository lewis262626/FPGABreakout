`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2017 15:24:09
// Design Name: 
// Module Name: clk_div_60hz
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

// assume 6Mhz clk_in;

module clk_div_60hz(
    input clk_in,
    output reg clk_out
    );
    
    reg [0:16] count; // 17bit counter as log(100000) ~ 17 bits
    
    always @(posedge clk_in)
    begin
        count <= count + 1;
        if (count == 100000)
        begin
            count <= 0;
            clk_out <= ~clk_out;
        end
    end
endmodule
