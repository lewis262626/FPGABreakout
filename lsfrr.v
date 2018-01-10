`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2017 00:09:14
// Design Name: 
// Module Name: lsfrr
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


module lsfrr(
    input gameclk,
    output reg [9:0] y_loc
    );
    
    reg [9:0] y_internal = 9'd112;
    
    always @(posedge gameclk)
    begin
        y_loc <= {y_loc[8:0], y_loc[9] ^ y_loc[0]};
    end
    
endmodule
