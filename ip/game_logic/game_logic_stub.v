// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
// Date        : Fri Dec  1 15:18:03 2017
// Host        : A205-27 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub {h:/Documents/YEAR
//               3/fpga_game/LAB4.srcs/sources_1/ip/game_logic/game_logic_stub.v}
// Design      : game_logic
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module game_logic(clk_out1, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out1,clk_in1" */;
  output clk_out1;
  input clk_in1;
endmodule
