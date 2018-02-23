--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: tcu_top_synthesis.vhd
-- /___/   /\     Timestamp: Thu Feb 22 14:53:05 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm tcu_top -w -dir netgen/synthesis -ofmt vhdl -sim tcu_top.ngc tcu_top_synthesis.vhd 
-- Device	: xc6slx150t-4-fgg676
-- Input file	: tcu_top.ngc
-- Output file	: /home/brad/tcu_v2/tcu_gateware/ise/test_1KHz/test_1KHz/netgen/synthesis/tcu_top_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: tcu_top
-- Xilinx	: /opt/Xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity tcu_top is
  port (
    sys_clk_100MHz_ext_IN : in STD_LOGIC := 'X'; 
    sys_clk_100MHz_int_p_IN : in STD_LOGIC := 'X'; 
    sys_clk_100MHz_int_n_IN : in STD_LOGIC := 'X'; 
    gpio_IN : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    gpio_OUT : out STD_LOGIC_VECTOR ( 15 downto 2 ); 
    led_OUT : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end tcu_top;

architecture Structure of tcu_top is
  component clk_wiz_v3_6
    port (
      CLK_IN : in STD_LOGIC := 'X'; 
      CLK_400MHz_OUT : out STD_LOGIC; 
      CLK_100MHz_OUT : out STD_LOGIC; 
      CLK_10MHz_OUT : out STD_LOGIC; 
      LOCKED : out STD_LOGIC 
    );
  end component;
  signal sys_clk_100MHz_ext : STD_LOGIC; 
  signal led_OUT_0_OBUF_4 : STD_LOGIC; 
  signal NLW_IBUFGDS_inst_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_Inst_clk_wiz_v3_6_CLK_400MHz_OUT_UNCONNECTED : STD_LOGIC; 
  signal NLW_Inst_clk_wiz_v3_6_CLK_100MHz_OUT_UNCONNECTED : STD_LOGIC; 
  signal NLW_Inst_clk_wiz_v3_6_CLK_10MHz_OUT_UNCONNECTED : STD_LOGIC; 
  signal NLW_Inst_clk_wiz_v3_6_LOCKED_UNCONNECTED : STD_LOGIC; 
begin
  XST_GND : GND
    port map (
      G => led_OUT_0_OBUF_4
    );
  IBUFG_inst : IBUFG
    generic map(
      CAPACITANCE => "DONT_CARE",
      IBUF_DELAY_VALUE => "0",
      IBUF_LOW_PWR => FALSE,
      IOSTANDARD => "DEFAULT"
    )
    port map (
      I => sys_clk_100MHz_ext_IN,
      O => sys_clk_100MHz_ext
    );
  IBUFGDS_inst : IBUFGDS
    generic map(
      CAPACITANCE => "DONT_CARE",
      DIFF_TERM => FALSE,
      IBUF_DELAY_VALUE => "0",
      IBUF_LOW_PWR => FALSE,
      IOSTANDARD => "DEFAULT"
    )
    port map (
      I => sys_clk_100MHz_int_p_IN,
      IB => sys_clk_100MHz_int_n_IN,
      O => NLW_IBUFGDS_inst_O_UNCONNECTED
    );
  Inst_clk_wiz_v3_6 : clk_wiz_v3_6
    port map (
      CLK_IN => sys_clk_100MHz_ext,
      CLK_400MHz_OUT => NLW_Inst_clk_wiz_v3_6_CLK_400MHz_OUT_UNCONNECTED,
      CLK_100MHz_OUT => NLW_Inst_clk_wiz_v3_6_CLK_100MHz_OUT_UNCONNECTED,
      CLK_10MHz_OUT => NLW_Inst_clk_wiz_v3_6_CLK_10MHz_OUT_UNCONNECTED,
      LOCKED => NLW_Inst_clk_wiz_v3_6_LOCKED_UNCONNECTED
    );
  gpio_OUT_15_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(15)
    );
  gpio_OUT_14_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(14)
    );
  gpio_OUT_13_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(13)
    );
  gpio_OUT_12_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(12)
    );
  gpio_OUT_11_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(11)
    );
  gpio_OUT_10_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(10)
    );
  gpio_OUT_9_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(9)
    );
  gpio_OUT_8_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(8)
    );
  gpio_OUT_7_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(7)
    );
  gpio_OUT_6_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(6)
    );
  gpio_OUT_5_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(5)
    );
  gpio_OUT_4_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(4)
    );
  gpio_OUT_3_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(3)
    );
  gpio_OUT_2_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => gpio_OUT(2)
    );
  led_OUT_7_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => led_OUT(7)
    );
  led_OUT_6_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => led_OUT(6)
    );
  led_OUT_5_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => led_OUT(5)
    );
  led_OUT_4_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => led_OUT(4)
    );
  led_OUT_3_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => led_OUT(3)
    );
  led_OUT_2_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => led_OUT(2)
    );
  led_OUT_1_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => led_OUT(1)
    );
  led_OUT_0_OBUF : OBUF
    port map (
      I => led_OUT_0_OBUF_4,
      O => led_OUT(0)
    );

end Structure;

