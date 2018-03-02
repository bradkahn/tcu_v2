--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: tcu_fc_synthesis.vhd
-- /___/   /\     Timestamp: Fri Mar  2 13:18:12 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm tcu_fc -w -dir netgen/synthesis -ofmt vhdl -sim tcu_fc.ngc tcu_fc_synthesis.vhd 
-- Device	: xc6slx150t-3-fgg676
-- Input file	: tcu_fc.ngc
-- Output file	: /home/brad/tcu_v2/tcu_gateware/ise/tcu_fc/netgen/synthesis/tcu_fc_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: tcu_fc
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

entity tcu_fc is
  port (
    clk_IN : in STD_LOGIC := 'X'; 
    rst_IN : in STD_LOGIC := 'X'; 
    trigger_IN : in STD_LOGIC := 'X'; 
    bias_X_OUT : out STD_LOGIC; 
    bias_L_OUT : out STD_LOGIC; 
    pol_tx_X_OUT : out STD_LOGIC; 
    bias_tx_L_OUT : out STD_LOGIC; 
    bias_rx_L_OUT : out STD_LOGIC; 
    pri_OUT : out STD_LOGIC; 
    instruction_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    num_pulses_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    num_repeats_IN : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    x_amp_delay_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    l_amp_delay_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    pri_pulse_width_IN : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    pulse_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_index_OUT : out STD_LOGIC_VECTOR ( 4 downto 0 ); 
    status_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end tcu_fc;

architecture Structure of tcu_fc is
  signal pri_OUT_OBUF_0 : STD_LOGIC; 
begin
  XST_GND : GND
    port map (
      G => pri_OUT_OBUF_0
    );
  pri_OUT_OBUF : OBUF
    port map (
      I => pri_OUT_OBUF_0,
      O => pri_OUT
    );

end Structure;

