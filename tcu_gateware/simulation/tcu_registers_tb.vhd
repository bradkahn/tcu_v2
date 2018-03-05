--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   09:19:38 03/05/2018
-- Design Name:
-- Module Name:   /home/brad/tcu_v2/tcu_gateware/simulation/tcu_registers_tb.vhd
-- Project Name:  tcu_fc
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: tcu_registers
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

ENTITY tcu_registers_tb IS
END tcu_registers_tb;

ARCHITECTURE behavior OF tcu_registers_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT tcu_registers
    PORT(
         clk_IN : IN  std_logic;
         rst_IN : IN  std_logic;
         pulse_index_IN : IN  std_logic_vector(4 downto 0);
         status_IN : IN  std_logic_vector(15 downto 0);
         status_OUT : OUT  std_logic_vector(15 downto 0);
         instruction_OUT : OUT  std_logic_vector(15 downto 0);
         num_pulses_OUT : OUT  std_logic_vector(15 downto 0);
         num_repeats_OUT : OUT  std_logic_vector(31 downto 0);
         x_amp_delay_OUT : OUT  std_logic_vector(15 downto 0);
         l_amp_delay_OUT : OUT  std_logic_vector(15 downto 0);
         pri_pulse_width_OUT : OUT  std_logic_vector(31 downto 0);
         pulse_params_OUT : OUT  std_logic_vector(95 downto 0);
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
   signal pulse_index_IN : std_logic_vector(4 downto 0) := (others => '0');
   signal status_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal CLK_I : std_logic := '0';
   signal RST_I : std_logic := '0';
   signal STB_I : std_logic := '0';
   signal WE_I : std_logic := '0';
   signal DAT_I : std_logic_vector(15 downto 0) := (others => '0');
   signal ADR_I : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal status_OUT : std_logic_vector(15 downto 0);
   signal instruction_OUT : std_logic_vector(15 downto 0);
   signal num_pulses_OUT : std_logic_vector(15 downto 0);
   signal num_repeats_OUT : std_logic_vector(31 downto 0);
   signal x_amp_delay_OUT : std_logic_vector(15 downto 0);
   signal l_amp_delay_OUT : std_logic_vector(15 downto 0);
   signal pri_pulse_width_OUT : std_logic_vector(31 downto 0);
   signal pulse_params_OUT : std_logic_vector(95 downto 0);
   signal ACK_O : std_logic;
   signal DAT_O : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_IN_period : time := 10 ns;
   constant CLK_I_period : time := 20 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: tcu_registers PORT MAP (
          clk_IN => clk_IN,
          rst_IN => rst_IN,
          pulse_index_IN => pulse_index_IN,
          status_IN => status_IN,
          status_OUT => status_OUT,
          instruction_OUT => instruction_OUT,
          num_pulses_OUT => num_pulses_OUT,
          num_repeats_OUT => num_repeats_OUT,
          x_amp_delay_OUT => x_amp_delay_OUT,
          l_amp_delay_OUT => l_amp_delay_OUT,
          pri_pulse_width_OUT => pri_pulse_width_OUT,
          pulse_params_OUT => pulse_params_OUT,
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

       pulse_index_IN <= "00000";
       wait for clk_IN_period;
       pulse_index_IN <= "00001";
       wait for clk_IN_period;
       pulse_index_IN <= "00010";
       wait for clk_IN_period;
       pulse_index_IN <= "00011";
       wait for clk_IN_period;
      wait;
   end process;

END;
