-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2.1 (win64) Build 1957588 Wed Aug  9 16:32:24 MDT 2017
-- Date        : Fri Dec  1 15:18:03 2017
-- Host        : A205-27 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub {h:/Documents/YEAR
--               3/fpga_game/LAB4.srcs/sources_1/ip/game_logic/game_logic_stub.vhdl}
-- Design      : game_logic
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity game_logic is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end game_logic;

architecture stub of game_logic is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_in1";
begin
end;
