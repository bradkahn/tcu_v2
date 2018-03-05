--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: tcu_registers_synthesis.vhd
-- /___/   /\     Timestamp: Mon Mar  5 09:18:49 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm tcu_registers -w -dir netgen/synthesis -ofmt vhdl -sim tcu_registers.ngc tcu_registers_synthesis.vhd 
-- Device	: xc6slx150t-3-fgg676
-- Input file	: tcu_registers.ngc
-- Output file	: /home/brad/tcu_v2/tcu_gateware/ise/tcu_fc/netgen/synthesis/tcu_registers_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: tcu_registers
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

entity tcu_registers is
  port (
    clk_IN : in STD_LOGIC := 'X'; 
    rst_IN : in STD_LOGIC := 'X'; 
    CLK_I : in STD_LOGIC := 'X'; 
    RST_I : in STD_LOGIC := 'X'; 
    STB_I : in STD_LOGIC := 'X'; 
    WE_I : in STD_LOGIC := 'X'; 
    ACK_O : out STD_LOGIC; 
    pulse_index_IN : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    status_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    DAT_I : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    ADR_I : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    status_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    instruction_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    num_pulses_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    num_repeats_OUT : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    x_amp_delay_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    l_amp_delay_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    pri_pulse_width_OUT : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    pulse_params_OUT : out STD_LOGIC_VECTOR ( 95 downto 0 ); 
    DAT_O : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end tcu_registers;

architecture Structure of tcu_registers is
  signal status_IN_15_IBUF_0 : STD_LOGIC; 
  signal status_IN_14_IBUF_1 : STD_LOGIC; 
  signal status_IN_13_IBUF_2 : STD_LOGIC; 
  signal status_IN_12_IBUF_3 : STD_LOGIC; 
  signal status_IN_11_IBUF_4 : STD_LOGIC; 
  signal status_IN_10_IBUF_5 : STD_LOGIC; 
  signal status_IN_9_IBUF_6 : STD_LOGIC; 
  signal status_IN_8_IBUF_7 : STD_LOGIC; 
  signal status_IN_7_IBUF_8 : STD_LOGIC; 
  signal status_IN_6_IBUF_9 : STD_LOGIC; 
  signal status_IN_5_IBUF_10 : STD_LOGIC; 
  signal status_IN_4_IBUF_11 : STD_LOGIC; 
  signal status_IN_3_IBUF_12 : STD_LOGIC; 
  signal status_IN_2_IBUF_13 : STD_LOGIC; 
  signal status_IN_1_IBUF_14 : STD_LOGIC; 
  signal status_IN_0_IBUF_15 : STD_LOGIC; 
  signal DAT_I_15_IBUF_16 : STD_LOGIC; 
  signal DAT_I_14_IBUF_17 : STD_LOGIC; 
  signal DAT_I_13_IBUF_18 : STD_LOGIC; 
  signal DAT_I_12_IBUF_19 : STD_LOGIC; 
  signal DAT_I_11_IBUF_20 : STD_LOGIC; 
  signal DAT_I_10_IBUF_21 : STD_LOGIC; 
  signal DAT_I_9_IBUF_22 : STD_LOGIC; 
  signal DAT_I_8_IBUF_23 : STD_LOGIC; 
  signal DAT_I_7_IBUF_24 : STD_LOGIC; 
  signal DAT_I_6_IBUF_25 : STD_LOGIC; 
  signal DAT_I_5_IBUF_26 : STD_LOGIC; 
  signal DAT_I_4_IBUF_27 : STD_LOGIC; 
  signal DAT_I_3_IBUF_28 : STD_LOGIC; 
  signal DAT_I_2_IBUF_29 : STD_LOGIC; 
  signal DAT_I_1_IBUF_30 : STD_LOGIC; 
  signal DAT_I_0_IBUF_31 : STD_LOGIC; 
  signal ADR_I_7_IBUF_32 : STD_LOGIC; 
  signal ADR_I_6_IBUF_33 : STD_LOGIC; 
  signal ADR_I_5_IBUF_34 : STD_LOGIC; 
  signal ADR_I_4_IBUF_35 : STD_LOGIC; 
  signal ADR_I_3_IBUF_36 : STD_LOGIC; 
  signal ADR_I_2_IBUF_37 : STD_LOGIC; 
  signal ADR_I_1_IBUF_38 : STD_LOGIC; 
  signal ADR_I_0_IBUF_39 : STD_LOGIC; 
  signal clk_IN_BUFGP_40 : STD_LOGIC; 
  signal CLK_I_BUFGP_41 : STD_LOGIC; 
  signal STB_I_IBUF_42 : STD_LOGIC; 
  signal WE_I_IBUF_43 : STD_LOGIC; 
  signal n0235_5_0_4_Q : STD_LOGIC; 
  signal n0235_5_0_3_Q : STD_LOGIC; 
  signal n0235_5_0_2_Q : STD_LOGIC; 
  signal n0235_5_0_1_Q : STD_LOGIC; 
  signal n0235_5_0_0_Q : STD_LOGIC; 
  signal n0237_5_0_4_Q : STD_LOGIC; 
  signal n0237_5_0_3_Q : STD_LOGIC; 
  signal n0237_5_0_2_Q : STD_LOGIC; 
  signal n0237_5_0_1_Q : STD_LOGIC; 
  signal n0239_5_0_4_Q : STD_LOGIC; 
  signal n0239_5_0_3_Q : STD_LOGIC; 
  signal n0239_5_0_2_Q : STD_LOGIC; 
  signal n0239_5_0_1_Q : STD_LOGIC; 
  signal n0241_5_0_4_Q : STD_LOGIC; 
  signal n0241_5_0_3_Q : STD_LOGIC; 
  signal n0241_5_0_2_Q : STD_LOGIC; 
  signal n0243_5_0_4_Q : STD_LOGIC; 
  signal n0243_5_0_3_Q : STD_LOGIC; 
  signal n0243_5_0_2_Q : STD_LOGIC; 
  signal ACK_O_OBUFT_312 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal WE_I_0_0 : STD_LOGIC; 
  signal Q_n3046_inv : STD_LOGIC; 
  signal Q_n3053_inv : STD_LOGIC; 
  signal Q_n3096_inv : STD_LOGIC; 
  signal Q_n3103_inv : STD_LOGIC; 
  signal STB_I_inv : STD_LOGIC; 
  signal Q_n3039_inv : STD_LOGIC; 
  signal Q_n3089_inv : STD_LOGIC; 
  signal Q_n3003_inv_322 : STD_LOGIC; 
  signal write_ctrl_323 : STD_LOGIC; 
  signal pulse_params_OUT_48_OBUF_324 : STD_LOGIC; 
  signal pulse_params_OUT_49_OBUF_325 : STD_LOGIC; 
  signal pulse_params_OUT_50_OBUF_326 : STD_LOGIC; 
  signal pulse_params_OUT_51_OBUF_327 : STD_LOGIC; 
  signal pulse_params_OUT_52_OBUF_328 : STD_LOGIC; 
  signal pulse_params_OUT_53_OBUF_329 : STD_LOGIC; 
  signal pulse_params_OUT_54_OBUF_330 : STD_LOGIC; 
  signal pulse_params_OUT_55_OBUF_331 : STD_LOGIC; 
  signal pulse_params_OUT_56_OBUF_332 : STD_LOGIC; 
  signal pulse_params_OUT_57_OBUF_333 : STD_LOGIC; 
  signal pulse_params_OUT_58_OBUF_334 : STD_LOGIC; 
  signal pulse_params_OUT_59_OBUF_335 : STD_LOGIC; 
  signal pulse_params_OUT_60_OBUF_336 : STD_LOGIC; 
  signal pulse_params_OUT_61_OBUF_337 : STD_LOGIC; 
  signal pulse_params_OUT_62_OBUF_338 : STD_LOGIC; 
  signal pulse_params_OUT_63_OBUF_339 : STD_LOGIC; 
  signal write_ctrl3_340 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal pulse_params_OUT_80_OBUF_342 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal pulse_params_OUT_81_OBUF_344 : STD_LOGIC; 
  signal N74 : STD_LOGIC; 
  signal pulse_params_OUT_82_OBUF_346 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal pulse_params_OUT_83_OBUF_348 : STD_LOGIC; 
  signal N78 : STD_LOGIC; 
  signal pulse_params_OUT_84_OBUF_350 : STD_LOGIC; 
  signal N80 : STD_LOGIC; 
  signal pulse_params_OUT_85_OBUF_352 : STD_LOGIC; 
  signal N82 : STD_LOGIC; 
  signal pulse_params_OUT_86_OBUF_354 : STD_LOGIC; 
  signal N84 : STD_LOGIC; 
  signal pulse_params_OUT_87_OBUF_356 : STD_LOGIC; 
  signal N86 : STD_LOGIC; 
  signal pulse_params_OUT_88_OBUF_358 : STD_LOGIC; 
  signal N88 : STD_LOGIC; 
  signal pulse_params_OUT_89_OBUF_360 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal pulse_params_OUT_90_OBUF_362 : STD_LOGIC; 
  signal N92 : STD_LOGIC; 
  signal pulse_params_OUT_91_OBUF_364 : STD_LOGIC; 
  signal N94 : STD_LOGIC; 
  signal pulse_params_OUT_92_OBUF_366 : STD_LOGIC; 
  signal N96 : STD_LOGIC; 
  signal pulse_params_OUT_93_OBUF_368 : STD_LOGIC; 
  signal N98 : STD_LOGIC; 
  signal pulse_params_OUT_94_OBUF_370 : STD_LOGIC; 
  signal N100 : STD_LOGIC; 
  signal pulse_params_OUT_95_OBUF_372 : STD_LOGIC; 
  signal N102 : STD_LOGIC; 
  signal N104 : STD_LOGIC; 
  signal N106 : STD_LOGIC; 
  signal N108 : STD_LOGIC; 
  signal N110 : STD_LOGIC; 
  signal N112 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal N116 : STD_LOGIC; 
  signal N118 : STD_LOGIC; 
  signal N120 : STD_LOGIC; 
  signal N122 : STD_LOGIC; 
  signal N124 : STD_LOGIC; 
  signal N126 : STD_LOGIC; 
  signal N128 : STD_LOGIC; 
  signal N130 : STD_LOGIC; 
  signal N132 : STD_LOGIC; 
  signal pulse_params_OUT_64_OBUF_389 : STD_LOGIC; 
  signal pulse_params_OUT_65_OBUF_390 : STD_LOGIC; 
  signal pulse_params_OUT_66_OBUF_391 : STD_LOGIC; 
  signal pulse_params_OUT_67_OBUF_392 : STD_LOGIC; 
  signal pulse_params_OUT_68_OBUF_393 : STD_LOGIC; 
  signal pulse_params_OUT_69_OBUF_394 : STD_LOGIC; 
  signal pulse_params_OUT_70_OBUF_395 : STD_LOGIC; 
  signal pulse_params_OUT_71_OBUF_396 : STD_LOGIC; 
  signal pulse_params_OUT_72_OBUF_397 : STD_LOGIC; 
  signal pulse_params_OUT_73_OBUF_398 : STD_LOGIC; 
  signal pulse_params_OUT_74_OBUF_399 : STD_LOGIC; 
  signal pulse_params_OUT_75_OBUF_400 : STD_LOGIC; 
  signal pulse_params_OUT_76_OBUF_401 : STD_LOGIC; 
  signal pulse_params_OUT_77_OBUF_402 : STD_LOGIC; 
  signal pulse_params_OUT_78_OBUF_403 : STD_LOGIC; 
  signal pulse_params_OUT_79_OBUF_404 : STD_LOGIC; 
  signal pulse_params_OUT_0_OBUF_405 : STD_LOGIC; 
  signal pulse_params_OUT_1_OBUF_406 : STD_LOGIC; 
  signal pulse_params_OUT_2_OBUF_407 : STD_LOGIC; 
  signal pulse_params_OUT_3_OBUF_408 : STD_LOGIC; 
  signal pulse_params_OUT_4_OBUF_409 : STD_LOGIC; 
  signal pulse_params_OUT_5_OBUF_410 : STD_LOGIC; 
  signal pulse_params_OUT_6_OBUF_411 : STD_LOGIC; 
  signal pulse_params_OUT_7_OBUF_412 : STD_LOGIC; 
  signal pulse_params_OUT_8_OBUF_413 : STD_LOGIC; 
  signal pulse_params_OUT_9_OBUF_414 : STD_LOGIC; 
  signal pulse_params_OUT_10_OBUF_415 : STD_LOGIC; 
  signal pulse_params_OUT_11_OBUF_416 : STD_LOGIC; 
  signal pulse_params_OUT_12_OBUF_417 : STD_LOGIC; 
  signal pulse_params_OUT_13_OBUF_418 : STD_LOGIC; 
  signal pulse_params_OUT_14_OBUF_419 : STD_LOGIC; 
  signal pulse_params_OUT_15_OBUF_420 : STD_LOGIC; 
  signal pulse_params_OUT_32_OBUF_421 : STD_LOGIC; 
  signal pulse_params_OUT_33_OBUF_422 : STD_LOGIC; 
  signal pulse_params_OUT_34_OBUF_423 : STD_LOGIC; 
  signal pulse_params_OUT_35_OBUF_424 : STD_LOGIC; 
  signal pulse_params_OUT_36_OBUF_425 : STD_LOGIC; 
  signal pulse_params_OUT_37_OBUF_426 : STD_LOGIC; 
  signal pulse_params_OUT_38_OBUF_427 : STD_LOGIC; 
  signal pulse_params_OUT_39_OBUF_428 : STD_LOGIC; 
  signal pulse_params_OUT_40_OBUF_429 : STD_LOGIC; 
  signal pulse_params_OUT_41_OBUF_430 : STD_LOGIC; 
  signal pulse_params_OUT_42_OBUF_431 : STD_LOGIC; 
  signal pulse_params_OUT_43_OBUF_432 : STD_LOGIC; 
  signal pulse_params_OUT_44_OBUF_433 : STD_LOGIC; 
  signal pulse_params_OUT_45_OBUF_434 : STD_LOGIC; 
  signal pulse_params_OUT_46_OBUF_435 : STD_LOGIC; 
  signal pulse_params_OUT_47_OBUF_436 : STD_LOGIC; 
  signal pulse_params_OUT_16_OBUF_437 : STD_LOGIC; 
  signal pulse_params_OUT_17_OBUF_438 : STD_LOGIC; 
  signal pulse_params_OUT_18_OBUF_439 : STD_LOGIC; 
  signal pulse_params_OUT_19_OBUF_440 : STD_LOGIC; 
  signal pulse_params_OUT_20_OBUF_441 : STD_LOGIC; 
  signal pulse_params_OUT_21_OBUF_442 : STD_LOGIC; 
  signal pulse_params_OUT_22_OBUF_443 : STD_LOGIC; 
  signal pulse_params_OUT_23_OBUF_444 : STD_LOGIC; 
  signal pulse_params_OUT_24_OBUF_445 : STD_LOGIC; 
  signal pulse_params_OUT_25_OBUF_446 : STD_LOGIC; 
  signal pulse_params_OUT_26_OBUF_447 : STD_LOGIC; 
  signal pulse_params_OUT_27_OBUF_448 : STD_LOGIC; 
  signal pulse_params_OUT_28_OBUF_449 : STD_LOGIC; 
  signal pulse_params_OUT_29_OBUF_450 : STD_LOGIC; 
  signal pulse_params_OUT_30_OBUF_451 : STD_LOGIC; 
  signal pulse_params_OUT_31_OBUF_452 : STD_LOGIC; 
  signal Madd_n0237_5_0_cy_4_Q : STD_LOGIC; 
  signal Madd_n0235_5_0_cy_0_Q : STD_LOGIC; 
  signal Madd_n0235_5_0_lut_1_Q : STD_LOGIC; 
  signal Madd_n0235_5_0_lut_2_Q : STD_LOGIC; 
  signal Madd_n0235_5_0_lut_3_Q : STD_LOGIC; 
  signal Madd_n0235_5_0_lut_4_Q : STD_LOGIC; 
  signal Madd_n0235_5_0_cy_4_Q : STD_LOGIC; 
  signal Madd_n0239_5_0_cy_4_Q : STD_LOGIC; 
  signal Madd_n0243_5_0_cy_4_Q : STD_LOGIC; 
  signal Madd_n0239_5_0_cy_4_11 : STD_LOGIC; 
  signal Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_11_463 : STD_LOGIC; 
  signal Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11_464 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT121_465 : STD_LOGIC; 
  signal Q_n3046_inv1 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT122_468 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT124_469 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT151_470 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT181_471 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT211_472 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT241_473 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT271_474 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT31_475 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT301_476 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT332_477 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT361_478 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT391_479 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT421_480 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT451_481 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT481_482 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT61_483 : STD_LOGIC; 
  signal Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT91_484 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal dat_o_sig_0_BRB0_775 : STD_LOGIC; 
  signal dat_o_sig_0_BRB1_776 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N710 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal N910 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N131 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N152 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N191 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N212 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N251 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal N272 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N311 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N331 : STD_LOGIC; 
  signal N36 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N43 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N49 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N511 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N57 : STD_LOGIC; 
  signal N60 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N63 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N721 : STD_LOGIC; 
  signal N731 : STD_LOGIC; 
  signal N741 : STD_LOGIC; 
  signal N751 : STD_LOGIC; 
  signal N781 : STD_LOGIC; 
  signal N791 : STD_LOGIC; 
  signal N801 : STD_LOGIC; 
  signal N811 : STD_LOGIC; 
  signal N841 : STD_LOGIC; 
  signal N851 : STD_LOGIC; 
  signal N861 : STD_LOGIC; 
  signal N871 : STD_LOGIC; 
  signal N901 : STD_LOGIC; 
  signal N911 : STD_LOGIC; 
  signal N921 : STD_LOGIC; 
  signal N931 : STD_LOGIC; 
  signal N961 : STD_LOGIC; 
  signal N971 : STD_LOGIC; 
  signal N981 : STD_LOGIC; 
  signal N991 : STD_LOGIC; 
  signal dat_o_sig_0_BRB6_841 : STD_LOGIC; 
  signal dat_o_sig_0_BRB7_842 : STD_LOGIC; 
  signal dat_o_sig_0_BRB8_843 : STD_LOGIC; 
  signal dat_o_sig_0_BRB9_844 : STD_LOGIC; 
  signal dat_o_sig_1_BRB6_845 : STD_LOGIC; 
  signal dat_o_sig_1_BRB7_846 : STD_LOGIC; 
  signal dat_o_sig_2_BRB6_847 : STD_LOGIC; 
  signal dat_o_sig_2_BRB7_848 : STD_LOGIC; 
  signal dat_o_sig_3_BRB6_849 : STD_LOGIC; 
  signal dat_o_sig_3_BRB7_850 : STD_LOGIC; 
  signal dat_o_sig_4_BRB6_851 : STD_LOGIC; 
  signal dat_o_sig_4_BRB7_852 : STD_LOGIC; 
  signal dat_o_sig_5_BRB6_853 : STD_LOGIC; 
  signal dat_o_sig_5_BRB7_854 : STD_LOGIC; 
  signal dat_o_sig_6_BRB6_855 : STD_LOGIC; 
  signal dat_o_sig_6_BRB7_856 : STD_LOGIC; 
  signal dat_o_sig_7_BRB6_857 : STD_LOGIC; 
  signal dat_o_sig_7_BRB7_858 : STD_LOGIC; 
  signal dat_o_sig_8_BRB6_859 : STD_LOGIC; 
  signal dat_o_sig_8_BRB7_860 : STD_LOGIC; 
  signal dat_o_sig_9_BRB6_861 : STD_LOGIC; 
  signal dat_o_sig_9_BRB7_862 : STD_LOGIC; 
  signal dat_o_sig_10_BRB6_863 : STD_LOGIC; 
  signal dat_o_sig_10_BRB7_864 : STD_LOGIC; 
  signal dat_o_sig_11_BRB6_865 : STD_LOGIC; 
  signal dat_o_sig_11_BRB7_866 : STD_LOGIC; 
  signal dat_o_sig_12_BRB6_867 : STD_LOGIC; 
  signal dat_o_sig_12_BRB7_868 : STD_LOGIC; 
  signal dat_o_sig_13_BRB6_869 : STD_LOGIC; 
  signal dat_o_sig_13_BRB7_870 : STD_LOGIC; 
  signal dat_o_sig_14_BRB6_871 : STD_LOGIC; 
  signal dat_o_sig_14_BRB7_872 : STD_LOGIC; 
  signal dat_o_sig_15_BRB6_873 : STD_LOGIC; 
  signal dat_o_sig_15_BRB7_874 : STD_LOGIC; 
  signal dat_o_sig_0_BRB4_875 : STD_LOGIC; 
  signal dat_o_sig_0_BRB10_876 : STD_LOGIC; 
  signal dat_o_sig_0_BRB11_877 : STD_LOGIC; 
  signal dat_o_sig_0_BRB12_878 : STD_LOGIC; 
  signal dat_o_sig_0_BRB13_879 : STD_LOGIC; 
  signal dat_o_sig_1_BRB9_880 : STD_LOGIC; 
  signal dat_o_sig_1_BRB10_881 : STD_LOGIC; 
  signal dat_o_sig_1_BRB11_882 : STD_LOGIC; 
  signal dat_o_sig_2_BRB9_883 : STD_LOGIC; 
  signal dat_o_sig_2_BRB10_884 : STD_LOGIC; 
  signal dat_o_sig_2_BRB11_885 : STD_LOGIC; 
  signal dat_o_sig_3_BRB9_886 : STD_LOGIC; 
  signal dat_o_sig_3_BRB10_887 : STD_LOGIC; 
  signal dat_o_sig_3_BRB11_888 : STD_LOGIC; 
  signal dat_o_sig_4_BRB9_889 : STD_LOGIC; 
  signal dat_o_sig_4_BRB10_890 : STD_LOGIC; 
  signal dat_o_sig_4_BRB11_891 : STD_LOGIC; 
  signal dat_o_sig_5_BRB9_892 : STD_LOGIC; 
  signal dat_o_sig_5_BRB10_893 : STD_LOGIC; 
  signal dat_o_sig_5_BRB11_894 : STD_LOGIC; 
  signal dat_o_sig_6_BRB9_895 : STD_LOGIC; 
  signal dat_o_sig_6_BRB10_896 : STD_LOGIC; 
  signal dat_o_sig_6_BRB11_897 : STD_LOGIC; 
  signal dat_o_sig_7_BRB9_898 : STD_LOGIC; 
  signal dat_o_sig_7_BRB10_899 : STD_LOGIC; 
  signal dat_o_sig_7_BRB11_900 : STD_LOGIC; 
  signal dat_o_sig_8_BRB9_901 : STD_LOGIC; 
  signal dat_o_sig_8_BRB10_902 : STD_LOGIC; 
  signal dat_o_sig_8_BRB11_903 : STD_LOGIC; 
  signal dat_o_sig_9_BRB9_904 : STD_LOGIC; 
  signal dat_o_sig_9_BRB10_905 : STD_LOGIC; 
  signal dat_o_sig_9_BRB11_906 : STD_LOGIC; 
  signal dat_o_sig_10_BRB9_907 : STD_LOGIC; 
  signal dat_o_sig_10_BRB10_908 : STD_LOGIC; 
  signal dat_o_sig_10_BRB11_909 : STD_LOGIC; 
  signal dat_o_sig_11_BRB9_910 : STD_LOGIC; 
  signal dat_o_sig_11_BRB10_911 : STD_LOGIC; 
  signal dat_o_sig_11_BRB11_912 : STD_LOGIC; 
  signal dat_o_sig_12_BRB9_913 : STD_LOGIC; 
  signal dat_o_sig_12_BRB10_914 : STD_LOGIC; 
  signal dat_o_sig_12_BRB11_915 : STD_LOGIC; 
  signal dat_o_sig_13_BRB9_916 : STD_LOGIC; 
  signal dat_o_sig_13_BRB10_917 : STD_LOGIC; 
  signal dat_o_sig_13_BRB11_918 : STD_LOGIC; 
  signal dat_o_sig_14_BRB9_919 : STD_LOGIC; 
  signal dat_o_sig_14_BRB10_920 : STD_LOGIC; 
  signal dat_o_sig_14_BRB11_921 : STD_LOGIC; 
  signal dat_o_sig_15_BRB9_922 : STD_LOGIC; 
  signal dat_o_sig_15_BRB10_923 : STD_LOGIC; 
  signal dat_o_sig_15_BRB11_924 : STD_LOGIC; 
  signal dat_o_sig_0_BRB15_925 : STD_LOGIC; 
  signal dat_o_sig_0_BRB16_926 : STD_LOGIC; 
  signal dat_o_sig_0_BRB17_927 : STD_LOGIC; 
  signal dat_o_sig_0_BRB18_928 : STD_LOGIC; 
  signal dat_o_sig_1_BRB13_929 : STD_LOGIC; 
  signal dat_o_sig_1_BRB14_930 : STD_LOGIC; 
  signal dat_o_sig_1_BRB15_931 : STD_LOGIC; 
  signal dat_o_sig_1_BRB16_932 : STD_LOGIC; 
  signal dat_o_sig_2_BRB13_933 : STD_LOGIC; 
  signal dat_o_sig_2_BRB14_934 : STD_LOGIC; 
  signal dat_o_sig_2_BRB15_935 : STD_LOGIC; 
  signal dat_o_sig_2_BRB16_936 : STD_LOGIC; 
  signal dat_o_sig_3_BRB13_937 : STD_LOGIC; 
  signal dat_o_sig_3_BRB14_938 : STD_LOGIC; 
  signal dat_o_sig_3_BRB15_939 : STD_LOGIC; 
  signal dat_o_sig_3_BRB16_940 : STD_LOGIC; 
  signal dat_o_sig_4_BRB13_941 : STD_LOGIC; 
  signal dat_o_sig_4_BRB14_942 : STD_LOGIC; 
  signal dat_o_sig_4_BRB15_943 : STD_LOGIC; 
  signal dat_o_sig_4_BRB16_944 : STD_LOGIC; 
  signal dat_o_sig_5_BRB13_945 : STD_LOGIC; 
  signal dat_o_sig_5_BRB14_946 : STD_LOGIC; 
  signal dat_o_sig_5_BRB15_947 : STD_LOGIC; 
  signal dat_o_sig_5_BRB16_948 : STD_LOGIC; 
  signal dat_o_sig_6_BRB13_949 : STD_LOGIC; 
  signal dat_o_sig_6_BRB14_950 : STD_LOGIC; 
  signal dat_o_sig_6_BRB15_951 : STD_LOGIC; 
  signal dat_o_sig_6_BRB16_952 : STD_LOGIC; 
  signal dat_o_sig_7_BRB13_953 : STD_LOGIC; 
  signal dat_o_sig_7_BRB14_954 : STD_LOGIC; 
  signal dat_o_sig_7_BRB15_955 : STD_LOGIC; 
  signal dat_o_sig_7_BRB16_956 : STD_LOGIC; 
  signal dat_o_sig_8_BRB13_957 : STD_LOGIC; 
  signal dat_o_sig_8_BRB14_958 : STD_LOGIC; 
  signal dat_o_sig_8_BRB15_959 : STD_LOGIC; 
  signal dat_o_sig_8_BRB16_960 : STD_LOGIC; 
  signal dat_o_sig_9_BRB13_961 : STD_LOGIC; 
  signal dat_o_sig_9_BRB14_962 : STD_LOGIC; 
  signal dat_o_sig_9_BRB15_963 : STD_LOGIC; 
  signal dat_o_sig_9_BRB16_964 : STD_LOGIC; 
  signal dat_o_sig_10_BRB13_965 : STD_LOGIC; 
  signal dat_o_sig_10_BRB14_966 : STD_LOGIC; 
  signal dat_o_sig_10_BRB15_967 : STD_LOGIC; 
  signal dat_o_sig_10_BRB16_968 : STD_LOGIC; 
  signal dat_o_sig_11_BRB13_969 : STD_LOGIC; 
  signal dat_o_sig_11_BRB14_970 : STD_LOGIC; 
  signal dat_o_sig_11_BRB15_971 : STD_LOGIC; 
  signal dat_o_sig_11_BRB16_972 : STD_LOGIC; 
  signal dat_o_sig_12_BRB13_973 : STD_LOGIC; 
  signal dat_o_sig_12_BRB14_974 : STD_LOGIC; 
  signal dat_o_sig_12_BRB15_975 : STD_LOGIC; 
  signal dat_o_sig_12_BRB16_976 : STD_LOGIC; 
  signal dat_o_sig_13_BRB13_977 : STD_LOGIC; 
  signal dat_o_sig_13_BRB14_978 : STD_LOGIC; 
  signal dat_o_sig_13_BRB15_979 : STD_LOGIC; 
  signal dat_o_sig_13_BRB16_980 : STD_LOGIC; 
  signal dat_o_sig_14_BRB13_981 : STD_LOGIC; 
  signal dat_o_sig_14_BRB14_982 : STD_LOGIC; 
  signal dat_o_sig_14_BRB15_983 : STD_LOGIC; 
  signal dat_o_sig_14_BRB16_984 : STD_LOGIC; 
  signal dat_o_sig_15_BRB13_985 : STD_LOGIC; 
  signal dat_o_sig_15_BRB14_986 : STD_LOGIC; 
  signal dat_o_sig_15_BRB15_987 : STD_LOGIC; 
  signal dat_o_sig_15_BRB16_988 : STD_LOGIC; 
  signal dat_o_sig_0_BRB2_989 : STD_LOGIC; 
  signal dat_o_sig_0_BRB3_990 : STD_LOGIC; 
  signal dat_o_sig_0_BRB14_991 : STD_LOGIC; 
  signal dat_o_sig_0_BRB19_992 : STD_LOGIC; 
  signal dat_o_sig_0_BRB20_993 : STD_LOGIC; 
  signal dat_o_sig_1_BRB3_994 : STD_LOGIC; 
  signal dat_o_sig_1_BRB4_995 : STD_LOGIC; 
  signal dat_o_sig_2_BRB3_996 : STD_LOGIC; 
  signal dat_o_sig_2_BRB4_997 : STD_LOGIC; 
  signal dat_o_sig_3_BRB3_998 : STD_LOGIC; 
  signal dat_o_sig_3_BRB4_999 : STD_LOGIC; 
  signal dat_o_sig_4_BRB3_1000 : STD_LOGIC; 
  signal dat_o_sig_4_BRB4_1001 : STD_LOGIC; 
  signal dat_o_sig_5_BRB3_1002 : STD_LOGIC; 
  signal dat_o_sig_5_BRB4_1003 : STD_LOGIC; 
  signal dat_o_sig_6_BRB3_1004 : STD_LOGIC; 
  signal dat_o_sig_6_BRB4_1005 : STD_LOGIC; 
  signal dat_o_sig_7_BRB3_1006 : STD_LOGIC; 
  signal dat_o_sig_7_BRB4_1007 : STD_LOGIC; 
  signal dat_o_sig_8_BRB3_1008 : STD_LOGIC; 
  signal dat_o_sig_8_BRB4_1009 : STD_LOGIC; 
  signal dat_o_sig_9_BRB3_1010 : STD_LOGIC; 
  signal dat_o_sig_9_BRB4_1011 : STD_LOGIC; 
  signal dat_o_sig_10_BRB3_1012 : STD_LOGIC; 
  signal dat_o_sig_10_BRB4_1013 : STD_LOGIC; 
  signal dat_o_sig_11_BRB3_1014 : STD_LOGIC; 
  signal dat_o_sig_11_BRB4_1015 : STD_LOGIC; 
  signal dat_o_sig_12_BRB3_1016 : STD_LOGIC; 
  signal dat_o_sig_12_BRB4_1017 : STD_LOGIC; 
  signal dat_o_sig_13_BRB3_1018 : STD_LOGIC; 
  signal dat_o_sig_13_BRB4_1019 : STD_LOGIC; 
  signal dat_o_sig_14_BRB3_1020 : STD_LOGIC; 
  signal dat_o_sig_14_BRB4_1021 : STD_LOGIC; 
  signal dat_o_sig_15_BRB3_1022 : STD_LOGIC; 
  signal dat_o_sig_15_BRB4_1023 : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg21_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg22_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg23_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg24_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg25_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg26_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg27_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg28_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg29_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg212_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg210_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg211_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg213_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg214_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg215_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg216_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg30_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg31_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg32_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg35_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg33_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg34_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg36_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg37_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg38_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg39_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg40_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg41_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg42_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg43_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg44_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg45_DPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg111_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg110_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg112_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg113_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg114_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg115_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg116_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg117_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg118_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg119_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg120_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg121_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg122_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg123_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg124_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg125_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg51_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg52_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg53_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg54_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg55_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg56_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg57_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg58_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg59_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg510_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg513_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg511_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg512_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg514_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg515_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg516_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg310_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg311_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg312_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg313_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg314_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg317_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg315_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg316_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg318_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg319_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg320_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg321_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg322_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg323_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg324_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg325_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg46_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg49_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg47_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg48_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg410_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg411_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg412_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg413_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg414_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg415_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg416_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg417_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg418_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg419_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg420_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_Mram_pulse_params_reg421_SPO_UNCONNECTED : STD_LOGIC; 
  signal status_reg : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal x_amp_delay_reg : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal l_amp_delay_reg : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal instruction_reg : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal num_pulses_reg : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal GND_5_o_GND_5_o_sub_11_OUT : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal dat_o_sig : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal num_repeats_reg : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal pri_pulse_width_reg : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal Q_n3006 : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal Q_n3056 : STD_LOGIC_VECTOR ( 31 downto 0 ); 
begin
  XST_VCC : VCC
    port map (
      P => ACK_O_OBUFT_312
    );
  XST_GND : GND
    port map (
      G => N1
    );
  status_reg_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_0_IBUF_15,
      Q => status_reg(0)
    );
  status_reg_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_1_IBUF_14,
      Q => status_reg(1)
    );
  status_reg_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_2_IBUF_13,
      Q => status_reg(2)
    );
  status_reg_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_3_IBUF_12,
      Q => status_reg(3)
    );
  status_reg_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_4_IBUF_11,
      Q => status_reg(4)
    );
  status_reg_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_5_IBUF_10,
      Q => status_reg(5)
    );
  status_reg_6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_6_IBUF_9,
      Q => status_reg(6)
    );
  status_reg_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_7_IBUF_8,
      Q => status_reg(7)
    );
  status_reg_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_8_IBUF_7,
      Q => status_reg(8)
    );
  status_reg_9 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_9_IBUF_6,
      Q => status_reg(9)
    );
  status_reg_10 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_10_IBUF_5,
      Q => status_reg(10)
    );
  status_reg_11 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_11_IBUF_4,
      Q => status_reg(11)
    );
  status_reg_12 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_12_IBUF_3,
      Q => status_reg(12)
    );
  status_reg_13 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_13_IBUF_2,
      Q => status_reg(13)
    );
  status_reg_14 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_14_IBUF_1,
      Q => status_reg(14)
    );
  status_reg_15 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_40,
      D => status_IN_15_IBUF_0,
      Q => status_reg(15)
    );
  x_amp_delay_reg_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_0_IBUF_31,
      Q => x_amp_delay_reg(0)
    );
  x_amp_delay_reg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_1_IBUF_30,
      Q => x_amp_delay_reg(1)
    );
  x_amp_delay_reg_2 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_2_IBUF_29,
      Q => x_amp_delay_reg(2)
    );
  x_amp_delay_reg_3 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_3_IBUF_28,
      Q => x_amp_delay_reg(3)
    );
  x_amp_delay_reg_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_4_IBUF_27,
      Q => x_amp_delay_reg(4)
    );
  x_amp_delay_reg_5 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_5_IBUF_26,
      Q => x_amp_delay_reg(5)
    );
  x_amp_delay_reg_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_6_IBUF_25,
      Q => x_amp_delay_reg(6)
    );
  x_amp_delay_reg_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_7_IBUF_24,
      Q => x_amp_delay_reg(7)
    );
  x_amp_delay_reg_8 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_8_IBUF_23,
      Q => x_amp_delay_reg(8)
    );
  x_amp_delay_reg_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_9_IBUF_22,
      Q => x_amp_delay_reg(9)
    );
  x_amp_delay_reg_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_10_IBUF_21,
      Q => x_amp_delay_reg(10)
    );
  x_amp_delay_reg_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_11_IBUF_20,
      Q => x_amp_delay_reg(11)
    );
  x_amp_delay_reg_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_12_IBUF_19,
      Q => x_amp_delay_reg(12)
    );
  x_amp_delay_reg_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_13_IBUF_18,
      Q => x_amp_delay_reg(13)
    );
  x_amp_delay_reg_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_14_IBUF_17,
      Q => x_amp_delay_reg(14)
    );
  x_amp_delay_reg_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3046_inv,
      D => DAT_I_15_IBUF_16,
      Q => x_amp_delay_reg(15)
    );
  l_amp_delay_reg_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_0_IBUF_31,
      Q => l_amp_delay_reg(0)
    );
  l_amp_delay_reg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_1_IBUF_30,
      Q => l_amp_delay_reg(1)
    );
  l_amp_delay_reg_2 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_2_IBUF_29,
      Q => l_amp_delay_reg(2)
    );
  l_amp_delay_reg_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_3_IBUF_28,
      Q => l_amp_delay_reg(3)
    );
  l_amp_delay_reg_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_4_IBUF_27,
      Q => l_amp_delay_reg(4)
    );
  l_amp_delay_reg_5 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_5_IBUF_26,
      Q => l_amp_delay_reg(5)
    );
  l_amp_delay_reg_6 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_6_IBUF_25,
      Q => l_amp_delay_reg(6)
    );
  l_amp_delay_reg_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_7_IBUF_24,
      Q => l_amp_delay_reg(7)
    );
  l_amp_delay_reg_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_8_IBUF_23,
      Q => l_amp_delay_reg(8)
    );
  l_amp_delay_reg_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_9_IBUF_22,
      Q => l_amp_delay_reg(9)
    );
  l_amp_delay_reg_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_10_IBUF_21,
      Q => l_amp_delay_reg(10)
    );
  l_amp_delay_reg_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_11_IBUF_20,
      Q => l_amp_delay_reg(11)
    );
  l_amp_delay_reg_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_12_IBUF_19,
      Q => l_amp_delay_reg(12)
    );
  l_amp_delay_reg_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_13_IBUF_18,
      Q => l_amp_delay_reg(13)
    );
  l_amp_delay_reg_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_14_IBUF_17,
      Q => l_amp_delay_reg(14)
    );
  l_amp_delay_reg_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3053_inv,
      D => DAT_I_15_IBUF_16,
      Q => l_amp_delay_reg(15)
    );
  instruction_reg_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_0_IBUF_31,
      Q => instruction_reg(0)
    );
  instruction_reg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_1_IBUF_30,
      Q => instruction_reg(1)
    );
  instruction_reg_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_2_IBUF_29,
      Q => instruction_reg(2)
    );
  instruction_reg_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_3_IBUF_28,
      Q => instruction_reg(3)
    );
  instruction_reg_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_4_IBUF_27,
      Q => instruction_reg(4)
    );
  instruction_reg_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_5_IBUF_26,
      Q => instruction_reg(5)
    );
  instruction_reg_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_6_IBUF_25,
      Q => instruction_reg(6)
    );
  instruction_reg_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_7_IBUF_24,
      Q => instruction_reg(7)
    );
  instruction_reg_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_8_IBUF_23,
      Q => instruction_reg(8)
    );
  instruction_reg_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_9_IBUF_22,
      Q => instruction_reg(9)
    );
  instruction_reg_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_10_IBUF_21,
      Q => instruction_reg(10)
    );
  instruction_reg_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_11_IBUF_20,
      Q => instruction_reg(11)
    );
  instruction_reg_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_12_IBUF_19,
      Q => instruction_reg(12)
    );
  instruction_reg_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_13_IBUF_18,
      Q => instruction_reg(13)
    );
  instruction_reg_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_14_IBUF_17,
      Q => instruction_reg(14)
    );
  instruction_reg_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3096_inv,
      D => DAT_I_15_IBUF_16,
      Q => instruction_reg(15)
    );
  num_pulses_reg_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_0_IBUF_31,
      Q => num_pulses_reg(0)
    );
  num_pulses_reg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_1_IBUF_30,
      Q => num_pulses_reg(1)
    );
  num_pulses_reg_2 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_2_IBUF_29,
      Q => num_pulses_reg(2)
    );
  num_pulses_reg_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_3_IBUF_28,
      Q => num_pulses_reg(3)
    );
  num_pulses_reg_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_4_IBUF_27,
      Q => num_pulses_reg(4)
    );
  num_pulses_reg_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_5_IBUF_26,
      Q => num_pulses_reg(5)
    );
  num_pulses_reg_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_6_IBUF_25,
      Q => num_pulses_reg(6)
    );
  num_pulses_reg_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_7_IBUF_24,
      Q => num_pulses_reg(7)
    );
  num_pulses_reg_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_8_IBUF_23,
      Q => num_pulses_reg(8)
    );
  num_pulses_reg_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_9_IBUF_22,
      Q => num_pulses_reg(9)
    );
  num_pulses_reg_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_10_IBUF_21,
      Q => num_pulses_reg(10)
    );
  num_pulses_reg_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_11_IBUF_20,
      Q => num_pulses_reg(11)
    );
  num_pulses_reg_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_12_IBUF_19,
      Q => num_pulses_reg(12)
    );
  num_pulses_reg_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_13_IBUF_18,
      Q => num_pulses_reg(13)
    );
  num_pulses_reg_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_14_IBUF_17,
      Q => num_pulses_reg(14)
    );
  num_pulses_reg_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3103_inv,
      D => DAT_I_15_IBUF_16,
      Q => num_pulses_reg(15)
    );
  num_repeats_reg_0 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(0),
      Q => num_repeats_reg(0)
    );
  num_repeats_reg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(1),
      Q => num_repeats_reg(1)
    );
  num_repeats_reg_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(2),
      Q => num_repeats_reg(2)
    );
  num_repeats_reg_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(3),
      Q => num_repeats_reg(3)
    );
  num_repeats_reg_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(4),
      Q => num_repeats_reg(4)
    );
  num_repeats_reg_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(5),
      Q => num_repeats_reg(5)
    );
  num_repeats_reg_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(6),
      Q => num_repeats_reg(6)
    );
  num_repeats_reg_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(7),
      Q => num_repeats_reg(7)
    );
  num_repeats_reg_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(8),
      Q => num_repeats_reg(8)
    );
  num_repeats_reg_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(9),
      Q => num_repeats_reg(9)
    );
  num_repeats_reg_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(10),
      Q => num_repeats_reg(10)
    );
  num_repeats_reg_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(11),
      Q => num_repeats_reg(11)
    );
  num_repeats_reg_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(12),
      Q => num_repeats_reg(12)
    );
  num_repeats_reg_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(13),
      Q => num_repeats_reg(13)
    );
  num_repeats_reg_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(14),
      Q => num_repeats_reg(14)
    );
  num_repeats_reg_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(15),
      Q => num_repeats_reg(15)
    );
  num_repeats_reg_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(16),
      Q => num_repeats_reg(16)
    );
  num_repeats_reg_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(17),
      Q => num_repeats_reg(17)
    );
  num_repeats_reg_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(18),
      Q => num_repeats_reg(18)
    );
  num_repeats_reg_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(19),
      Q => num_repeats_reg(19)
    );
  num_repeats_reg_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(20),
      Q => num_repeats_reg(20)
    );
  num_repeats_reg_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(21),
      Q => num_repeats_reg(21)
    );
  num_repeats_reg_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(22),
      Q => num_repeats_reg(22)
    );
  num_repeats_reg_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(23),
      Q => num_repeats_reg(23)
    );
  num_repeats_reg_24 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(24),
      Q => num_repeats_reg(24)
    );
  num_repeats_reg_25 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(25),
      Q => num_repeats_reg(25)
    );
  num_repeats_reg_26 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(26),
      Q => num_repeats_reg(26)
    );
  num_repeats_reg_27 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(27),
      Q => num_repeats_reg(27)
    );
  num_repeats_reg_28 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(28),
      Q => num_repeats_reg(28)
    );
  num_repeats_reg_29 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(29),
      Q => num_repeats_reg(29)
    );
  num_repeats_reg_30 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(30),
      Q => num_repeats_reg(30)
    );
  num_repeats_reg_31 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3039_inv,
      D => Q_n3006(31),
      Q => num_repeats_reg(31)
    );
  pri_pulse_width_reg_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(0),
      Q => pri_pulse_width_reg(0)
    );
  pri_pulse_width_reg_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(1),
      Q => pri_pulse_width_reg(1)
    );
  pri_pulse_width_reg_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(2),
      Q => pri_pulse_width_reg(2)
    );
  pri_pulse_width_reg_3 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(3),
      Q => pri_pulse_width_reg(3)
    );
  pri_pulse_width_reg_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(4),
      Q => pri_pulse_width_reg(4)
    );
  pri_pulse_width_reg_5 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(5),
      Q => pri_pulse_width_reg(5)
    );
  pri_pulse_width_reg_6 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(6),
      Q => pri_pulse_width_reg(6)
    );
  pri_pulse_width_reg_7 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(7),
      Q => pri_pulse_width_reg(7)
    );
  pri_pulse_width_reg_8 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(8),
      Q => pri_pulse_width_reg(8)
    );
  pri_pulse_width_reg_9 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(9),
      Q => pri_pulse_width_reg(9)
    );
  pri_pulse_width_reg_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(10),
      Q => pri_pulse_width_reg(10)
    );
  pri_pulse_width_reg_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(11),
      Q => pri_pulse_width_reg(11)
    );
  pri_pulse_width_reg_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(12),
      Q => pri_pulse_width_reg(12)
    );
  pri_pulse_width_reg_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(13),
      Q => pri_pulse_width_reg(13)
    );
  pri_pulse_width_reg_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(14),
      Q => pri_pulse_width_reg(14)
    );
  pri_pulse_width_reg_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(15),
      Q => pri_pulse_width_reg(15)
    );
  pri_pulse_width_reg_16 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(16),
      Q => pri_pulse_width_reg(16)
    );
  pri_pulse_width_reg_17 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(17),
      Q => pri_pulse_width_reg(17)
    );
  pri_pulse_width_reg_18 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(18),
      Q => pri_pulse_width_reg(18)
    );
  pri_pulse_width_reg_19 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(19),
      Q => pri_pulse_width_reg(19)
    );
  pri_pulse_width_reg_20 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(20),
      Q => pri_pulse_width_reg(20)
    );
  pri_pulse_width_reg_21 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(21),
      Q => pri_pulse_width_reg(21)
    );
  pri_pulse_width_reg_22 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(22),
      Q => pri_pulse_width_reg(22)
    );
  pri_pulse_width_reg_23 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(23),
      Q => pri_pulse_width_reg(23)
    );
  pri_pulse_width_reg_24 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(24),
      Q => pri_pulse_width_reg(24)
    );
  pri_pulse_width_reg_25 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(25),
      Q => pri_pulse_width_reg(25)
    );
  pri_pulse_width_reg_26 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(26),
      Q => pri_pulse_width_reg(26)
    );
  pri_pulse_width_reg_27 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(27),
      Q => pri_pulse_width_reg(27)
    );
  pri_pulse_width_reg_28 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(28),
      Q => pri_pulse_width_reg(28)
    );
  pri_pulse_width_reg_29 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(29),
      Q => pri_pulse_width_reg(29)
    );
  pri_pulse_width_reg_30 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(30),
      Q => pri_pulse_width_reg(30)
    );
  pri_pulse_width_reg_31 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3089_inv,
      D => Q_n3056(31),
      Q => pri_pulse_width_reg(31)
    );
  Mram_pulse_params_reg21 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF718718"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_0_IBUF_31,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg21_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_48_OBUF_324,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg22 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF30C208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_1_IBUF_30,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg22_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_49_OBUF_325,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg23 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_2_IBUF_29,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg23_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_50_OBUF_326,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg24 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_3_IBUF_28,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg24_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_51_OBUF_327,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg25 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_4_IBUF_27,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg25_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_52_OBUF_328,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg26 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_5_IBUF_26,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg26_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_53_OBUF_329,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg27 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF28A28A"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_6_IBUF_25,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg27_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_54_OBUF_330,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg28 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_7_IBUF_24,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg28_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_55_OBUF_331,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg29 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_8_IBUF_23,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg29_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_56_OBUF_332,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg212 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_11_IBUF_20,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg212_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_59_OBUF_335,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg210 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_9_IBUF_22,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg210_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_57_OBUF_333,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg211 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_10_IBUF_21,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg211_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_58_OBUF_334,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg213 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_12_IBUF_19,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg213_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_60_OBUF_336,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg214 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_13_IBUF_18,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg214_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_61_OBUF_337,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg215 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_14_IBUF_17,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg215_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_62_OBUF_338,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg216 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_15_IBUF_16,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg216_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_63_OBUF_339,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0237_5_0_cy_4_Q,
      DPRA(4) => n0237_5_0_4_Q,
      DPRA(3) => n0237_5_0_3_Q,
      DPRA(2) => n0237_5_0_2_Q,
      DPRA(1) => n0237_5_0_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg233 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF718718"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_0_IBUF_31,
      WE => write_ctrl_323,
      SPO => N70,
      DPO => pulse_params_OUT_80_OBUF_342,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg6 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF30C208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_1_IBUF_30,
      WE => write_ctrl_323,
      SPO => N72,
      DPO => pulse_params_OUT_81_OBUF_344,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg7 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_2_IBUF_29,
      WE => write_ctrl_323,
      SPO => N74,
      DPO => pulse_params_OUT_82_OBUF_346,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg8 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_3_IBUF_28,
      WE => write_ctrl_323,
      SPO => N76,
      DPO => pulse_params_OUT_83_OBUF_348,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg9 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_4_IBUF_27,
      WE => write_ctrl_323,
      SPO => N78,
      DPO => pulse_params_OUT_84_OBUF_350,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg12 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_7_IBUF_24,
      WE => write_ctrl_323,
      SPO => N84,
      DPO => pulse_params_OUT_87_OBUF_356,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg10 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_5_IBUF_26,
      WE => write_ctrl_323,
      SPO => N80,
      DPO => pulse_params_OUT_85_OBUF_352,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg11 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF28A28A"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_6_IBUF_25,
      WE => write_ctrl_323,
      SPO => N82,
      DPO => pulse_params_OUT_86_OBUF_354,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg13 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_8_IBUF_23,
      WE => write_ctrl_323,
      SPO => N86,
      DPO => pulse_params_OUT_88_OBUF_358,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg14 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_9_IBUF_22,
      WE => write_ctrl_323,
      SPO => N88,
      DPO => pulse_params_OUT_89_OBUF_360,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg15 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_10_IBUF_21,
      WE => write_ctrl_323,
      SPO => N90,
      DPO => pulse_params_OUT_90_OBUF_362,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg16 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_11_IBUF_20,
      WE => write_ctrl_323,
      SPO => N92,
      DPO => pulse_params_OUT_91_OBUF_364,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg19 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_14_IBUF_17,
      WE => write_ctrl_323,
      SPO => N98,
      DPO => pulse_params_OUT_94_OBUF_370,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg17 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_12_IBUF_19,
      WE => write_ctrl_323,
      SPO => N94,
      DPO => pulse_params_OUT_92_OBUF_366,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg18 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_13_IBUF_18,
      WE => write_ctrl_323,
      SPO => N96,
      DPO => pulse_params_OUT_93_OBUF_368,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg20 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_15_IBUF_16,
      WE => write_ctrl_323,
      SPO => N100,
      DPO => pulse_params_OUT_95_OBUF_372,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => N1,
      DPRA(4) => Madd_n0235_5_0_lut_4_Q,
      DPRA(3) => Madd_n0235_5_0_lut_3_Q,
      DPRA(2) => Madd_n0235_5_0_lut_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg30 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_0_IBUF_31,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N102,
      DPO => NLW_Mram_pulse_params_reg30_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg31 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_1_IBUF_30,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N104,
      DPO => NLW_Mram_pulse_params_reg31_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg32 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_2_IBUF_29,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N106,
      DPO => NLW_Mram_pulse_params_reg32_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg35 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_5_IBUF_26,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N112,
      DPO => NLW_Mram_pulse_params_reg35_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg33 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_3_IBUF_28,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N108,
      DPO => NLW_Mram_pulse_params_reg33_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg34 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_4_IBUF_27,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N110,
      DPO => NLW_Mram_pulse_params_reg34_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg36 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_6_IBUF_25,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N114,
      DPO => NLW_Mram_pulse_params_reg36_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg37 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_7_IBUF_24,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N116,
      DPO => NLW_Mram_pulse_params_reg37_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg38 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_8_IBUF_23,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N118,
      DPO => NLW_Mram_pulse_params_reg38_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg39 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_9_IBUF_22,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N120,
      DPO => NLW_Mram_pulse_params_reg39_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg40 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_10_IBUF_21,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N122,
      DPO => NLW_Mram_pulse_params_reg40_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg41 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_11_IBUF_20,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N124,
      DPO => NLW_Mram_pulse_params_reg41_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg42 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_12_IBUF_19,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N126,
      DPO => NLW_Mram_pulse_params_reg42_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg43 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_13_IBUF_18,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N128,
      DPO => NLW_Mram_pulse_params_reg43_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg44 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_14_IBUF_17,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N130,
      DPO => NLW_Mram_pulse_params_reg44_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg45 : RAM64X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFF"
    )
    port map (
      A0 => GND_5_o_GND_5_o_sub_11_OUT(0),
      A1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      A2 => GND_5_o_GND_5_o_sub_11_OUT(2),
      A3 => GND_5_o_GND_5_o_sub_11_OUT(3),
      A4 => GND_5_o_GND_5_o_sub_11_OUT(4),
      A5 => GND_5_o_GND_5_o_sub_11_OUT(5),
      D => DAT_I_15_IBUF_16,
      DPRA0 => Madd_n0235_5_0_cy_0_Q,
      DPRA1 => Madd_n0235_5_0_lut_1_Q,
      DPRA2 => Madd_n0235_5_0_lut_2_Q,
      DPRA3 => Madd_n0235_5_0_lut_3_Q,
      DPRA4 => Madd_n0235_5_0_lut_4_Q,
      DPRA5 => N1,
      WCLK => CLK_I_BUFGP_41,
      WE => write_ctrl3_340,
      SPO => N132,
      DPO => NLW_Mram_pulse_params_reg45_DPO_UNCONNECTED
    );
  Mram_pulse_params_reg111 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF30C208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_1_IBUF_30,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg111_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_65_OBUF_390,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg110 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF718718"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_0_IBUF_31,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg110_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_64_OBUF_389,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg112 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_2_IBUF_29,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg112_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_66_OBUF_391,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg113 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_3_IBUF_28,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg113_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_67_OBUF_392,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg114 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_4_IBUF_27,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg114_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_68_OBUF_393,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg115 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_5_IBUF_26,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg115_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_69_OBUF_394,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg116 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF28A28A"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_6_IBUF_25,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg116_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_70_OBUF_395,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg117 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_7_IBUF_24,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg117_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_71_OBUF_396,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg118 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_8_IBUF_23,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg118_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_72_OBUF_397,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg119 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_9_IBUF_22,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg119_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_73_OBUF_398,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg120 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_10_IBUF_21,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg120_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_74_OBUF_399,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg121 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_11_IBUF_20,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg121_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_75_OBUF_400,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg122 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_12_IBUF_19,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg122_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_76_OBUF_401,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg123 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_13_IBUF_18,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg123_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_77_OBUF_402,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg124 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_14_IBUF_17,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg124_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_78_OBUF_403,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg125 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_15_IBUF_16,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg125_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_79_OBUF_404,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0235_5_0_cy_4_Q,
      DPRA(4) => n0235_5_0_4_Q,
      DPRA(3) => n0235_5_0_3_Q,
      DPRA(2) => n0235_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg51 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF718718"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_0_IBUF_31,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg51_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_0_OBUF_405,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg52 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF30C208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_1_IBUF_30,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg52_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_1_OBUF_406,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg53 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_2_IBUF_29,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg53_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_2_OBUF_407,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg54 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_3_IBUF_28,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg54_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_3_OBUF_408,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg55 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_4_IBUF_27,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg55_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_4_OBUF_409,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg56 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_5_IBUF_26,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg56_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_5_OBUF_410,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg57 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF28A28A"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_6_IBUF_25,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg57_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_6_OBUF_411,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg58 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_7_IBUF_24,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg58_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_7_OBUF_412,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg59 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_8_IBUF_23,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg59_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_8_OBUF_413,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg510 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_9_IBUF_22,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg510_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_9_OBUF_414,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg513 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_12_IBUF_19,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg513_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_12_OBUF_417,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg511 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_10_IBUF_21,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg511_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_10_OBUF_415,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg512 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_11_IBUF_20,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg512_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_11_OBUF_416,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg514 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_13_IBUF_18,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg514_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_13_OBUF_418,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg515 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_14_IBUF_17,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg515_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_14_OBUF_419,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg516 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_15_IBUF_16,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg516_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_15_OBUF_420,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0243_5_0_cy_4_Q,
      DPRA(4) => n0243_5_0_4_Q,
      DPRA(3) => n0243_5_0_3_Q,
      DPRA(2) => n0243_5_0_2_Q,
      DPRA(1) => n0235_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg310 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF718718"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_0_IBUF_31,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg310_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_32_OBUF_421,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg311 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF30C208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_1_IBUF_30,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg311_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_33_OBUF_422,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg312 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_2_IBUF_29,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg312_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_34_OBUF_423,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg313 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_3_IBUF_28,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg313_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_35_OBUF_424,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg314 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_4_IBUF_27,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg314_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_36_OBUF_425,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg317 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_7_IBUF_24,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg317_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_39_OBUF_428,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg315 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_5_IBUF_26,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg315_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_37_OBUF_426,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg316 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF28A28A"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_6_IBUF_25,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg316_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_38_OBUF_427,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg318 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_8_IBUF_23,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg318_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_40_OBUF_429,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg319 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_9_IBUF_22,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg319_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_41_OBUF_430,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg320 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_10_IBUF_21,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg320_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_42_OBUF_431,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg321 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_11_IBUF_20,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg321_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_43_OBUF_432,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg322 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_12_IBUF_19,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg322_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_44_OBUF_433,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg323 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_13_IBUF_18,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg323_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_45_OBUF_434,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg324 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_14_IBUF_17,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg324_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_46_OBUF_435,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg325 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_15_IBUF_16,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg325_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_47_OBUF_436,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_Q,
      DPRA(4) => n0239_5_0_4_Q,
      DPRA(3) => n0239_5_0_3_Q,
      DPRA(2) => n0239_5_0_2_Q,
      DPRA(1) => n0239_5_0_1_Q,
      DPRA(0) => n0235_5_0_0_Q
    );
  Mram_pulse_params_reg46 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF718718"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_0_IBUF_31,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg46_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_16_OBUF_437,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg49 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_3_IBUF_28,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg49_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_19_OBUF_440,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg47 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF30C208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_1_IBUF_30,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg47_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_17_OBUF_438,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg48 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_2_IBUF_29,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg48_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_18_OBUF_439,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg410 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_4_IBUF_27,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg410_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_20_OBUF_441,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg411 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_5_IBUF_26,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg411_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_21_OBUF_442,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg412 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF28A28A"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_6_IBUF_25,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg412_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_22_OBUF_443,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg413 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF2CB2CB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_7_IBUF_24,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg413_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_23_OBUF_444,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg414 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_8_IBUF_23,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg414_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_24_OBUF_445,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg415 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFAEBAEB"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_9_IBUF_22,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg415_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_25_OBUF_446,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg416 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_10_IBUF_21,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg416_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_26_OBUF_447,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg417 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF249249"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_11_IBUF_20,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg417_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_27_OBUF_448,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg418 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_12_IBUF_19,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg418_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_28_OBUF_449,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg419 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_13_IBUF_18,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg419_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_29_OBUF_450,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg420 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFA28A28"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_14_IBUF_17,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg420_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_30_OBUF_451,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Mram_pulse_params_reg421 : RAM128X1D
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFF208208"
    )
    port map (
      WCLK => CLK_I_BUFGP_41,
      D => DAT_I_15_IBUF_16,
      WE => write_ctrl_323,
      SPO => NLW_Mram_pulse_params_reg421_SPO_UNCONNECTED,
      DPO => pulse_params_OUT_31_OBUF_452,
      A(6) => GND_5_o_GND_5_o_sub_11_OUT(6),
      A(5) => GND_5_o_GND_5_o_sub_11_OUT(5),
      A(4) => GND_5_o_GND_5_o_sub_11_OUT(4),
      A(3) => GND_5_o_GND_5_o_sub_11_OUT(3),
      A(2) => GND_5_o_GND_5_o_sub_11_OUT(2),
      A(1) => GND_5_o_GND_5_o_sub_11_OUT(1),
      A(0) => GND_5_o_GND_5_o_sub_11_OUT(0),
      DPRA(6) => N1,
      DPRA(5) => Madd_n0239_5_0_cy_4_11,
      DPRA(4) => n0241_5_0_4_Q,
      DPRA(3) => n0241_5_0_3_Q,
      DPRA(2) => n0241_5_0_2_Q,
      DPRA(1) => Madd_n0235_5_0_lut_1_Q,
      DPRA(0) => Madd_n0235_5_0_cy_0_Q
    );
  Madd_n0237_5_0_xor_2_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_2_Q,
      I1 => Madd_n0235_5_0_lut_1_Q,
      O => n0237_5_0_2_Q
    );
  Madd_n0241_5_0_xor_3_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_3_Q,
      I1 => Madd_n0235_5_0_lut_2_Q,
      O => n0241_5_0_3_Q
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_111 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => ADR_I_0_IBUF_39,
      I2 => ADR_I_1_IBUF_38,
      O => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_11_463
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_111 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => ADR_I_3_IBUF_36,
      I1 => ADR_I_4_IBUF_35,
      I2 => ADR_I_5_IBUF_34,
      O => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11_464
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => ADR_I_1_IBUF_38,
      I1 => ADR_I_0_IBUF_39,
      O => GND_5_o_GND_5_o_sub_11_OUT(1)
    );
  n0239_5_0_1_1 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => Madd_n0235_5_0_cy_0_Q,
      I1 => Madd_n0235_5_0_lut_1_Q,
      O => n0239_5_0_1_Q
    );
  n0235_5_0_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Madd_n0235_5_0_cy_0_Q,
      I1 => Madd_n0235_5_0_lut_1_Q,
      O => n0235_5_0_1_Q
    );
  n0241_5_0_4_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_lut_2_Q,
      O => n0241_5_0_4_Q
    );
  Madd_n0239_5_0_cy_4_1111 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_lut_2_Q,
      O => Madd_n0239_5_0_cy_4_11
    );
  n0237_5_0_4_1 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_lut_2_Q,
      I3 => Madd_n0235_5_0_lut_1_Q,
      O => n0237_5_0_4_Q
    );
  Madd_n0237_5_0_cy_4_1 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_lut_2_Q,
      I3 => Madd_n0235_5_0_lut_1_Q,
      O => Madd_n0237_5_0_cy_4_Q
    );
  n0237_5_0_3_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_3_Q,
      I1 => Madd_n0235_5_0_lut_2_Q,
      I2 => Madd_n0235_5_0_lut_1_Q,
      O => n0237_5_0_3_Q
    );
  n0235_5_0_4_1 : LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_lut_2_Q,
      I3 => Madd_n0235_5_0_lut_1_Q,
      I4 => Madd_n0235_5_0_cy_0_Q,
      O => n0235_5_0_4_Q
    );
  Madd_n0235_5_0_cy_4_1 : LUT5
    generic map(
      INIT => X"80000000"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_lut_2_Q,
      I3 => Madd_n0235_5_0_lut_1_Q,
      I4 => Madd_n0235_5_0_cy_0_Q,
      O => Madd_n0235_5_0_cy_4_Q
    );
  n0235_5_0_3_1 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_3_Q,
      I1 => Madd_n0235_5_0_lut_2_Q,
      I2 => Madd_n0235_5_0_lut_1_Q,
      I3 => Madd_n0235_5_0_cy_0_Q,
      O => n0235_5_0_3_Q
    );
  n0239_5_0_4_1 : LUT5
    generic map(
      INIT => X"6A6A6AAA"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_lut_2_Q,
      I3 => Madd_n0235_5_0_lut_1_Q,
      I4 => Madd_n0235_5_0_cy_0_Q,
      O => n0239_5_0_4_Q
    );
  Madd_n0239_5_0_cy_4_1 : LUT5
    generic map(
      INIT => X"80808000"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_lut_2_Q,
      I3 => Madd_n0235_5_0_lut_1_Q,
      I4 => Madd_n0235_5_0_cy_0_Q,
      O => Madd_n0239_5_0_cy_4_Q
    );
  n0239_5_0_3_1 : LUT4
    generic map(
      INIT => X"666A"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_3_Q,
      I1 => Madd_n0235_5_0_lut_2_Q,
      I2 => Madd_n0235_5_0_lut_1_Q,
      I3 => Madd_n0235_5_0_cy_0_Q,
      O => n0239_5_0_3_Q
    );
  n0239_5_0_2_1 : LUT3
    generic map(
      INIT => X"56"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_2_Q,
      I1 => Madd_n0235_5_0_lut_1_Q,
      I2 => Madd_n0235_5_0_cy_0_Q,
      O => n0239_5_0_2_Q
    );
  n0243_5_0_4_1 : LUT5
    generic map(
      INIT => X"5A787878"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_3_Q,
      I1 => Madd_n0235_5_0_lut_2_Q,
      I2 => Madd_n0235_5_0_lut_4_Q,
      I3 => Madd_n0235_5_0_cy_0_Q,
      I4 => Madd_n0235_5_0_lut_1_Q,
      O => n0243_5_0_4_Q
    );
  n0243_5_0_3_1 : LUT4
    generic map(
      INIT => X"5666"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_3_Q,
      I1 => Madd_n0235_5_0_lut_2_Q,
      I2 => Madd_n0235_5_0_cy_0_Q,
      I3 => Madd_n0235_5_0_lut_1_Q,
      O => n0243_5_0_3_Q
    );
  n0243_5_0_2_1 : LUT3
    generic map(
      INIT => X"95"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_2_Q,
      I1 => Madd_n0235_5_0_cy_0_Q,
      I2 => Madd_n0235_5_0_lut_1_Q,
      O => n0243_5_0_2_Q
    );
  n0235_5_0_2_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_2_Q,
      I1 => Madd_n0235_5_0_cy_0_Q,
      I2 => Madd_n0235_5_0_lut_1_Q,
      O => n0235_5_0_2_Q
    );
  Madd_n0243_5_0_cy_4_1 : LUT5
    generic map(
      INIT => X"88888000"
    )
    port map (
      I0 => Madd_n0235_5_0_lut_4_Q,
      I1 => Madd_n0235_5_0_lut_3_Q,
      I2 => Madd_n0235_5_0_cy_0_Q,
      I3 => Madd_n0235_5_0_lut_1_Q,
      I4 => Madd_n0235_5_0_lut_2_Q,
      O => Madd_n0243_5_0_cy_4_Q
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => ADR_I_0_IBUF_39,
      I2 => ADR_I_1_IBUF_38,
      O => GND_5_o_GND_5_o_sub_11_OUT(2)
    );
  Mmux_n3056101 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_2_IBUF_29,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(18),
      O => Q_n3056(18)
    );
  Mmux_n3006101 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_2_IBUF_29,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(18),
      O => Q_n3006(18)
    );
  Mmux_n3056111 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_3_IBUF_28,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(19),
      O => Q_n3056(19)
    );
  Mmux_n3006111 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_3_IBUF_28,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(19),
      O => Q_n3006(19)
    );
  Mmux_n305611 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_0_IBUF_31,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(0),
      O => Q_n3056(0)
    );
  Mmux_n300611 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_0_IBUF_31,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(0),
      O => Q_n3006(0)
    );
  Mmux_n3056121 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_1_IBUF_30,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(1),
      O => Q_n3056(1)
    );
  Mmux_n3006121 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_1_IBUF_30,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(1),
      O => Q_n3006(1)
    );
  Mmux_n3056131 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_4_IBUF_27,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(20),
      O => Q_n3056(20)
    );
  Mmux_n3006131 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_4_IBUF_27,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(20),
      O => Q_n3006(20)
    );
  Mmux_n3056141 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_5_IBUF_26,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(21),
      O => Q_n3056(21)
    );
  Mmux_n3006141 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_5_IBUF_26,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(21),
      O => Q_n3006(21)
    );
  Mmux_n3056151 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_6_IBUF_25,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(22),
      O => Q_n3056(22)
    );
  Mmux_n3006151 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_6_IBUF_25,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(22),
      O => Q_n3006(22)
    );
  Mmux_n3056161 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_7_IBUF_24,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(23),
      O => Q_n3056(23)
    );
  Mmux_n3006161 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_7_IBUF_24,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(23),
      O => Q_n3006(23)
    );
  Mmux_n3056171 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_8_IBUF_23,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(24),
      O => Q_n3056(24)
    );
  Mmux_n3006171 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_8_IBUF_23,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(24),
      O => Q_n3006(24)
    );
  Mmux_n3056181 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_9_IBUF_22,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(25),
      O => Q_n3056(25)
    );
  Mmux_n3006181 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_9_IBUF_22,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(25),
      O => Q_n3006(25)
    );
  Mmux_n3056191 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_10_IBUF_21,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(26),
      O => Q_n3056(26)
    );
  Mmux_n3006191 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_10_IBUF_21,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(26),
      O => Q_n3006(26)
    );
  Mmux_n3056201 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_11_IBUF_20,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(27),
      O => Q_n3056(27)
    );
  Mmux_n3006201 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_11_IBUF_20,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(27),
      O => Q_n3006(27)
    );
  Mmux_n3056210 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_10_IBUF_21,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(10),
      O => Q_n3056(10)
    );
  Mmux_n3006210 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_10_IBUF_21,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(10),
      O => Q_n3006(10)
    );
  Mmux_n3056211 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_12_IBUF_19,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(28),
      O => Q_n3056(28)
    );
  Mmux_n3006211 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_12_IBUF_19,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(28),
      O => Q_n3006(28)
    );
  Mmux_n3056221 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_13_IBUF_18,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(29),
      O => Q_n3056(29)
    );
  Mmux_n3006221 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_13_IBUF_18,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(29),
      O => Q_n3006(29)
    );
  Mmux_n3056231 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_2_IBUF_29,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(2),
      O => Q_n3056(2)
    );
  Mmux_n3006231 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_2_IBUF_29,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(2),
      O => Q_n3006(2)
    );
  Mmux_n3056241 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_14_IBUF_17,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(30),
      O => Q_n3056(30)
    );
  Mmux_n3006241 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_14_IBUF_17,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(30),
      O => Q_n3006(30)
    );
  Mmux_n3056251 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_15_IBUF_16,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(31),
      O => Q_n3056(31)
    );
  Mmux_n3006251 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_15_IBUF_16,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(31),
      O => Q_n3006(31)
    );
  Mmux_n3056261 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_3_IBUF_28,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(3),
      O => Q_n3056(3)
    );
  Mmux_n3006261 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_3_IBUF_28,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(3),
      O => Q_n3006(3)
    );
  Mmux_n3056271 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_4_IBUF_27,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(4),
      O => Q_n3056(4)
    );
  Mmux_n3006271 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_4_IBUF_27,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(4),
      O => Q_n3006(4)
    );
  Mmux_n3056281 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_5_IBUF_26,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(5),
      O => Q_n3056(5)
    );
  Mmux_n3006281 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_5_IBUF_26,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(5),
      O => Q_n3006(5)
    );
  Mmux_n3056291 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_6_IBUF_25,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(6),
      O => Q_n3056(6)
    );
  Mmux_n3006291 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_6_IBUF_25,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(6),
      O => Q_n3006(6)
    );
  Mmux_n3056301 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_7_IBUF_24,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(7),
      O => Q_n3056(7)
    );
  Mmux_n3006301 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_7_IBUF_24,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(7),
      O => Q_n3006(7)
    );
  Mmux_n3056311 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_8_IBUF_23,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(8),
      O => Q_n3056(8)
    );
  Mmux_n3006311 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_8_IBUF_23,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(8),
      O => Q_n3006(8)
    );
  Mmux_n3056321 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_9_IBUF_22,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(9),
      O => Q_n3056(9)
    );
  Mmux_n3006321 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_9_IBUF_22,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(9),
      O => Q_n3006(9)
    );
  Mmux_n305631 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_11_IBUF_20,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(11),
      O => Q_n3056(11)
    );
  Mmux_n300631 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_11_IBUF_20,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(11),
      O => Q_n3006(11)
    );
  Mmux_n305641 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_12_IBUF_19,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(12),
      O => Q_n3056(12)
    );
  Mmux_n300641 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_12_IBUF_19,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(12),
      O => Q_n3006(12)
    );
  Mmux_n305651 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_13_IBUF_18,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(13),
      O => Q_n3056(13)
    );
  Mmux_n300651 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_13_IBUF_18,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(13),
      O => Q_n3006(13)
    );
  Mmux_n305661 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_14_IBUF_17,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(14),
      O => Q_n3056(14)
    );
  Mmux_n300661 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_14_IBUF_17,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(14),
      O => Q_n3006(14)
    );
  Mmux_n305671 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_15_IBUF_16,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(15),
      O => Q_n3056(15)
    );
  Mmux_n300671 : LUT4
    generic map(
      INIT => X"FB08"
    )
    port map (
      I0 => DAT_I_15_IBUF_16,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(15),
      O => Q_n3006(15)
    );
  Mmux_n305681 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_0_IBUF_31,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(16),
      O => Q_n3056(16)
    );
  Mmux_n300681 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_0_IBUF_31,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(16),
      O => Q_n3006(16)
    );
  Mmux_n305691 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_1_IBUF_30,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => pri_pulse_width_reg(17),
      O => Q_n3056(17)
    );
  Mmux_n300691 : LUT4
    generic map(
      INIT => X"BF80"
    )
    port map (
      I0 => DAT_I_1_IBUF_30,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_1_IBUF_38,
      I3 => num_repeats_reg(17),
      O => Q_n3006(17)
    );
  Q_n3039_inv1 : LUT6
    generic map(
      INIT => X"0000004000000000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      I2 => STB_I_IBUF_42,
      I3 => ADR_I_6_IBUF_33,
      I4 => ADR_I_7_IBUF_32,
      I5 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11_464,
      O => Q_n3039_inv
    );
  Q_n3089_inv1 : LUT6
    generic map(
      INIT => X"0000008000000000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => GND_5_o_GND_5_o_sub_11_OUT(1),
      I2 => STB_I_IBUF_42,
      I3 => ADR_I_6_IBUF_33,
      I4 => ADR_I_7_IBUF_32,
      I5 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11_464,
      O => Q_n3089_inv
    );
  WE_I_0_01 : LUT6
    generic map(
      INIT => X"8808080880888888"
    )
    port map (
      I0 => STB_I_IBUF_42,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_6_IBUF_33,
      I3 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_11_463,
      I4 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11_464,
      I5 => ADR_I_7_IBUF_32,
      O => WE_I_0_0
    );
  Q_n3103_inv1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => Q_n3046_inv1,
      I1 => ADR_I_2_IBUF_37,
      I2 => ADR_I_1_IBUF_38,
      I3 => ADR_I_0_IBUF_39,
      O => Q_n3103_inv
    );
  Q_n3046_inv2 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => Q_n3046_inv1,
      I1 => ADR_I_1_IBUF_38,
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_2_IBUF_37,
      O => Q_n3046_inv
    );
  Q_n3046_inv11 : LUT5
    generic map(
      INIT => X"00080000"
    )
    port map (
      I0 => WE_I_IBUF_43,
      I1 => STB_I_IBUF_42,
      I2 => ADR_I_6_IBUF_33,
      I3 => ADR_I_7_IBUF_32,
      I4 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11_464,
      O => Q_n3046_inv1
    );
  Q_n3053_inv1 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => Q_n3046_inv1,
      I1 => ADR_I_0_IBUF_39,
      I2 => ADR_I_1_IBUF_38,
      I3 => ADR_I_2_IBUF_37,
      O => Q_n3053_inv
    );
  Q_n3003_inv_SW0 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => ADR_I_5_IBUF_34,
      I1 => ADR_I_4_IBUF_35,
      I2 => ADR_I_2_IBUF_37,
      I3 => ADR_I_1_IBUF_38,
      I4 => ADR_I_0_IBUF_39,
      O => N01
    );
  Q_n3003_inv : LUT6
    generic map(
      INIT => X"4444044444444444"
    )
    port map (
      I0 => WE_I_IBUF_43,
      I1 => STB_I_IBUF_42,
      I2 => ADR_I_7_IBUF_32,
      I3 => ADR_I_6_IBUF_33,
      I4 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11_464,
      I5 => N01,
      O => Q_n3003_inv_322
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT121 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_12_BRB6_867,
      I3 => dat_o_sig_12_BRB7_868,
      O => N801
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT122 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(12),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT122_468
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT123 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_12_BRB3_1016,
      I4 => dat_o_sig_12_BRB4_1017,
      O => N811
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT125 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_12_BRB13_973,
      I3 => dat_o_sig_12_BRB14_974,
      I4 => dat_o_sig_12_BRB15_975,
      I5 => dat_o_sig_12_BRB16_976,
      O => N781
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT126 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_12_BRB9_913,
      I3 => dat_o_sig_12_BRB10_914,
      I4 => dat_o_sig_12_BRB11_915,
      O => N791
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT127 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N781,
      I3 => N791,
      I4 => N801,
      I5 => N811,
      O => dat_o_sig(12)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT151 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_13_BRB6_869,
      I3 => dat_o_sig_13_BRB7_870,
      O => N861
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT152 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(13),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT151_470
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT153 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_13_BRB3_1018,
      I4 => dat_o_sig_13_BRB4_1019,
      O => N871
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT155 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_13_BRB13_977,
      I3 => dat_o_sig_13_BRB14_978,
      I4 => dat_o_sig_13_BRB15_979,
      I5 => dat_o_sig_13_BRB16_980,
      O => N841
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT156 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_13_BRB9_916,
      I3 => dat_o_sig_13_BRB10_917,
      I4 => dat_o_sig_13_BRB11_918,
      O => N851
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT157 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N841,
      I3 => N851,
      I4 => N861,
      I5 => N871,
      O => dat_o_sig(13)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT181 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_14_BRB6_871,
      I3 => dat_o_sig_14_BRB7_872,
      O => N921
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT182 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(14),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT181_471
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT183 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_14_BRB3_1020,
      I4 => dat_o_sig_14_BRB4_1021,
      O => N931
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT185 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_14_BRB13_981,
      I3 => dat_o_sig_14_BRB14_982,
      I4 => dat_o_sig_14_BRB15_983,
      I5 => dat_o_sig_14_BRB16_984,
      O => N901
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT186 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_14_BRB9_919,
      I3 => dat_o_sig_14_BRB10_920,
      I4 => dat_o_sig_14_BRB11_921,
      O => N911
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT187 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N901,
      I3 => N911,
      I4 => N921,
      I5 => N931,
      O => dat_o_sig(14)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT211 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_15_BRB6_873,
      I3 => dat_o_sig_15_BRB7_874,
      O => N981
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT212 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(15),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT211_472
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT213 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_15_BRB3_1022,
      I4 => dat_o_sig_15_BRB4_1023,
      O => N991
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT215 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_15_BRB13_985,
      I3 => dat_o_sig_15_BRB14_986,
      I4 => dat_o_sig_15_BRB15_987,
      I5 => dat_o_sig_15_BRB16_988,
      O => N961
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT216 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_15_BRB9_922,
      I3 => dat_o_sig_15_BRB10_923,
      I4 => dat_o_sig_15_BRB11_924,
      O => N971
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT217 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N961,
      I3 => N971,
      I4 => N981,
      I5 => N991,
      O => dat_o_sig(15)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT241 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_1_BRB6_845,
      I3 => dat_o_sig_1_BRB7_846,
      O => N14
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT242 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(1),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT241_473
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT243 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_1_BRB3_994,
      I4 => dat_o_sig_1_BRB4_995,
      O => N152
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT245 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_1_BRB13_929,
      I3 => dat_o_sig_1_BRB14_930,
      I4 => dat_o_sig_1_BRB15_931,
      I5 => dat_o_sig_1_BRB16_932,
      O => N12
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT246 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_1_BRB9_880,
      I3 => dat_o_sig_1_BRB10_881,
      I4 => dat_o_sig_1_BRB11_882,
      O => N131
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT247 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N12,
      I3 => N131,
      I4 => N14,
      I5 => N152,
      O => dat_o_sig(1)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT271 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_2_BRB6_847,
      I3 => dat_o_sig_2_BRB7_848,
      O => N20
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT272 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(2),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT271_474
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT273 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_2_BRB3_996,
      I4 => dat_o_sig_2_BRB4_997,
      O => N212
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT275 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_2_BRB13_933,
      I3 => dat_o_sig_2_BRB14_934,
      I4 => dat_o_sig_2_BRB15_935,
      I5 => dat_o_sig_2_BRB16_936,
      O => N18
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT276 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_2_BRB9_883,
      I3 => dat_o_sig_2_BRB10_884,
      I4 => dat_o_sig_2_BRB11_885,
      O => N191
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT277 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N18,
      I3 => N191,
      I4 => N20,
      I5 => N212,
      O => dat_o_sig(2)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT31 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_0_BRB8_843,
      I3 => dat_o_sig_0_BRB9_844,
      O => N8
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT32 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(0),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT31_475
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT34 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_0_BRB19_992,
      I4 => dat_o_sig_0_BRB20_993,
      O => N910
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT37 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_0_BRB15_925,
      I3 => dat_o_sig_0_BRB16_926,
      I4 => dat_o_sig_0_BRB17_927,
      I5 => dat_o_sig_0_BRB18_928,
      O => N6
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT38 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_0_BRB11_877,
      I3 => dat_o_sig_0_BRB12_878,
      I4 => dat_o_sig_0_BRB13_879,
      O => N710
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT310 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N6,
      I3 => N710,
      I4 => N8,
      I5 => N910,
      O => dat_o_sig(0)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT301 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_3_BRB6_849,
      I3 => dat_o_sig_3_BRB7_850,
      O => N26
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT302 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(3),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT301_476
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT303 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_3_BRB3_998,
      I4 => dat_o_sig_3_BRB4_999,
      O => N272
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT305 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_3_BRB13_937,
      I3 => dat_o_sig_3_BRB14_938,
      I4 => dat_o_sig_3_BRB15_939,
      I5 => dat_o_sig_3_BRB16_940,
      O => N24
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT306 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_3_BRB9_886,
      I3 => dat_o_sig_3_BRB10_887,
      I4 => dat_o_sig_3_BRB11_888,
      O => N251
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT307 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N24,
      I3 => N251,
      I4 => N26,
      I5 => N272,
      O => dat_o_sig(3)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT331 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_4_BRB6_851,
      I3 => dat_o_sig_4_BRB7_852,
      O => N32
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT332 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(4),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT332_477
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT333 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_4_BRB3_1000,
      I4 => dat_o_sig_4_BRB4_1001,
      O => N331
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT335 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_4_BRB13_941,
      I3 => dat_o_sig_4_BRB14_942,
      I4 => dat_o_sig_4_BRB15_943,
      I5 => dat_o_sig_4_BRB16_944,
      O => N30
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT336 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_4_BRB9_889,
      I3 => dat_o_sig_4_BRB10_890,
      I4 => dat_o_sig_4_BRB11_891,
      O => N311
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT337 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N30,
      I3 => N311,
      I4 => N32,
      I5 => N331,
      O => dat_o_sig(4)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT361 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_5_BRB6_853,
      I3 => dat_o_sig_5_BRB7_854,
      O => N38
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT362 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(5),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT361_478
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT363 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_5_BRB3_1002,
      I4 => dat_o_sig_5_BRB4_1003,
      O => N39
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT365 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_5_BRB13_945,
      I3 => dat_o_sig_5_BRB14_946,
      I4 => dat_o_sig_5_BRB15_947,
      I5 => dat_o_sig_5_BRB16_948,
      O => N36
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT366 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_5_BRB9_892,
      I3 => dat_o_sig_5_BRB10_893,
      I4 => dat_o_sig_5_BRB11_894,
      O => N37
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT367 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N36,
      I3 => N37,
      I4 => N38,
      I5 => N39,
      O => dat_o_sig(5)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT391 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_6_BRB6_855,
      I3 => dat_o_sig_6_BRB7_856,
      O => N44
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT392 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(6),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT391_479
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT393 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_6_BRB3_1004,
      I4 => dat_o_sig_6_BRB4_1005,
      O => N45
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT395 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_6_BRB13_949,
      I3 => dat_o_sig_6_BRB14_950,
      I4 => dat_o_sig_6_BRB15_951,
      I5 => dat_o_sig_6_BRB16_952,
      O => N42
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT396 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_6_BRB9_895,
      I3 => dat_o_sig_6_BRB10_896,
      I4 => dat_o_sig_6_BRB11_897,
      O => N43
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT397 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N42,
      I3 => N43,
      I4 => N44,
      I5 => N45,
      O => dat_o_sig(6)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT421 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_7_BRB6_857,
      I3 => dat_o_sig_7_BRB7_858,
      O => N50
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT422 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(7),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT421_480
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT423 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_7_BRB3_1006,
      I4 => dat_o_sig_7_BRB4_1007,
      O => N511
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT425 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_7_BRB13_953,
      I3 => dat_o_sig_7_BRB14_954,
      I4 => dat_o_sig_7_BRB15_955,
      I5 => dat_o_sig_7_BRB16_956,
      O => N48
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT426 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_7_BRB9_898,
      I3 => dat_o_sig_7_BRB10_899,
      I4 => dat_o_sig_7_BRB11_900,
      O => N49
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT427 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N48,
      I3 => N49,
      I4 => N50,
      I5 => N511,
      O => dat_o_sig(7)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT451 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_8_BRB6_859,
      I3 => dat_o_sig_8_BRB7_860,
      O => N56
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT452 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(8),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT451_481
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT453 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_8_BRB3_1008,
      I4 => dat_o_sig_8_BRB4_1009,
      O => N57
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT455 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_8_BRB13_957,
      I3 => dat_o_sig_8_BRB14_958,
      I4 => dat_o_sig_8_BRB15_959,
      I5 => dat_o_sig_8_BRB16_960,
      O => N54
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT456 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_8_BRB9_901,
      I3 => dat_o_sig_8_BRB10_902,
      I4 => dat_o_sig_8_BRB11_903,
      O => N55
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT457 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N54,
      I3 => N55,
      I4 => N56,
      I5 => N57,
      O => dat_o_sig(8)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT481 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_9_BRB6_861,
      I3 => dat_o_sig_9_BRB7_862,
      O => N62
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT482 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(9),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT481_482
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT483 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_9_BRB3_1010,
      I4 => dat_o_sig_9_BRB4_1011,
      O => N63
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT485 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_9_BRB13_961,
      I3 => dat_o_sig_9_BRB14_962,
      I4 => dat_o_sig_9_BRB15_963,
      I5 => dat_o_sig_9_BRB16_964,
      O => N60
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT486 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_9_BRB9_904,
      I3 => dat_o_sig_9_BRB10_905,
      I4 => dat_o_sig_9_BRB11_906,
      O => N61
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT487 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N60,
      I3 => N61,
      I4 => N62,
      I5 => N63,
      O => dat_o_sig(9)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT61 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_10_BRB6_863,
      I3 => dat_o_sig_10_BRB7_864,
      O => N68
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT62 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(10),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT61_483
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT63 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_10_BRB3_1012,
      I4 => dat_o_sig_10_BRB4_1013,
      O => N69
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT65 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_10_BRB13_965,
      I3 => dat_o_sig_10_BRB14_966,
      I4 => dat_o_sig_10_BRB15_967,
      I5 => dat_o_sig_10_BRB16_968,
      O => N66
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT66 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_10_BRB9_907,
      I3 => dat_o_sig_10_BRB10_908,
      I4 => dat_o_sig_10_BRB11_909,
      O => N67
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT67 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N66,
      I3 => N67,
      I4 => N68,
      I5 => N69,
      O => dat_o_sig(10)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT91 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB6_841,
      I1 => dat_o_sig_0_BRB7_842,
      I2 => dat_o_sig_11_BRB6_865,
      I3 => dat_o_sig_11_BRB7_866,
      O => N741
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT92 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => ADR_I_2_IBUF_37,
      I1 => status_reg(11),
      I2 => ADR_I_0_IBUF_39,
      I3 => ADR_I_1_IBUF_38,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT91_484
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT93 : LUT5
    generic map(
      INIT => X"88800800"
    )
    port map (
      I0 => dat_o_sig_0_BRB2_989,
      I1 => dat_o_sig_0_BRB3_990,
      I2 => dat_o_sig_0_BRB14_991,
      I3 => dat_o_sig_11_BRB3_1014,
      I4 => dat_o_sig_11_BRB4_1015,
      O => N751
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT95 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_11_BRB13_969,
      I3 => dat_o_sig_11_BRB14_970,
      I4 => dat_o_sig_11_BRB15_971,
      I5 => dat_o_sig_11_BRB16_972,
      O => N721
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT96 : LUT5
    generic map(
      INIT => X"73625140"
    )
    port map (
      I0 => dat_o_sig_0_BRB4_875,
      I1 => dat_o_sig_0_BRB10_876,
      I2 => dat_o_sig_11_BRB9_910,
      I3 => dat_o_sig_11_BRB10_911,
      I4 => dat_o_sig_11_BRB11_912,
      O => N731
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT97 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFA820"
    )
    port map (
      I0 => dat_o_sig_0_BRB0_775,
      I1 => dat_o_sig_0_BRB1_776,
      I2 => N721,
      I3 => N731,
      I4 => N741,
      I5 => N751,
      O => dat_o_sig(11)
    );
  Q_n3096_inv1_SW0 : LUT5
    generic map(
      INIT => X"FFFFFFFD"
    )
    port map (
      I0 => ADR_I_3_IBUF_36,
      I1 => ADR_I_4_IBUF_35,
      I2 => ADR_I_2_IBUF_37,
      I3 => ADR_I_1_IBUF_38,
      I4 => ADR_I_0_IBUF_39,
      O => N22
    );
  Q_n3096_inv1 : LUT6
    generic map(
      INIT => X"0000008000000000"
    )
    port map (
      I0 => ADR_I_6_IBUF_33,
      I1 => WE_I_IBUF_43,
      I2 => ADR_I_7_IBUF_32,
      I3 => ADR_I_5_IBUF_34,
      I4 => N22,
      I5 => STB_I_IBUF_42,
      O => Q_n3096_inv
    );
  pulse_index_IN_4_IBUF : IBUF
    port map (
      I => pulse_index_IN(4),
      O => Madd_n0235_5_0_lut_4_Q
    );
  pulse_index_IN_3_IBUF : IBUF
    port map (
      I => pulse_index_IN(3),
      O => Madd_n0235_5_0_lut_3_Q
    );
  pulse_index_IN_2_IBUF : IBUF
    port map (
      I => pulse_index_IN(2),
      O => Madd_n0235_5_0_lut_2_Q
    );
  pulse_index_IN_1_IBUF : IBUF
    port map (
      I => pulse_index_IN(1),
      O => Madd_n0235_5_0_lut_1_Q
    );
  pulse_index_IN_0_IBUF : IBUF
    port map (
      I => pulse_index_IN(0),
      O => Madd_n0235_5_0_cy_0_Q
    );
  status_IN_15_IBUF : IBUF
    port map (
      I => status_IN(15),
      O => status_IN_15_IBUF_0
    );
  status_IN_14_IBUF : IBUF
    port map (
      I => status_IN(14),
      O => status_IN_14_IBUF_1
    );
  status_IN_13_IBUF : IBUF
    port map (
      I => status_IN(13),
      O => status_IN_13_IBUF_2
    );
  status_IN_12_IBUF : IBUF
    port map (
      I => status_IN(12),
      O => status_IN_12_IBUF_3
    );
  status_IN_11_IBUF : IBUF
    port map (
      I => status_IN(11),
      O => status_IN_11_IBUF_4
    );
  status_IN_10_IBUF : IBUF
    port map (
      I => status_IN(10),
      O => status_IN_10_IBUF_5
    );
  status_IN_9_IBUF : IBUF
    port map (
      I => status_IN(9),
      O => status_IN_9_IBUF_6
    );
  status_IN_8_IBUF : IBUF
    port map (
      I => status_IN(8),
      O => status_IN_8_IBUF_7
    );
  status_IN_7_IBUF : IBUF
    port map (
      I => status_IN(7),
      O => status_IN_7_IBUF_8
    );
  status_IN_6_IBUF : IBUF
    port map (
      I => status_IN(6),
      O => status_IN_6_IBUF_9
    );
  status_IN_5_IBUF : IBUF
    port map (
      I => status_IN(5),
      O => status_IN_5_IBUF_10
    );
  status_IN_4_IBUF : IBUF
    port map (
      I => status_IN(4),
      O => status_IN_4_IBUF_11
    );
  status_IN_3_IBUF : IBUF
    port map (
      I => status_IN(3),
      O => status_IN_3_IBUF_12
    );
  status_IN_2_IBUF : IBUF
    port map (
      I => status_IN(2),
      O => status_IN_2_IBUF_13
    );
  status_IN_1_IBUF : IBUF
    port map (
      I => status_IN(1),
      O => status_IN_1_IBUF_14
    );
  status_IN_0_IBUF : IBUF
    port map (
      I => status_IN(0),
      O => status_IN_0_IBUF_15
    );
  DAT_I_15_IBUF : IBUF
    port map (
      I => DAT_I(15),
      O => DAT_I_15_IBUF_16
    );
  DAT_I_14_IBUF : IBUF
    port map (
      I => DAT_I(14),
      O => DAT_I_14_IBUF_17
    );
  DAT_I_13_IBUF : IBUF
    port map (
      I => DAT_I(13),
      O => DAT_I_13_IBUF_18
    );
  DAT_I_12_IBUF : IBUF
    port map (
      I => DAT_I(12),
      O => DAT_I_12_IBUF_19
    );
  DAT_I_11_IBUF : IBUF
    port map (
      I => DAT_I(11),
      O => DAT_I_11_IBUF_20
    );
  DAT_I_10_IBUF : IBUF
    port map (
      I => DAT_I(10),
      O => DAT_I_10_IBUF_21
    );
  DAT_I_9_IBUF : IBUF
    port map (
      I => DAT_I(9),
      O => DAT_I_9_IBUF_22
    );
  DAT_I_8_IBUF : IBUF
    port map (
      I => DAT_I(8),
      O => DAT_I_8_IBUF_23
    );
  DAT_I_7_IBUF : IBUF
    port map (
      I => DAT_I(7),
      O => DAT_I_7_IBUF_24
    );
  DAT_I_6_IBUF : IBUF
    port map (
      I => DAT_I(6),
      O => DAT_I_6_IBUF_25
    );
  DAT_I_5_IBUF : IBUF
    port map (
      I => DAT_I(5),
      O => DAT_I_5_IBUF_26
    );
  DAT_I_4_IBUF : IBUF
    port map (
      I => DAT_I(4),
      O => DAT_I_4_IBUF_27
    );
  DAT_I_3_IBUF : IBUF
    port map (
      I => DAT_I(3),
      O => DAT_I_3_IBUF_28
    );
  DAT_I_2_IBUF : IBUF
    port map (
      I => DAT_I(2),
      O => DAT_I_2_IBUF_29
    );
  DAT_I_1_IBUF : IBUF
    port map (
      I => DAT_I(1),
      O => DAT_I_1_IBUF_30
    );
  DAT_I_0_IBUF : IBUF
    port map (
      I => DAT_I(0),
      O => DAT_I_0_IBUF_31
    );
  ADR_I_7_IBUF : IBUF
    port map (
      I => ADR_I(7),
      O => ADR_I_7_IBUF_32
    );
  ADR_I_6_IBUF : IBUF
    port map (
      I => ADR_I(6),
      O => ADR_I_6_IBUF_33
    );
  ADR_I_5_IBUF : IBUF
    port map (
      I => ADR_I(5),
      O => ADR_I_5_IBUF_34
    );
  ADR_I_4_IBUF : IBUF
    port map (
      I => ADR_I(4),
      O => ADR_I_4_IBUF_35
    );
  ADR_I_3_IBUF : IBUF
    port map (
      I => ADR_I(3),
      O => ADR_I_3_IBUF_36
    );
  ADR_I_2_IBUF : IBUF
    port map (
      I => ADR_I(2),
      O => ADR_I_2_IBUF_37
    );
  ADR_I_1_IBUF : IBUF
    port map (
      I => ADR_I(1),
      O => ADR_I_1_IBUF_38
    );
  ADR_I_0_IBUF : IBUF
    port map (
      I => ADR_I(0),
      O => ADR_I_0_IBUF_39
    );
  STB_I_IBUF : IBUF
    port map (
      I => STB_I,
      O => STB_I_IBUF_42
    );
  WE_I_IBUF : IBUF
    port map (
      I => WE_I,
      O => WE_I_IBUF_43
    );
  status_OUT_15_OBUF : OBUF
    port map (
      I => status_reg(15),
      O => status_OUT(15)
    );
  status_OUT_14_OBUF : OBUF
    port map (
      I => status_reg(14),
      O => status_OUT(14)
    );
  status_OUT_13_OBUF : OBUF
    port map (
      I => status_reg(13),
      O => status_OUT(13)
    );
  status_OUT_12_OBUF : OBUF
    port map (
      I => status_reg(12),
      O => status_OUT(12)
    );
  status_OUT_11_OBUF : OBUF
    port map (
      I => status_reg(11),
      O => status_OUT(11)
    );
  status_OUT_10_OBUF : OBUF
    port map (
      I => status_reg(10),
      O => status_OUT(10)
    );
  status_OUT_9_OBUF : OBUF
    port map (
      I => status_reg(9),
      O => status_OUT(9)
    );
  status_OUT_8_OBUF : OBUF
    port map (
      I => status_reg(8),
      O => status_OUT(8)
    );
  status_OUT_7_OBUF : OBUF
    port map (
      I => status_reg(7),
      O => status_OUT(7)
    );
  status_OUT_6_OBUF : OBUF
    port map (
      I => status_reg(6),
      O => status_OUT(6)
    );
  status_OUT_5_OBUF : OBUF
    port map (
      I => status_reg(5),
      O => status_OUT(5)
    );
  status_OUT_4_OBUF : OBUF
    port map (
      I => status_reg(4),
      O => status_OUT(4)
    );
  status_OUT_3_OBUF : OBUF
    port map (
      I => status_reg(3),
      O => status_OUT(3)
    );
  status_OUT_2_OBUF : OBUF
    port map (
      I => status_reg(2),
      O => status_OUT(2)
    );
  status_OUT_1_OBUF : OBUF
    port map (
      I => status_reg(1),
      O => status_OUT(1)
    );
  status_OUT_0_OBUF : OBUF
    port map (
      I => status_reg(0),
      O => status_OUT(0)
    );
  instruction_OUT_15_OBUF : OBUF
    port map (
      I => instruction_reg(15),
      O => instruction_OUT(15)
    );
  instruction_OUT_14_OBUF : OBUF
    port map (
      I => instruction_reg(14),
      O => instruction_OUT(14)
    );
  instruction_OUT_13_OBUF : OBUF
    port map (
      I => instruction_reg(13),
      O => instruction_OUT(13)
    );
  instruction_OUT_12_OBUF : OBUF
    port map (
      I => instruction_reg(12),
      O => instruction_OUT(12)
    );
  instruction_OUT_11_OBUF : OBUF
    port map (
      I => instruction_reg(11),
      O => instruction_OUT(11)
    );
  instruction_OUT_10_OBUF : OBUF
    port map (
      I => instruction_reg(10),
      O => instruction_OUT(10)
    );
  instruction_OUT_9_OBUF : OBUF
    port map (
      I => instruction_reg(9),
      O => instruction_OUT(9)
    );
  instruction_OUT_8_OBUF : OBUF
    port map (
      I => instruction_reg(8),
      O => instruction_OUT(8)
    );
  instruction_OUT_7_OBUF : OBUF
    port map (
      I => instruction_reg(7),
      O => instruction_OUT(7)
    );
  instruction_OUT_6_OBUF : OBUF
    port map (
      I => instruction_reg(6),
      O => instruction_OUT(6)
    );
  instruction_OUT_5_OBUF : OBUF
    port map (
      I => instruction_reg(5),
      O => instruction_OUT(5)
    );
  instruction_OUT_4_OBUF : OBUF
    port map (
      I => instruction_reg(4),
      O => instruction_OUT(4)
    );
  instruction_OUT_3_OBUF : OBUF
    port map (
      I => instruction_reg(3),
      O => instruction_OUT(3)
    );
  instruction_OUT_2_OBUF : OBUF
    port map (
      I => instruction_reg(2),
      O => instruction_OUT(2)
    );
  instruction_OUT_1_OBUF : OBUF
    port map (
      I => instruction_reg(1),
      O => instruction_OUT(1)
    );
  instruction_OUT_0_OBUF : OBUF
    port map (
      I => instruction_reg(0),
      O => instruction_OUT(0)
    );
  num_pulses_OUT_15_OBUF : OBUF
    port map (
      I => num_pulses_reg(15),
      O => num_pulses_OUT(15)
    );
  num_pulses_OUT_14_OBUF : OBUF
    port map (
      I => num_pulses_reg(14),
      O => num_pulses_OUT(14)
    );
  num_pulses_OUT_13_OBUF : OBUF
    port map (
      I => num_pulses_reg(13),
      O => num_pulses_OUT(13)
    );
  num_pulses_OUT_12_OBUF : OBUF
    port map (
      I => num_pulses_reg(12),
      O => num_pulses_OUT(12)
    );
  num_pulses_OUT_11_OBUF : OBUF
    port map (
      I => num_pulses_reg(11),
      O => num_pulses_OUT(11)
    );
  num_pulses_OUT_10_OBUF : OBUF
    port map (
      I => num_pulses_reg(10),
      O => num_pulses_OUT(10)
    );
  num_pulses_OUT_9_OBUF : OBUF
    port map (
      I => num_pulses_reg(9),
      O => num_pulses_OUT(9)
    );
  num_pulses_OUT_8_OBUF : OBUF
    port map (
      I => num_pulses_reg(8),
      O => num_pulses_OUT(8)
    );
  num_pulses_OUT_7_OBUF : OBUF
    port map (
      I => num_pulses_reg(7),
      O => num_pulses_OUT(7)
    );
  num_pulses_OUT_6_OBUF : OBUF
    port map (
      I => num_pulses_reg(6),
      O => num_pulses_OUT(6)
    );
  num_pulses_OUT_5_OBUF : OBUF
    port map (
      I => num_pulses_reg(5),
      O => num_pulses_OUT(5)
    );
  num_pulses_OUT_4_OBUF : OBUF
    port map (
      I => num_pulses_reg(4),
      O => num_pulses_OUT(4)
    );
  num_pulses_OUT_3_OBUF : OBUF
    port map (
      I => num_pulses_reg(3),
      O => num_pulses_OUT(3)
    );
  num_pulses_OUT_2_OBUF : OBUF
    port map (
      I => num_pulses_reg(2),
      O => num_pulses_OUT(2)
    );
  num_pulses_OUT_1_OBUF : OBUF
    port map (
      I => num_pulses_reg(1),
      O => num_pulses_OUT(1)
    );
  num_pulses_OUT_0_OBUF : OBUF
    port map (
      I => num_pulses_reg(0),
      O => num_pulses_OUT(0)
    );
  num_repeats_OUT_31_OBUF : OBUF
    port map (
      I => num_repeats_reg(31),
      O => num_repeats_OUT(31)
    );
  num_repeats_OUT_30_OBUF : OBUF
    port map (
      I => num_repeats_reg(30),
      O => num_repeats_OUT(30)
    );
  num_repeats_OUT_29_OBUF : OBUF
    port map (
      I => num_repeats_reg(29),
      O => num_repeats_OUT(29)
    );
  num_repeats_OUT_28_OBUF : OBUF
    port map (
      I => num_repeats_reg(28),
      O => num_repeats_OUT(28)
    );
  num_repeats_OUT_27_OBUF : OBUF
    port map (
      I => num_repeats_reg(27),
      O => num_repeats_OUT(27)
    );
  num_repeats_OUT_26_OBUF : OBUF
    port map (
      I => num_repeats_reg(26),
      O => num_repeats_OUT(26)
    );
  num_repeats_OUT_25_OBUF : OBUF
    port map (
      I => num_repeats_reg(25),
      O => num_repeats_OUT(25)
    );
  num_repeats_OUT_24_OBUF : OBUF
    port map (
      I => num_repeats_reg(24),
      O => num_repeats_OUT(24)
    );
  num_repeats_OUT_23_OBUF : OBUF
    port map (
      I => num_repeats_reg(23),
      O => num_repeats_OUT(23)
    );
  num_repeats_OUT_22_OBUF : OBUF
    port map (
      I => num_repeats_reg(22),
      O => num_repeats_OUT(22)
    );
  num_repeats_OUT_21_OBUF : OBUF
    port map (
      I => num_repeats_reg(21),
      O => num_repeats_OUT(21)
    );
  num_repeats_OUT_20_OBUF : OBUF
    port map (
      I => num_repeats_reg(20),
      O => num_repeats_OUT(20)
    );
  num_repeats_OUT_19_OBUF : OBUF
    port map (
      I => num_repeats_reg(19),
      O => num_repeats_OUT(19)
    );
  num_repeats_OUT_18_OBUF : OBUF
    port map (
      I => num_repeats_reg(18),
      O => num_repeats_OUT(18)
    );
  num_repeats_OUT_17_OBUF : OBUF
    port map (
      I => num_repeats_reg(17),
      O => num_repeats_OUT(17)
    );
  num_repeats_OUT_16_OBUF : OBUF
    port map (
      I => num_repeats_reg(16),
      O => num_repeats_OUT(16)
    );
  num_repeats_OUT_15_OBUF : OBUF
    port map (
      I => num_repeats_reg(15),
      O => num_repeats_OUT(15)
    );
  num_repeats_OUT_14_OBUF : OBUF
    port map (
      I => num_repeats_reg(14),
      O => num_repeats_OUT(14)
    );
  num_repeats_OUT_13_OBUF : OBUF
    port map (
      I => num_repeats_reg(13),
      O => num_repeats_OUT(13)
    );
  num_repeats_OUT_12_OBUF : OBUF
    port map (
      I => num_repeats_reg(12),
      O => num_repeats_OUT(12)
    );
  num_repeats_OUT_11_OBUF : OBUF
    port map (
      I => num_repeats_reg(11),
      O => num_repeats_OUT(11)
    );
  num_repeats_OUT_10_OBUF : OBUF
    port map (
      I => num_repeats_reg(10),
      O => num_repeats_OUT(10)
    );
  num_repeats_OUT_9_OBUF : OBUF
    port map (
      I => num_repeats_reg(9),
      O => num_repeats_OUT(9)
    );
  num_repeats_OUT_8_OBUF : OBUF
    port map (
      I => num_repeats_reg(8),
      O => num_repeats_OUT(8)
    );
  num_repeats_OUT_7_OBUF : OBUF
    port map (
      I => num_repeats_reg(7),
      O => num_repeats_OUT(7)
    );
  num_repeats_OUT_6_OBUF : OBUF
    port map (
      I => num_repeats_reg(6),
      O => num_repeats_OUT(6)
    );
  num_repeats_OUT_5_OBUF : OBUF
    port map (
      I => num_repeats_reg(5),
      O => num_repeats_OUT(5)
    );
  num_repeats_OUT_4_OBUF : OBUF
    port map (
      I => num_repeats_reg(4),
      O => num_repeats_OUT(4)
    );
  num_repeats_OUT_3_OBUF : OBUF
    port map (
      I => num_repeats_reg(3),
      O => num_repeats_OUT(3)
    );
  num_repeats_OUT_2_OBUF : OBUF
    port map (
      I => num_repeats_reg(2),
      O => num_repeats_OUT(2)
    );
  num_repeats_OUT_1_OBUF : OBUF
    port map (
      I => num_repeats_reg(1),
      O => num_repeats_OUT(1)
    );
  num_repeats_OUT_0_OBUF : OBUF
    port map (
      I => num_repeats_reg(0),
      O => num_repeats_OUT(0)
    );
  x_amp_delay_OUT_15_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(15),
      O => x_amp_delay_OUT(15)
    );
  x_amp_delay_OUT_14_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(14),
      O => x_amp_delay_OUT(14)
    );
  x_amp_delay_OUT_13_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(13),
      O => x_amp_delay_OUT(13)
    );
  x_amp_delay_OUT_12_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(12),
      O => x_amp_delay_OUT(12)
    );
  x_amp_delay_OUT_11_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(11),
      O => x_amp_delay_OUT(11)
    );
  x_amp_delay_OUT_10_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(10),
      O => x_amp_delay_OUT(10)
    );
  x_amp_delay_OUT_9_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(9),
      O => x_amp_delay_OUT(9)
    );
  x_amp_delay_OUT_8_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(8),
      O => x_amp_delay_OUT(8)
    );
  x_amp_delay_OUT_7_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(7),
      O => x_amp_delay_OUT(7)
    );
  x_amp_delay_OUT_6_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(6),
      O => x_amp_delay_OUT(6)
    );
  x_amp_delay_OUT_5_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(5),
      O => x_amp_delay_OUT(5)
    );
  x_amp_delay_OUT_4_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(4),
      O => x_amp_delay_OUT(4)
    );
  x_amp_delay_OUT_3_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(3),
      O => x_amp_delay_OUT(3)
    );
  x_amp_delay_OUT_2_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(2),
      O => x_amp_delay_OUT(2)
    );
  x_amp_delay_OUT_1_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(1),
      O => x_amp_delay_OUT(1)
    );
  x_amp_delay_OUT_0_OBUF : OBUF
    port map (
      I => x_amp_delay_reg(0),
      O => x_amp_delay_OUT(0)
    );
  l_amp_delay_OUT_15_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(15),
      O => l_amp_delay_OUT(15)
    );
  l_amp_delay_OUT_14_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(14),
      O => l_amp_delay_OUT(14)
    );
  l_amp_delay_OUT_13_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(13),
      O => l_amp_delay_OUT(13)
    );
  l_amp_delay_OUT_12_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(12),
      O => l_amp_delay_OUT(12)
    );
  l_amp_delay_OUT_11_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(11),
      O => l_amp_delay_OUT(11)
    );
  l_amp_delay_OUT_10_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(10),
      O => l_amp_delay_OUT(10)
    );
  l_amp_delay_OUT_9_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(9),
      O => l_amp_delay_OUT(9)
    );
  l_amp_delay_OUT_8_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(8),
      O => l_amp_delay_OUT(8)
    );
  l_amp_delay_OUT_7_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(7),
      O => l_amp_delay_OUT(7)
    );
  l_amp_delay_OUT_6_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(6),
      O => l_amp_delay_OUT(6)
    );
  l_amp_delay_OUT_5_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(5),
      O => l_amp_delay_OUT(5)
    );
  l_amp_delay_OUT_4_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(4),
      O => l_amp_delay_OUT(4)
    );
  l_amp_delay_OUT_3_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(3),
      O => l_amp_delay_OUT(3)
    );
  l_amp_delay_OUT_2_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(2),
      O => l_amp_delay_OUT(2)
    );
  l_amp_delay_OUT_1_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(1),
      O => l_amp_delay_OUT(1)
    );
  l_amp_delay_OUT_0_OBUF : OBUF
    port map (
      I => l_amp_delay_reg(0),
      O => l_amp_delay_OUT(0)
    );
  pri_pulse_width_OUT_31_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(31),
      O => pri_pulse_width_OUT(31)
    );
  pri_pulse_width_OUT_30_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(30),
      O => pri_pulse_width_OUT(30)
    );
  pri_pulse_width_OUT_29_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(29),
      O => pri_pulse_width_OUT(29)
    );
  pri_pulse_width_OUT_28_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(28),
      O => pri_pulse_width_OUT(28)
    );
  pri_pulse_width_OUT_27_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(27),
      O => pri_pulse_width_OUT(27)
    );
  pri_pulse_width_OUT_26_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(26),
      O => pri_pulse_width_OUT(26)
    );
  pri_pulse_width_OUT_25_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(25),
      O => pri_pulse_width_OUT(25)
    );
  pri_pulse_width_OUT_24_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(24),
      O => pri_pulse_width_OUT(24)
    );
  pri_pulse_width_OUT_23_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(23),
      O => pri_pulse_width_OUT(23)
    );
  pri_pulse_width_OUT_22_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(22),
      O => pri_pulse_width_OUT(22)
    );
  pri_pulse_width_OUT_21_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(21),
      O => pri_pulse_width_OUT(21)
    );
  pri_pulse_width_OUT_20_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(20),
      O => pri_pulse_width_OUT(20)
    );
  pri_pulse_width_OUT_19_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(19),
      O => pri_pulse_width_OUT(19)
    );
  pri_pulse_width_OUT_18_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(18),
      O => pri_pulse_width_OUT(18)
    );
  pri_pulse_width_OUT_17_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(17),
      O => pri_pulse_width_OUT(17)
    );
  pri_pulse_width_OUT_16_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(16),
      O => pri_pulse_width_OUT(16)
    );
  pri_pulse_width_OUT_15_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(15),
      O => pri_pulse_width_OUT(15)
    );
  pri_pulse_width_OUT_14_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(14),
      O => pri_pulse_width_OUT(14)
    );
  pri_pulse_width_OUT_13_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(13),
      O => pri_pulse_width_OUT(13)
    );
  pri_pulse_width_OUT_12_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(12),
      O => pri_pulse_width_OUT(12)
    );
  pri_pulse_width_OUT_11_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(11),
      O => pri_pulse_width_OUT(11)
    );
  pri_pulse_width_OUT_10_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(10),
      O => pri_pulse_width_OUT(10)
    );
  pri_pulse_width_OUT_9_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(9),
      O => pri_pulse_width_OUT(9)
    );
  pri_pulse_width_OUT_8_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(8),
      O => pri_pulse_width_OUT(8)
    );
  pri_pulse_width_OUT_7_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(7),
      O => pri_pulse_width_OUT(7)
    );
  pri_pulse_width_OUT_6_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(6),
      O => pri_pulse_width_OUT(6)
    );
  pri_pulse_width_OUT_5_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(5),
      O => pri_pulse_width_OUT(5)
    );
  pri_pulse_width_OUT_4_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(4),
      O => pri_pulse_width_OUT(4)
    );
  pri_pulse_width_OUT_3_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(3),
      O => pri_pulse_width_OUT(3)
    );
  pri_pulse_width_OUT_2_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(2),
      O => pri_pulse_width_OUT(2)
    );
  pri_pulse_width_OUT_1_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(1),
      O => pri_pulse_width_OUT(1)
    );
  pri_pulse_width_OUT_0_OBUF : OBUF
    port map (
      I => pri_pulse_width_reg(0),
      O => pri_pulse_width_OUT(0)
    );
  pulse_params_OUT_95_OBUF : OBUF
    port map (
      I => pulse_params_OUT_95_OBUF_372,
      O => pulse_params_OUT(95)
    );
  pulse_params_OUT_94_OBUF : OBUF
    port map (
      I => pulse_params_OUT_94_OBUF_370,
      O => pulse_params_OUT(94)
    );
  pulse_params_OUT_93_OBUF : OBUF
    port map (
      I => pulse_params_OUT_93_OBUF_368,
      O => pulse_params_OUT(93)
    );
  pulse_params_OUT_92_OBUF : OBUF
    port map (
      I => pulse_params_OUT_92_OBUF_366,
      O => pulse_params_OUT(92)
    );
  pulse_params_OUT_91_OBUF : OBUF
    port map (
      I => pulse_params_OUT_91_OBUF_364,
      O => pulse_params_OUT(91)
    );
  pulse_params_OUT_90_OBUF : OBUF
    port map (
      I => pulse_params_OUT_90_OBUF_362,
      O => pulse_params_OUT(90)
    );
  pulse_params_OUT_89_OBUF : OBUF
    port map (
      I => pulse_params_OUT_89_OBUF_360,
      O => pulse_params_OUT(89)
    );
  pulse_params_OUT_88_OBUF : OBUF
    port map (
      I => pulse_params_OUT_88_OBUF_358,
      O => pulse_params_OUT(88)
    );
  pulse_params_OUT_87_OBUF : OBUF
    port map (
      I => pulse_params_OUT_87_OBUF_356,
      O => pulse_params_OUT(87)
    );
  pulse_params_OUT_86_OBUF : OBUF
    port map (
      I => pulse_params_OUT_86_OBUF_354,
      O => pulse_params_OUT(86)
    );
  pulse_params_OUT_85_OBUF : OBUF
    port map (
      I => pulse_params_OUT_85_OBUF_352,
      O => pulse_params_OUT(85)
    );
  pulse_params_OUT_84_OBUF : OBUF
    port map (
      I => pulse_params_OUT_84_OBUF_350,
      O => pulse_params_OUT(84)
    );
  pulse_params_OUT_83_OBUF : OBUF
    port map (
      I => pulse_params_OUT_83_OBUF_348,
      O => pulse_params_OUT(83)
    );
  pulse_params_OUT_82_OBUF : OBUF
    port map (
      I => pulse_params_OUT_82_OBUF_346,
      O => pulse_params_OUT(82)
    );
  pulse_params_OUT_81_OBUF : OBUF
    port map (
      I => pulse_params_OUT_81_OBUF_344,
      O => pulse_params_OUT(81)
    );
  pulse_params_OUT_80_OBUF : OBUF
    port map (
      I => pulse_params_OUT_80_OBUF_342,
      O => pulse_params_OUT(80)
    );
  pulse_params_OUT_79_OBUF : OBUF
    port map (
      I => pulse_params_OUT_79_OBUF_404,
      O => pulse_params_OUT(79)
    );
  pulse_params_OUT_78_OBUF : OBUF
    port map (
      I => pulse_params_OUT_78_OBUF_403,
      O => pulse_params_OUT(78)
    );
  pulse_params_OUT_77_OBUF : OBUF
    port map (
      I => pulse_params_OUT_77_OBUF_402,
      O => pulse_params_OUT(77)
    );
  pulse_params_OUT_76_OBUF : OBUF
    port map (
      I => pulse_params_OUT_76_OBUF_401,
      O => pulse_params_OUT(76)
    );
  pulse_params_OUT_75_OBUF : OBUF
    port map (
      I => pulse_params_OUT_75_OBUF_400,
      O => pulse_params_OUT(75)
    );
  pulse_params_OUT_74_OBUF : OBUF
    port map (
      I => pulse_params_OUT_74_OBUF_399,
      O => pulse_params_OUT(74)
    );
  pulse_params_OUT_73_OBUF : OBUF
    port map (
      I => pulse_params_OUT_73_OBUF_398,
      O => pulse_params_OUT(73)
    );
  pulse_params_OUT_72_OBUF : OBUF
    port map (
      I => pulse_params_OUT_72_OBUF_397,
      O => pulse_params_OUT(72)
    );
  pulse_params_OUT_71_OBUF : OBUF
    port map (
      I => pulse_params_OUT_71_OBUF_396,
      O => pulse_params_OUT(71)
    );
  pulse_params_OUT_70_OBUF : OBUF
    port map (
      I => pulse_params_OUT_70_OBUF_395,
      O => pulse_params_OUT(70)
    );
  pulse_params_OUT_69_OBUF : OBUF
    port map (
      I => pulse_params_OUT_69_OBUF_394,
      O => pulse_params_OUT(69)
    );
  pulse_params_OUT_68_OBUF : OBUF
    port map (
      I => pulse_params_OUT_68_OBUF_393,
      O => pulse_params_OUT(68)
    );
  pulse_params_OUT_67_OBUF : OBUF
    port map (
      I => pulse_params_OUT_67_OBUF_392,
      O => pulse_params_OUT(67)
    );
  pulse_params_OUT_66_OBUF : OBUF
    port map (
      I => pulse_params_OUT_66_OBUF_391,
      O => pulse_params_OUT(66)
    );
  pulse_params_OUT_65_OBUF : OBUF
    port map (
      I => pulse_params_OUT_65_OBUF_390,
      O => pulse_params_OUT(65)
    );
  pulse_params_OUT_64_OBUF : OBUF
    port map (
      I => pulse_params_OUT_64_OBUF_389,
      O => pulse_params_OUT(64)
    );
  pulse_params_OUT_63_OBUF : OBUF
    port map (
      I => pulse_params_OUT_63_OBUF_339,
      O => pulse_params_OUT(63)
    );
  pulse_params_OUT_62_OBUF : OBUF
    port map (
      I => pulse_params_OUT_62_OBUF_338,
      O => pulse_params_OUT(62)
    );
  pulse_params_OUT_61_OBUF : OBUF
    port map (
      I => pulse_params_OUT_61_OBUF_337,
      O => pulse_params_OUT(61)
    );
  pulse_params_OUT_60_OBUF : OBUF
    port map (
      I => pulse_params_OUT_60_OBUF_336,
      O => pulse_params_OUT(60)
    );
  pulse_params_OUT_59_OBUF : OBUF
    port map (
      I => pulse_params_OUT_59_OBUF_335,
      O => pulse_params_OUT(59)
    );
  pulse_params_OUT_58_OBUF : OBUF
    port map (
      I => pulse_params_OUT_58_OBUF_334,
      O => pulse_params_OUT(58)
    );
  pulse_params_OUT_57_OBUF : OBUF
    port map (
      I => pulse_params_OUT_57_OBUF_333,
      O => pulse_params_OUT(57)
    );
  pulse_params_OUT_56_OBUF : OBUF
    port map (
      I => pulse_params_OUT_56_OBUF_332,
      O => pulse_params_OUT(56)
    );
  pulse_params_OUT_55_OBUF : OBUF
    port map (
      I => pulse_params_OUT_55_OBUF_331,
      O => pulse_params_OUT(55)
    );
  pulse_params_OUT_54_OBUF : OBUF
    port map (
      I => pulse_params_OUT_54_OBUF_330,
      O => pulse_params_OUT(54)
    );
  pulse_params_OUT_53_OBUF : OBUF
    port map (
      I => pulse_params_OUT_53_OBUF_329,
      O => pulse_params_OUT(53)
    );
  pulse_params_OUT_52_OBUF : OBUF
    port map (
      I => pulse_params_OUT_52_OBUF_328,
      O => pulse_params_OUT(52)
    );
  pulse_params_OUT_51_OBUF : OBUF
    port map (
      I => pulse_params_OUT_51_OBUF_327,
      O => pulse_params_OUT(51)
    );
  pulse_params_OUT_50_OBUF : OBUF
    port map (
      I => pulse_params_OUT_50_OBUF_326,
      O => pulse_params_OUT(50)
    );
  pulse_params_OUT_49_OBUF : OBUF
    port map (
      I => pulse_params_OUT_49_OBUF_325,
      O => pulse_params_OUT(49)
    );
  pulse_params_OUT_48_OBUF : OBUF
    port map (
      I => pulse_params_OUT_48_OBUF_324,
      O => pulse_params_OUT(48)
    );
  pulse_params_OUT_47_OBUF : OBUF
    port map (
      I => pulse_params_OUT_47_OBUF_436,
      O => pulse_params_OUT(47)
    );
  pulse_params_OUT_46_OBUF : OBUF
    port map (
      I => pulse_params_OUT_46_OBUF_435,
      O => pulse_params_OUT(46)
    );
  pulse_params_OUT_45_OBUF : OBUF
    port map (
      I => pulse_params_OUT_45_OBUF_434,
      O => pulse_params_OUT(45)
    );
  pulse_params_OUT_44_OBUF : OBUF
    port map (
      I => pulse_params_OUT_44_OBUF_433,
      O => pulse_params_OUT(44)
    );
  pulse_params_OUT_43_OBUF : OBUF
    port map (
      I => pulse_params_OUT_43_OBUF_432,
      O => pulse_params_OUT(43)
    );
  pulse_params_OUT_42_OBUF : OBUF
    port map (
      I => pulse_params_OUT_42_OBUF_431,
      O => pulse_params_OUT(42)
    );
  pulse_params_OUT_41_OBUF : OBUF
    port map (
      I => pulse_params_OUT_41_OBUF_430,
      O => pulse_params_OUT(41)
    );
  pulse_params_OUT_40_OBUF : OBUF
    port map (
      I => pulse_params_OUT_40_OBUF_429,
      O => pulse_params_OUT(40)
    );
  pulse_params_OUT_39_OBUF : OBUF
    port map (
      I => pulse_params_OUT_39_OBUF_428,
      O => pulse_params_OUT(39)
    );
  pulse_params_OUT_38_OBUF : OBUF
    port map (
      I => pulse_params_OUT_38_OBUF_427,
      O => pulse_params_OUT(38)
    );
  pulse_params_OUT_37_OBUF : OBUF
    port map (
      I => pulse_params_OUT_37_OBUF_426,
      O => pulse_params_OUT(37)
    );
  pulse_params_OUT_36_OBUF : OBUF
    port map (
      I => pulse_params_OUT_36_OBUF_425,
      O => pulse_params_OUT(36)
    );
  pulse_params_OUT_35_OBUF : OBUF
    port map (
      I => pulse_params_OUT_35_OBUF_424,
      O => pulse_params_OUT(35)
    );
  pulse_params_OUT_34_OBUF : OBUF
    port map (
      I => pulse_params_OUT_34_OBUF_423,
      O => pulse_params_OUT(34)
    );
  pulse_params_OUT_33_OBUF : OBUF
    port map (
      I => pulse_params_OUT_33_OBUF_422,
      O => pulse_params_OUT(33)
    );
  pulse_params_OUT_32_OBUF : OBUF
    port map (
      I => pulse_params_OUT_32_OBUF_421,
      O => pulse_params_OUT(32)
    );
  pulse_params_OUT_31_OBUF : OBUF
    port map (
      I => pulse_params_OUT_31_OBUF_452,
      O => pulse_params_OUT(31)
    );
  pulse_params_OUT_30_OBUF : OBUF
    port map (
      I => pulse_params_OUT_30_OBUF_451,
      O => pulse_params_OUT(30)
    );
  pulse_params_OUT_29_OBUF : OBUF
    port map (
      I => pulse_params_OUT_29_OBUF_450,
      O => pulse_params_OUT(29)
    );
  pulse_params_OUT_28_OBUF : OBUF
    port map (
      I => pulse_params_OUT_28_OBUF_449,
      O => pulse_params_OUT(28)
    );
  pulse_params_OUT_27_OBUF : OBUF
    port map (
      I => pulse_params_OUT_27_OBUF_448,
      O => pulse_params_OUT(27)
    );
  pulse_params_OUT_26_OBUF : OBUF
    port map (
      I => pulse_params_OUT_26_OBUF_447,
      O => pulse_params_OUT(26)
    );
  pulse_params_OUT_25_OBUF : OBUF
    port map (
      I => pulse_params_OUT_25_OBUF_446,
      O => pulse_params_OUT(25)
    );
  pulse_params_OUT_24_OBUF : OBUF
    port map (
      I => pulse_params_OUT_24_OBUF_445,
      O => pulse_params_OUT(24)
    );
  pulse_params_OUT_23_OBUF : OBUF
    port map (
      I => pulse_params_OUT_23_OBUF_444,
      O => pulse_params_OUT(23)
    );
  pulse_params_OUT_22_OBUF : OBUF
    port map (
      I => pulse_params_OUT_22_OBUF_443,
      O => pulse_params_OUT(22)
    );
  pulse_params_OUT_21_OBUF : OBUF
    port map (
      I => pulse_params_OUT_21_OBUF_442,
      O => pulse_params_OUT(21)
    );
  pulse_params_OUT_20_OBUF : OBUF
    port map (
      I => pulse_params_OUT_20_OBUF_441,
      O => pulse_params_OUT(20)
    );
  pulse_params_OUT_19_OBUF : OBUF
    port map (
      I => pulse_params_OUT_19_OBUF_440,
      O => pulse_params_OUT(19)
    );
  pulse_params_OUT_18_OBUF : OBUF
    port map (
      I => pulse_params_OUT_18_OBUF_439,
      O => pulse_params_OUT(18)
    );
  pulse_params_OUT_17_OBUF : OBUF
    port map (
      I => pulse_params_OUT_17_OBUF_438,
      O => pulse_params_OUT(17)
    );
  pulse_params_OUT_16_OBUF : OBUF
    port map (
      I => pulse_params_OUT_16_OBUF_437,
      O => pulse_params_OUT(16)
    );
  pulse_params_OUT_15_OBUF : OBUF
    port map (
      I => pulse_params_OUT_15_OBUF_420,
      O => pulse_params_OUT(15)
    );
  pulse_params_OUT_14_OBUF : OBUF
    port map (
      I => pulse_params_OUT_14_OBUF_419,
      O => pulse_params_OUT(14)
    );
  pulse_params_OUT_13_OBUF : OBUF
    port map (
      I => pulse_params_OUT_13_OBUF_418,
      O => pulse_params_OUT(13)
    );
  pulse_params_OUT_12_OBUF : OBUF
    port map (
      I => pulse_params_OUT_12_OBUF_417,
      O => pulse_params_OUT(12)
    );
  pulse_params_OUT_11_OBUF : OBUF
    port map (
      I => pulse_params_OUT_11_OBUF_416,
      O => pulse_params_OUT(11)
    );
  pulse_params_OUT_10_OBUF : OBUF
    port map (
      I => pulse_params_OUT_10_OBUF_415,
      O => pulse_params_OUT(10)
    );
  pulse_params_OUT_9_OBUF : OBUF
    port map (
      I => pulse_params_OUT_9_OBUF_414,
      O => pulse_params_OUT(9)
    );
  pulse_params_OUT_8_OBUF : OBUF
    port map (
      I => pulse_params_OUT_8_OBUF_413,
      O => pulse_params_OUT(8)
    );
  pulse_params_OUT_7_OBUF : OBUF
    port map (
      I => pulse_params_OUT_7_OBUF_412,
      O => pulse_params_OUT(7)
    );
  pulse_params_OUT_6_OBUF : OBUF
    port map (
      I => pulse_params_OUT_6_OBUF_411,
      O => pulse_params_OUT(6)
    );
  pulse_params_OUT_5_OBUF : OBUF
    port map (
      I => pulse_params_OUT_5_OBUF_410,
      O => pulse_params_OUT(5)
    );
  pulse_params_OUT_4_OBUF : OBUF
    port map (
      I => pulse_params_OUT_4_OBUF_409,
      O => pulse_params_OUT(4)
    );
  pulse_params_OUT_3_OBUF : OBUF
    port map (
      I => pulse_params_OUT_3_OBUF_408,
      O => pulse_params_OUT(3)
    );
  pulse_params_OUT_2_OBUF : OBUF
    port map (
      I => pulse_params_OUT_2_OBUF_407,
      O => pulse_params_OUT(2)
    );
  pulse_params_OUT_1_OBUF : OBUF
    port map (
      I => pulse_params_OUT_1_OBUF_406,
      O => pulse_params_OUT(1)
    );
  pulse_params_OUT_0_OBUF : OBUF
    port map (
      I => pulse_params_OUT_0_OBUF_405,
      O => pulse_params_OUT(0)
    );
  DAT_O_15_OBUFT : OBUFT
    port map (
      I => dat_o_sig(15),
      T => STB_I_inv,
      O => DAT_O(15)
    );
  DAT_O_14_OBUFT : OBUFT
    port map (
      I => dat_o_sig(14),
      T => STB_I_inv,
      O => DAT_O(14)
    );
  DAT_O_13_OBUFT : OBUFT
    port map (
      I => dat_o_sig(13),
      T => STB_I_inv,
      O => DAT_O(13)
    );
  DAT_O_12_OBUFT : OBUFT
    port map (
      I => dat_o_sig(12),
      T => STB_I_inv,
      O => DAT_O(12)
    );
  DAT_O_11_OBUFT : OBUFT
    port map (
      I => dat_o_sig(11),
      T => STB_I_inv,
      O => DAT_O(11)
    );
  DAT_O_10_OBUFT : OBUFT
    port map (
      I => dat_o_sig(10),
      T => STB_I_inv,
      O => DAT_O(10)
    );
  DAT_O_9_OBUFT : OBUFT
    port map (
      I => dat_o_sig(9),
      T => STB_I_inv,
      O => DAT_O(9)
    );
  DAT_O_8_OBUFT : OBUFT
    port map (
      I => dat_o_sig(8),
      T => STB_I_inv,
      O => DAT_O(8)
    );
  DAT_O_7_OBUFT : OBUFT
    port map (
      I => dat_o_sig(7),
      T => STB_I_inv,
      O => DAT_O(7)
    );
  DAT_O_6_OBUFT : OBUFT
    port map (
      I => dat_o_sig(6),
      T => STB_I_inv,
      O => DAT_O(6)
    );
  DAT_O_5_OBUFT : OBUFT
    port map (
      I => dat_o_sig(5),
      T => STB_I_inv,
      O => DAT_O(5)
    );
  DAT_O_4_OBUFT : OBUFT
    port map (
      I => dat_o_sig(4),
      T => STB_I_inv,
      O => DAT_O(4)
    );
  DAT_O_3_OBUFT : OBUFT
    port map (
      I => dat_o_sig(3),
      T => STB_I_inv,
      O => DAT_O(3)
    );
  DAT_O_2_OBUFT : OBUFT
    port map (
      I => dat_o_sig(2),
      T => STB_I_inv,
      O => DAT_O(2)
    );
  DAT_O_1_OBUFT : OBUFT
    port map (
      I => dat_o_sig(1),
      T => STB_I_inv,
      O => DAT_O(1)
    );
  DAT_O_0_OBUFT : OBUFT
    port map (
      I => dat_o_sig(0),
      T => STB_I_inv,
      O => DAT_O(0)
    );
  ACK_O_OBUFT : OBUFT
    port map (
      I => ACK_O_OBUFT_312,
      T => STB_I_inv,
      O => ACK_O
    );
  dat_o_sig_0_BRB0 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT124_469,
      Q => dat_o_sig_0_BRB0_775
    );
  dat_o_sig_0_BRB1 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => ADR_I_0_IBUF_39,
      Q => dat_o_sig_0_BRB1_776
    );
  dat_o_sig_0_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT121_465,
      Q => dat_o_sig_0_BRB6_841
    );
  dat_o_sig_0_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => GND_5_o_GND_5_o_sub_11_OUT(7),
      Q => dat_o_sig_0_BRB7_842
    );
  dat_o_sig_0_BRB8 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N70,
      Q => dat_o_sig_0_BRB8_843
    );
  dat_o_sig_0_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N102,
      Q => dat_o_sig_0_BRB9_844
    );
  dat_o_sig_1_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N72,
      Q => dat_o_sig_1_BRB6_845
    );
  dat_o_sig_1_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N104,
      Q => dat_o_sig_1_BRB7_846
    );
  dat_o_sig_2_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N74,
      Q => dat_o_sig_2_BRB6_847
    );
  dat_o_sig_2_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N106,
      Q => dat_o_sig_2_BRB7_848
    );
  dat_o_sig_3_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N76,
      Q => dat_o_sig_3_BRB6_849
    );
  dat_o_sig_3_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N108,
      Q => dat_o_sig_3_BRB7_850
    );
  dat_o_sig_4_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N78,
      Q => dat_o_sig_4_BRB6_851
    );
  dat_o_sig_4_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N110,
      Q => dat_o_sig_4_BRB7_852
    );
  dat_o_sig_5_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N80,
      Q => dat_o_sig_5_BRB6_853
    );
  dat_o_sig_5_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N112,
      Q => dat_o_sig_5_BRB7_854
    );
  dat_o_sig_6_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N82,
      Q => dat_o_sig_6_BRB6_855
    );
  dat_o_sig_6_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N114,
      Q => dat_o_sig_6_BRB7_856
    );
  dat_o_sig_7_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N84,
      Q => dat_o_sig_7_BRB6_857
    );
  dat_o_sig_7_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N116,
      Q => dat_o_sig_7_BRB7_858
    );
  dat_o_sig_8_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N86,
      Q => dat_o_sig_8_BRB6_859
    );
  dat_o_sig_8_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N118,
      Q => dat_o_sig_8_BRB7_860
    );
  dat_o_sig_9_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N88,
      Q => dat_o_sig_9_BRB6_861
    );
  dat_o_sig_9_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N120,
      Q => dat_o_sig_9_BRB7_862
    );
  dat_o_sig_10_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N90,
      Q => dat_o_sig_10_BRB6_863
    );
  dat_o_sig_10_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N122,
      Q => dat_o_sig_10_BRB7_864
    );
  dat_o_sig_11_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N92,
      Q => dat_o_sig_11_BRB6_865
    );
  dat_o_sig_11_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N124,
      Q => dat_o_sig_11_BRB7_866
    );
  dat_o_sig_12_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N94,
      Q => dat_o_sig_12_BRB6_867
    );
  dat_o_sig_12_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N126,
      Q => dat_o_sig_12_BRB7_868
    );
  dat_o_sig_13_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N96,
      Q => dat_o_sig_13_BRB6_869
    );
  dat_o_sig_13_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N128,
      Q => dat_o_sig_13_BRB7_870
    );
  dat_o_sig_14_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N98,
      Q => dat_o_sig_14_BRB6_871
    );
  dat_o_sig_14_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N130,
      Q => dat_o_sig_14_BRB7_872
    );
  dat_o_sig_15_BRB6 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N100,
      Q => dat_o_sig_15_BRB6_873
    );
  dat_o_sig_15_BRB7 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => N132,
      Q => dat_o_sig_15_BRB7_874
    );
  dat_o_sig_0_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => ADR_I_1_IBUF_38,
      Q => dat_o_sig_0_BRB4_875
    );
  dat_o_sig_0_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => ADR_I_2_IBUF_37,
      Q => dat_o_sig_0_BRB10_876
    );
  dat_o_sig_0_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(0),
      Q => dat_o_sig_0_BRB11_877
    );
  dat_o_sig_0_BRB12 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(0),
      Q => dat_o_sig_0_BRB12_878
    );
  dat_o_sig_0_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(0),
      Q => dat_o_sig_0_BRB13_879
    );
  dat_o_sig_1_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(1),
      Q => dat_o_sig_1_BRB9_880
    );
  dat_o_sig_1_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(1),
      Q => dat_o_sig_1_BRB10_881
    );
  dat_o_sig_1_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(1),
      Q => dat_o_sig_1_BRB11_882
    );
  dat_o_sig_2_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(2),
      Q => dat_o_sig_2_BRB9_883
    );
  dat_o_sig_2_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(2),
      Q => dat_o_sig_2_BRB10_884
    );
  dat_o_sig_2_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(2),
      Q => dat_o_sig_2_BRB11_885
    );
  dat_o_sig_3_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(3),
      Q => dat_o_sig_3_BRB9_886
    );
  dat_o_sig_3_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(3),
      Q => dat_o_sig_3_BRB10_887
    );
  dat_o_sig_3_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(3),
      Q => dat_o_sig_3_BRB11_888
    );
  dat_o_sig_4_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(4),
      Q => dat_o_sig_4_BRB9_889
    );
  dat_o_sig_4_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(4),
      Q => dat_o_sig_4_BRB10_890
    );
  dat_o_sig_4_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(4),
      Q => dat_o_sig_4_BRB11_891
    );
  dat_o_sig_5_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(5),
      Q => dat_o_sig_5_BRB9_892
    );
  dat_o_sig_5_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(5),
      Q => dat_o_sig_5_BRB10_893
    );
  dat_o_sig_5_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(5),
      Q => dat_o_sig_5_BRB11_894
    );
  dat_o_sig_6_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(6),
      Q => dat_o_sig_6_BRB9_895
    );
  dat_o_sig_6_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(6),
      Q => dat_o_sig_6_BRB10_896
    );
  dat_o_sig_6_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(6),
      Q => dat_o_sig_6_BRB11_897
    );
  dat_o_sig_7_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(7),
      Q => dat_o_sig_7_BRB9_898
    );
  dat_o_sig_7_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(7),
      Q => dat_o_sig_7_BRB10_899
    );
  dat_o_sig_7_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(7),
      Q => dat_o_sig_7_BRB11_900
    );
  dat_o_sig_8_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(8),
      Q => dat_o_sig_8_BRB9_901
    );
  dat_o_sig_8_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(8),
      Q => dat_o_sig_8_BRB10_902
    );
  dat_o_sig_8_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(8),
      Q => dat_o_sig_8_BRB11_903
    );
  dat_o_sig_9_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(9),
      Q => dat_o_sig_9_BRB9_904
    );
  dat_o_sig_9_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(9),
      Q => dat_o_sig_9_BRB10_905
    );
  dat_o_sig_9_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(9),
      Q => dat_o_sig_9_BRB11_906
    );
  dat_o_sig_10_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(10),
      Q => dat_o_sig_10_BRB9_907
    );
  dat_o_sig_10_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(10),
      Q => dat_o_sig_10_BRB10_908
    );
  dat_o_sig_10_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(10),
      Q => dat_o_sig_10_BRB11_909
    );
  dat_o_sig_11_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(11),
      Q => dat_o_sig_11_BRB9_910
    );
  dat_o_sig_11_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(11),
      Q => dat_o_sig_11_BRB10_911
    );
  dat_o_sig_11_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(11),
      Q => dat_o_sig_11_BRB11_912
    );
  dat_o_sig_12_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(12),
      Q => dat_o_sig_12_BRB9_913
    );
  dat_o_sig_12_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(12),
      Q => dat_o_sig_12_BRB10_914
    );
  dat_o_sig_12_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(12),
      Q => dat_o_sig_12_BRB11_915
    );
  dat_o_sig_13_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(13),
      Q => dat_o_sig_13_BRB9_916
    );
  dat_o_sig_13_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(13),
      Q => dat_o_sig_13_BRB10_917
    );
  dat_o_sig_13_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(13),
      Q => dat_o_sig_13_BRB11_918
    );
  dat_o_sig_14_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(14),
      Q => dat_o_sig_14_BRB9_919
    );
  dat_o_sig_14_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(14),
      Q => dat_o_sig_14_BRB10_920
    );
  dat_o_sig_14_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(14),
      Q => dat_o_sig_14_BRB11_921
    );
  dat_o_sig_15_BRB9 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(15),
      Q => dat_o_sig_15_BRB9_922
    );
  dat_o_sig_15_BRB10 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(15),
      Q => dat_o_sig_15_BRB10_923
    );
  dat_o_sig_15_BRB11 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => x_amp_delay_reg(15),
      Q => dat_o_sig_15_BRB11_924
    );
  dat_o_sig_0_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(16),
      Q => dat_o_sig_0_BRB15_925
    );
  dat_o_sig_0_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(16),
      Q => dat_o_sig_0_BRB16_926
    );
  dat_o_sig_0_BRB17 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(0),
      Q => dat_o_sig_0_BRB17_927
    );
  dat_o_sig_0_BRB18 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(0),
      Q => dat_o_sig_0_BRB18_928
    );
  dat_o_sig_1_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(17),
      Q => dat_o_sig_1_BRB13_929
    );
  dat_o_sig_1_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(17),
      Q => dat_o_sig_1_BRB14_930
    );
  dat_o_sig_1_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(1),
      Q => dat_o_sig_1_BRB15_931
    );
  dat_o_sig_1_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(1),
      Q => dat_o_sig_1_BRB16_932
    );
  dat_o_sig_2_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(18),
      Q => dat_o_sig_2_BRB13_933
    );
  dat_o_sig_2_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(18),
      Q => dat_o_sig_2_BRB14_934
    );
  dat_o_sig_2_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(2),
      Q => dat_o_sig_2_BRB15_935
    );
  dat_o_sig_2_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(2),
      Q => dat_o_sig_2_BRB16_936
    );
  dat_o_sig_3_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(19),
      Q => dat_o_sig_3_BRB13_937
    );
  dat_o_sig_3_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(19),
      Q => dat_o_sig_3_BRB14_938
    );
  dat_o_sig_3_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(3),
      Q => dat_o_sig_3_BRB15_939
    );
  dat_o_sig_3_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(3),
      Q => dat_o_sig_3_BRB16_940
    );
  dat_o_sig_4_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(20),
      Q => dat_o_sig_4_BRB13_941
    );
  dat_o_sig_4_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(20),
      Q => dat_o_sig_4_BRB14_942
    );
  dat_o_sig_4_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(4),
      Q => dat_o_sig_4_BRB15_943
    );
  dat_o_sig_4_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(4),
      Q => dat_o_sig_4_BRB16_944
    );
  dat_o_sig_5_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(21),
      Q => dat_o_sig_5_BRB13_945
    );
  dat_o_sig_5_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(21),
      Q => dat_o_sig_5_BRB14_946
    );
  dat_o_sig_5_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(5),
      Q => dat_o_sig_5_BRB15_947
    );
  dat_o_sig_5_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(5),
      Q => dat_o_sig_5_BRB16_948
    );
  dat_o_sig_6_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(22),
      Q => dat_o_sig_6_BRB13_949
    );
  dat_o_sig_6_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(22),
      Q => dat_o_sig_6_BRB14_950
    );
  dat_o_sig_6_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(6),
      Q => dat_o_sig_6_BRB15_951
    );
  dat_o_sig_6_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(6),
      Q => dat_o_sig_6_BRB16_952
    );
  dat_o_sig_7_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(23),
      Q => dat_o_sig_7_BRB13_953
    );
  dat_o_sig_7_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(23),
      Q => dat_o_sig_7_BRB14_954
    );
  dat_o_sig_7_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(7),
      Q => dat_o_sig_7_BRB15_955
    );
  dat_o_sig_7_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(7),
      Q => dat_o_sig_7_BRB16_956
    );
  dat_o_sig_8_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(24),
      Q => dat_o_sig_8_BRB13_957
    );
  dat_o_sig_8_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(24),
      Q => dat_o_sig_8_BRB14_958
    );
  dat_o_sig_8_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(8),
      Q => dat_o_sig_8_BRB15_959
    );
  dat_o_sig_8_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(8),
      Q => dat_o_sig_8_BRB16_960
    );
  dat_o_sig_9_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(25),
      Q => dat_o_sig_9_BRB13_961
    );
  dat_o_sig_9_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(25),
      Q => dat_o_sig_9_BRB14_962
    );
  dat_o_sig_9_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(9),
      Q => dat_o_sig_9_BRB15_963
    );
  dat_o_sig_9_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(9),
      Q => dat_o_sig_9_BRB16_964
    );
  dat_o_sig_10_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(26),
      Q => dat_o_sig_10_BRB13_965
    );
  dat_o_sig_10_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(26),
      Q => dat_o_sig_10_BRB14_966
    );
  dat_o_sig_10_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(10),
      Q => dat_o_sig_10_BRB15_967
    );
  dat_o_sig_10_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(10),
      Q => dat_o_sig_10_BRB16_968
    );
  dat_o_sig_11_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(27),
      Q => dat_o_sig_11_BRB13_969
    );
  dat_o_sig_11_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(27),
      Q => dat_o_sig_11_BRB14_970
    );
  dat_o_sig_11_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(11),
      Q => dat_o_sig_11_BRB15_971
    );
  dat_o_sig_11_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(11),
      Q => dat_o_sig_11_BRB16_972
    );
  dat_o_sig_12_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(28),
      Q => dat_o_sig_12_BRB13_973
    );
  dat_o_sig_12_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(28),
      Q => dat_o_sig_12_BRB14_974
    );
  dat_o_sig_12_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(12),
      Q => dat_o_sig_12_BRB15_975
    );
  dat_o_sig_12_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(12),
      Q => dat_o_sig_12_BRB16_976
    );
  dat_o_sig_13_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(29),
      Q => dat_o_sig_13_BRB13_977
    );
  dat_o_sig_13_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(29),
      Q => dat_o_sig_13_BRB14_978
    );
  dat_o_sig_13_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(13),
      Q => dat_o_sig_13_BRB15_979
    );
  dat_o_sig_13_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(13),
      Q => dat_o_sig_13_BRB16_980
    );
  dat_o_sig_14_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(30),
      Q => dat_o_sig_14_BRB13_981
    );
  dat_o_sig_14_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(30),
      Q => dat_o_sig_14_BRB14_982
    );
  dat_o_sig_14_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(14),
      Q => dat_o_sig_14_BRB15_983
    );
  dat_o_sig_14_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(14),
      Q => dat_o_sig_14_BRB16_984
    );
  dat_o_sig_15_BRB13 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_repeats_reg(31),
      Q => dat_o_sig_15_BRB13_985
    );
  dat_o_sig_15_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => pri_pulse_width_reg(31),
      Q => dat_o_sig_15_BRB14_986
    );
  dat_o_sig_15_BRB15 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => l_amp_delay_reg(15),
      Q => dat_o_sig_15_BRB15_987
    );
  dat_o_sig_15_BRB16 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => num_pulses_reg(15),
      Q => dat_o_sig_15_BRB16_988
    );
  dat_o_sig_0_BRB2 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => ADR_I_7_IBUF_32,
      Q => dat_o_sig_0_BRB2_989
    );
  dat_o_sig_0_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => ADR_I_6_IBUF_33,
      Q => dat_o_sig_0_BRB3_990
    );
  dat_o_sig_0_BRB14 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => ADR_I_3_IBUF_36,
      Q => dat_o_sig_0_BRB14_991
    );
  dat_o_sig_0_BRB19 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT31_475,
      Q => dat_o_sig_0_BRB19_992
    );
  dat_o_sig_0_BRB20 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(0),
      Q => dat_o_sig_0_BRB20_993
    );
  dat_o_sig_1_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT241_473,
      Q => dat_o_sig_1_BRB3_994
    );
  dat_o_sig_1_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(1),
      Q => dat_o_sig_1_BRB4_995
    );
  dat_o_sig_2_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT271_474,
      Q => dat_o_sig_2_BRB3_996
    );
  dat_o_sig_2_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(2),
      Q => dat_o_sig_2_BRB4_997
    );
  dat_o_sig_3_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT301_476,
      Q => dat_o_sig_3_BRB3_998
    );
  dat_o_sig_3_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(3),
      Q => dat_o_sig_3_BRB4_999
    );
  dat_o_sig_4_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT332_477,
      Q => dat_o_sig_4_BRB3_1000
    );
  dat_o_sig_4_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(4),
      Q => dat_o_sig_4_BRB4_1001
    );
  dat_o_sig_5_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT361_478,
      Q => dat_o_sig_5_BRB3_1002
    );
  dat_o_sig_5_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(5),
      Q => dat_o_sig_5_BRB4_1003
    );
  dat_o_sig_6_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT391_479,
      Q => dat_o_sig_6_BRB3_1004
    );
  dat_o_sig_6_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(6),
      Q => dat_o_sig_6_BRB4_1005
    );
  dat_o_sig_7_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT421_480,
      Q => dat_o_sig_7_BRB3_1006
    );
  dat_o_sig_7_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(7),
      Q => dat_o_sig_7_BRB4_1007
    );
  dat_o_sig_8_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT451_481,
      Q => dat_o_sig_8_BRB3_1008
    );
  dat_o_sig_8_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(8),
      Q => dat_o_sig_8_BRB4_1009
    );
  dat_o_sig_9_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT481_482,
      Q => dat_o_sig_9_BRB3_1010
    );
  dat_o_sig_9_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(9),
      Q => dat_o_sig_9_BRB4_1011
    );
  dat_o_sig_10_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT61_483,
      Q => dat_o_sig_10_BRB3_1012
    );
  dat_o_sig_10_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(10),
      Q => dat_o_sig_10_BRB4_1013
    );
  dat_o_sig_11_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT91_484,
      Q => dat_o_sig_11_BRB3_1014
    );
  dat_o_sig_11_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(11),
      Q => dat_o_sig_11_BRB4_1015
    );
  dat_o_sig_12_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT122_468,
      Q => dat_o_sig_12_BRB3_1016
    );
  dat_o_sig_12_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(12),
      Q => dat_o_sig_12_BRB4_1017
    );
  dat_o_sig_13_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT151_470,
      Q => dat_o_sig_13_BRB3_1018
    );
  dat_o_sig_13_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(13),
      Q => dat_o_sig_13_BRB4_1019
    );
  dat_o_sig_14_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT181_471,
      Q => dat_o_sig_14_BRB3_1020
    );
  dat_o_sig_14_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(14),
      Q => dat_o_sig_14_BRB4_1021
    );
  dat_o_sig_15_BRB3 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT211_472,
      Q => dat_o_sig_15_BRB3_1022
    );
  dat_o_sig_15_BRB4 : FDE
    port map (
      C => CLK_I_BUFGP_41,
      CE => Q_n3003_inv_322,
      D => instruction_reg(15),
      Q => dat_o_sig_15_BRB4_1023
    );
  write_ctrl : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => GND_5_o_GND_5_o_sub_11_OUT(7),
      I1 => WE_I_0_0,
      O => write_ctrl_323
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT1211 : LUT6
    generic map(
      INIT => X"5555FFFFFF55FEFF"
    )
    port map (
      I0 => ADR_I_7_IBUF_32,
      I1 => ADR_I_5_IBUF_34,
      I2 => ADR_I_4_IBUF_35,
      I3 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_11_463,
      I4 => ADR_I_6_IBUF_33,
      I5 => ADR_I_3_IBUF_36,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT121_465
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_3_11 : LUT4
    generic map(
      INIT => X"9555"
    )
    port map (
      I0 => ADR_I_3_IBUF_36,
      I1 => ADR_I_0_IBUF_39,
      I2 => ADR_I_1_IBUF_38,
      I3 => ADR_I_2_IBUF_37,
      O => GND_5_o_GND_5_o_sub_11_OUT(3)
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11 : LUT6
    generic map(
      INIT => X"AAAAAAAAA9999999"
    )
    port map (
      I0 => ADR_I_5_IBUF_34,
      I1 => ADR_I_3_IBUF_36,
      I2 => ADR_I_1_IBUF_38,
      I3 => ADR_I_2_IBUF_37,
      I4 => ADR_I_0_IBUF_39,
      I5 => ADR_I_4_IBUF_35,
      O => GND_5_o_GND_5_o_sub_11_OUT(5)
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_4_11 : LUT5
    generic map(
      INIT => X"A9999999"
    )
    port map (
      I0 => ADR_I_4_IBUF_35,
      I1 => ADR_I_3_IBUF_36,
      I2 => ADR_I_2_IBUF_37,
      I3 => ADR_I_0_IBUF_39,
      I4 => ADR_I_1_IBUF_38,
      O => GND_5_o_GND_5_o_sub_11_OUT(4)
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_6_11 : LUT5
    generic map(
      INIT => X"AAA9AAAA"
    )
    port map (
      I0 => ADR_I_6_IBUF_33,
      I1 => ADR_I_3_IBUF_36,
      I2 => ADR_I_4_IBUF_35,
      I3 => ADR_I_5_IBUF_34,
      I4 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_11_463,
      O => GND_5_o_GND_5_o_sub_11_OUT(6)
    );
  Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT124 : LUT5
    generic map(
      INIT => X"00000001"
    )
    port map (
      I0 => ADR_I_7_IBUF_32,
      I1 => ADR_I_3_IBUF_36,
      I2 => ADR_I_4_IBUF_35,
      I3 => ADR_I_5_IBUF_34,
      I4 => ADR_I_6_IBUF_33,
      O => Mmux_GND_5_o_num_pulses_reg_15_select_31_OUT124_469
    );
  write_ctrl3 : LUT6
    generic map(
      INIT => X"8000008000800080"
    )
    port map (
      I0 => WE_I_IBUF_43,
      I1 => STB_I_IBUF_42,
      I2 => ADR_I_7_IBUF_32,
      I3 => ADR_I_6_IBUF_33,
      I4 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_11_463,
      I5 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_5_11_464,
      O => write_ctrl3_340
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_11 : LUT6
    generic map(
      INIT => X"AAAAAAAAAAA9AAAA"
    )
    port map (
      I0 => ADR_I_7_IBUF_32,
      I1 => ADR_I_6_IBUF_33,
      I2 => ADR_I_3_IBUF_36,
      I3 => ADR_I_4_IBUF_35,
      I4 => Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_7_11_463,
      I5 => ADR_I_5_IBUF_34,
      O => GND_5_o_GND_5_o_sub_11_OUT(7)
    );
  CLK_I_BUFGP : BUFGP
    port map (
      I => CLK_I,
      O => CLK_I_BUFGP_41
    );
  clk_IN_BUFGP : BUFGP
    port map (
      I => clk_IN,
      O => clk_IN_BUFGP_40
    );
  STB_I_inv1_INV_0 : INV
    port map (
      I => STB_I_IBUF_42,
      O => STB_I_inv
    );
  Msub_GND_5_o_GND_5_o_sub_11_OUT_7_0_xor_0_11_INV_0 : INV
    port map (
      I => ADR_I_0_IBUF_39,
      O => GND_5_o_GND_5_o_sub_11_OUT(0)
    );
  Madd_n0237_5_0_xor_1_11_INV_0 : INV
    port map (
      I => Madd_n0235_5_0_lut_1_Q,
      O => n0237_5_0_1_Q
    );
  n0235_5_0_0_1_INV_0 : INV
    port map (
      I => Madd_n0235_5_0_cy_0_Q,
      O => n0235_5_0_0_Q
    );
  Madd_n0241_5_0_xor_2_11_INV_0 : INV
    port map (
      I => Madd_n0235_5_0_lut_2_Q,
      O => n0241_5_0_2_Q
    );

end Structure;

