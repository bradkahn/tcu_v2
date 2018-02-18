--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   00:27:50 02/19/2018
-- Design Name:
-- Module Name:   /home/brad/tcu_v2/tcu_gateware/simulation/amp_controller_tb.vhd
-- Project Name:  tcu_counter
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: amp_controller
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
USE ieee.numeric_std.ALL;

ENTITY amp_controller_tb IS
END amp_controller_tb;

ARCHITECTURE behavior OF amp_controller_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT amp_controller
    PORT(
         clk_IN : IN  std_logic;
         rst_IN : IN  std_logic;
         en_IN : IN  std_logic;
         count_IN : IN  std_logic_vector(16 downto 0);
         mode_IN : IN  std_logic_vector(2 downto 0);
         x_amp_on_duration_IN : IN  std_logic_vector(15 downto 0);
         l_amp_on_duration_IN : IN  std_logic_vector(15 downto 0);
         x_amp_OUT : OUT  std_logic;
         l_amp_OUT : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk_IN : std_logic := '0';
   signal rst_IN : std_logic := '0';
   signal en_IN : std_logic := '0';
   signal count_IN : std_logic_vector(16 downto 0) := (others => '0');
   signal mode_IN : std_logic_vector(2 downto 0) := (others => '0');
   signal x_amp_on_duration_IN : std_logic_vector(15 downto 0) := (others => '0');
   signal l_amp_on_duration_IN : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal x_amp_OUT : std_logic;
   signal l_amp_OUT : std_logic;

   -- Clock period definitions
   constant clk_IN_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: amp_controller PORT MAP (
          clk_IN => clk_IN,
          rst_IN => rst_IN,
          en_IN => en_IN,
          count_IN => count_IN,
          mode_IN => mode_IN,
          x_amp_on_duration_IN => x_amp_on_duration_IN,
          l_amp_on_duration_IN => l_amp_on_duration_IN,
          x_amp_OUT => x_amp_OUT,
          l_amp_OUT => l_amp_OUT
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
    en_IN <= '0';
    wait for 50 ns;
    rst_IN <= '0';
    wait for 20 ns;
    mode_IN <= "000";
    x_amp_on_duration_IN <= x"0000";
    l_amp_on_duration_IN <= x"1770";
    wait for 20 ns;
    en_IN <= '1';

    counting : for i in 0 to 300000 loop
        count_IN <= std_logic_vector(to_unsigned(i, 17));
        wait for 10 ns;
    end loop;

      wait;
   end process;

END;
