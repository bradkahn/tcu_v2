--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: tcu_reg_file_synthesis.vhd
-- /___/   /\     Timestamp: Sun Mar  4 20:50:51 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm tcu_reg_file -w -dir netgen/synthesis -ofmt vhdl -sim tcu_reg_file.ngc tcu_reg_file_synthesis.vhd 
-- Device	: xc6slx150t-3-fgg676
-- Input file	: tcu_reg_file.ngc
-- Output file	: /home/brad/tcu_v2/tcu_gateware/ise/tcu_fc/netgen/synthesis/tcu_reg_file_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: tcu_reg_file
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

entity tcu_reg_file is
  port (
    clk_IN : in STD_LOGIC := 'X'; 
    rst_IN : in STD_LOGIC := 'X'; 
    pulse_index_IN : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    status_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    instruction_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    num_pulses_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    num_repeats_IN : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    x_amp_delay_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    l_amp_delay_IN : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    pri_pulse_width_IN : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    pulse_0_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_1_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_2_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_3_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_4_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_5_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_6_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_7_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_8_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_9_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_10_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_11_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_12_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_13_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_14_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    pulse_15_params_IN : in STD_LOGIC_VECTOR ( 95 downto 0 ); 
    status_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    instruction_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    num_pulses_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    num_repeats_OUT : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    x_amp_delay_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    l_amp_delay_OUT : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    pri_pulse_width_OUT : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    pulse_params_OUT : out STD_LOGIC_VECTOR ( 95 downto 0 ) 
  );
end tcu_reg_file;

architecture Structure of tcu_reg_file is
  signal pulse_index_IN_4_IBUF_0 : STD_LOGIC; 
  signal pulse_index_IN_3_IBUF_1 : STD_LOGIC; 
  signal pulse_index_IN_2_IBUF_2 : STD_LOGIC; 
  signal pulse_index_IN_1_IBUF_3 : STD_LOGIC; 
  signal pulse_index_IN_0_IBUF_4 : STD_LOGIC; 
  signal instruction_IN_15_IBUF_5 : STD_LOGIC; 
  signal instruction_IN_14_IBUF_6 : STD_LOGIC; 
  signal instruction_IN_13_IBUF_7 : STD_LOGIC; 
  signal instruction_IN_12_IBUF_8 : STD_LOGIC; 
  signal instruction_IN_11_IBUF_9 : STD_LOGIC; 
  signal instruction_IN_10_IBUF_10 : STD_LOGIC; 
  signal instruction_IN_9_IBUF_11 : STD_LOGIC; 
  signal instruction_IN_8_IBUF_12 : STD_LOGIC; 
  signal instruction_IN_7_IBUF_13 : STD_LOGIC; 
  signal instruction_IN_6_IBUF_14 : STD_LOGIC; 
  signal instruction_IN_5_IBUF_15 : STD_LOGIC; 
  signal instruction_IN_4_IBUF_16 : STD_LOGIC; 
  signal instruction_IN_3_IBUF_17 : STD_LOGIC; 
  signal instruction_IN_2_IBUF_18 : STD_LOGIC; 
  signal instruction_IN_1_IBUF_19 : STD_LOGIC; 
  signal instruction_IN_0_IBUF_20 : STD_LOGIC; 
  signal num_pulses_IN_15_IBUF_21 : STD_LOGIC; 
  signal num_pulses_IN_14_IBUF_22 : STD_LOGIC; 
  signal num_pulses_IN_13_IBUF_23 : STD_LOGIC; 
  signal num_pulses_IN_12_IBUF_24 : STD_LOGIC; 
  signal num_pulses_IN_11_IBUF_25 : STD_LOGIC; 
  signal num_pulses_IN_10_IBUF_26 : STD_LOGIC; 
  signal num_pulses_IN_9_IBUF_27 : STD_LOGIC; 
  signal num_pulses_IN_8_IBUF_28 : STD_LOGIC; 
  signal num_pulses_IN_7_IBUF_29 : STD_LOGIC; 
  signal num_pulses_IN_6_IBUF_30 : STD_LOGIC; 
  signal num_pulses_IN_5_IBUF_31 : STD_LOGIC; 
  signal num_pulses_IN_4_IBUF_32 : STD_LOGIC; 
  signal num_pulses_IN_3_IBUF_33 : STD_LOGIC; 
  signal num_pulses_IN_2_IBUF_34 : STD_LOGIC; 
  signal num_pulses_IN_1_IBUF_35 : STD_LOGIC; 
  signal num_pulses_IN_0_IBUF_36 : STD_LOGIC; 
  signal num_repeats_IN_31_IBUF_37 : STD_LOGIC; 
  signal num_repeats_IN_30_IBUF_38 : STD_LOGIC; 
  signal num_repeats_IN_29_IBUF_39 : STD_LOGIC; 
  signal num_repeats_IN_28_IBUF_40 : STD_LOGIC; 
  signal num_repeats_IN_27_IBUF_41 : STD_LOGIC; 
  signal num_repeats_IN_26_IBUF_42 : STD_LOGIC; 
  signal num_repeats_IN_25_IBUF_43 : STD_LOGIC; 
  signal num_repeats_IN_24_IBUF_44 : STD_LOGIC; 
  signal num_repeats_IN_23_IBUF_45 : STD_LOGIC; 
  signal num_repeats_IN_22_IBUF_46 : STD_LOGIC; 
  signal num_repeats_IN_21_IBUF_47 : STD_LOGIC; 
  signal num_repeats_IN_20_IBUF_48 : STD_LOGIC; 
  signal num_repeats_IN_19_IBUF_49 : STD_LOGIC; 
  signal num_repeats_IN_18_IBUF_50 : STD_LOGIC; 
  signal num_repeats_IN_17_IBUF_51 : STD_LOGIC; 
  signal num_repeats_IN_16_IBUF_52 : STD_LOGIC; 
  signal num_repeats_IN_15_IBUF_53 : STD_LOGIC; 
  signal num_repeats_IN_14_IBUF_54 : STD_LOGIC; 
  signal num_repeats_IN_13_IBUF_55 : STD_LOGIC; 
  signal num_repeats_IN_12_IBUF_56 : STD_LOGIC; 
  signal num_repeats_IN_11_IBUF_57 : STD_LOGIC; 
  signal num_repeats_IN_10_IBUF_58 : STD_LOGIC; 
  signal num_repeats_IN_9_IBUF_59 : STD_LOGIC; 
  signal num_repeats_IN_8_IBUF_60 : STD_LOGIC; 
  signal num_repeats_IN_7_IBUF_61 : STD_LOGIC; 
  signal num_repeats_IN_6_IBUF_62 : STD_LOGIC; 
  signal num_repeats_IN_5_IBUF_63 : STD_LOGIC; 
  signal num_repeats_IN_4_IBUF_64 : STD_LOGIC; 
  signal num_repeats_IN_3_IBUF_65 : STD_LOGIC; 
  signal num_repeats_IN_2_IBUF_66 : STD_LOGIC; 
  signal num_repeats_IN_1_IBUF_67 : STD_LOGIC; 
  signal num_repeats_IN_0_IBUF_68 : STD_LOGIC; 
  signal x_amp_delay_IN_15_IBUF_69 : STD_LOGIC; 
  signal x_amp_delay_IN_14_IBUF_70 : STD_LOGIC; 
  signal x_amp_delay_IN_13_IBUF_71 : STD_LOGIC; 
  signal x_amp_delay_IN_12_IBUF_72 : STD_LOGIC; 
  signal x_amp_delay_IN_11_IBUF_73 : STD_LOGIC; 
  signal x_amp_delay_IN_10_IBUF_74 : STD_LOGIC; 
  signal x_amp_delay_IN_9_IBUF_75 : STD_LOGIC; 
  signal x_amp_delay_IN_8_IBUF_76 : STD_LOGIC; 
  signal x_amp_delay_IN_7_IBUF_77 : STD_LOGIC; 
  signal x_amp_delay_IN_6_IBUF_78 : STD_LOGIC; 
  signal x_amp_delay_IN_5_IBUF_79 : STD_LOGIC; 
  signal x_amp_delay_IN_4_IBUF_80 : STD_LOGIC; 
  signal x_amp_delay_IN_3_IBUF_81 : STD_LOGIC; 
  signal x_amp_delay_IN_2_IBUF_82 : STD_LOGIC; 
  signal x_amp_delay_IN_1_IBUF_83 : STD_LOGIC; 
  signal x_amp_delay_IN_0_IBUF_84 : STD_LOGIC; 
  signal l_amp_delay_IN_15_IBUF_85 : STD_LOGIC; 
  signal l_amp_delay_IN_14_IBUF_86 : STD_LOGIC; 
  signal l_amp_delay_IN_13_IBUF_87 : STD_LOGIC; 
  signal l_amp_delay_IN_12_IBUF_88 : STD_LOGIC; 
  signal l_amp_delay_IN_11_IBUF_89 : STD_LOGIC; 
  signal l_amp_delay_IN_10_IBUF_90 : STD_LOGIC; 
  signal l_amp_delay_IN_9_IBUF_91 : STD_LOGIC; 
  signal l_amp_delay_IN_8_IBUF_92 : STD_LOGIC; 
  signal l_amp_delay_IN_7_IBUF_93 : STD_LOGIC; 
  signal l_amp_delay_IN_6_IBUF_94 : STD_LOGIC; 
  signal l_amp_delay_IN_5_IBUF_95 : STD_LOGIC; 
  signal l_amp_delay_IN_4_IBUF_96 : STD_LOGIC; 
  signal l_amp_delay_IN_3_IBUF_97 : STD_LOGIC; 
  signal l_amp_delay_IN_2_IBUF_98 : STD_LOGIC; 
  signal l_amp_delay_IN_1_IBUF_99 : STD_LOGIC; 
  signal l_amp_delay_IN_0_IBUF_100 : STD_LOGIC; 
  signal pri_pulse_width_IN_31_IBUF_101 : STD_LOGIC; 
  signal pri_pulse_width_IN_30_IBUF_102 : STD_LOGIC; 
  signal pri_pulse_width_IN_29_IBUF_103 : STD_LOGIC; 
  signal pri_pulse_width_IN_28_IBUF_104 : STD_LOGIC; 
  signal pri_pulse_width_IN_27_IBUF_105 : STD_LOGIC; 
  signal pri_pulse_width_IN_26_IBUF_106 : STD_LOGIC; 
  signal pri_pulse_width_IN_25_IBUF_107 : STD_LOGIC; 
  signal pri_pulse_width_IN_24_IBUF_108 : STD_LOGIC; 
  signal pri_pulse_width_IN_23_IBUF_109 : STD_LOGIC; 
  signal pri_pulse_width_IN_22_IBUF_110 : STD_LOGIC; 
  signal pri_pulse_width_IN_21_IBUF_111 : STD_LOGIC; 
  signal pri_pulse_width_IN_20_IBUF_112 : STD_LOGIC; 
  signal pri_pulse_width_IN_19_IBUF_113 : STD_LOGIC; 
  signal pri_pulse_width_IN_18_IBUF_114 : STD_LOGIC; 
  signal pri_pulse_width_IN_17_IBUF_115 : STD_LOGIC; 
  signal pri_pulse_width_IN_16_IBUF_116 : STD_LOGIC; 
  signal pri_pulse_width_IN_15_IBUF_117 : STD_LOGIC; 
  signal pri_pulse_width_IN_14_IBUF_118 : STD_LOGIC; 
  signal pri_pulse_width_IN_13_IBUF_119 : STD_LOGIC; 
  signal pri_pulse_width_IN_12_IBUF_120 : STD_LOGIC; 
  signal pri_pulse_width_IN_11_IBUF_121 : STD_LOGIC; 
  signal pri_pulse_width_IN_10_IBUF_122 : STD_LOGIC; 
  signal pri_pulse_width_IN_9_IBUF_123 : STD_LOGIC; 
  signal pri_pulse_width_IN_8_IBUF_124 : STD_LOGIC; 
  signal pri_pulse_width_IN_7_IBUF_125 : STD_LOGIC; 
  signal pri_pulse_width_IN_6_IBUF_126 : STD_LOGIC; 
  signal pri_pulse_width_IN_5_IBUF_127 : STD_LOGIC; 
  signal pri_pulse_width_IN_4_IBUF_128 : STD_LOGIC; 
  signal pri_pulse_width_IN_3_IBUF_129 : STD_LOGIC; 
  signal pri_pulse_width_IN_2_IBUF_130 : STD_LOGIC; 
  signal pri_pulse_width_IN_1_IBUF_131 : STD_LOGIC; 
  signal pri_pulse_width_IN_0_IBUF_132 : STD_LOGIC; 
  signal pulse_0_params_IN_95_IBUF_133 : STD_LOGIC; 
  signal pulse_0_params_IN_94_IBUF_134 : STD_LOGIC; 
  signal pulse_0_params_IN_93_IBUF_135 : STD_LOGIC; 
  signal pulse_0_params_IN_92_IBUF_136 : STD_LOGIC; 
  signal pulse_0_params_IN_91_IBUF_137 : STD_LOGIC; 
  signal pulse_0_params_IN_90_IBUF_138 : STD_LOGIC; 
  signal pulse_0_params_IN_89_IBUF_139 : STD_LOGIC; 
  signal pulse_0_params_IN_88_IBUF_140 : STD_LOGIC; 
  signal pulse_0_params_IN_87_IBUF_141 : STD_LOGIC; 
  signal pulse_0_params_IN_86_IBUF_142 : STD_LOGIC; 
  signal pulse_0_params_IN_85_IBUF_143 : STD_LOGIC; 
  signal pulse_0_params_IN_84_IBUF_144 : STD_LOGIC; 
  signal pulse_0_params_IN_83_IBUF_145 : STD_LOGIC; 
  signal pulse_0_params_IN_82_IBUF_146 : STD_LOGIC; 
  signal pulse_0_params_IN_81_IBUF_147 : STD_LOGIC; 
  signal pulse_0_params_IN_80_IBUF_148 : STD_LOGIC; 
  signal pulse_0_params_IN_79_IBUF_149 : STD_LOGIC; 
  signal pulse_0_params_IN_78_IBUF_150 : STD_LOGIC; 
  signal pulse_0_params_IN_77_IBUF_151 : STD_LOGIC; 
  signal pulse_0_params_IN_76_IBUF_152 : STD_LOGIC; 
  signal pulse_0_params_IN_75_IBUF_153 : STD_LOGIC; 
  signal pulse_0_params_IN_74_IBUF_154 : STD_LOGIC; 
  signal pulse_0_params_IN_73_IBUF_155 : STD_LOGIC; 
  signal pulse_0_params_IN_72_IBUF_156 : STD_LOGIC; 
  signal pulse_0_params_IN_71_IBUF_157 : STD_LOGIC; 
  signal pulse_0_params_IN_70_IBUF_158 : STD_LOGIC; 
  signal pulse_0_params_IN_69_IBUF_159 : STD_LOGIC; 
  signal pulse_0_params_IN_68_IBUF_160 : STD_LOGIC; 
  signal pulse_0_params_IN_67_IBUF_161 : STD_LOGIC; 
  signal pulse_0_params_IN_66_IBUF_162 : STD_LOGIC; 
  signal pulse_0_params_IN_65_IBUF_163 : STD_LOGIC; 
  signal pulse_0_params_IN_64_IBUF_164 : STD_LOGIC; 
  signal pulse_0_params_IN_63_IBUF_165 : STD_LOGIC; 
  signal pulse_0_params_IN_62_IBUF_166 : STD_LOGIC; 
  signal pulse_0_params_IN_61_IBUF_167 : STD_LOGIC; 
  signal pulse_0_params_IN_60_IBUF_168 : STD_LOGIC; 
  signal pulse_0_params_IN_59_IBUF_169 : STD_LOGIC; 
  signal pulse_0_params_IN_58_IBUF_170 : STD_LOGIC; 
  signal pulse_0_params_IN_57_IBUF_171 : STD_LOGIC; 
  signal pulse_0_params_IN_56_IBUF_172 : STD_LOGIC; 
  signal pulse_0_params_IN_55_IBUF_173 : STD_LOGIC; 
  signal pulse_0_params_IN_54_IBUF_174 : STD_LOGIC; 
  signal pulse_0_params_IN_53_IBUF_175 : STD_LOGIC; 
  signal pulse_0_params_IN_52_IBUF_176 : STD_LOGIC; 
  signal pulse_0_params_IN_51_IBUF_177 : STD_LOGIC; 
  signal pulse_0_params_IN_50_IBUF_178 : STD_LOGIC; 
  signal pulse_0_params_IN_49_IBUF_179 : STD_LOGIC; 
  signal pulse_0_params_IN_48_IBUF_180 : STD_LOGIC; 
  signal pulse_0_params_IN_47_IBUF_181 : STD_LOGIC; 
  signal pulse_0_params_IN_46_IBUF_182 : STD_LOGIC; 
  signal pulse_0_params_IN_45_IBUF_183 : STD_LOGIC; 
  signal pulse_0_params_IN_44_IBUF_184 : STD_LOGIC; 
  signal pulse_0_params_IN_43_IBUF_185 : STD_LOGIC; 
  signal pulse_0_params_IN_42_IBUF_186 : STD_LOGIC; 
  signal pulse_0_params_IN_41_IBUF_187 : STD_LOGIC; 
  signal pulse_0_params_IN_40_IBUF_188 : STD_LOGIC; 
  signal pulse_0_params_IN_39_IBUF_189 : STD_LOGIC; 
  signal pulse_0_params_IN_38_IBUF_190 : STD_LOGIC; 
  signal pulse_0_params_IN_37_IBUF_191 : STD_LOGIC; 
  signal pulse_0_params_IN_36_IBUF_192 : STD_LOGIC; 
  signal pulse_0_params_IN_35_IBUF_193 : STD_LOGIC; 
  signal pulse_0_params_IN_34_IBUF_194 : STD_LOGIC; 
  signal pulse_0_params_IN_33_IBUF_195 : STD_LOGIC; 
  signal pulse_0_params_IN_32_IBUF_196 : STD_LOGIC; 
  signal pulse_0_params_IN_31_IBUF_197 : STD_LOGIC; 
  signal pulse_0_params_IN_30_IBUF_198 : STD_LOGIC; 
  signal pulse_0_params_IN_29_IBUF_199 : STD_LOGIC; 
  signal pulse_0_params_IN_28_IBUF_200 : STD_LOGIC; 
  signal pulse_0_params_IN_27_IBUF_201 : STD_LOGIC; 
  signal pulse_0_params_IN_26_IBUF_202 : STD_LOGIC; 
  signal pulse_0_params_IN_25_IBUF_203 : STD_LOGIC; 
  signal pulse_0_params_IN_24_IBUF_204 : STD_LOGIC; 
  signal pulse_0_params_IN_23_IBUF_205 : STD_LOGIC; 
  signal pulse_0_params_IN_22_IBUF_206 : STD_LOGIC; 
  signal pulse_0_params_IN_21_IBUF_207 : STD_LOGIC; 
  signal pulse_0_params_IN_20_IBUF_208 : STD_LOGIC; 
  signal pulse_0_params_IN_19_IBUF_209 : STD_LOGIC; 
  signal pulse_0_params_IN_18_IBUF_210 : STD_LOGIC; 
  signal pulse_0_params_IN_17_IBUF_211 : STD_LOGIC; 
  signal pulse_0_params_IN_16_IBUF_212 : STD_LOGIC; 
  signal pulse_0_params_IN_15_IBUF_213 : STD_LOGIC; 
  signal pulse_0_params_IN_14_IBUF_214 : STD_LOGIC; 
  signal pulse_0_params_IN_13_IBUF_215 : STD_LOGIC; 
  signal pulse_0_params_IN_12_IBUF_216 : STD_LOGIC; 
  signal pulse_0_params_IN_11_IBUF_217 : STD_LOGIC; 
  signal pulse_0_params_IN_10_IBUF_218 : STD_LOGIC; 
  signal pulse_0_params_IN_9_IBUF_219 : STD_LOGIC; 
  signal pulse_0_params_IN_8_IBUF_220 : STD_LOGIC; 
  signal pulse_0_params_IN_7_IBUF_221 : STD_LOGIC; 
  signal pulse_0_params_IN_6_IBUF_222 : STD_LOGIC; 
  signal pulse_0_params_IN_5_IBUF_223 : STD_LOGIC; 
  signal pulse_0_params_IN_4_IBUF_224 : STD_LOGIC; 
  signal pulse_0_params_IN_3_IBUF_225 : STD_LOGIC; 
  signal pulse_0_params_IN_2_IBUF_226 : STD_LOGIC; 
  signal pulse_0_params_IN_1_IBUF_227 : STD_LOGIC; 
  signal pulse_0_params_IN_0_IBUF_228 : STD_LOGIC; 
  signal clk_IN_BUFGP_229 : STD_LOGIC; 
  signal rst_IN_IBUF_230 : STD_LOGIC; 
  signal instruction_OUT_15_460 : STD_LOGIC; 
  signal instruction_OUT_14_461 : STD_LOGIC; 
  signal instruction_OUT_13_462 : STD_LOGIC; 
  signal instruction_OUT_12_463 : STD_LOGIC; 
  signal instruction_OUT_11_464 : STD_LOGIC; 
  signal instruction_OUT_10_465 : STD_LOGIC; 
  signal instruction_OUT_9_466 : STD_LOGIC; 
  signal instruction_OUT_8_467 : STD_LOGIC; 
  signal instruction_OUT_7_468 : STD_LOGIC; 
  signal instruction_OUT_6_469 : STD_LOGIC; 
  signal instruction_OUT_5_470 : STD_LOGIC; 
  signal instruction_OUT_4_471 : STD_LOGIC; 
  signal instruction_OUT_3_472 : STD_LOGIC; 
  signal instruction_OUT_2_473 : STD_LOGIC; 
  signal instruction_OUT_1_474 : STD_LOGIC; 
  signal instruction_OUT_0_475 : STD_LOGIC; 
  signal num_pulses_OUT_15_476 : STD_LOGIC; 
  signal num_pulses_OUT_14_477 : STD_LOGIC; 
  signal num_pulses_OUT_13_478 : STD_LOGIC; 
  signal num_pulses_OUT_12_479 : STD_LOGIC; 
  signal num_pulses_OUT_11_480 : STD_LOGIC; 
  signal num_pulses_OUT_10_481 : STD_LOGIC; 
  signal num_pulses_OUT_9_482 : STD_LOGIC; 
  signal num_pulses_OUT_8_483 : STD_LOGIC; 
  signal num_pulses_OUT_7_484 : STD_LOGIC; 
  signal num_pulses_OUT_6_485 : STD_LOGIC; 
  signal num_pulses_OUT_5_486 : STD_LOGIC; 
  signal num_pulses_OUT_4_487 : STD_LOGIC; 
  signal num_pulses_OUT_3_488 : STD_LOGIC; 
  signal num_pulses_OUT_2_489 : STD_LOGIC; 
  signal num_pulses_OUT_1_490 : STD_LOGIC; 
  signal num_pulses_OUT_0_491 : STD_LOGIC; 
  signal num_repeats_OUT_31_492 : STD_LOGIC; 
  signal num_repeats_OUT_30_493 : STD_LOGIC; 
  signal num_repeats_OUT_29_494 : STD_LOGIC; 
  signal num_repeats_OUT_28_495 : STD_LOGIC; 
  signal num_repeats_OUT_27_496 : STD_LOGIC; 
  signal num_repeats_OUT_26_497 : STD_LOGIC; 
  signal num_repeats_OUT_25_498 : STD_LOGIC; 
  signal num_repeats_OUT_24_499 : STD_LOGIC; 
  signal num_repeats_OUT_23_500 : STD_LOGIC; 
  signal num_repeats_OUT_22_501 : STD_LOGIC; 
  signal num_repeats_OUT_21_502 : STD_LOGIC; 
  signal num_repeats_OUT_20_503 : STD_LOGIC; 
  signal num_repeats_OUT_19_504 : STD_LOGIC; 
  signal num_repeats_OUT_18_505 : STD_LOGIC; 
  signal num_repeats_OUT_17_506 : STD_LOGIC; 
  signal num_repeats_OUT_16_507 : STD_LOGIC; 
  signal num_repeats_OUT_15_508 : STD_LOGIC; 
  signal num_repeats_OUT_14_509 : STD_LOGIC; 
  signal num_repeats_OUT_13_510 : STD_LOGIC; 
  signal num_repeats_OUT_12_511 : STD_LOGIC; 
  signal num_repeats_OUT_11_512 : STD_LOGIC; 
  signal num_repeats_OUT_10_513 : STD_LOGIC; 
  signal num_repeats_OUT_9_514 : STD_LOGIC; 
  signal num_repeats_OUT_8_515 : STD_LOGIC; 
  signal num_repeats_OUT_7_516 : STD_LOGIC; 
  signal num_repeats_OUT_6_517 : STD_LOGIC; 
  signal num_repeats_OUT_5_518 : STD_LOGIC; 
  signal num_repeats_OUT_4_519 : STD_LOGIC; 
  signal num_repeats_OUT_3_520 : STD_LOGIC; 
  signal num_repeats_OUT_2_521 : STD_LOGIC; 
  signal num_repeats_OUT_1_522 : STD_LOGIC; 
  signal num_repeats_OUT_0_523 : STD_LOGIC; 
  signal x_amp_delay_OUT_15_524 : STD_LOGIC; 
  signal x_amp_delay_OUT_14_525 : STD_LOGIC; 
  signal x_amp_delay_OUT_13_526 : STD_LOGIC; 
  signal x_amp_delay_OUT_12_527 : STD_LOGIC; 
  signal x_amp_delay_OUT_11_528 : STD_LOGIC; 
  signal x_amp_delay_OUT_10_529 : STD_LOGIC; 
  signal x_amp_delay_OUT_9_530 : STD_LOGIC; 
  signal x_amp_delay_OUT_8_531 : STD_LOGIC; 
  signal x_amp_delay_OUT_7_532 : STD_LOGIC; 
  signal x_amp_delay_OUT_6_533 : STD_LOGIC; 
  signal x_amp_delay_OUT_5_534 : STD_LOGIC; 
  signal x_amp_delay_OUT_4_535 : STD_LOGIC; 
  signal x_amp_delay_OUT_3_536 : STD_LOGIC; 
  signal x_amp_delay_OUT_2_537 : STD_LOGIC; 
  signal x_amp_delay_OUT_1_538 : STD_LOGIC; 
  signal x_amp_delay_OUT_0_539 : STD_LOGIC; 
  signal l_amp_delay_OUT_15_540 : STD_LOGIC; 
  signal l_amp_delay_OUT_14_541 : STD_LOGIC; 
  signal l_amp_delay_OUT_13_542 : STD_LOGIC; 
  signal l_amp_delay_OUT_12_543 : STD_LOGIC; 
  signal l_amp_delay_OUT_11_544 : STD_LOGIC; 
  signal l_amp_delay_OUT_10_545 : STD_LOGIC; 
  signal l_amp_delay_OUT_9_546 : STD_LOGIC; 
  signal l_amp_delay_OUT_8_547 : STD_LOGIC; 
  signal l_amp_delay_OUT_7_548 : STD_LOGIC; 
  signal l_amp_delay_OUT_6_549 : STD_LOGIC; 
  signal l_amp_delay_OUT_5_550 : STD_LOGIC; 
  signal l_amp_delay_OUT_4_551 : STD_LOGIC; 
  signal l_amp_delay_OUT_3_552 : STD_LOGIC; 
  signal l_amp_delay_OUT_2_553 : STD_LOGIC; 
  signal l_amp_delay_OUT_1_554 : STD_LOGIC; 
  signal l_amp_delay_OUT_0_555 : STD_LOGIC; 
  signal pri_pulse_width_OUT_31_556 : STD_LOGIC; 
  signal pri_pulse_width_OUT_30_557 : STD_LOGIC; 
  signal pri_pulse_width_OUT_29_558 : STD_LOGIC; 
  signal pri_pulse_width_OUT_28_559 : STD_LOGIC; 
  signal pri_pulse_width_OUT_27_560 : STD_LOGIC; 
  signal pri_pulse_width_OUT_26_561 : STD_LOGIC; 
  signal pri_pulse_width_OUT_25_562 : STD_LOGIC; 
  signal pri_pulse_width_OUT_24_563 : STD_LOGIC; 
  signal pri_pulse_width_OUT_23_564 : STD_LOGIC; 
  signal pri_pulse_width_OUT_22_565 : STD_LOGIC; 
  signal pri_pulse_width_OUT_21_566 : STD_LOGIC; 
  signal pri_pulse_width_OUT_20_567 : STD_LOGIC; 
  signal pri_pulse_width_OUT_19_568 : STD_LOGIC; 
  signal pri_pulse_width_OUT_18_569 : STD_LOGIC; 
  signal pri_pulse_width_OUT_17_570 : STD_LOGIC; 
  signal pri_pulse_width_OUT_16_571 : STD_LOGIC; 
  signal pri_pulse_width_OUT_15_572 : STD_LOGIC; 
  signal pri_pulse_width_OUT_14_573 : STD_LOGIC; 
  signal pri_pulse_width_OUT_13_574 : STD_LOGIC; 
  signal pri_pulse_width_OUT_12_575 : STD_LOGIC; 
  signal pri_pulse_width_OUT_11_576 : STD_LOGIC; 
  signal pri_pulse_width_OUT_10_577 : STD_LOGIC; 
  signal pri_pulse_width_OUT_9_578 : STD_LOGIC; 
  signal pri_pulse_width_OUT_8_579 : STD_LOGIC; 
  signal pri_pulse_width_OUT_7_580 : STD_LOGIC; 
  signal pri_pulse_width_OUT_6_581 : STD_LOGIC; 
  signal pri_pulse_width_OUT_5_582 : STD_LOGIC; 
  signal pri_pulse_width_OUT_4_583 : STD_LOGIC; 
  signal pri_pulse_width_OUT_3_584 : STD_LOGIC; 
  signal pri_pulse_width_OUT_2_585 : STD_LOGIC; 
  signal pri_pulse_width_OUT_1_586 : STD_LOGIC; 
  signal pri_pulse_width_OUT_0_587 : STD_LOGIC; 
  signal pulse_params_OUT_95_588 : STD_LOGIC; 
  signal pulse_params_OUT_94_589 : STD_LOGIC; 
  signal pulse_params_OUT_93_590 : STD_LOGIC; 
  signal pulse_params_OUT_92_591 : STD_LOGIC; 
  signal pulse_params_OUT_91_592 : STD_LOGIC; 
  signal pulse_params_OUT_90_593 : STD_LOGIC; 
  signal pulse_params_OUT_89_594 : STD_LOGIC; 
  signal pulse_params_OUT_88_595 : STD_LOGIC; 
  signal pulse_params_OUT_87_596 : STD_LOGIC; 
  signal pulse_params_OUT_86_597 : STD_LOGIC; 
  signal pulse_params_OUT_85_598 : STD_LOGIC; 
  signal pulse_params_OUT_84_599 : STD_LOGIC; 
  signal pulse_params_OUT_83_600 : STD_LOGIC; 
  signal pulse_params_OUT_82_601 : STD_LOGIC; 
  signal pulse_params_OUT_81_602 : STD_LOGIC; 
  signal pulse_params_OUT_80_603 : STD_LOGIC; 
  signal pulse_params_OUT_79_604 : STD_LOGIC; 
  signal pulse_params_OUT_78_605 : STD_LOGIC; 
  signal pulse_params_OUT_77_606 : STD_LOGIC; 
  signal pulse_params_OUT_76_607 : STD_LOGIC; 
  signal pulse_params_OUT_75_608 : STD_LOGIC; 
  signal pulse_params_OUT_74_609 : STD_LOGIC; 
  signal pulse_params_OUT_73_610 : STD_LOGIC; 
  signal pulse_params_OUT_72_611 : STD_LOGIC; 
  signal pulse_params_OUT_71_612 : STD_LOGIC; 
  signal pulse_params_OUT_70_613 : STD_LOGIC; 
  signal pulse_params_OUT_69_614 : STD_LOGIC; 
  signal pulse_params_OUT_68_615 : STD_LOGIC; 
  signal pulse_params_OUT_67_616 : STD_LOGIC; 
  signal pulse_params_OUT_66_617 : STD_LOGIC; 
  signal pulse_params_OUT_65_618 : STD_LOGIC; 
  signal pulse_params_OUT_64_619 : STD_LOGIC; 
  signal pulse_params_OUT_63_620 : STD_LOGIC; 
  signal pulse_params_OUT_62_621 : STD_LOGIC; 
  signal pulse_params_OUT_61_622 : STD_LOGIC; 
  signal pulse_params_OUT_60_623 : STD_LOGIC; 
  signal pulse_params_OUT_59_624 : STD_LOGIC; 
  signal pulse_params_OUT_58_625 : STD_LOGIC; 
  signal pulse_params_OUT_57_626 : STD_LOGIC; 
  signal pulse_params_OUT_56_627 : STD_LOGIC; 
  signal pulse_params_OUT_55_628 : STD_LOGIC; 
  signal pulse_params_OUT_54_629 : STD_LOGIC; 
  signal pulse_params_OUT_53_630 : STD_LOGIC; 
  signal pulse_params_OUT_52_631 : STD_LOGIC; 
  signal pulse_params_OUT_51_632 : STD_LOGIC; 
  signal pulse_params_OUT_50_633 : STD_LOGIC; 
  signal pulse_params_OUT_49_634 : STD_LOGIC; 
  signal pulse_params_OUT_48_635 : STD_LOGIC; 
  signal pulse_params_OUT_47_636 : STD_LOGIC; 
  signal pulse_params_OUT_46_637 : STD_LOGIC; 
  signal pulse_params_OUT_45_638 : STD_LOGIC; 
  signal pulse_params_OUT_44_639 : STD_LOGIC; 
  signal pulse_params_OUT_43_640 : STD_LOGIC; 
  signal pulse_params_OUT_42_641 : STD_LOGIC; 
  signal pulse_params_OUT_41_642 : STD_LOGIC; 
  signal pulse_params_OUT_40_643 : STD_LOGIC; 
  signal pulse_params_OUT_39_644 : STD_LOGIC; 
  signal pulse_params_OUT_38_645 : STD_LOGIC; 
  signal pulse_params_OUT_37_646 : STD_LOGIC; 
  signal pulse_params_OUT_36_647 : STD_LOGIC; 
  signal pulse_params_OUT_35_648 : STD_LOGIC; 
  signal pulse_params_OUT_34_649 : STD_LOGIC; 
  signal pulse_params_OUT_33_650 : STD_LOGIC; 
  signal pulse_params_OUT_32_651 : STD_LOGIC; 
  signal pulse_params_OUT_31_652 : STD_LOGIC; 
  signal pulse_params_OUT_30_653 : STD_LOGIC; 
  signal pulse_params_OUT_29_654 : STD_LOGIC; 
  signal pulse_params_OUT_28_655 : STD_LOGIC; 
  signal pulse_params_OUT_27_656 : STD_LOGIC; 
  signal pulse_params_OUT_26_657 : STD_LOGIC; 
  signal pulse_params_OUT_25_658 : STD_LOGIC; 
  signal pulse_params_OUT_24_659 : STD_LOGIC; 
  signal pulse_params_OUT_23_660 : STD_LOGIC; 
  signal pulse_params_OUT_22_661 : STD_LOGIC; 
  signal pulse_params_OUT_21_662 : STD_LOGIC; 
  signal pulse_params_OUT_20_663 : STD_LOGIC; 
  signal pulse_params_OUT_19_664 : STD_LOGIC; 
  signal pulse_params_OUT_18_665 : STD_LOGIC; 
  signal pulse_params_OUT_17_666 : STD_LOGIC; 
  signal pulse_params_OUT_16_667 : STD_LOGIC; 
  signal pulse_params_OUT_15_668 : STD_LOGIC; 
  signal pulse_params_OUT_14_669 : STD_LOGIC; 
  signal pulse_params_OUT_13_670 : STD_LOGIC; 
  signal pulse_params_OUT_12_671 : STD_LOGIC; 
  signal pulse_params_OUT_11_672 : STD_LOGIC; 
  signal pulse_params_OUT_10_673 : STD_LOGIC; 
  signal pulse_params_OUT_9_674 : STD_LOGIC; 
  signal pulse_params_OUT_8_675 : STD_LOGIC; 
  signal pulse_params_OUT_7_676 : STD_LOGIC; 
  signal pulse_params_OUT_6_677 : STD_LOGIC; 
  signal pulse_params_OUT_5_678 : STD_LOGIC; 
  signal pulse_params_OUT_4_679 : STD_LOGIC; 
  signal pulse_params_OUT_3_680 : STD_LOGIC; 
  signal pulse_params_OUT_2_681 : STD_LOGIC; 
  signal pulse_params_OUT_1_682 : STD_LOGIC; 
  signal pulse_params_OUT_0_683 : STD_LOGIC; 
  signal rst_IN_inv : STD_LOGIC; 
  signal pulse_params_OUT_0_rstpot_1140 : STD_LOGIC; 
  signal pulse_params_OUT_1_rstpot_1141 : STD_LOGIC; 
  signal pulse_params_OUT_2_rstpot_1142 : STD_LOGIC; 
  signal pulse_params_OUT_3_rstpot_1143 : STD_LOGIC; 
  signal pulse_params_OUT_4_rstpot_1144 : STD_LOGIC; 
  signal pulse_params_OUT_5_rstpot_1145 : STD_LOGIC; 
  signal pulse_params_OUT_6_rstpot_1146 : STD_LOGIC; 
  signal pulse_params_OUT_7_rstpot_1147 : STD_LOGIC; 
  signal pulse_params_OUT_8_rstpot_1148 : STD_LOGIC; 
  signal pulse_params_OUT_9_rstpot_1149 : STD_LOGIC; 
  signal pulse_params_OUT_10_rstpot_1150 : STD_LOGIC; 
  signal pulse_params_OUT_11_rstpot_1151 : STD_LOGIC; 
  signal pulse_params_OUT_12_rstpot_1152 : STD_LOGIC; 
  signal pulse_params_OUT_13_rstpot_1153 : STD_LOGIC; 
  signal pulse_params_OUT_14_rstpot_1154 : STD_LOGIC; 
  signal pulse_params_OUT_15_rstpot_1155 : STD_LOGIC; 
  signal pulse_params_OUT_16_rstpot_1156 : STD_LOGIC; 
  signal pulse_params_OUT_17_rstpot_1157 : STD_LOGIC; 
  signal pulse_params_OUT_18_rstpot_1158 : STD_LOGIC; 
  signal pulse_params_OUT_19_rstpot_1159 : STD_LOGIC; 
  signal pulse_params_OUT_20_rstpot_1160 : STD_LOGIC; 
  signal pulse_params_OUT_21_rstpot_1161 : STD_LOGIC; 
  signal pulse_params_OUT_22_rstpot_1162 : STD_LOGIC; 
  signal pulse_params_OUT_23_rstpot_1163 : STD_LOGIC; 
  signal pulse_params_OUT_24_rstpot_1164 : STD_LOGIC; 
  signal pulse_params_OUT_25_rstpot_1165 : STD_LOGIC; 
  signal pulse_params_OUT_26_rstpot_1166 : STD_LOGIC; 
  signal pulse_params_OUT_27_rstpot_1167 : STD_LOGIC; 
  signal pulse_params_OUT_28_rstpot_1168 : STD_LOGIC; 
  signal pulse_params_OUT_29_rstpot_1169 : STD_LOGIC; 
  signal pulse_params_OUT_30_rstpot_1170 : STD_LOGIC; 
  signal pulse_params_OUT_31_rstpot_1171 : STD_LOGIC; 
  signal pulse_params_OUT_32_rstpot_1172 : STD_LOGIC; 
  signal pulse_params_OUT_33_rstpot_1173 : STD_LOGIC; 
  signal pulse_params_OUT_34_rstpot_1174 : STD_LOGIC; 
  signal pulse_params_OUT_35_rstpot_1175 : STD_LOGIC; 
  signal pulse_params_OUT_36_rstpot_1176 : STD_LOGIC; 
  signal pulse_params_OUT_37_rstpot_1177 : STD_LOGIC; 
  signal pulse_params_OUT_38_rstpot_1178 : STD_LOGIC; 
  signal pulse_params_OUT_39_rstpot_1179 : STD_LOGIC; 
  signal pulse_params_OUT_40_rstpot_1180 : STD_LOGIC; 
  signal pulse_params_OUT_41_rstpot_1181 : STD_LOGIC; 
  signal pulse_params_OUT_42_rstpot_1182 : STD_LOGIC; 
  signal pulse_params_OUT_43_rstpot_1183 : STD_LOGIC; 
  signal pulse_params_OUT_44_rstpot_1184 : STD_LOGIC; 
  signal pulse_params_OUT_45_rstpot_1185 : STD_LOGIC; 
  signal pulse_params_OUT_46_rstpot_1186 : STD_LOGIC; 
  signal pulse_params_OUT_47_rstpot_1187 : STD_LOGIC; 
  signal pulse_params_OUT_48_rstpot_1188 : STD_LOGIC; 
  signal pulse_params_OUT_49_rstpot_1189 : STD_LOGIC; 
  signal pulse_params_OUT_50_rstpot_1190 : STD_LOGIC; 
  signal pulse_params_OUT_51_rstpot_1191 : STD_LOGIC; 
  signal pulse_params_OUT_52_rstpot_1192 : STD_LOGIC; 
  signal pulse_params_OUT_53_rstpot_1193 : STD_LOGIC; 
  signal pulse_params_OUT_54_rstpot_1194 : STD_LOGIC; 
  signal pulse_params_OUT_55_rstpot_1195 : STD_LOGIC; 
  signal pulse_params_OUT_56_rstpot_1196 : STD_LOGIC; 
  signal pulse_params_OUT_57_rstpot_1197 : STD_LOGIC; 
  signal pulse_params_OUT_58_rstpot_1198 : STD_LOGIC; 
  signal pulse_params_OUT_59_rstpot_1199 : STD_LOGIC; 
  signal pulse_params_OUT_60_rstpot_1200 : STD_LOGIC; 
  signal pulse_params_OUT_61_rstpot_1201 : STD_LOGIC; 
  signal pulse_params_OUT_62_rstpot_1202 : STD_LOGIC; 
  signal pulse_params_OUT_63_rstpot_1203 : STD_LOGIC; 
  signal pulse_params_OUT_64_rstpot_1204 : STD_LOGIC; 
  signal pulse_params_OUT_65_rstpot_1205 : STD_LOGIC; 
  signal pulse_params_OUT_66_rstpot_1206 : STD_LOGIC; 
  signal pulse_params_OUT_67_rstpot_1207 : STD_LOGIC; 
  signal pulse_params_OUT_68_rstpot_1208 : STD_LOGIC; 
  signal pulse_params_OUT_69_rstpot_1209 : STD_LOGIC; 
  signal pulse_params_OUT_70_rstpot_1210 : STD_LOGIC; 
  signal pulse_params_OUT_71_rstpot_1211 : STD_LOGIC; 
  signal pulse_params_OUT_72_rstpot_1212 : STD_LOGIC; 
  signal pulse_params_OUT_73_rstpot_1213 : STD_LOGIC; 
  signal pulse_params_OUT_74_rstpot_1214 : STD_LOGIC; 
  signal pulse_params_OUT_75_rstpot_1215 : STD_LOGIC; 
  signal pulse_params_OUT_76_rstpot_1216 : STD_LOGIC; 
  signal pulse_params_OUT_77_rstpot_1217 : STD_LOGIC; 
  signal pulse_params_OUT_78_rstpot_1218 : STD_LOGIC; 
  signal pulse_params_OUT_79_rstpot_1219 : STD_LOGIC; 
  signal pulse_params_OUT_80_rstpot_1220 : STD_LOGIC; 
  signal pulse_params_OUT_81_rstpot_1221 : STD_LOGIC; 
  signal pulse_params_OUT_82_rstpot_1222 : STD_LOGIC; 
  signal pulse_params_OUT_83_rstpot_1223 : STD_LOGIC; 
  signal pulse_params_OUT_84_rstpot_1224 : STD_LOGIC; 
  signal pulse_params_OUT_85_rstpot_1225 : STD_LOGIC; 
  signal pulse_params_OUT_86_rstpot_1226 : STD_LOGIC; 
  signal pulse_params_OUT_87_rstpot_1227 : STD_LOGIC; 
  signal pulse_params_OUT_88_rstpot_1228 : STD_LOGIC; 
  signal pulse_params_OUT_89_rstpot_1229 : STD_LOGIC; 
  signal pulse_params_OUT_90_rstpot_1230 : STD_LOGIC; 
  signal pulse_params_OUT_91_rstpot_1231 : STD_LOGIC; 
  signal pulse_params_OUT_92_rstpot_1232 : STD_LOGIC; 
  signal pulse_params_OUT_93_rstpot_1233 : STD_LOGIC; 
  signal pulse_params_OUT_94_rstpot_1234 : STD_LOGIC; 
  signal pulse_params_OUT_95_rstpot_1235 : STD_LOGIC; 
  signal pulse_index : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal instruction : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal num_pulses : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal num_repeats : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal x_amp_delay : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal l_amp_delay : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal pri_pulse_width : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal pulse_params_ram_0 : STD_LOGIC_VECTOR ( 95 downto 0 ); 
begin
  pulse_index_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_index_IN_0_IBUF_4,
      R => rst_IN_IBUF_230,
      Q => pulse_index(0)
    );
  pulse_index_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_index_IN_1_IBUF_3,
      R => rst_IN_IBUF_230,
      Q => pulse_index(1)
    );
  pulse_index_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_index_IN_2_IBUF_2,
      R => rst_IN_IBUF_230,
      Q => pulse_index(2)
    );
  pulse_index_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_index_IN_3_IBUF_1,
      R => rst_IN_IBUF_230,
      Q => pulse_index(3)
    );
  pulse_index_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_index_IN_4_IBUF_0,
      R => rst_IN_IBUF_230,
      Q => pulse_index(4)
    );
  instruction_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_0_IBUF_20,
      R => rst_IN_IBUF_230,
      Q => instruction(0)
    );
  instruction_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_1_IBUF_19,
      R => rst_IN_IBUF_230,
      Q => instruction(1)
    );
  instruction_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_2_IBUF_18,
      R => rst_IN_IBUF_230,
      Q => instruction(2)
    );
  instruction_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_3_IBUF_17,
      R => rst_IN_IBUF_230,
      Q => instruction(3)
    );
  instruction_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_4_IBUF_16,
      R => rst_IN_IBUF_230,
      Q => instruction(4)
    );
  instruction_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_5_IBUF_15,
      R => rst_IN_IBUF_230,
      Q => instruction(5)
    );
  instruction_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_6_IBUF_14,
      R => rst_IN_IBUF_230,
      Q => instruction(6)
    );
  instruction_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_7_IBUF_13,
      R => rst_IN_IBUF_230,
      Q => instruction(7)
    );
  instruction_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_8_IBUF_12,
      R => rst_IN_IBUF_230,
      Q => instruction(8)
    );
  instruction_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_9_IBUF_11,
      R => rst_IN_IBUF_230,
      Q => instruction(9)
    );
  instruction_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_10_IBUF_10,
      R => rst_IN_IBUF_230,
      Q => instruction(10)
    );
  instruction_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_11_IBUF_9,
      R => rst_IN_IBUF_230,
      Q => instruction(11)
    );
  instruction_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_12_IBUF_8,
      R => rst_IN_IBUF_230,
      Q => instruction(12)
    );
  instruction_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_13_IBUF_7,
      R => rst_IN_IBUF_230,
      Q => instruction(13)
    );
  instruction_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_14_IBUF_6,
      R => rst_IN_IBUF_230,
      Q => instruction(14)
    );
  instruction_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction_IN_15_IBUF_5,
      R => rst_IN_IBUF_230,
      Q => instruction(15)
    );
  num_pulses_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_0_IBUF_36,
      R => rst_IN_IBUF_230,
      Q => num_pulses(0)
    );
  num_pulses_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_1_IBUF_35,
      R => rst_IN_IBUF_230,
      Q => num_pulses(1)
    );
  num_pulses_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_2_IBUF_34,
      R => rst_IN_IBUF_230,
      Q => num_pulses(2)
    );
  num_pulses_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_3_IBUF_33,
      R => rst_IN_IBUF_230,
      Q => num_pulses(3)
    );
  num_pulses_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_4_IBUF_32,
      R => rst_IN_IBUF_230,
      Q => num_pulses(4)
    );
  num_pulses_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_5_IBUF_31,
      R => rst_IN_IBUF_230,
      Q => num_pulses(5)
    );
  num_pulses_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_6_IBUF_30,
      R => rst_IN_IBUF_230,
      Q => num_pulses(6)
    );
  num_pulses_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_7_IBUF_29,
      R => rst_IN_IBUF_230,
      Q => num_pulses(7)
    );
  num_pulses_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_8_IBUF_28,
      R => rst_IN_IBUF_230,
      Q => num_pulses(8)
    );
  num_pulses_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_9_IBUF_27,
      R => rst_IN_IBUF_230,
      Q => num_pulses(9)
    );
  num_pulses_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_10_IBUF_26,
      R => rst_IN_IBUF_230,
      Q => num_pulses(10)
    );
  num_pulses_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_11_IBUF_25,
      R => rst_IN_IBUF_230,
      Q => num_pulses(11)
    );
  num_pulses_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_12_IBUF_24,
      R => rst_IN_IBUF_230,
      Q => num_pulses(12)
    );
  num_pulses_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_13_IBUF_23,
      R => rst_IN_IBUF_230,
      Q => num_pulses(13)
    );
  num_pulses_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_14_IBUF_22,
      R => rst_IN_IBUF_230,
      Q => num_pulses(14)
    );
  num_pulses_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses_IN_15_IBUF_21,
      R => rst_IN_IBUF_230,
      Q => num_pulses(15)
    );
  num_repeats_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_0_IBUF_68,
      R => rst_IN_IBUF_230,
      Q => num_repeats(0)
    );
  num_repeats_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_1_IBUF_67,
      R => rst_IN_IBUF_230,
      Q => num_repeats(1)
    );
  num_repeats_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_2_IBUF_66,
      R => rst_IN_IBUF_230,
      Q => num_repeats(2)
    );
  num_repeats_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_3_IBUF_65,
      R => rst_IN_IBUF_230,
      Q => num_repeats(3)
    );
  num_repeats_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_4_IBUF_64,
      R => rst_IN_IBUF_230,
      Q => num_repeats(4)
    );
  num_repeats_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_5_IBUF_63,
      R => rst_IN_IBUF_230,
      Q => num_repeats(5)
    );
  num_repeats_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_6_IBUF_62,
      R => rst_IN_IBUF_230,
      Q => num_repeats(6)
    );
  num_repeats_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_7_IBUF_61,
      R => rst_IN_IBUF_230,
      Q => num_repeats(7)
    );
  num_repeats_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_8_IBUF_60,
      R => rst_IN_IBUF_230,
      Q => num_repeats(8)
    );
  num_repeats_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_9_IBUF_59,
      R => rst_IN_IBUF_230,
      Q => num_repeats(9)
    );
  num_repeats_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_10_IBUF_58,
      R => rst_IN_IBUF_230,
      Q => num_repeats(10)
    );
  num_repeats_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_11_IBUF_57,
      R => rst_IN_IBUF_230,
      Q => num_repeats(11)
    );
  num_repeats_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_12_IBUF_56,
      R => rst_IN_IBUF_230,
      Q => num_repeats(12)
    );
  num_repeats_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_13_IBUF_55,
      R => rst_IN_IBUF_230,
      Q => num_repeats(13)
    );
  num_repeats_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_14_IBUF_54,
      R => rst_IN_IBUF_230,
      Q => num_repeats(14)
    );
  num_repeats_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_15_IBUF_53,
      R => rst_IN_IBUF_230,
      Q => num_repeats(15)
    );
  num_repeats_16 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_16_IBUF_52,
      R => rst_IN_IBUF_230,
      Q => num_repeats(16)
    );
  num_repeats_17 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_17_IBUF_51,
      R => rst_IN_IBUF_230,
      Q => num_repeats(17)
    );
  num_repeats_18 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_18_IBUF_50,
      R => rst_IN_IBUF_230,
      Q => num_repeats(18)
    );
  num_repeats_19 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_19_IBUF_49,
      R => rst_IN_IBUF_230,
      Q => num_repeats(19)
    );
  num_repeats_20 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_20_IBUF_48,
      R => rst_IN_IBUF_230,
      Q => num_repeats(20)
    );
  num_repeats_21 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_21_IBUF_47,
      R => rst_IN_IBUF_230,
      Q => num_repeats(21)
    );
  num_repeats_22 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_22_IBUF_46,
      R => rst_IN_IBUF_230,
      Q => num_repeats(22)
    );
  num_repeats_23 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_23_IBUF_45,
      R => rst_IN_IBUF_230,
      Q => num_repeats(23)
    );
  num_repeats_24 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_24_IBUF_44,
      R => rst_IN_IBUF_230,
      Q => num_repeats(24)
    );
  num_repeats_25 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_25_IBUF_43,
      R => rst_IN_IBUF_230,
      Q => num_repeats(25)
    );
  num_repeats_26 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_26_IBUF_42,
      R => rst_IN_IBUF_230,
      Q => num_repeats(26)
    );
  num_repeats_27 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_27_IBUF_41,
      R => rst_IN_IBUF_230,
      Q => num_repeats(27)
    );
  num_repeats_28 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_28_IBUF_40,
      R => rst_IN_IBUF_230,
      Q => num_repeats(28)
    );
  num_repeats_29 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_29_IBUF_39,
      R => rst_IN_IBUF_230,
      Q => num_repeats(29)
    );
  num_repeats_30 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_30_IBUF_38,
      R => rst_IN_IBUF_230,
      Q => num_repeats(30)
    );
  num_repeats_31 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats_IN_31_IBUF_37,
      R => rst_IN_IBUF_230,
      Q => num_repeats(31)
    );
  x_amp_delay_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_0_IBUF_84,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(0)
    );
  x_amp_delay_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_1_IBUF_83,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(1)
    );
  x_amp_delay_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_2_IBUF_82,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(2)
    );
  x_amp_delay_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_3_IBUF_81,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(3)
    );
  x_amp_delay_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_4_IBUF_80,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(4)
    );
  x_amp_delay_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_5_IBUF_79,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(5)
    );
  x_amp_delay_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_6_IBUF_78,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(6)
    );
  x_amp_delay_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_7_IBUF_77,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(7)
    );
  x_amp_delay_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_8_IBUF_76,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(8)
    );
  x_amp_delay_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_9_IBUF_75,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(9)
    );
  x_amp_delay_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_10_IBUF_74,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(10)
    );
  x_amp_delay_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_11_IBUF_73,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(11)
    );
  x_amp_delay_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_12_IBUF_72,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(12)
    );
  x_amp_delay_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_13_IBUF_71,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(13)
    );
  x_amp_delay_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_14_IBUF_70,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(14)
    );
  x_amp_delay_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay_IN_15_IBUF_69,
      R => rst_IN_IBUF_230,
      Q => x_amp_delay(15)
    );
  l_amp_delay_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_0_IBUF_100,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(0)
    );
  l_amp_delay_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_1_IBUF_99,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(1)
    );
  l_amp_delay_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_2_IBUF_98,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(2)
    );
  l_amp_delay_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_3_IBUF_97,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(3)
    );
  l_amp_delay_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_4_IBUF_96,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(4)
    );
  l_amp_delay_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_5_IBUF_95,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(5)
    );
  l_amp_delay_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_6_IBUF_94,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(6)
    );
  l_amp_delay_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_7_IBUF_93,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(7)
    );
  l_amp_delay_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_8_IBUF_92,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(8)
    );
  l_amp_delay_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_9_IBUF_91,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(9)
    );
  l_amp_delay_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_10_IBUF_90,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(10)
    );
  l_amp_delay_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_11_IBUF_89,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(11)
    );
  l_amp_delay_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_12_IBUF_88,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(12)
    );
  l_amp_delay_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_13_IBUF_87,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(13)
    );
  l_amp_delay_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_14_IBUF_86,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(14)
    );
  l_amp_delay_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay_IN_15_IBUF_85,
      R => rst_IN_IBUF_230,
      Q => l_amp_delay(15)
    );
  pri_pulse_width_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_0_IBUF_132,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(0)
    );
  pri_pulse_width_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_1_IBUF_131,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(1)
    );
  pri_pulse_width_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_2_IBUF_130,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(2)
    );
  pri_pulse_width_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_3_IBUF_129,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(3)
    );
  pri_pulse_width_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_4_IBUF_128,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(4)
    );
  pri_pulse_width_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_5_IBUF_127,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(5)
    );
  pri_pulse_width_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_6_IBUF_126,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(6)
    );
  pri_pulse_width_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_7_IBUF_125,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(7)
    );
  pri_pulse_width_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_8_IBUF_124,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(8)
    );
  pri_pulse_width_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_9_IBUF_123,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(9)
    );
  pri_pulse_width_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_10_IBUF_122,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(10)
    );
  pri_pulse_width_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_11_IBUF_121,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(11)
    );
  pri_pulse_width_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_12_IBUF_120,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(12)
    );
  pri_pulse_width_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_13_IBUF_119,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(13)
    );
  pri_pulse_width_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_14_IBUF_118,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(14)
    );
  pri_pulse_width_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_15_IBUF_117,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(15)
    );
  pri_pulse_width_16 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_16_IBUF_116,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(16)
    );
  pri_pulse_width_17 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_17_IBUF_115,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(17)
    );
  pri_pulse_width_18 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_18_IBUF_114,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(18)
    );
  pri_pulse_width_19 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_19_IBUF_113,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(19)
    );
  pri_pulse_width_20 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_20_IBUF_112,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(20)
    );
  pri_pulse_width_21 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_21_IBUF_111,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(21)
    );
  pri_pulse_width_22 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_22_IBUF_110,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(22)
    );
  pri_pulse_width_23 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_23_IBUF_109,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(23)
    );
  pri_pulse_width_24 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_24_IBUF_108,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(24)
    );
  pri_pulse_width_25 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_25_IBUF_107,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(25)
    );
  pri_pulse_width_26 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_26_IBUF_106,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(26)
    );
  pri_pulse_width_27 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_27_IBUF_105,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(27)
    );
  pri_pulse_width_28 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_28_IBUF_104,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(28)
    );
  pri_pulse_width_29 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_29_IBUF_103,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(29)
    );
  pri_pulse_width_30 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_30_IBUF_102,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(30)
    );
  pri_pulse_width_31 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width_IN_31_IBUF_101,
      R => rst_IN_IBUF_230,
      Q => pri_pulse_width(31)
    );
  pulse_params_ram_0_0 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_0_IBUF_228,
      Q => pulse_params_ram_0(0)
    );
  pulse_params_ram_0_1 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_1_IBUF_227,
      Q => pulse_params_ram_0(1)
    );
  pulse_params_ram_0_2 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_2_IBUF_226,
      Q => pulse_params_ram_0(2)
    );
  pulse_params_ram_0_3 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_3_IBUF_225,
      Q => pulse_params_ram_0(3)
    );
  pulse_params_ram_0_4 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_4_IBUF_224,
      Q => pulse_params_ram_0(4)
    );
  pulse_params_ram_0_5 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_5_IBUF_223,
      Q => pulse_params_ram_0(5)
    );
  pulse_params_ram_0_6 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_6_IBUF_222,
      Q => pulse_params_ram_0(6)
    );
  pulse_params_ram_0_7 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_7_IBUF_221,
      Q => pulse_params_ram_0(7)
    );
  pulse_params_ram_0_8 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_8_IBUF_220,
      Q => pulse_params_ram_0(8)
    );
  pulse_params_ram_0_9 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_9_IBUF_219,
      Q => pulse_params_ram_0(9)
    );
  pulse_params_ram_0_10 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_10_IBUF_218,
      Q => pulse_params_ram_0(10)
    );
  pulse_params_ram_0_11 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_11_IBUF_217,
      Q => pulse_params_ram_0(11)
    );
  pulse_params_ram_0_12 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_12_IBUF_216,
      Q => pulse_params_ram_0(12)
    );
  pulse_params_ram_0_13 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_13_IBUF_215,
      Q => pulse_params_ram_0(13)
    );
  pulse_params_ram_0_14 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_14_IBUF_214,
      Q => pulse_params_ram_0(14)
    );
  pulse_params_ram_0_15 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_15_IBUF_213,
      Q => pulse_params_ram_0(15)
    );
  pulse_params_ram_0_16 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_16_IBUF_212,
      Q => pulse_params_ram_0(16)
    );
  pulse_params_ram_0_17 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_17_IBUF_211,
      Q => pulse_params_ram_0(17)
    );
  pulse_params_ram_0_18 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_18_IBUF_210,
      Q => pulse_params_ram_0(18)
    );
  pulse_params_ram_0_19 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_19_IBUF_209,
      Q => pulse_params_ram_0(19)
    );
  pulse_params_ram_0_20 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_20_IBUF_208,
      Q => pulse_params_ram_0(20)
    );
  pulse_params_ram_0_21 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_21_IBUF_207,
      Q => pulse_params_ram_0(21)
    );
  pulse_params_ram_0_22 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_22_IBUF_206,
      Q => pulse_params_ram_0(22)
    );
  pulse_params_ram_0_23 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_23_IBUF_205,
      Q => pulse_params_ram_0(23)
    );
  pulse_params_ram_0_24 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_24_IBUF_204,
      Q => pulse_params_ram_0(24)
    );
  pulse_params_ram_0_25 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_25_IBUF_203,
      Q => pulse_params_ram_0(25)
    );
  pulse_params_ram_0_26 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_26_IBUF_202,
      Q => pulse_params_ram_0(26)
    );
  pulse_params_ram_0_27 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_27_IBUF_201,
      Q => pulse_params_ram_0(27)
    );
  pulse_params_ram_0_28 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_28_IBUF_200,
      Q => pulse_params_ram_0(28)
    );
  pulse_params_ram_0_29 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_29_IBUF_199,
      Q => pulse_params_ram_0(29)
    );
  pulse_params_ram_0_30 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_30_IBUF_198,
      Q => pulse_params_ram_0(30)
    );
  pulse_params_ram_0_31 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_31_IBUF_197,
      Q => pulse_params_ram_0(31)
    );
  pulse_params_ram_0_32 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_32_IBUF_196,
      Q => pulse_params_ram_0(32)
    );
  pulse_params_ram_0_33 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_33_IBUF_195,
      Q => pulse_params_ram_0(33)
    );
  pulse_params_ram_0_34 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_34_IBUF_194,
      Q => pulse_params_ram_0(34)
    );
  pulse_params_ram_0_35 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_35_IBUF_193,
      Q => pulse_params_ram_0(35)
    );
  pulse_params_ram_0_36 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_36_IBUF_192,
      Q => pulse_params_ram_0(36)
    );
  pulse_params_ram_0_37 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_37_IBUF_191,
      Q => pulse_params_ram_0(37)
    );
  pulse_params_ram_0_38 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_38_IBUF_190,
      Q => pulse_params_ram_0(38)
    );
  pulse_params_ram_0_39 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_39_IBUF_189,
      Q => pulse_params_ram_0(39)
    );
  pulse_params_ram_0_40 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_40_IBUF_188,
      Q => pulse_params_ram_0(40)
    );
  pulse_params_ram_0_41 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_41_IBUF_187,
      Q => pulse_params_ram_0(41)
    );
  pulse_params_ram_0_42 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_42_IBUF_186,
      Q => pulse_params_ram_0(42)
    );
  pulse_params_ram_0_43 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_43_IBUF_185,
      Q => pulse_params_ram_0(43)
    );
  pulse_params_ram_0_44 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_44_IBUF_184,
      Q => pulse_params_ram_0(44)
    );
  pulse_params_ram_0_45 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_45_IBUF_183,
      Q => pulse_params_ram_0(45)
    );
  pulse_params_ram_0_46 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_46_IBUF_182,
      Q => pulse_params_ram_0(46)
    );
  pulse_params_ram_0_47 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_47_IBUF_181,
      Q => pulse_params_ram_0(47)
    );
  pulse_params_ram_0_48 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_48_IBUF_180,
      Q => pulse_params_ram_0(48)
    );
  pulse_params_ram_0_49 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_49_IBUF_179,
      Q => pulse_params_ram_0(49)
    );
  pulse_params_ram_0_50 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_50_IBUF_178,
      Q => pulse_params_ram_0(50)
    );
  pulse_params_ram_0_51 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_51_IBUF_177,
      Q => pulse_params_ram_0(51)
    );
  pulse_params_ram_0_52 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_52_IBUF_176,
      Q => pulse_params_ram_0(52)
    );
  pulse_params_ram_0_53 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_53_IBUF_175,
      Q => pulse_params_ram_0(53)
    );
  pulse_params_ram_0_54 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_54_IBUF_174,
      Q => pulse_params_ram_0(54)
    );
  pulse_params_ram_0_55 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_55_IBUF_173,
      Q => pulse_params_ram_0(55)
    );
  pulse_params_ram_0_56 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_56_IBUF_172,
      Q => pulse_params_ram_0(56)
    );
  pulse_params_ram_0_57 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_57_IBUF_171,
      Q => pulse_params_ram_0(57)
    );
  pulse_params_ram_0_58 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_58_IBUF_170,
      Q => pulse_params_ram_0(58)
    );
  pulse_params_ram_0_59 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_59_IBUF_169,
      Q => pulse_params_ram_0(59)
    );
  pulse_params_ram_0_60 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_60_IBUF_168,
      Q => pulse_params_ram_0(60)
    );
  pulse_params_ram_0_61 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_61_IBUF_167,
      Q => pulse_params_ram_0(61)
    );
  pulse_params_ram_0_62 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_62_IBUF_166,
      Q => pulse_params_ram_0(62)
    );
  pulse_params_ram_0_63 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_63_IBUF_165,
      Q => pulse_params_ram_0(63)
    );
  pulse_params_ram_0_64 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_64_IBUF_164,
      Q => pulse_params_ram_0(64)
    );
  pulse_params_ram_0_65 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_65_IBUF_163,
      Q => pulse_params_ram_0(65)
    );
  pulse_params_ram_0_66 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_66_IBUF_162,
      Q => pulse_params_ram_0(66)
    );
  pulse_params_ram_0_67 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_67_IBUF_161,
      Q => pulse_params_ram_0(67)
    );
  pulse_params_ram_0_68 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_68_IBUF_160,
      Q => pulse_params_ram_0(68)
    );
  pulse_params_ram_0_69 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_69_IBUF_159,
      Q => pulse_params_ram_0(69)
    );
  pulse_params_ram_0_70 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_70_IBUF_158,
      Q => pulse_params_ram_0(70)
    );
  pulse_params_ram_0_71 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_71_IBUF_157,
      Q => pulse_params_ram_0(71)
    );
  pulse_params_ram_0_72 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_72_IBUF_156,
      Q => pulse_params_ram_0(72)
    );
  pulse_params_ram_0_73 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_73_IBUF_155,
      Q => pulse_params_ram_0(73)
    );
  pulse_params_ram_0_74 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_74_IBUF_154,
      Q => pulse_params_ram_0(74)
    );
  pulse_params_ram_0_75 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_75_IBUF_153,
      Q => pulse_params_ram_0(75)
    );
  pulse_params_ram_0_76 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_76_IBUF_152,
      Q => pulse_params_ram_0(76)
    );
  pulse_params_ram_0_77 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_77_IBUF_151,
      Q => pulse_params_ram_0(77)
    );
  pulse_params_ram_0_78 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_78_IBUF_150,
      Q => pulse_params_ram_0(78)
    );
  pulse_params_ram_0_79 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_79_IBUF_149,
      Q => pulse_params_ram_0(79)
    );
  pulse_params_ram_0_80 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_80_IBUF_148,
      Q => pulse_params_ram_0(80)
    );
  pulse_params_ram_0_81 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_81_IBUF_147,
      Q => pulse_params_ram_0(81)
    );
  pulse_params_ram_0_82 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_82_IBUF_146,
      Q => pulse_params_ram_0(82)
    );
  pulse_params_ram_0_83 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_83_IBUF_145,
      Q => pulse_params_ram_0(83)
    );
  pulse_params_ram_0_84 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_84_IBUF_144,
      Q => pulse_params_ram_0(84)
    );
  pulse_params_ram_0_85 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_85_IBUF_143,
      Q => pulse_params_ram_0(85)
    );
  pulse_params_ram_0_86 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_86_IBUF_142,
      Q => pulse_params_ram_0(86)
    );
  pulse_params_ram_0_87 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_87_IBUF_141,
      Q => pulse_params_ram_0(87)
    );
  pulse_params_ram_0_88 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_88_IBUF_140,
      Q => pulse_params_ram_0(88)
    );
  pulse_params_ram_0_89 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_89_IBUF_139,
      Q => pulse_params_ram_0(89)
    );
  pulse_params_ram_0_90 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_90_IBUF_138,
      Q => pulse_params_ram_0(90)
    );
  pulse_params_ram_0_91 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_91_IBUF_137,
      Q => pulse_params_ram_0(91)
    );
  pulse_params_ram_0_92 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_92_IBUF_136,
      Q => pulse_params_ram_0(92)
    );
  pulse_params_ram_0_93 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_93_IBUF_135,
      Q => pulse_params_ram_0(93)
    );
  pulse_params_ram_0_94 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_94_IBUF_134,
      Q => pulse_params_ram_0(94)
    );
  pulse_params_ram_0_95 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_IN_BUFGP_229,
      CE => rst_IN_inv,
      D => pulse_0_params_IN_95_IBUF_133,
      Q => pulse_params_ram_0(95)
    );
  instruction_OUT_0 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(0),
      Q => instruction_OUT_0_475
    );
  instruction_OUT_1 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(1),
      Q => instruction_OUT_1_474
    );
  instruction_OUT_2 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(2),
      Q => instruction_OUT_2_473
    );
  instruction_OUT_3 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(3),
      Q => instruction_OUT_3_472
    );
  instruction_OUT_4 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(4),
      Q => instruction_OUT_4_471
    );
  instruction_OUT_5 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(5),
      Q => instruction_OUT_5_470
    );
  instruction_OUT_6 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(6),
      Q => instruction_OUT_6_469
    );
  instruction_OUT_7 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(7),
      Q => instruction_OUT_7_468
    );
  instruction_OUT_8 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(8),
      Q => instruction_OUT_8_467
    );
  instruction_OUT_9 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(9),
      Q => instruction_OUT_9_466
    );
  instruction_OUT_10 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(10),
      Q => instruction_OUT_10_465
    );
  instruction_OUT_11 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(11),
      Q => instruction_OUT_11_464
    );
  instruction_OUT_12 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(12),
      Q => instruction_OUT_12_463
    );
  instruction_OUT_13 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(13),
      Q => instruction_OUT_13_462
    );
  instruction_OUT_14 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(14),
      Q => instruction_OUT_14_461
    );
  instruction_OUT_15 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => instruction(15),
      Q => instruction_OUT_15_460
    );
  num_pulses_OUT_0 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(0),
      Q => num_pulses_OUT_0_491
    );
  num_pulses_OUT_1 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(1),
      Q => num_pulses_OUT_1_490
    );
  num_pulses_OUT_2 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(2),
      Q => num_pulses_OUT_2_489
    );
  num_pulses_OUT_3 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(3),
      Q => num_pulses_OUT_3_488
    );
  num_pulses_OUT_4 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(4),
      Q => num_pulses_OUT_4_487
    );
  num_pulses_OUT_5 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(5),
      Q => num_pulses_OUT_5_486
    );
  num_pulses_OUT_6 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(6),
      Q => num_pulses_OUT_6_485
    );
  num_pulses_OUT_7 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(7),
      Q => num_pulses_OUT_7_484
    );
  num_pulses_OUT_8 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(8),
      Q => num_pulses_OUT_8_483
    );
  num_pulses_OUT_9 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(9),
      Q => num_pulses_OUT_9_482
    );
  num_pulses_OUT_10 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(10),
      Q => num_pulses_OUT_10_481
    );
  num_pulses_OUT_11 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(11),
      Q => num_pulses_OUT_11_480
    );
  num_pulses_OUT_12 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(12),
      Q => num_pulses_OUT_12_479
    );
  num_pulses_OUT_13 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(13),
      Q => num_pulses_OUT_13_478
    );
  num_pulses_OUT_14 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(14),
      Q => num_pulses_OUT_14_477
    );
  num_pulses_OUT_15 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_pulses(15),
      Q => num_pulses_OUT_15_476
    );
  num_repeats_OUT_0 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(0),
      Q => num_repeats_OUT_0_523
    );
  num_repeats_OUT_1 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(1),
      Q => num_repeats_OUT_1_522
    );
  num_repeats_OUT_2 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(2),
      Q => num_repeats_OUT_2_521
    );
  num_repeats_OUT_3 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(3),
      Q => num_repeats_OUT_3_520
    );
  num_repeats_OUT_4 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(4),
      Q => num_repeats_OUT_4_519
    );
  num_repeats_OUT_5 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(5),
      Q => num_repeats_OUT_5_518
    );
  num_repeats_OUT_6 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(6),
      Q => num_repeats_OUT_6_517
    );
  num_repeats_OUT_7 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(7),
      Q => num_repeats_OUT_7_516
    );
  num_repeats_OUT_8 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(8),
      Q => num_repeats_OUT_8_515
    );
  num_repeats_OUT_9 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(9),
      Q => num_repeats_OUT_9_514
    );
  num_repeats_OUT_10 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(10),
      Q => num_repeats_OUT_10_513
    );
  num_repeats_OUT_11 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(11),
      Q => num_repeats_OUT_11_512
    );
  num_repeats_OUT_12 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(12),
      Q => num_repeats_OUT_12_511
    );
  num_repeats_OUT_13 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(13),
      Q => num_repeats_OUT_13_510
    );
  num_repeats_OUT_14 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(14),
      Q => num_repeats_OUT_14_509
    );
  num_repeats_OUT_15 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(15),
      Q => num_repeats_OUT_15_508
    );
  num_repeats_OUT_16 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(16),
      Q => num_repeats_OUT_16_507
    );
  num_repeats_OUT_17 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(17),
      Q => num_repeats_OUT_17_506
    );
  num_repeats_OUT_18 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(18),
      Q => num_repeats_OUT_18_505
    );
  num_repeats_OUT_19 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(19),
      Q => num_repeats_OUT_19_504
    );
  num_repeats_OUT_20 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(20),
      Q => num_repeats_OUT_20_503
    );
  num_repeats_OUT_21 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(21),
      Q => num_repeats_OUT_21_502
    );
  num_repeats_OUT_22 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(22),
      Q => num_repeats_OUT_22_501
    );
  num_repeats_OUT_23 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(23),
      Q => num_repeats_OUT_23_500
    );
  num_repeats_OUT_24 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(24),
      Q => num_repeats_OUT_24_499
    );
  num_repeats_OUT_25 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(25),
      Q => num_repeats_OUT_25_498
    );
  num_repeats_OUT_26 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(26),
      Q => num_repeats_OUT_26_497
    );
  num_repeats_OUT_27 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(27),
      Q => num_repeats_OUT_27_496
    );
  num_repeats_OUT_28 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(28),
      Q => num_repeats_OUT_28_495
    );
  num_repeats_OUT_29 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(29),
      Q => num_repeats_OUT_29_494
    );
  num_repeats_OUT_30 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(30),
      Q => num_repeats_OUT_30_493
    );
  num_repeats_OUT_31 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => num_repeats(31),
      Q => num_repeats_OUT_31_492
    );
  x_amp_delay_OUT_0 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(0),
      Q => x_amp_delay_OUT_0_539
    );
  x_amp_delay_OUT_1 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(1),
      Q => x_amp_delay_OUT_1_538
    );
  x_amp_delay_OUT_2 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(2),
      Q => x_amp_delay_OUT_2_537
    );
  x_amp_delay_OUT_3 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(3),
      Q => x_amp_delay_OUT_3_536
    );
  x_amp_delay_OUT_4 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(4),
      Q => x_amp_delay_OUT_4_535
    );
  x_amp_delay_OUT_5 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(5),
      Q => x_amp_delay_OUT_5_534
    );
  x_amp_delay_OUT_6 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(6),
      Q => x_amp_delay_OUT_6_533
    );
  x_amp_delay_OUT_7 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(7),
      Q => x_amp_delay_OUT_7_532
    );
  x_amp_delay_OUT_8 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(8),
      Q => x_amp_delay_OUT_8_531
    );
  x_amp_delay_OUT_9 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(9),
      Q => x_amp_delay_OUT_9_530
    );
  x_amp_delay_OUT_10 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(10),
      Q => x_amp_delay_OUT_10_529
    );
  x_amp_delay_OUT_11 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(11),
      Q => x_amp_delay_OUT_11_528
    );
  x_amp_delay_OUT_12 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(12),
      Q => x_amp_delay_OUT_12_527
    );
  x_amp_delay_OUT_13 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(13),
      Q => x_amp_delay_OUT_13_526
    );
  x_amp_delay_OUT_14 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(14),
      Q => x_amp_delay_OUT_14_525
    );
  x_amp_delay_OUT_15 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => x_amp_delay(15),
      Q => x_amp_delay_OUT_15_524
    );
  l_amp_delay_OUT_0 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(0),
      Q => l_amp_delay_OUT_0_555
    );
  l_amp_delay_OUT_1 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(1),
      Q => l_amp_delay_OUT_1_554
    );
  l_amp_delay_OUT_2 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(2),
      Q => l_amp_delay_OUT_2_553
    );
  l_amp_delay_OUT_3 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(3),
      Q => l_amp_delay_OUT_3_552
    );
  l_amp_delay_OUT_4 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(4),
      Q => l_amp_delay_OUT_4_551
    );
  l_amp_delay_OUT_5 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(5),
      Q => l_amp_delay_OUT_5_550
    );
  l_amp_delay_OUT_6 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(6),
      Q => l_amp_delay_OUT_6_549
    );
  l_amp_delay_OUT_7 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(7),
      Q => l_amp_delay_OUT_7_548
    );
  l_amp_delay_OUT_8 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(8),
      Q => l_amp_delay_OUT_8_547
    );
  l_amp_delay_OUT_9 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(9),
      Q => l_amp_delay_OUT_9_546
    );
  l_amp_delay_OUT_10 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(10),
      Q => l_amp_delay_OUT_10_545
    );
  l_amp_delay_OUT_11 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(11),
      Q => l_amp_delay_OUT_11_544
    );
  l_amp_delay_OUT_12 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(12),
      Q => l_amp_delay_OUT_12_543
    );
  l_amp_delay_OUT_13 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(13),
      Q => l_amp_delay_OUT_13_542
    );
  l_amp_delay_OUT_14 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(14),
      Q => l_amp_delay_OUT_14_541
    );
  l_amp_delay_OUT_15 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => l_amp_delay(15),
      Q => l_amp_delay_OUT_15_540
    );
  pri_pulse_width_OUT_0 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(0),
      Q => pri_pulse_width_OUT_0_587
    );
  pri_pulse_width_OUT_1 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(1),
      Q => pri_pulse_width_OUT_1_586
    );
  pri_pulse_width_OUT_2 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(2),
      Q => pri_pulse_width_OUT_2_585
    );
  pri_pulse_width_OUT_3 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(3),
      Q => pri_pulse_width_OUT_3_584
    );
  pri_pulse_width_OUT_4 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(4),
      Q => pri_pulse_width_OUT_4_583
    );
  pri_pulse_width_OUT_5 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(5),
      Q => pri_pulse_width_OUT_5_582
    );
  pri_pulse_width_OUT_6 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(6),
      Q => pri_pulse_width_OUT_6_581
    );
  pri_pulse_width_OUT_7 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(7),
      Q => pri_pulse_width_OUT_7_580
    );
  pri_pulse_width_OUT_8 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(8),
      Q => pri_pulse_width_OUT_8_579
    );
  pri_pulse_width_OUT_9 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(9),
      Q => pri_pulse_width_OUT_9_578
    );
  pri_pulse_width_OUT_10 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(10),
      Q => pri_pulse_width_OUT_10_577
    );
  pri_pulse_width_OUT_11 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(11),
      Q => pri_pulse_width_OUT_11_576
    );
  pri_pulse_width_OUT_12 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(12),
      Q => pri_pulse_width_OUT_12_575
    );
  pri_pulse_width_OUT_13 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(13),
      Q => pri_pulse_width_OUT_13_574
    );
  pri_pulse_width_OUT_14 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(14),
      Q => pri_pulse_width_OUT_14_573
    );
  pri_pulse_width_OUT_15 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(15),
      Q => pri_pulse_width_OUT_15_572
    );
  pri_pulse_width_OUT_16 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(16),
      Q => pri_pulse_width_OUT_16_571
    );
  pri_pulse_width_OUT_17 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(17),
      Q => pri_pulse_width_OUT_17_570
    );
  pri_pulse_width_OUT_18 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(18),
      Q => pri_pulse_width_OUT_18_569
    );
  pri_pulse_width_OUT_19 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(19),
      Q => pri_pulse_width_OUT_19_568
    );
  pri_pulse_width_OUT_20 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(20),
      Q => pri_pulse_width_OUT_20_567
    );
  pri_pulse_width_OUT_21 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(21),
      Q => pri_pulse_width_OUT_21_566
    );
  pri_pulse_width_OUT_22 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(22),
      Q => pri_pulse_width_OUT_22_565
    );
  pri_pulse_width_OUT_23 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(23),
      Q => pri_pulse_width_OUT_23_564
    );
  pri_pulse_width_OUT_24 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(24),
      Q => pri_pulse_width_OUT_24_563
    );
  pri_pulse_width_OUT_25 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(25),
      Q => pri_pulse_width_OUT_25_562
    );
  pri_pulse_width_OUT_26 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(26),
      Q => pri_pulse_width_OUT_26_561
    );
  pri_pulse_width_OUT_27 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(27),
      Q => pri_pulse_width_OUT_27_560
    );
  pri_pulse_width_OUT_28 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(28),
      Q => pri_pulse_width_OUT_28_559
    );
  pri_pulse_width_OUT_29 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(29),
      Q => pri_pulse_width_OUT_29_558
    );
  pri_pulse_width_OUT_30 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(30),
      Q => pri_pulse_width_OUT_30_557
    );
  pri_pulse_width_OUT_31 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pri_pulse_width(31),
      Q => pri_pulse_width_OUT_31_556
    );
  pulse_index_IN_4_IBUF : IBUF
    port map (
      I => pulse_index_IN(4),
      O => pulse_index_IN_4_IBUF_0
    );
  pulse_index_IN_3_IBUF : IBUF
    port map (
      I => pulse_index_IN(3),
      O => pulse_index_IN_3_IBUF_1
    );
  pulse_index_IN_2_IBUF : IBUF
    port map (
      I => pulse_index_IN(2),
      O => pulse_index_IN_2_IBUF_2
    );
  pulse_index_IN_1_IBUF : IBUF
    port map (
      I => pulse_index_IN(1),
      O => pulse_index_IN_1_IBUF_3
    );
  pulse_index_IN_0_IBUF : IBUF
    port map (
      I => pulse_index_IN(0),
      O => pulse_index_IN_0_IBUF_4
    );
  instruction_IN_15_IBUF : IBUF
    port map (
      I => instruction_IN(15),
      O => instruction_IN_15_IBUF_5
    );
  instruction_IN_14_IBUF : IBUF
    port map (
      I => instruction_IN(14),
      O => instruction_IN_14_IBUF_6
    );
  instruction_IN_13_IBUF : IBUF
    port map (
      I => instruction_IN(13),
      O => instruction_IN_13_IBUF_7
    );
  instruction_IN_12_IBUF : IBUF
    port map (
      I => instruction_IN(12),
      O => instruction_IN_12_IBUF_8
    );
  instruction_IN_11_IBUF : IBUF
    port map (
      I => instruction_IN(11),
      O => instruction_IN_11_IBUF_9
    );
  instruction_IN_10_IBUF : IBUF
    port map (
      I => instruction_IN(10),
      O => instruction_IN_10_IBUF_10
    );
  instruction_IN_9_IBUF : IBUF
    port map (
      I => instruction_IN(9),
      O => instruction_IN_9_IBUF_11
    );
  instruction_IN_8_IBUF : IBUF
    port map (
      I => instruction_IN(8),
      O => instruction_IN_8_IBUF_12
    );
  instruction_IN_7_IBUF : IBUF
    port map (
      I => instruction_IN(7),
      O => instruction_IN_7_IBUF_13
    );
  instruction_IN_6_IBUF : IBUF
    port map (
      I => instruction_IN(6),
      O => instruction_IN_6_IBUF_14
    );
  instruction_IN_5_IBUF : IBUF
    port map (
      I => instruction_IN(5),
      O => instruction_IN_5_IBUF_15
    );
  instruction_IN_4_IBUF : IBUF
    port map (
      I => instruction_IN(4),
      O => instruction_IN_4_IBUF_16
    );
  instruction_IN_3_IBUF : IBUF
    port map (
      I => instruction_IN(3),
      O => instruction_IN_3_IBUF_17
    );
  instruction_IN_2_IBUF : IBUF
    port map (
      I => instruction_IN(2),
      O => instruction_IN_2_IBUF_18
    );
  instruction_IN_1_IBUF : IBUF
    port map (
      I => instruction_IN(1),
      O => instruction_IN_1_IBUF_19
    );
  instruction_IN_0_IBUF : IBUF
    port map (
      I => instruction_IN(0),
      O => instruction_IN_0_IBUF_20
    );
  num_pulses_IN_15_IBUF : IBUF
    port map (
      I => num_pulses_IN(15),
      O => num_pulses_IN_15_IBUF_21
    );
  num_pulses_IN_14_IBUF : IBUF
    port map (
      I => num_pulses_IN(14),
      O => num_pulses_IN_14_IBUF_22
    );
  num_pulses_IN_13_IBUF : IBUF
    port map (
      I => num_pulses_IN(13),
      O => num_pulses_IN_13_IBUF_23
    );
  num_pulses_IN_12_IBUF : IBUF
    port map (
      I => num_pulses_IN(12),
      O => num_pulses_IN_12_IBUF_24
    );
  num_pulses_IN_11_IBUF : IBUF
    port map (
      I => num_pulses_IN(11),
      O => num_pulses_IN_11_IBUF_25
    );
  num_pulses_IN_10_IBUF : IBUF
    port map (
      I => num_pulses_IN(10),
      O => num_pulses_IN_10_IBUF_26
    );
  num_pulses_IN_9_IBUF : IBUF
    port map (
      I => num_pulses_IN(9),
      O => num_pulses_IN_9_IBUF_27
    );
  num_pulses_IN_8_IBUF : IBUF
    port map (
      I => num_pulses_IN(8),
      O => num_pulses_IN_8_IBUF_28
    );
  num_pulses_IN_7_IBUF : IBUF
    port map (
      I => num_pulses_IN(7),
      O => num_pulses_IN_7_IBUF_29
    );
  num_pulses_IN_6_IBUF : IBUF
    port map (
      I => num_pulses_IN(6),
      O => num_pulses_IN_6_IBUF_30
    );
  num_pulses_IN_5_IBUF : IBUF
    port map (
      I => num_pulses_IN(5),
      O => num_pulses_IN_5_IBUF_31
    );
  num_pulses_IN_4_IBUF : IBUF
    port map (
      I => num_pulses_IN(4),
      O => num_pulses_IN_4_IBUF_32
    );
  num_pulses_IN_3_IBUF : IBUF
    port map (
      I => num_pulses_IN(3),
      O => num_pulses_IN_3_IBUF_33
    );
  num_pulses_IN_2_IBUF : IBUF
    port map (
      I => num_pulses_IN(2),
      O => num_pulses_IN_2_IBUF_34
    );
  num_pulses_IN_1_IBUF : IBUF
    port map (
      I => num_pulses_IN(1),
      O => num_pulses_IN_1_IBUF_35
    );
  num_pulses_IN_0_IBUF : IBUF
    port map (
      I => num_pulses_IN(0),
      O => num_pulses_IN_0_IBUF_36
    );
  num_repeats_IN_31_IBUF : IBUF
    port map (
      I => num_repeats_IN(31),
      O => num_repeats_IN_31_IBUF_37
    );
  num_repeats_IN_30_IBUF : IBUF
    port map (
      I => num_repeats_IN(30),
      O => num_repeats_IN_30_IBUF_38
    );
  num_repeats_IN_29_IBUF : IBUF
    port map (
      I => num_repeats_IN(29),
      O => num_repeats_IN_29_IBUF_39
    );
  num_repeats_IN_28_IBUF : IBUF
    port map (
      I => num_repeats_IN(28),
      O => num_repeats_IN_28_IBUF_40
    );
  num_repeats_IN_27_IBUF : IBUF
    port map (
      I => num_repeats_IN(27),
      O => num_repeats_IN_27_IBUF_41
    );
  num_repeats_IN_26_IBUF : IBUF
    port map (
      I => num_repeats_IN(26),
      O => num_repeats_IN_26_IBUF_42
    );
  num_repeats_IN_25_IBUF : IBUF
    port map (
      I => num_repeats_IN(25),
      O => num_repeats_IN_25_IBUF_43
    );
  num_repeats_IN_24_IBUF : IBUF
    port map (
      I => num_repeats_IN(24),
      O => num_repeats_IN_24_IBUF_44
    );
  num_repeats_IN_23_IBUF : IBUF
    port map (
      I => num_repeats_IN(23),
      O => num_repeats_IN_23_IBUF_45
    );
  num_repeats_IN_22_IBUF : IBUF
    port map (
      I => num_repeats_IN(22),
      O => num_repeats_IN_22_IBUF_46
    );
  num_repeats_IN_21_IBUF : IBUF
    port map (
      I => num_repeats_IN(21),
      O => num_repeats_IN_21_IBUF_47
    );
  num_repeats_IN_20_IBUF : IBUF
    port map (
      I => num_repeats_IN(20),
      O => num_repeats_IN_20_IBUF_48
    );
  num_repeats_IN_19_IBUF : IBUF
    port map (
      I => num_repeats_IN(19),
      O => num_repeats_IN_19_IBUF_49
    );
  num_repeats_IN_18_IBUF : IBUF
    port map (
      I => num_repeats_IN(18),
      O => num_repeats_IN_18_IBUF_50
    );
  num_repeats_IN_17_IBUF : IBUF
    port map (
      I => num_repeats_IN(17),
      O => num_repeats_IN_17_IBUF_51
    );
  num_repeats_IN_16_IBUF : IBUF
    port map (
      I => num_repeats_IN(16),
      O => num_repeats_IN_16_IBUF_52
    );
  num_repeats_IN_15_IBUF : IBUF
    port map (
      I => num_repeats_IN(15),
      O => num_repeats_IN_15_IBUF_53
    );
  num_repeats_IN_14_IBUF : IBUF
    port map (
      I => num_repeats_IN(14),
      O => num_repeats_IN_14_IBUF_54
    );
  num_repeats_IN_13_IBUF : IBUF
    port map (
      I => num_repeats_IN(13),
      O => num_repeats_IN_13_IBUF_55
    );
  num_repeats_IN_12_IBUF : IBUF
    port map (
      I => num_repeats_IN(12),
      O => num_repeats_IN_12_IBUF_56
    );
  num_repeats_IN_11_IBUF : IBUF
    port map (
      I => num_repeats_IN(11),
      O => num_repeats_IN_11_IBUF_57
    );
  num_repeats_IN_10_IBUF : IBUF
    port map (
      I => num_repeats_IN(10),
      O => num_repeats_IN_10_IBUF_58
    );
  num_repeats_IN_9_IBUF : IBUF
    port map (
      I => num_repeats_IN(9),
      O => num_repeats_IN_9_IBUF_59
    );
  num_repeats_IN_8_IBUF : IBUF
    port map (
      I => num_repeats_IN(8),
      O => num_repeats_IN_8_IBUF_60
    );
  num_repeats_IN_7_IBUF : IBUF
    port map (
      I => num_repeats_IN(7),
      O => num_repeats_IN_7_IBUF_61
    );
  num_repeats_IN_6_IBUF : IBUF
    port map (
      I => num_repeats_IN(6),
      O => num_repeats_IN_6_IBUF_62
    );
  num_repeats_IN_5_IBUF : IBUF
    port map (
      I => num_repeats_IN(5),
      O => num_repeats_IN_5_IBUF_63
    );
  num_repeats_IN_4_IBUF : IBUF
    port map (
      I => num_repeats_IN(4),
      O => num_repeats_IN_4_IBUF_64
    );
  num_repeats_IN_3_IBUF : IBUF
    port map (
      I => num_repeats_IN(3),
      O => num_repeats_IN_3_IBUF_65
    );
  num_repeats_IN_2_IBUF : IBUF
    port map (
      I => num_repeats_IN(2),
      O => num_repeats_IN_2_IBUF_66
    );
  num_repeats_IN_1_IBUF : IBUF
    port map (
      I => num_repeats_IN(1),
      O => num_repeats_IN_1_IBUF_67
    );
  num_repeats_IN_0_IBUF : IBUF
    port map (
      I => num_repeats_IN(0),
      O => num_repeats_IN_0_IBUF_68
    );
  x_amp_delay_IN_15_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(15),
      O => x_amp_delay_IN_15_IBUF_69
    );
  x_amp_delay_IN_14_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(14),
      O => x_amp_delay_IN_14_IBUF_70
    );
  x_amp_delay_IN_13_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(13),
      O => x_amp_delay_IN_13_IBUF_71
    );
  x_amp_delay_IN_12_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(12),
      O => x_amp_delay_IN_12_IBUF_72
    );
  x_amp_delay_IN_11_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(11),
      O => x_amp_delay_IN_11_IBUF_73
    );
  x_amp_delay_IN_10_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(10),
      O => x_amp_delay_IN_10_IBUF_74
    );
  x_amp_delay_IN_9_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(9),
      O => x_amp_delay_IN_9_IBUF_75
    );
  x_amp_delay_IN_8_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(8),
      O => x_amp_delay_IN_8_IBUF_76
    );
  x_amp_delay_IN_7_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(7),
      O => x_amp_delay_IN_7_IBUF_77
    );
  x_amp_delay_IN_6_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(6),
      O => x_amp_delay_IN_6_IBUF_78
    );
  x_amp_delay_IN_5_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(5),
      O => x_amp_delay_IN_5_IBUF_79
    );
  x_amp_delay_IN_4_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(4),
      O => x_amp_delay_IN_4_IBUF_80
    );
  x_amp_delay_IN_3_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(3),
      O => x_amp_delay_IN_3_IBUF_81
    );
  x_amp_delay_IN_2_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(2),
      O => x_amp_delay_IN_2_IBUF_82
    );
  x_amp_delay_IN_1_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(1),
      O => x_amp_delay_IN_1_IBUF_83
    );
  x_amp_delay_IN_0_IBUF : IBUF
    port map (
      I => x_amp_delay_IN(0),
      O => x_amp_delay_IN_0_IBUF_84
    );
  l_amp_delay_IN_15_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(15),
      O => l_amp_delay_IN_15_IBUF_85
    );
  l_amp_delay_IN_14_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(14),
      O => l_amp_delay_IN_14_IBUF_86
    );
  l_amp_delay_IN_13_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(13),
      O => l_amp_delay_IN_13_IBUF_87
    );
  l_amp_delay_IN_12_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(12),
      O => l_amp_delay_IN_12_IBUF_88
    );
  l_amp_delay_IN_11_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(11),
      O => l_amp_delay_IN_11_IBUF_89
    );
  l_amp_delay_IN_10_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(10),
      O => l_amp_delay_IN_10_IBUF_90
    );
  l_amp_delay_IN_9_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(9),
      O => l_amp_delay_IN_9_IBUF_91
    );
  l_amp_delay_IN_8_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(8),
      O => l_amp_delay_IN_8_IBUF_92
    );
  l_amp_delay_IN_7_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(7),
      O => l_amp_delay_IN_7_IBUF_93
    );
  l_amp_delay_IN_6_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(6),
      O => l_amp_delay_IN_6_IBUF_94
    );
  l_amp_delay_IN_5_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(5),
      O => l_amp_delay_IN_5_IBUF_95
    );
  l_amp_delay_IN_4_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(4),
      O => l_amp_delay_IN_4_IBUF_96
    );
  l_amp_delay_IN_3_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(3),
      O => l_amp_delay_IN_3_IBUF_97
    );
  l_amp_delay_IN_2_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(2),
      O => l_amp_delay_IN_2_IBUF_98
    );
  l_amp_delay_IN_1_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(1),
      O => l_amp_delay_IN_1_IBUF_99
    );
  l_amp_delay_IN_0_IBUF : IBUF
    port map (
      I => l_amp_delay_IN(0),
      O => l_amp_delay_IN_0_IBUF_100
    );
  pri_pulse_width_IN_31_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(31),
      O => pri_pulse_width_IN_31_IBUF_101
    );
  pri_pulse_width_IN_30_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(30),
      O => pri_pulse_width_IN_30_IBUF_102
    );
  pri_pulse_width_IN_29_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(29),
      O => pri_pulse_width_IN_29_IBUF_103
    );
  pri_pulse_width_IN_28_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(28),
      O => pri_pulse_width_IN_28_IBUF_104
    );
  pri_pulse_width_IN_27_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(27),
      O => pri_pulse_width_IN_27_IBUF_105
    );
  pri_pulse_width_IN_26_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(26),
      O => pri_pulse_width_IN_26_IBUF_106
    );
  pri_pulse_width_IN_25_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(25),
      O => pri_pulse_width_IN_25_IBUF_107
    );
  pri_pulse_width_IN_24_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(24),
      O => pri_pulse_width_IN_24_IBUF_108
    );
  pri_pulse_width_IN_23_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(23),
      O => pri_pulse_width_IN_23_IBUF_109
    );
  pri_pulse_width_IN_22_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(22),
      O => pri_pulse_width_IN_22_IBUF_110
    );
  pri_pulse_width_IN_21_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(21),
      O => pri_pulse_width_IN_21_IBUF_111
    );
  pri_pulse_width_IN_20_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(20),
      O => pri_pulse_width_IN_20_IBUF_112
    );
  pri_pulse_width_IN_19_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(19),
      O => pri_pulse_width_IN_19_IBUF_113
    );
  pri_pulse_width_IN_18_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(18),
      O => pri_pulse_width_IN_18_IBUF_114
    );
  pri_pulse_width_IN_17_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(17),
      O => pri_pulse_width_IN_17_IBUF_115
    );
  pri_pulse_width_IN_16_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(16),
      O => pri_pulse_width_IN_16_IBUF_116
    );
  pri_pulse_width_IN_15_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(15),
      O => pri_pulse_width_IN_15_IBUF_117
    );
  pri_pulse_width_IN_14_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(14),
      O => pri_pulse_width_IN_14_IBUF_118
    );
  pri_pulse_width_IN_13_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(13),
      O => pri_pulse_width_IN_13_IBUF_119
    );
  pri_pulse_width_IN_12_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(12),
      O => pri_pulse_width_IN_12_IBUF_120
    );
  pri_pulse_width_IN_11_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(11),
      O => pri_pulse_width_IN_11_IBUF_121
    );
  pri_pulse_width_IN_10_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(10),
      O => pri_pulse_width_IN_10_IBUF_122
    );
  pri_pulse_width_IN_9_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(9),
      O => pri_pulse_width_IN_9_IBUF_123
    );
  pri_pulse_width_IN_8_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(8),
      O => pri_pulse_width_IN_8_IBUF_124
    );
  pri_pulse_width_IN_7_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(7),
      O => pri_pulse_width_IN_7_IBUF_125
    );
  pri_pulse_width_IN_6_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(6),
      O => pri_pulse_width_IN_6_IBUF_126
    );
  pri_pulse_width_IN_5_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(5),
      O => pri_pulse_width_IN_5_IBUF_127
    );
  pri_pulse_width_IN_4_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(4),
      O => pri_pulse_width_IN_4_IBUF_128
    );
  pri_pulse_width_IN_3_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(3),
      O => pri_pulse_width_IN_3_IBUF_129
    );
  pri_pulse_width_IN_2_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(2),
      O => pri_pulse_width_IN_2_IBUF_130
    );
  pri_pulse_width_IN_1_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(1),
      O => pri_pulse_width_IN_1_IBUF_131
    );
  pri_pulse_width_IN_0_IBUF : IBUF
    port map (
      I => pri_pulse_width_IN(0),
      O => pri_pulse_width_IN_0_IBUF_132
    );
  pulse_0_params_IN_95_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(95),
      O => pulse_0_params_IN_95_IBUF_133
    );
  pulse_0_params_IN_94_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(94),
      O => pulse_0_params_IN_94_IBUF_134
    );
  pulse_0_params_IN_93_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(93),
      O => pulse_0_params_IN_93_IBUF_135
    );
  pulse_0_params_IN_92_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(92),
      O => pulse_0_params_IN_92_IBUF_136
    );
  pulse_0_params_IN_91_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(91),
      O => pulse_0_params_IN_91_IBUF_137
    );
  pulse_0_params_IN_90_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(90),
      O => pulse_0_params_IN_90_IBUF_138
    );
  pulse_0_params_IN_89_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(89),
      O => pulse_0_params_IN_89_IBUF_139
    );
  pulse_0_params_IN_88_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(88),
      O => pulse_0_params_IN_88_IBUF_140
    );
  pulse_0_params_IN_87_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(87),
      O => pulse_0_params_IN_87_IBUF_141
    );
  pulse_0_params_IN_86_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(86),
      O => pulse_0_params_IN_86_IBUF_142
    );
  pulse_0_params_IN_85_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(85),
      O => pulse_0_params_IN_85_IBUF_143
    );
  pulse_0_params_IN_84_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(84),
      O => pulse_0_params_IN_84_IBUF_144
    );
  pulse_0_params_IN_83_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(83),
      O => pulse_0_params_IN_83_IBUF_145
    );
  pulse_0_params_IN_82_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(82),
      O => pulse_0_params_IN_82_IBUF_146
    );
  pulse_0_params_IN_81_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(81),
      O => pulse_0_params_IN_81_IBUF_147
    );
  pulse_0_params_IN_80_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(80),
      O => pulse_0_params_IN_80_IBUF_148
    );
  pulse_0_params_IN_79_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(79),
      O => pulse_0_params_IN_79_IBUF_149
    );
  pulse_0_params_IN_78_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(78),
      O => pulse_0_params_IN_78_IBUF_150
    );
  pulse_0_params_IN_77_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(77),
      O => pulse_0_params_IN_77_IBUF_151
    );
  pulse_0_params_IN_76_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(76),
      O => pulse_0_params_IN_76_IBUF_152
    );
  pulse_0_params_IN_75_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(75),
      O => pulse_0_params_IN_75_IBUF_153
    );
  pulse_0_params_IN_74_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(74),
      O => pulse_0_params_IN_74_IBUF_154
    );
  pulse_0_params_IN_73_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(73),
      O => pulse_0_params_IN_73_IBUF_155
    );
  pulse_0_params_IN_72_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(72),
      O => pulse_0_params_IN_72_IBUF_156
    );
  pulse_0_params_IN_71_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(71),
      O => pulse_0_params_IN_71_IBUF_157
    );
  pulse_0_params_IN_70_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(70),
      O => pulse_0_params_IN_70_IBUF_158
    );
  pulse_0_params_IN_69_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(69),
      O => pulse_0_params_IN_69_IBUF_159
    );
  pulse_0_params_IN_68_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(68),
      O => pulse_0_params_IN_68_IBUF_160
    );
  pulse_0_params_IN_67_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(67),
      O => pulse_0_params_IN_67_IBUF_161
    );
  pulse_0_params_IN_66_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(66),
      O => pulse_0_params_IN_66_IBUF_162
    );
  pulse_0_params_IN_65_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(65),
      O => pulse_0_params_IN_65_IBUF_163
    );
  pulse_0_params_IN_64_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(64),
      O => pulse_0_params_IN_64_IBUF_164
    );
  pulse_0_params_IN_63_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(63),
      O => pulse_0_params_IN_63_IBUF_165
    );
  pulse_0_params_IN_62_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(62),
      O => pulse_0_params_IN_62_IBUF_166
    );
  pulse_0_params_IN_61_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(61),
      O => pulse_0_params_IN_61_IBUF_167
    );
  pulse_0_params_IN_60_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(60),
      O => pulse_0_params_IN_60_IBUF_168
    );
  pulse_0_params_IN_59_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(59),
      O => pulse_0_params_IN_59_IBUF_169
    );
  pulse_0_params_IN_58_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(58),
      O => pulse_0_params_IN_58_IBUF_170
    );
  pulse_0_params_IN_57_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(57),
      O => pulse_0_params_IN_57_IBUF_171
    );
  pulse_0_params_IN_56_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(56),
      O => pulse_0_params_IN_56_IBUF_172
    );
  pulse_0_params_IN_55_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(55),
      O => pulse_0_params_IN_55_IBUF_173
    );
  pulse_0_params_IN_54_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(54),
      O => pulse_0_params_IN_54_IBUF_174
    );
  pulse_0_params_IN_53_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(53),
      O => pulse_0_params_IN_53_IBUF_175
    );
  pulse_0_params_IN_52_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(52),
      O => pulse_0_params_IN_52_IBUF_176
    );
  pulse_0_params_IN_51_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(51),
      O => pulse_0_params_IN_51_IBUF_177
    );
  pulse_0_params_IN_50_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(50),
      O => pulse_0_params_IN_50_IBUF_178
    );
  pulse_0_params_IN_49_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(49),
      O => pulse_0_params_IN_49_IBUF_179
    );
  pulse_0_params_IN_48_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(48),
      O => pulse_0_params_IN_48_IBUF_180
    );
  pulse_0_params_IN_47_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(47),
      O => pulse_0_params_IN_47_IBUF_181
    );
  pulse_0_params_IN_46_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(46),
      O => pulse_0_params_IN_46_IBUF_182
    );
  pulse_0_params_IN_45_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(45),
      O => pulse_0_params_IN_45_IBUF_183
    );
  pulse_0_params_IN_44_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(44),
      O => pulse_0_params_IN_44_IBUF_184
    );
  pulse_0_params_IN_43_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(43),
      O => pulse_0_params_IN_43_IBUF_185
    );
  pulse_0_params_IN_42_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(42),
      O => pulse_0_params_IN_42_IBUF_186
    );
  pulse_0_params_IN_41_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(41),
      O => pulse_0_params_IN_41_IBUF_187
    );
  pulse_0_params_IN_40_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(40),
      O => pulse_0_params_IN_40_IBUF_188
    );
  pulse_0_params_IN_39_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(39),
      O => pulse_0_params_IN_39_IBUF_189
    );
  pulse_0_params_IN_38_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(38),
      O => pulse_0_params_IN_38_IBUF_190
    );
  pulse_0_params_IN_37_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(37),
      O => pulse_0_params_IN_37_IBUF_191
    );
  pulse_0_params_IN_36_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(36),
      O => pulse_0_params_IN_36_IBUF_192
    );
  pulse_0_params_IN_35_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(35),
      O => pulse_0_params_IN_35_IBUF_193
    );
  pulse_0_params_IN_34_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(34),
      O => pulse_0_params_IN_34_IBUF_194
    );
  pulse_0_params_IN_33_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(33),
      O => pulse_0_params_IN_33_IBUF_195
    );
  pulse_0_params_IN_32_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(32),
      O => pulse_0_params_IN_32_IBUF_196
    );
  pulse_0_params_IN_31_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(31),
      O => pulse_0_params_IN_31_IBUF_197
    );
  pulse_0_params_IN_30_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(30),
      O => pulse_0_params_IN_30_IBUF_198
    );
  pulse_0_params_IN_29_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(29),
      O => pulse_0_params_IN_29_IBUF_199
    );
  pulse_0_params_IN_28_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(28),
      O => pulse_0_params_IN_28_IBUF_200
    );
  pulse_0_params_IN_27_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(27),
      O => pulse_0_params_IN_27_IBUF_201
    );
  pulse_0_params_IN_26_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(26),
      O => pulse_0_params_IN_26_IBUF_202
    );
  pulse_0_params_IN_25_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(25),
      O => pulse_0_params_IN_25_IBUF_203
    );
  pulse_0_params_IN_24_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(24),
      O => pulse_0_params_IN_24_IBUF_204
    );
  pulse_0_params_IN_23_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(23),
      O => pulse_0_params_IN_23_IBUF_205
    );
  pulse_0_params_IN_22_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(22),
      O => pulse_0_params_IN_22_IBUF_206
    );
  pulse_0_params_IN_21_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(21),
      O => pulse_0_params_IN_21_IBUF_207
    );
  pulse_0_params_IN_20_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(20),
      O => pulse_0_params_IN_20_IBUF_208
    );
  pulse_0_params_IN_19_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(19),
      O => pulse_0_params_IN_19_IBUF_209
    );
  pulse_0_params_IN_18_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(18),
      O => pulse_0_params_IN_18_IBUF_210
    );
  pulse_0_params_IN_17_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(17),
      O => pulse_0_params_IN_17_IBUF_211
    );
  pulse_0_params_IN_16_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(16),
      O => pulse_0_params_IN_16_IBUF_212
    );
  pulse_0_params_IN_15_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(15),
      O => pulse_0_params_IN_15_IBUF_213
    );
  pulse_0_params_IN_14_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(14),
      O => pulse_0_params_IN_14_IBUF_214
    );
  pulse_0_params_IN_13_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(13),
      O => pulse_0_params_IN_13_IBUF_215
    );
  pulse_0_params_IN_12_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(12),
      O => pulse_0_params_IN_12_IBUF_216
    );
  pulse_0_params_IN_11_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(11),
      O => pulse_0_params_IN_11_IBUF_217
    );
  pulse_0_params_IN_10_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(10),
      O => pulse_0_params_IN_10_IBUF_218
    );
  pulse_0_params_IN_9_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(9),
      O => pulse_0_params_IN_9_IBUF_219
    );
  pulse_0_params_IN_8_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(8),
      O => pulse_0_params_IN_8_IBUF_220
    );
  pulse_0_params_IN_7_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(7),
      O => pulse_0_params_IN_7_IBUF_221
    );
  pulse_0_params_IN_6_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(6),
      O => pulse_0_params_IN_6_IBUF_222
    );
  pulse_0_params_IN_5_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(5),
      O => pulse_0_params_IN_5_IBUF_223
    );
  pulse_0_params_IN_4_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(4),
      O => pulse_0_params_IN_4_IBUF_224
    );
  pulse_0_params_IN_3_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(3),
      O => pulse_0_params_IN_3_IBUF_225
    );
  pulse_0_params_IN_2_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(2),
      O => pulse_0_params_IN_2_IBUF_226
    );
  pulse_0_params_IN_1_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(1),
      O => pulse_0_params_IN_1_IBUF_227
    );
  pulse_0_params_IN_0_IBUF : IBUF
    port map (
      I => pulse_0_params_IN(0),
      O => pulse_0_params_IN_0_IBUF_228
    );
  rst_IN_IBUF : IBUF
    port map (
      I => rst_IN,
      O => rst_IN_IBUF_230
    );
  instruction_OUT_15_OBUF : OBUF
    port map (
      I => instruction_OUT_15_460,
      O => instruction_OUT(15)
    );
  instruction_OUT_14_OBUF : OBUF
    port map (
      I => instruction_OUT_14_461,
      O => instruction_OUT(14)
    );
  instruction_OUT_13_OBUF : OBUF
    port map (
      I => instruction_OUT_13_462,
      O => instruction_OUT(13)
    );
  instruction_OUT_12_OBUF : OBUF
    port map (
      I => instruction_OUT_12_463,
      O => instruction_OUT(12)
    );
  instruction_OUT_11_OBUF : OBUF
    port map (
      I => instruction_OUT_11_464,
      O => instruction_OUT(11)
    );
  instruction_OUT_10_OBUF : OBUF
    port map (
      I => instruction_OUT_10_465,
      O => instruction_OUT(10)
    );
  instruction_OUT_9_OBUF : OBUF
    port map (
      I => instruction_OUT_9_466,
      O => instruction_OUT(9)
    );
  instruction_OUT_8_OBUF : OBUF
    port map (
      I => instruction_OUT_8_467,
      O => instruction_OUT(8)
    );
  instruction_OUT_7_OBUF : OBUF
    port map (
      I => instruction_OUT_7_468,
      O => instruction_OUT(7)
    );
  instruction_OUT_6_OBUF : OBUF
    port map (
      I => instruction_OUT_6_469,
      O => instruction_OUT(6)
    );
  instruction_OUT_5_OBUF : OBUF
    port map (
      I => instruction_OUT_5_470,
      O => instruction_OUT(5)
    );
  instruction_OUT_4_OBUF : OBUF
    port map (
      I => instruction_OUT_4_471,
      O => instruction_OUT(4)
    );
  instruction_OUT_3_OBUF : OBUF
    port map (
      I => instruction_OUT_3_472,
      O => instruction_OUT(3)
    );
  instruction_OUT_2_OBUF : OBUF
    port map (
      I => instruction_OUT_2_473,
      O => instruction_OUT(2)
    );
  instruction_OUT_1_OBUF : OBUF
    port map (
      I => instruction_OUT_1_474,
      O => instruction_OUT(1)
    );
  instruction_OUT_0_OBUF : OBUF
    port map (
      I => instruction_OUT_0_475,
      O => instruction_OUT(0)
    );
  num_pulses_OUT_15_OBUF : OBUF
    port map (
      I => num_pulses_OUT_15_476,
      O => num_pulses_OUT(15)
    );
  num_pulses_OUT_14_OBUF : OBUF
    port map (
      I => num_pulses_OUT_14_477,
      O => num_pulses_OUT(14)
    );
  num_pulses_OUT_13_OBUF : OBUF
    port map (
      I => num_pulses_OUT_13_478,
      O => num_pulses_OUT(13)
    );
  num_pulses_OUT_12_OBUF : OBUF
    port map (
      I => num_pulses_OUT_12_479,
      O => num_pulses_OUT(12)
    );
  num_pulses_OUT_11_OBUF : OBUF
    port map (
      I => num_pulses_OUT_11_480,
      O => num_pulses_OUT(11)
    );
  num_pulses_OUT_10_OBUF : OBUF
    port map (
      I => num_pulses_OUT_10_481,
      O => num_pulses_OUT(10)
    );
  num_pulses_OUT_9_OBUF : OBUF
    port map (
      I => num_pulses_OUT_9_482,
      O => num_pulses_OUT(9)
    );
  num_pulses_OUT_8_OBUF : OBUF
    port map (
      I => num_pulses_OUT_8_483,
      O => num_pulses_OUT(8)
    );
  num_pulses_OUT_7_OBUF : OBUF
    port map (
      I => num_pulses_OUT_7_484,
      O => num_pulses_OUT(7)
    );
  num_pulses_OUT_6_OBUF : OBUF
    port map (
      I => num_pulses_OUT_6_485,
      O => num_pulses_OUT(6)
    );
  num_pulses_OUT_5_OBUF : OBUF
    port map (
      I => num_pulses_OUT_5_486,
      O => num_pulses_OUT(5)
    );
  num_pulses_OUT_4_OBUF : OBUF
    port map (
      I => num_pulses_OUT_4_487,
      O => num_pulses_OUT(4)
    );
  num_pulses_OUT_3_OBUF : OBUF
    port map (
      I => num_pulses_OUT_3_488,
      O => num_pulses_OUT(3)
    );
  num_pulses_OUT_2_OBUF : OBUF
    port map (
      I => num_pulses_OUT_2_489,
      O => num_pulses_OUT(2)
    );
  num_pulses_OUT_1_OBUF : OBUF
    port map (
      I => num_pulses_OUT_1_490,
      O => num_pulses_OUT(1)
    );
  num_pulses_OUT_0_OBUF : OBUF
    port map (
      I => num_pulses_OUT_0_491,
      O => num_pulses_OUT(0)
    );
  num_repeats_OUT_31_OBUF : OBUF
    port map (
      I => num_repeats_OUT_31_492,
      O => num_repeats_OUT(31)
    );
  num_repeats_OUT_30_OBUF : OBUF
    port map (
      I => num_repeats_OUT_30_493,
      O => num_repeats_OUT(30)
    );
  num_repeats_OUT_29_OBUF : OBUF
    port map (
      I => num_repeats_OUT_29_494,
      O => num_repeats_OUT(29)
    );
  num_repeats_OUT_28_OBUF : OBUF
    port map (
      I => num_repeats_OUT_28_495,
      O => num_repeats_OUT(28)
    );
  num_repeats_OUT_27_OBUF : OBUF
    port map (
      I => num_repeats_OUT_27_496,
      O => num_repeats_OUT(27)
    );
  num_repeats_OUT_26_OBUF : OBUF
    port map (
      I => num_repeats_OUT_26_497,
      O => num_repeats_OUT(26)
    );
  num_repeats_OUT_25_OBUF : OBUF
    port map (
      I => num_repeats_OUT_25_498,
      O => num_repeats_OUT(25)
    );
  num_repeats_OUT_24_OBUF : OBUF
    port map (
      I => num_repeats_OUT_24_499,
      O => num_repeats_OUT(24)
    );
  num_repeats_OUT_23_OBUF : OBUF
    port map (
      I => num_repeats_OUT_23_500,
      O => num_repeats_OUT(23)
    );
  num_repeats_OUT_22_OBUF : OBUF
    port map (
      I => num_repeats_OUT_22_501,
      O => num_repeats_OUT(22)
    );
  num_repeats_OUT_21_OBUF : OBUF
    port map (
      I => num_repeats_OUT_21_502,
      O => num_repeats_OUT(21)
    );
  num_repeats_OUT_20_OBUF : OBUF
    port map (
      I => num_repeats_OUT_20_503,
      O => num_repeats_OUT(20)
    );
  num_repeats_OUT_19_OBUF : OBUF
    port map (
      I => num_repeats_OUT_19_504,
      O => num_repeats_OUT(19)
    );
  num_repeats_OUT_18_OBUF : OBUF
    port map (
      I => num_repeats_OUT_18_505,
      O => num_repeats_OUT(18)
    );
  num_repeats_OUT_17_OBUF : OBUF
    port map (
      I => num_repeats_OUT_17_506,
      O => num_repeats_OUT(17)
    );
  num_repeats_OUT_16_OBUF : OBUF
    port map (
      I => num_repeats_OUT_16_507,
      O => num_repeats_OUT(16)
    );
  num_repeats_OUT_15_OBUF : OBUF
    port map (
      I => num_repeats_OUT_15_508,
      O => num_repeats_OUT(15)
    );
  num_repeats_OUT_14_OBUF : OBUF
    port map (
      I => num_repeats_OUT_14_509,
      O => num_repeats_OUT(14)
    );
  num_repeats_OUT_13_OBUF : OBUF
    port map (
      I => num_repeats_OUT_13_510,
      O => num_repeats_OUT(13)
    );
  num_repeats_OUT_12_OBUF : OBUF
    port map (
      I => num_repeats_OUT_12_511,
      O => num_repeats_OUT(12)
    );
  num_repeats_OUT_11_OBUF : OBUF
    port map (
      I => num_repeats_OUT_11_512,
      O => num_repeats_OUT(11)
    );
  num_repeats_OUT_10_OBUF : OBUF
    port map (
      I => num_repeats_OUT_10_513,
      O => num_repeats_OUT(10)
    );
  num_repeats_OUT_9_OBUF : OBUF
    port map (
      I => num_repeats_OUT_9_514,
      O => num_repeats_OUT(9)
    );
  num_repeats_OUT_8_OBUF : OBUF
    port map (
      I => num_repeats_OUT_8_515,
      O => num_repeats_OUT(8)
    );
  num_repeats_OUT_7_OBUF : OBUF
    port map (
      I => num_repeats_OUT_7_516,
      O => num_repeats_OUT(7)
    );
  num_repeats_OUT_6_OBUF : OBUF
    port map (
      I => num_repeats_OUT_6_517,
      O => num_repeats_OUT(6)
    );
  num_repeats_OUT_5_OBUF : OBUF
    port map (
      I => num_repeats_OUT_5_518,
      O => num_repeats_OUT(5)
    );
  num_repeats_OUT_4_OBUF : OBUF
    port map (
      I => num_repeats_OUT_4_519,
      O => num_repeats_OUT(4)
    );
  num_repeats_OUT_3_OBUF : OBUF
    port map (
      I => num_repeats_OUT_3_520,
      O => num_repeats_OUT(3)
    );
  num_repeats_OUT_2_OBUF : OBUF
    port map (
      I => num_repeats_OUT_2_521,
      O => num_repeats_OUT(2)
    );
  num_repeats_OUT_1_OBUF : OBUF
    port map (
      I => num_repeats_OUT_1_522,
      O => num_repeats_OUT(1)
    );
  num_repeats_OUT_0_OBUF : OBUF
    port map (
      I => num_repeats_OUT_0_523,
      O => num_repeats_OUT(0)
    );
  x_amp_delay_OUT_15_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_15_524,
      O => x_amp_delay_OUT(15)
    );
  x_amp_delay_OUT_14_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_14_525,
      O => x_amp_delay_OUT(14)
    );
  x_amp_delay_OUT_13_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_13_526,
      O => x_amp_delay_OUT(13)
    );
  x_amp_delay_OUT_12_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_12_527,
      O => x_amp_delay_OUT(12)
    );
  x_amp_delay_OUT_11_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_11_528,
      O => x_amp_delay_OUT(11)
    );
  x_amp_delay_OUT_10_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_10_529,
      O => x_amp_delay_OUT(10)
    );
  x_amp_delay_OUT_9_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_9_530,
      O => x_amp_delay_OUT(9)
    );
  x_amp_delay_OUT_8_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_8_531,
      O => x_amp_delay_OUT(8)
    );
  x_amp_delay_OUT_7_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_7_532,
      O => x_amp_delay_OUT(7)
    );
  x_amp_delay_OUT_6_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_6_533,
      O => x_amp_delay_OUT(6)
    );
  x_amp_delay_OUT_5_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_5_534,
      O => x_amp_delay_OUT(5)
    );
  x_amp_delay_OUT_4_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_4_535,
      O => x_amp_delay_OUT(4)
    );
  x_amp_delay_OUT_3_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_3_536,
      O => x_amp_delay_OUT(3)
    );
  x_amp_delay_OUT_2_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_2_537,
      O => x_amp_delay_OUT(2)
    );
  x_amp_delay_OUT_1_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_1_538,
      O => x_amp_delay_OUT(1)
    );
  x_amp_delay_OUT_0_OBUF : OBUF
    port map (
      I => x_amp_delay_OUT_0_539,
      O => x_amp_delay_OUT(0)
    );
  l_amp_delay_OUT_15_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_15_540,
      O => l_amp_delay_OUT(15)
    );
  l_amp_delay_OUT_14_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_14_541,
      O => l_amp_delay_OUT(14)
    );
  l_amp_delay_OUT_13_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_13_542,
      O => l_amp_delay_OUT(13)
    );
  l_amp_delay_OUT_12_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_12_543,
      O => l_amp_delay_OUT(12)
    );
  l_amp_delay_OUT_11_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_11_544,
      O => l_amp_delay_OUT(11)
    );
  l_amp_delay_OUT_10_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_10_545,
      O => l_amp_delay_OUT(10)
    );
  l_amp_delay_OUT_9_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_9_546,
      O => l_amp_delay_OUT(9)
    );
  l_amp_delay_OUT_8_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_8_547,
      O => l_amp_delay_OUT(8)
    );
  l_amp_delay_OUT_7_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_7_548,
      O => l_amp_delay_OUT(7)
    );
  l_amp_delay_OUT_6_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_6_549,
      O => l_amp_delay_OUT(6)
    );
  l_amp_delay_OUT_5_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_5_550,
      O => l_amp_delay_OUT(5)
    );
  l_amp_delay_OUT_4_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_4_551,
      O => l_amp_delay_OUT(4)
    );
  l_amp_delay_OUT_3_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_3_552,
      O => l_amp_delay_OUT(3)
    );
  l_amp_delay_OUT_2_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_2_553,
      O => l_amp_delay_OUT(2)
    );
  l_amp_delay_OUT_1_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_1_554,
      O => l_amp_delay_OUT(1)
    );
  l_amp_delay_OUT_0_OBUF : OBUF
    port map (
      I => l_amp_delay_OUT_0_555,
      O => l_amp_delay_OUT(0)
    );
  pri_pulse_width_OUT_31_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_31_556,
      O => pri_pulse_width_OUT(31)
    );
  pri_pulse_width_OUT_30_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_30_557,
      O => pri_pulse_width_OUT(30)
    );
  pri_pulse_width_OUT_29_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_29_558,
      O => pri_pulse_width_OUT(29)
    );
  pri_pulse_width_OUT_28_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_28_559,
      O => pri_pulse_width_OUT(28)
    );
  pri_pulse_width_OUT_27_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_27_560,
      O => pri_pulse_width_OUT(27)
    );
  pri_pulse_width_OUT_26_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_26_561,
      O => pri_pulse_width_OUT(26)
    );
  pri_pulse_width_OUT_25_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_25_562,
      O => pri_pulse_width_OUT(25)
    );
  pri_pulse_width_OUT_24_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_24_563,
      O => pri_pulse_width_OUT(24)
    );
  pri_pulse_width_OUT_23_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_23_564,
      O => pri_pulse_width_OUT(23)
    );
  pri_pulse_width_OUT_22_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_22_565,
      O => pri_pulse_width_OUT(22)
    );
  pri_pulse_width_OUT_21_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_21_566,
      O => pri_pulse_width_OUT(21)
    );
  pri_pulse_width_OUT_20_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_20_567,
      O => pri_pulse_width_OUT(20)
    );
  pri_pulse_width_OUT_19_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_19_568,
      O => pri_pulse_width_OUT(19)
    );
  pri_pulse_width_OUT_18_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_18_569,
      O => pri_pulse_width_OUT(18)
    );
  pri_pulse_width_OUT_17_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_17_570,
      O => pri_pulse_width_OUT(17)
    );
  pri_pulse_width_OUT_16_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_16_571,
      O => pri_pulse_width_OUT(16)
    );
  pri_pulse_width_OUT_15_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_15_572,
      O => pri_pulse_width_OUT(15)
    );
  pri_pulse_width_OUT_14_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_14_573,
      O => pri_pulse_width_OUT(14)
    );
  pri_pulse_width_OUT_13_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_13_574,
      O => pri_pulse_width_OUT(13)
    );
  pri_pulse_width_OUT_12_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_12_575,
      O => pri_pulse_width_OUT(12)
    );
  pri_pulse_width_OUT_11_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_11_576,
      O => pri_pulse_width_OUT(11)
    );
  pri_pulse_width_OUT_10_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_10_577,
      O => pri_pulse_width_OUT(10)
    );
  pri_pulse_width_OUT_9_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_9_578,
      O => pri_pulse_width_OUT(9)
    );
  pri_pulse_width_OUT_8_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_8_579,
      O => pri_pulse_width_OUT(8)
    );
  pri_pulse_width_OUT_7_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_7_580,
      O => pri_pulse_width_OUT(7)
    );
  pri_pulse_width_OUT_6_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_6_581,
      O => pri_pulse_width_OUT(6)
    );
  pri_pulse_width_OUT_5_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_5_582,
      O => pri_pulse_width_OUT(5)
    );
  pri_pulse_width_OUT_4_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_4_583,
      O => pri_pulse_width_OUT(4)
    );
  pri_pulse_width_OUT_3_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_3_584,
      O => pri_pulse_width_OUT(3)
    );
  pri_pulse_width_OUT_2_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_2_585,
      O => pri_pulse_width_OUT(2)
    );
  pri_pulse_width_OUT_1_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_1_586,
      O => pri_pulse_width_OUT(1)
    );
  pri_pulse_width_OUT_0_OBUF : OBUF
    port map (
      I => pri_pulse_width_OUT_0_587,
      O => pri_pulse_width_OUT(0)
    );
  pulse_params_OUT_95_OBUF : OBUF
    port map (
      I => pulse_params_OUT_95_588,
      O => pulse_params_OUT(95)
    );
  pulse_params_OUT_94_OBUF : OBUF
    port map (
      I => pulse_params_OUT_94_589,
      O => pulse_params_OUT(94)
    );
  pulse_params_OUT_93_OBUF : OBUF
    port map (
      I => pulse_params_OUT_93_590,
      O => pulse_params_OUT(93)
    );
  pulse_params_OUT_92_OBUF : OBUF
    port map (
      I => pulse_params_OUT_92_591,
      O => pulse_params_OUT(92)
    );
  pulse_params_OUT_91_OBUF : OBUF
    port map (
      I => pulse_params_OUT_91_592,
      O => pulse_params_OUT(91)
    );
  pulse_params_OUT_90_OBUF : OBUF
    port map (
      I => pulse_params_OUT_90_593,
      O => pulse_params_OUT(90)
    );
  pulse_params_OUT_89_OBUF : OBUF
    port map (
      I => pulse_params_OUT_89_594,
      O => pulse_params_OUT(89)
    );
  pulse_params_OUT_88_OBUF : OBUF
    port map (
      I => pulse_params_OUT_88_595,
      O => pulse_params_OUT(88)
    );
  pulse_params_OUT_87_OBUF : OBUF
    port map (
      I => pulse_params_OUT_87_596,
      O => pulse_params_OUT(87)
    );
  pulse_params_OUT_86_OBUF : OBUF
    port map (
      I => pulse_params_OUT_86_597,
      O => pulse_params_OUT(86)
    );
  pulse_params_OUT_85_OBUF : OBUF
    port map (
      I => pulse_params_OUT_85_598,
      O => pulse_params_OUT(85)
    );
  pulse_params_OUT_84_OBUF : OBUF
    port map (
      I => pulse_params_OUT_84_599,
      O => pulse_params_OUT(84)
    );
  pulse_params_OUT_83_OBUF : OBUF
    port map (
      I => pulse_params_OUT_83_600,
      O => pulse_params_OUT(83)
    );
  pulse_params_OUT_82_OBUF : OBUF
    port map (
      I => pulse_params_OUT_82_601,
      O => pulse_params_OUT(82)
    );
  pulse_params_OUT_81_OBUF : OBUF
    port map (
      I => pulse_params_OUT_81_602,
      O => pulse_params_OUT(81)
    );
  pulse_params_OUT_80_OBUF : OBUF
    port map (
      I => pulse_params_OUT_80_603,
      O => pulse_params_OUT(80)
    );
  pulse_params_OUT_79_OBUF : OBUF
    port map (
      I => pulse_params_OUT_79_604,
      O => pulse_params_OUT(79)
    );
  pulse_params_OUT_78_OBUF : OBUF
    port map (
      I => pulse_params_OUT_78_605,
      O => pulse_params_OUT(78)
    );
  pulse_params_OUT_77_OBUF : OBUF
    port map (
      I => pulse_params_OUT_77_606,
      O => pulse_params_OUT(77)
    );
  pulse_params_OUT_76_OBUF : OBUF
    port map (
      I => pulse_params_OUT_76_607,
      O => pulse_params_OUT(76)
    );
  pulse_params_OUT_75_OBUF : OBUF
    port map (
      I => pulse_params_OUT_75_608,
      O => pulse_params_OUT(75)
    );
  pulse_params_OUT_74_OBUF : OBUF
    port map (
      I => pulse_params_OUT_74_609,
      O => pulse_params_OUT(74)
    );
  pulse_params_OUT_73_OBUF : OBUF
    port map (
      I => pulse_params_OUT_73_610,
      O => pulse_params_OUT(73)
    );
  pulse_params_OUT_72_OBUF : OBUF
    port map (
      I => pulse_params_OUT_72_611,
      O => pulse_params_OUT(72)
    );
  pulse_params_OUT_71_OBUF : OBUF
    port map (
      I => pulse_params_OUT_71_612,
      O => pulse_params_OUT(71)
    );
  pulse_params_OUT_70_OBUF : OBUF
    port map (
      I => pulse_params_OUT_70_613,
      O => pulse_params_OUT(70)
    );
  pulse_params_OUT_69_OBUF : OBUF
    port map (
      I => pulse_params_OUT_69_614,
      O => pulse_params_OUT(69)
    );
  pulse_params_OUT_68_OBUF : OBUF
    port map (
      I => pulse_params_OUT_68_615,
      O => pulse_params_OUT(68)
    );
  pulse_params_OUT_67_OBUF : OBUF
    port map (
      I => pulse_params_OUT_67_616,
      O => pulse_params_OUT(67)
    );
  pulse_params_OUT_66_OBUF : OBUF
    port map (
      I => pulse_params_OUT_66_617,
      O => pulse_params_OUT(66)
    );
  pulse_params_OUT_65_OBUF : OBUF
    port map (
      I => pulse_params_OUT_65_618,
      O => pulse_params_OUT(65)
    );
  pulse_params_OUT_64_OBUF : OBUF
    port map (
      I => pulse_params_OUT_64_619,
      O => pulse_params_OUT(64)
    );
  pulse_params_OUT_63_OBUF : OBUF
    port map (
      I => pulse_params_OUT_63_620,
      O => pulse_params_OUT(63)
    );
  pulse_params_OUT_62_OBUF : OBUF
    port map (
      I => pulse_params_OUT_62_621,
      O => pulse_params_OUT(62)
    );
  pulse_params_OUT_61_OBUF : OBUF
    port map (
      I => pulse_params_OUT_61_622,
      O => pulse_params_OUT(61)
    );
  pulse_params_OUT_60_OBUF : OBUF
    port map (
      I => pulse_params_OUT_60_623,
      O => pulse_params_OUT(60)
    );
  pulse_params_OUT_59_OBUF : OBUF
    port map (
      I => pulse_params_OUT_59_624,
      O => pulse_params_OUT(59)
    );
  pulse_params_OUT_58_OBUF : OBUF
    port map (
      I => pulse_params_OUT_58_625,
      O => pulse_params_OUT(58)
    );
  pulse_params_OUT_57_OBUF : OBUF
    port map (
      I => pulse_params_OUT_57_626,
      O => pulse_params_OUT(57)
    );
  pulse_params_OUT_56_OBUF : OBUF
    port map (
      I => pulse_params_OUT_56_627,
      O => pulse_params_OUT(56)
    );
  pulse_params_OUT_55_OBUF : OBUF
    port map (
      I => pulse_params_OUT_55_628,
      O => pulse_params_OUT(55)
    );
  pulse_params_OUT_54_OBUF : OBUF
    port map (
      I => pulse_params_OUT_54_629,
      O => pulse_params_OUT(54)
    );
  pulse_params_OUT_53_OBUF : OBUF
    port map (
      I => pulse_params_OUT_53_630,
      O => pulse_params_OUT(53)
    );
  pulse_params_OUT_52_OBUF : OBUF
    port map (
      I => pulse_params_OUT_52_631,
      O => pulse_params_OUT(52)
    );
  pulse_params_OUT_51_OBUF : OBUF
    port map (
      I => pulse_params_OUT_51_632,
      O => pulse_params_OUT(51)
    );
  pulse_params_OUT_50_OBUF : OBUF
    port map (
      I => pulse_params_OUT_50_633,
      O => pulse_params_OUT(50)
    );
  pulse_params_OUT_49_OBUF : OBUF
    port map (
      I => pulse_params_OUT_49_634,
      O => pulse_params_OUT(49)
    );
  pulse_params_OUT_48_OBUF : OBUF
    port map (
      I => pulse_params_OUT_48_635,
      O => pulse_params_OUT(48)
    );
  pulse_params_OUT_47_OBUF : OBUF
    port map (
      I => pulse_params_OUT_47_636,
      O => pulse_params_OUT(47)
    );
  pulse_params_OUT_46_OBUF : OBUF
    port map (
      I => pulse_params_OUT_46_637,
      O => pulse_params_OUT(46)
    );
  pulse_params_OUT_45_OBUF : OBUF
    port map (
      I => pulse_params_OUT_45_638,
      O => pulse_params_OUT(45)
    );
  pulse_params_OUT_44_OBUF : OBUF
    port map (
      I => pulse_params_OUT_44_639,
      O => pulse_params_OUT(44)
    );
  pulse_params_OUT_43_OBUF : OBUF
    port map (
      I => pulse_params_OUT_43_640,
      O => pulse_params_OUT(43)
    );
  pulse_params_OUT_42_OBUF : OBUF
    port map (
      I => pulse_params_OUT_42_641,
      O => pulse_params_OUT(42)
    );
  pulse_params_OUT_41_OBUF : OBUF
    port map (
      I => pulse_params_OUT_41_642,
      O => pulse_params_OUT(41)
    );
  pulse_params_OUT_40_OBUF : OBUF
    port map (
      I => pulse_params_OUT_40_643,
      O => pulse_params_OUT(40)
    );
  pulse_params_OUT_39_OBUF : OBUF
    port map (
      I => pulse_params_OUT_39_644,
      O => pulse_params_OUT(39)
    );
  pulse_params_OUT_38_OBUF : OBUF
    port map (
      I => pulse_params_OUT_38_645,
      O => pulse_params_OUT(38)
    );
  pulse_params_OUT_37_OBUF : OBUF
    port map (
      I => pulse_params_OUT_37_646,
      O => pulse_params_OUT(37)
    );
  pulse_params_OUT_36_OBUF : OBUF
    port map (
      I => pulse_params_OUT_36_647,
      O => pulse_params_OUT(36)
    );
  pulse_params_OUT_35_OBUF : OBUF
    port map (
      I => pulse_params_OUT_35_648,
      O => pulse_params_OUT(35)
    );
  pulse_params_OUT_34_OBUF : OBUF
    port map (
      I => pulse_params_OUT_34_649,
      O => pulse_params_OUT(34)
    );
  pulse_params_OUT_33_OBUF : OBUF
    port map (
      I => pulse_params_OUT_33_650,
      O => pulse_params_OUT(33)
    );
  pulse_params_OUT_32_OBUF : OBUF
    port map (
      I => pulse_params_OUT_32_651,
      O => pulse_params_OUT(32)
    );
  pulse_params_OUT_31_OBUF : OBUF
    port map (
      I => pulse_params_OUT_31_652,
      O => pulse_params_OUT(31)
    );
  pulse_params_OUT_30_OBUF : OBUF
    port map (
      I => pulse_params_OUT_30_653,
      O => pulse_params_OUT(30)
    );
  pulse_params_OUT_29_OBUF : OBUF
    port map (
      I => pulse_params_OUT_29_654,
      O => pulse_params_OUT(29)
    );
  pulse_params_OUT_28_OBUF : OBUF
    port map (
      I => pulse_params_OUT_28_655,
      O => pulse_params_OUT(28)
    );
  pulse_params_OUT_27_OBUF : OBUF
    port map (
      I => pulse_params_OUT_27_656,
      O => pulse_params_OUT(27)
    );
  pulse_params_OUT_26_OBUF : OBUF
    port map (
      I => pulse_params_OUT_26_657,
      O => pulse_params_OUT(26)
    );
  pulse_params_OUT_25_OBUF : OBUF
    port map (
      I => pulse_params_OUT_25_658,
      O => pulse_params_OUT(25)
    );
  pulse_params_OUT_24_OBUF : OBUF
    port map (
      I => pulse_params_OUT_24_659,
      O => pulse_params_OUT(24)
    );
  pulse_params_OUT_23_OBUF : OBUF
    port map (
      I => pulse_params_OUT_23_660,
      O => pulse_params_OUT(23)
    );
  pulse_params_OUT_22_OBUF : OBUF
    port map (
      I => pulse_params_OUT_22_661,
      O => pulse_params_OUT(22)
    );
  pulse_params_OUT_21_OBUF : OBUF
    port map (
      I => pulse_params_OUT_21_662,
      O => pulse_params_OUT(21)
    );
  pulse_params_OUT_20_OBUF : OBUF
    port map (
      I => pulse_params_OUT_20_663,
      O => pulse_params_OUT(20)
    );
  pulse_params_OUT_19_OBUF : OBUF
    port map (
      I => pulse_params_OUT_19_664,
      O => pulse_params_OUT(19)
    );
  pulse_params_OUT_18_OBUF : OBUF
    port map (
      I => pulse_params_OUT_18_665,
      O => pulse_params_OUT(18)
    );
  pulse_params_OUT_17_OBUF : OBUF
    port map (
      I => pulse_params_OUT_17_666,
      O => pulse_params_OUT(17)
    );
  pulse_params_OUT_16_OBUF : OBUF
    port map (
      I => pulse_params_OUT_16_667,
      O => pulse_params_OUT(16)
    );
  pulse_params_OUT_15_OBUF : OBUF
    port map (
      I => pulse_params_OUT_15_668,
      O => pulse_params_OUT(15)
    );
  pulse_params_OUT_14_OBUF : OBUF
    port map (
      I => pulse_params_OUT_14_669,
      O => pulse_params_OUT(14)
    );
  pulse_params_OUT_13_OBUF : OBUF
    port map (
      I => pulse_params_OUT_13_670,
      O => pulse_params_OUT(13)
    );
  pulse_params_OUT_12_OBUF : OBUF
    port map (
      I => pulse_params_OUT_12_671,
      O => pulse_params_OUT(12)
    );
  pulse_params_OUT_11_OBUF : OBUF
    port map (
      I => pulse_params_OUT_11_672,
      O => pulse_params_OUT(11)
    );
  pulse_params_OUT_10_OBUF : OBUF
    port map (
      I => pulse_params_OUT_10_673,
      O => pulse_params_OUT(10)
    );
  pulse_params_OUT_9_OBUF : OBUF
    port map (
      I => pulse_params_OUT_9_674,
      O => pulse_params_OUT(9)
    );
  pulse_params_OUT_8_OBUF : OBUF
    port map (
      I => pulse_params_OUT_8_675,
      O => pulse_params_OUT(8)
    );
  pulse_params_OUT_7_OBUF : OBUF
    port map (
      I => pulse_params_OUT_7_676,
      O => pulse_params_OUT(7)
    );
  pulse_params_OUT_6_OBUF : OBUF
    port map (
      I => pulse_params_OUT_6_677,
      O => pulse_params_OUT(6)
    );
  pulse_params_OUT_5_OBUF : OBUF
    port map (
      I => pulse_params_OUT_5_678,
      O => pulse_params_OUT(5)
    );
  pulse_params_OUT_4_OBUF : OBUF
    port map (
      I => pulse_params_OUT_4_679,
      O => pulse_params_OUT(4)
    );
  pulse_params_OUT_3_OBUF : OBUF
    port map (
      I => pulse_params_OUT_3_680,
      O => pulse_params_OUT(3)
    );
  pulse_params_OUT_2_OBUF : OBUF
    port map (
      I => pulse_params_OUT_2_681,
      O => pulse_params_OUT(2)
    );
  pulse_params_OUT_1_OBUF : OBUF
    port map (
      I => pulse_params_OUT_1_682,
      O => pulse_params_OUT(1)
    );
  pulse_params_OUT_0_OBUF : OBUF
    port map (
      I => pulse_params_OUT_0_683,
      O => pulse_params_OUT(0)
    );
  pulse_params_OUT_0 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_0_rstpot_1140,
      Q => pulse_params_OUT_0_683
    );
  pulse_params_OUT_1 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_1_rstpot_1141,
      Q => pulse_params_OUT_1_682
    );
  pulse_params_OUT_2 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_2_rstpot_1142,
      Q => pulse_params_OUT_2_681
    );
  pulse_params_OUT_3 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_3_rstpot_1143,
      Q => pulse_params_OUT_3_680
    );
  pulse_params_OUT_4 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_4_rstpot_1144,
      Q => pulse_params_OUT_4_679
    );
  pulse_params_OUT_5 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_5_rstpot_1145,
      Q => pulse_params_OUT_5_678
    );
  pulse_params_OUT_6 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_6_rstpot_1146,
      Q => pulse_params_OUT_6_677
    );
  pulse_params_OUT_7 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_7_rstpot_1147,
      Q => pulse_params_OUT_7_676
    );
  pulse_params_OUT_8 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_8_rstpot_1148,
      Q => pulse_params_OUT_8_675
    );
  pulse_params_OUT_9 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_9_rstpot_1149,
      Q => pulse_params_OUT_9_674
    );
  pulse_params_OUT_10 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_10_rstpot_1150,
      Q => pulse_params_OUT_10_673
    );
  pulse_params_OUT_11 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_11_rstpot_1151,
      Q => pulse_params_OUT_11_672
    );
  pulse_params_OUT_12 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_12_rstpot_1152,
      Q => pulse_params_OUT_12_671
    );
  pulse_params_OUT_13 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_13_rstpot_1153,
      Q => pulse_params_OUT_13_670
    );
  pulse_params_OUT_14 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_14_rstpot_1154,
      Q => pulse_params_OUT_14_669
    );
  pulse_params_OUT_15 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_15_rstpot_1155,
      Q => pulse_params_OUT_15_668
    );
  pulse_params_OUT_16 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_16_rstpot_1156,
      Q => pulse_params_OUT_16_667
    );
  pulse_params_OUT_17 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_17_rstpot_1157,
      Q => pulse_params_OUT_17_666
    );
  pulse_params_OUT_18 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_18_rstpot_1158,
      Q => pulse_params_OUT_18_665
    );
  pulse_params_OUT_19 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_19_rstpot_1159,
      Q => pulse_params_OUT_19_664
    );
  pulse_params_OUT_20 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_20_rstpot_1160,
      Q => pulse_params_OUT_20_663
    );
  pulse_params_OUT_21 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_21_rstpot_1161,
      Q => pulse_params_OUT_21_662
    );
  pulse_params_OUT_22 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_22_rstpot_1162,
      Q => pulse_params_OUT_22_661
    );
  pulse_params_OUT_23 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_23_rstpot_1163,
      Q => pulse_params_OUT_23_660
    );
  pulse_params_OUT_24 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_24_rstpot_1164,
      Q => pulse_params_OUT_24_659
    );
  pulse_params_OUT_25 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_25_rstpot_1165,
      Q => pulse_params_OUT_25_658
    );
  pulse_params_OUT_26 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_26_rstpot_1166,
      Q => pulse_params_OUT_26_657
    );
  pulse_params_OUT_27 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_27_rstpot_1167,
      Q => pulse_params_OUT_27_656
    );
  pulse_params_OUT_28 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_28_rstpot_1168,
      Q => pulse_params_OUT_28_655
    );
  pulse_params_OUT_29 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_29_rstpot_1169,
      Q => pulse_params_OUT_29_654
    );
  pulse_params_OUT_30 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_30_rstpot_1170,
      Q => pulse_params_OUT_30_653
    );
  pulse_params_OUT_31 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_31_rstpot_1171,
      Q => pulse_params_OUT_31_652
    );
  pulse_params_OUT_32 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_32_rstpot_1172,
      Q => pulse_params_OUT_32_651
    );
  pulse_params_OUT_33 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_33_rstpot_1173,
      Q => pulse_params_OUT_33_650
    );
  pulse_params_OUT_34 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_34_rstpot_1174,
      Q => pulse_params_OUT_34_649
    );
  pulse_params_OUT_35 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_35_rstpot_1175,
      Q => pulse_params_OUT_35_648
    );
  pulse_params_OUT_36 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_36_rstpot_1176,
      Q => pulse_params_OUT_36_647
    );
  pulse_params_OUT_37 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_37_rstpot_1177,
      Q => pulse_params_OUT_37_646
    );
  pulse_params_OUT_38 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_38_rstpot_1178,
      Q => pulse_params_OUT_38_645
    );
  pulse_params_OUT_39 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_39_rstpot_1179,
      Q => pulse_params_OUT_39_644
    );
  pulse_params_OUT_40 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_40_rstpot_1180,
      Q => pulse_params_OUT_40_643
    );
  pulse_params_OUT_41 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_41_rstpot_1181,
      Q => pulse_params_OUT_41_642
    );
  pulse_params_OUT_42 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_42_rstpot_1182,
      Q => pulse_params_OUT_42_641
    );
  pulse_params_OUT_43 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_43_rstpot_1183,
      Q => pulse_params_OUT_43_640
    );
  pulse_params_OUT_44 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_44_rstpot_1184,
      Q => pulse_params_OUT_44_639
    );
  pulse_params_OUT_45 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_45_rstpot_1185,
      Q => pulse_params_OUT_45_638
    );
  pulse_params_OUT_46 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_46_rstpot_1186,
      Q => pulse_params_OUT_46_637
    );
  pulse_params_OUT_47 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_47_rstpot_1187,
      Q => pulse_params_OUT_47_636
    );
  pulse_params_OUT_48 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_48_rstpot_1188,
      Q => pulse_params_OUT_48_635
    );
  pulse_params_OUT_49 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_49_rstpot_1189,
      Q => pulse_params_OUT_49_634
    );
  pulse_params_OUT_50 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_50_rstpot_1190,
      Q => pulse_params_OUT_50_633
    );
  pulse_params_OUT_51 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_51_rstpot_1191,
      Q => pulse_params_OUT_51_632
    );
  pulse_params_OUT_52 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_52_rstpot_1192,
      Q => pulse_params_OUT_52_631
    );
  pulse_params_OUT_53 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_53_rstpot_1193,
      Q => pulse_params_OUT_53_630
    );
  pulse_params_OUT_54 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_54_rstpot_1194,
      Q => pulse_params_OUT_54_629
    );
  pulse_params_OUT_55 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_55_rstpot_1195,
      Q => pulse_params_OUT_55_628
    );
  pulse_params_OUT_56 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_56_rstpot_1196,
      Q => pulse_params_OUT_56_627
    );
  pulse_params_OUT_57 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_57_rstpot_1197,
      Q => pulse_params_OUT_57_626
    );
  pulse_params_OUT_58 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_58_rstpot_1198,
      Q => pulse_params_OUT_58_625
    );
  pulse_params_OUT_59 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_59_rstpot_1199,
      Q => pulse_params_OUT_59_624
    );
  pulse_params_OUT_60 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_60_rstpot_1200,
      Q => pulse_params_OUT_60_623
    );
  pulse_params_OUT_61 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_61_rstpot_1201,
      Q => pulse_params_OUT_61_622
    );
  pulse_params_OUT_62 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_62_rstpot_1202,
      Q => pulse_params_OUT_62_621
    );
  pulse_params_OUT_63 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_63_rstpot_1203,
      Q => pulse_params_OUT_63_620
    );
  pulse_params_OUT_64 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_64_rstpot_1204,
      Q => pulse_params_OUT_64_619
    );
  pulse_params_OUT_65 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_65_rstpot_1205,
      Q => pulse_params_OUT_65_618
    );
  pulse_params_OUT_66 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_66_rstpot_1206,
      Q => pulse_params_OUT_66_617
    );
  pulse_params_OUT_67 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_67_rstpot_1207,
      Q => pulse_params_OUT_67_616
    );
  pulse_params_OUT_68 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_68_rstpot_1208,
      Q => pulse_params_OUT_68_615
    );
  pulse_params_OUT_69 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_69_rstpot_1209,
      Q => pulse_params_OUT_69_614
    );
  pulse_params_OUT_70 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_70_rstpot_1210,
      Q => pulse_params_OUT_70_613
    );
  pulse_params_OUT_71 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_71_rstpot_1211,
      Q => pulse_params_OUT_71_612
    );
  pulse_params_OUT_72 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_72_rstpot_1212,
      Q => pulse_params_OUT_72_611
    );
  pulse_params_OUT_73 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_73_rstpot_1213,
      Q => pulse_params_OUT_73_610
    );
  pulse_params_OUT_74 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_74_rstpot_1214,
      Q => pulse_params_OUT_74_609
    );
  pulse_params_OUT_75 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_75_rstpot_1215,
      Q => pulse_params_OUT_75_608
    );
  pulse_params_OUT_76 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_76_rstpot_1216,
      Q => pulse_params_OUT_76_607
    );
  pulse_params_OUT_77 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_77_rstpot_1217,
      Q => pulse_params_OUT_77_606
    );
  pulse_params_OUT_78 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_78_rstpot_1218,
      Q => pulse_params_OUT_78_605
    );
  pulse_params_OUT_79 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_79_rstpot_1219,
      Q => pulse_params_OUT_79_604
    );
  pulse_params_OUT_80 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_80_rstpot_1220,
      Q => pulse_params_OUT_80_603
    );
  pulse_params_OUT_81 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_81_rstpot_1221,
      Q => pulse_params_OUT_81_602
    );
  pulse_params_OUT_82 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_82_rstpot_1222,
      Q => pulse_params_OUT_82_601
    );
  pulse_params_OUT_83 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_83_rstpot_1223,
      Q => pulse_params_OUT_83_600
    );
  pulse_params_OUT_84 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_84_rstpot_1224,
      Q => pulse_params_OUT_84_599
    );
  pulse_params_OUT_85 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_85_rstpot_1225,
      Q => pulse_params_OUT_85_598
    );
  pulse_params_OUT_86 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_86_rstpot_1226,
      Q => pulse_params_OUT_86_597
    );
  pulse_params_OUT_87 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_87_rstpot_1227,
      Q => pulse_params_OUT_87_596
    );
  pulse_params_OUT_88 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_88_rstpot_1228,
      Q => pulse_params_OUT_88_595
    );
  pulse_params_OUT_89 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_89_rstpot_1229,
      Q => pulse_params_OUT_89_594
    );
  pulse_params_OUT_90 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_90_rstpot_1230,
      Q => pulse_params_OUT_90_593
    );
  pulse_params_OUT_91 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_91_rstpot_1231,
      Q => pulse_params_OUT_91_592
    );
  pulse_params_OUT_92 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_92_rstpot_1232,
      Q => pulse_params_OUT_92_591
    );
  pulse_params_OUT_93 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_93_rstpot_1233,
      Q => pulse_params_OUT_93_590
    );
  pulse_params_OUT_94 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_94_rstpot_1234,
      Q => pulse_params_OUT_94_589
    );
  pulse_params_OUT_95 : FD
    port map (
      C => clk_IN_BUFGP_229,
      D => pulse_params_OUT_95_rstpot_1235,
      Q => pulse_params_OUT_95_588
    );
  pulse_params_OUT_0_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(0),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_0_rstpot_1140
    );
  pulse_params_OUT_1_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(1),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_1_rstpot_1141
    );
  pulse_params_OUT_2_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(2),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_2_rstpot_1142
    );
  pulse_params_OUT_3_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(3),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_3_rstpot_1143
    );
  pulse_params_OUT_4_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(4),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_4_rstpot_1144
    );
  pulse_params_OUT_5_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(5),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_5_rstpot_1145
    );
  pulse_params_OUT_6_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(6),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_6_rstpot_1146
    );
  pulse_params_OUT_7_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(7),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_7_rstpot_1147
    );
  pulse_params_OUT_8_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(8),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_8_rstpot_1148
    );
  pulse_params_OUT_9_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(9),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_9_rstpot_1149
    );
  pulse_params_OUT_10_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(10),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_10_rstpot_1150
    );
  pulse_params_OUT_11_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(11),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_11_rstpot_1151
    );
  pulse_params_OUT_12_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(12),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_12_rstpot_1152
    );
  pulse_params_OUT_13_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(13),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_13_rstpot_1153
    );
  pulse_params_OUT_14_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(14),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_14_rstpot_1154
    );
  pulse_params_OUT_15_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(15),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_15_rstpot_1155
    );
  pulse_params_OUT_16_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(16),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_16_rstpot_1156
    );
  pulse_params_OUT_17_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(17),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_17_rstpot_1157
    );
  pulse_params_OUT_18_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(18),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_18_rstpot_1158
    );
  pulse_params_OUT_19_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(19),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_19_rstpot_1159
    );
  pulse_params_OUT_20_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(20),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_20_rstpot_1160
    );
  pulse_params_OUT_21_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(21),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_21_rstpot_1161
    );
  pulse_params_OUT_22_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(22),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_22_rstpot_1162
    );
  pulse_params_OUT_23_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(23),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_23_rstpot_1163
    );
  pulse_params_OUT_24_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(24),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_24_rstpot_1164
    );
  pulse_params_OUT_25_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(25),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_25_rstpot_1165
    );
  pulse_params_OUT_26_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(26),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_26_rstpot_1166
    );
  pulse_params_OUT_27_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(27),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_27_rstpot_1167
    );
  pulse_params_OUT_28_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(28),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_28_rstpot_1168
    );
  pulse_params_OUT_29_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(29),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_29_rstpot_1169
    );
  pulse_params_OUT_30_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(30),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_30_rstpot_1170
    );
  pulse_params_OUT_31_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(31),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_31_rstpot_1171
    );
  pulse_params_OUT_32_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(32),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_32_rstpot_1172
    );
  pulse_params_OUT_33_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(33),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_33_rstpot_1173
    );
  pulse_params_OUT_34_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(34),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_34_rstpot_1174
    );
  pulse_params_OUT_35_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(35),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_35_rstpot_1175
    );
  pulse_params_OUT_36_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(36),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_36_rstpot_1176
    );
  pulse_params_OUT_37_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(37),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_37_rstpot_1177
    );
  pulse_params_OUT_38_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(38),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_38_rstpot_1178
    );
  pulse_params_OUT_39_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(39),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_39_rstpot_1179
    );
  pulse_params_OUT_40_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(40),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_40_rstpot_1180
    );
  pulse_params_OUT_41_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(41),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_41_rstpot_1181
    );
  pulse_params_OUT_42_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(42),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_42_rstpot_1182
    );
  pulse_params_OUT_43_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(43),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_43_rstpot_1183
    );
  pulse_params_OUT_44_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(44),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_44_rstpot_1184
    );
  pulse_params_OUT_45_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(45),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_45_rstpot_1185
    );
  pulse_params_OUT_46_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(46),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_46_rstpot_1186
    );
  pulse_params_OUT_47_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(47),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_47_rstpot_1187
    );
  pulse_params_OUT_48_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(48),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_48_rstpot_1188
    );
  pulse_params_OUT_49_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(49),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_49_rstpot_1189
    );
  pulse_params_OUT_50_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(50),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_50_rstpot_1190
    );
  pulse_params_OUT_51_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(51),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_51_rstpot_1191
    );
  pulse_params_OUT_52_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(52),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_52_rstpot_1192
    );
  pulse_params_OUT_53_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(53),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_53_rstpot_1193
    );
  pulse_params_OUT_54_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(54),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_54_rstpot_1194
    );
  pulse_params_OUT_55_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(55),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_55_rstpot_1195
    );
  pulse_params_OUT_56_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(56),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_56_rstpot_1196
    );
  pulse_params_OUT_57_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(57),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_57_rstpot_1197
    );
  pulse_params_OUT_58_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(58),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_58_rstpot_1198
    );
  pulse_params_OUT_59_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(59),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_59_rstpot_1199
    );
  pulse_params_OUT_60_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(60),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_60_rstpot_1200
    );
  pulse_params_OUT_61_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(61),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_61_rstpot_1201
    );
  pulse_params_OUT_62_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(62),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_62_rstpot_1202
    );
  pulse_params_OUT_63_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(63),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_63_rstpot_1203
    );
  pulse_params_OUT_64_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(64),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_64_rstpot_1204
    );
  pulse_params_OUT_65_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(65),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_65_rstpot_1205
    );
  pulse_params_OUT_66_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(66),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_66_rstpot_1206
    );
  pulse_params_OUT_67_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(67),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_67_rstpot_1207
    );
  pulse_params_OUT_68_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(68),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_68_rstpot_1208
    );
  pulse_params_OUT_69_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(69),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_69_rstpot_1209
    );
  pulse_params_OUT_70_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(70),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_70_rstpot_1210
    );
  pulse_params_OUT_71_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(71),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_71_rstpot_1211
    );
  pulse_params_OUT_72_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(72),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_72_rstpot_1212
    );
  pulse_params_OUT_73_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(73),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_73_rstpot_1213
    );
  pulse_params_OUT_74_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(74),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_74_rstpot_1214
    );
  pulse_params_OUT_75_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(75),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_75_rstpot_1215
    );
  pulse_params_OUT_76_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(76),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_76_rstpot_1216
    );
  pulse_params_OUT_77_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(77),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_77_rstpot_1217
    );
  pulse_params_OUT_78_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(78),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_78_rstpot_1218
    );
  pulse_params_OUT_79_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(79),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_79_rstpot_1219
    );
  pulse_params_OUT_80_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(80),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_80_rstpot_1220
    );
  pulse_params_OUT_81_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(81),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_81_rstpot_1221
    );
  pulse_params_OUT_82_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(82),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_82_rstpot_1222
    );
  pulse_params_OUT_83_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(83),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_83_rstpot_1223
    );
  pulse_params_OUT_84_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(84),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_84_rstpot_1224
    );
  pulse_params_OUT_85_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(85),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_85_rstpot_1225
    );
  pulse_params_OUT_86_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(86),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_86_rstpot_1226
    );
  pulse_params_OUT_87_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(87),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_87_rstpot_1227
    );
  pulse_params_OUT_88_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(88),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_88_rstpot_1228
    );
  pulse_params_OUT_89_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(89),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_89_rstpot_1229
    );
  pulse_params_OUT_90_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(90),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_90_rstpot_1230
    );
  pulse_params_OUT_91_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(91),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_91_rstpot_1231
    );
  pulse_params_OUT_92_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(92),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_92_rstpot_1232
    );
  pulse_params_OUT_93_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(93),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_93_rstpot_1233
    );
  pulse_params_OUT_94_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(94),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_94_rstpot_1234
    );
  pulse_params_OUT_95_rstpot : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
    port map (
      I0 => pulse_params_ram_0(95),
      I1 => pulse_index(0),
      I2 => pulse_index(4),
      I3 => pulse_index(3),
      I4 => pulse_index(2),
      I5 => pulse_index(1),
      O => pulse_params_OUT_95_rstpot_1235
    );
  clk_IN_BUFGP : BUFGP
    port map (
      I => clk_IN,
      O => clk_IN_BUFGP_229
    );
  rst_IN_inv1_INV_0 : INV
    port map (
      I => rst_IN_IBUF_230,
      O => rst_IN_inv
    );

end Structure;

