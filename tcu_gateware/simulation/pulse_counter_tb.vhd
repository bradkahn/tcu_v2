--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   01:03:34 02/19/2018
-- Design Name:
-- Module Name:   /home/brad/tcu_v2/tcu_gateware/simulation/pulse_counter_tb.vhd
-- Project Name:  tcu_counter
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: pulse_counter
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

ENTITY pulse_counter_tb IS
END pulse_counter_tb;

ARCHITECTURE behavior OF pulse_counter_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT pulse_counter
    PORT(
         clk_IN : IN  std_logic;
         pulse_IN : IN  std_logic;
         rst_IN : IN  std_logic;
         en_IN : IN  std_logic;
         num_transfers_IN : IN  std_logic_vector(31 downto 0);
         count_OUT : OUT  std_logic_vector(31 downto 0);
         done_OUT : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal clk_IN : std_logic := '0';
   signal pulse_IN : std_logic := '0';
   signal rst_IN : std_logic := '0';
   signal en_IN : std_logic := '0';
   signal num_transfers_IN : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal count_OUT : std_logic_vector(31 downto 0);
   signal done_OUT : std_logic;

   -- Clock period definitions
   constant clk_IN_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: pulse_counter PORT MAP (
          clk_IN => clk_IN,
          pulse_IN => pulse_IN,
          rst_IN => rst_IN,
          en_IN => en_IN,
          num_transfers_IN => num_transfers_IN,
          count_OUT => count_OUT,
          done_OUT => done_OUT
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
      -- hold reset state for 100 ns.
      rst_IN <= '1';
      wait for 50 ns;
      rst_IN <= '0';
      en_IN <= '0';

      wait for clk_IN_period*10;
      en_IN <= '1';

      num_transfers_IN <= x"00000010";

      pulses : for i in 0 to 30 loop
          pulse_IN <= not pulse_IN;
          wait for 10 ns;
      end loop;


      wait;
   end process;

END;
