--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   14:09:33 03/02/2018
-- Design Name:
-- Module Name:   /home/brad/tcu_v2/tcu_gateware/simulation/tcu_fc_tb.vhd
-- Project Name:  tcu_fc
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: tcu_fc
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY tcu_fc_tb IS
END tcu_fc_tb;

ARCHITECTURE behavior OF tcu_fc_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT tcu_fc
    PORT(
         clk_IN : IN  std_logic;
         rst_IN : IN  std_logic;
         trigger_IN : IN  std_logic;
         instruction_IN : IN  std_logic_vector(15 downto 0);
         num_pulses_IN : IN  std_logic_vector(15 downto 0);
         num_repeats_IN : IN  std_logic_vector(31 downto 0);
         x_amp_delay_IN : IN  std_logic_vector(15 downto 0);
         l_amp_delay_IN : IN  std_logic_vector(15 downto 0);
         pri_pulse_width_IN : IN  std_logic_vector(31 downto 0);
         pulse_params_IN : IN  std_logic_vector(95 downto 0);
         pulse_index_OUT : OUT  std_logic_vector(4 downto 0);
         status_OUT : OUT  std_logic_vector(15 downto 0);
         bias_X_OUT : OUT  std_logic;
         bias_L_OUT : OUT  std_logic;
         pol_tx_X_OUT : OUT  std_logic;
         pol_tx_L_OUT : OUT  std_logic;
         pol_rx_L_OUT : OUT  std_logic;
         pri_OUT : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk_IN : std_logic := '0';
   signal rst_IN : std_logic := '0';
   signal trigger_IN : std_logic := '0';
   signal instruction_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal num_pulses_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal num_repeats_IN : std_logic_vector(31 downto 0) := (others => '0');
   signal x_amp_delay_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal l_amp_delay_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal pri_pulse_width_IN : std_logic_vector(31 downto 0) := (others => '0');
   signal pulse_params_IN : std_logic_vector(95 downto 0) := (others => '0');

 	--Outputs
   signal pulse_index_OUT : std_logic_vector(4 downto 0);
   signal status_OUT : std_logic_vector(15 downto 0);
   signal bias_X_OUT : std_logic;
   signal bias_L_OUT : std_logic;
   signal pol_tx_X_OUT : std_logic;
   signal pol_tx_L_OUT : std_logic;
   signal pol_rx_L_OUT : std_logic;
   signal pri_OUT : std_logic;

   -- Clock period definitions
   constant clk_IN_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: tcu_fc PORT MAP (
          clk_IN => clk_IN,
          rst_IN => rst_IN,
          trigger_IN => trigger_IN,
          instruction_IN => instruction_IN,
          num_pulses_IN => num_pulses_IN,
          num_repeats_IN => num_repeats_IN,
          x_amp_delay_IN => x_amp_delay_IN,
          l_amp_delay_IN => l_amp_delay_IN,
          pri_pulse_width_IN => pri_pulse_width_IN,
          pulse_params_IN => pulse_params_IN,
          pulse_index_OUT => pulse_index_OUT,
          status_OUT => status_OUT,
          bias_X_OUT => bias_X_OUT,
          bias_L_OUT => bias_L_OUT,
          pol_tx_X_OUT => pol_tx_X_OUT,
          pol_tx_L_OUT => pol_tx_L_OUT,
          pol_rx_L_OUT => pol_rx_L_OUT,
          pri_OUT => pri_OUT
        );

   -- Clock process definitions
   clk_IN_process :process
   begin
		clk_IN <= '0';
		wait for clk_IN_period/2;
		clk_IN <= '1';
		wait for clk_IN_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      rst_IN <= '1';
      wait for 100 ns;
      rst_IN <= '0';
      wait for clk_IN_period*2;

      -- set register values...
        num_pulses_IN <= x"0002";           -- block size = 2
        num_repeats_IN <= x"0000000a";      -- 10 repeats
        x_amp_delay_IN <= x"012e";          -- 3us NOTE ADD 2 CYCLES
        l_amp_delay_IN <= x"012e";          -- 3us
        pri_pulse_width_IN <= x"000003e8";  --
        --
        pulse_params_IN <= x"7700_0001_ffff_0001_03e8_0bb8";

        wait for clk_IN_period*2;
        instruction_IN <= x"0001";          -- soft_arm <= '1'
        wait for clk_IN_period*2;
        trigger_IN <= '1';
      wait;
   end process;

END;
