--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   09:52:13 03/05/2018
-- Design Name:
-- Module Name:   /home/brad/tcu_v2/tcu_gateware/simulation/tcu_fc_reg_tb.vhd
-- Project Name:  tcu_fc
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: tcu_fc_reg
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

ENTITY tcu_fc_reg_tb IS
END tcu_fc_reg_tb;

ARCHITECTURE behavior OF tcu_fc_reg_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT tcu_fc_reg
    PORT(
         clk_IN : IN  std_logic;
         rst_IN : IN  std_logic;
         trigger_IN : IN  std_logic;
         status_OUT : OUT  std_logic_vector(15 downto 0);
         bias_x_OUT : OUT  std_logic;
         bias_l_OUT : OUT  std_logic;
         pol_tx_x_OUT : OUT  std_logic;
         pol_tx_l_OUT : OUT  std_logic;
         pol_rx_l_OUT : OUT  std_logic;
         pri_OUT : OUT  std_logic;
         CLK_I : IN  std_logic;
         RST_I : IN  std_logic;
         STB_I : IN  std_logic;
         WE_I : IN  std_logic;
         DAT_I : IN  std_logic_vector(15 downto 0);
         ADR_I : IN  std_logic_vector(7 downto 0);
         ACK_O : OUT  std_logic;
         DAT_O : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal clk_IN : std_logic := '0';
   signal rst_IN : std_logic := '0';
   signal trigger_IN : std_logic := '0';
   signal CLK_I : std_logic := '0';
   signal RST_I : std_logic := '0';
   signal STB_I : std_logic := '0';
   signal WE_I : std_logic := '0';
   signal DAT_I : std_logic_vector(15 downto 0) := (others => '0');
   signal ADR_I : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal status_OUT : std_logic_vector(15 downto 0);
   signal bias_x_OUT : std_logic;
   signal bias_l_OUT : std_logic;
   signal pol_tx_x_OUT : std_logic;
   signal pol_tx_l_OUT : std_logic;
   signal pol_rx_l_OUT : std_logic;
   signal pri_OUT : std_logic;
   signal ACK_O : std_logic;
   signal DAT_O : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_IN_period : time := 10 ns;
   constant CLK_I_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: tcu_fc_reg PORT MAP (
          clk_IN => clk_IN,
          rst_IN => rst_IN,
          trigger_IN => trigger_IN,
          status_OUT => status_OUT,
          bias_x_OUT => bias_x_OUT,
          bias_l_OUT => bias_l_OUT,
          pol_tx_x_OUT => pol_tx_x_OUT,
          pol_tx_l_OUT => pol_tx_l_OUT,
          pol_rx_l_OUT => pol_rx_l_OUT,
          pri_OUT => pri_OUT,
          CLK_I => CLK_I,
          RST_I => RST_I,
          STB_I => STB_I,
          WE_I => WE_I,
          DAT_I => DAT_I,
          ADR_I => ADR_I,
          ACK_O => ACK_O,
          DAT_O => DAT_O
        );

   -- Clock process definitions
   clk_IN_process :process
   begin
		clk_IN <= '0';
		wait for clk_IN_period/2;
		clk_IN <= '1';
		wait for clk_IN_period/2;
   end process;

   CLK_I_process :process
   begin
		CLK_I <= '0';
		wait for CLK_I_period/2;
		CLK_I <= '1';
		wait for CLK_I_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      rst_IN <= '1';
      wait for 100 ns;

      rst_IN <= '0';
      wait for 100 ns;

      trigger_IN <= '1';

      wait;
   end process;

END;
