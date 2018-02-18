--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:42:05 02/18/2018
-- Design Name:   
-- Module Name:   /home/brad/tcu_v2/tcu_gateware/simulation/pri_generator_tb.vhd
-- Project Name:  tcu_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pri_generator
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
 
ENTITY pri_generator_tb IS
END pri_generator_tb;
 
ARCHITECTURE behavior OF pri_generator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pri_generator
    PORT(
         clk_IN : IN  std_logic;
         en_IN : IN  std_logic;
         rst_IN : IN  std_logic;
         threshold_OUT : OUT  std_logic;
         pri_OUT : OUT  std_logic;
         count_OUT : OUT  std_logic_vector(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_IN : std_logic := '0';
   signal en_IN : std_logic := '0';
   signal rst_IN : std_logic := '0';

 	--Outputs
   signal threshold_OUT : std_logic;
   signal pri_OUT : std_logic;
   signal count_OUT : std_logic_vector(16 downto 0);

   -- Clock period definitions
   constant clk_IN_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pri_generator PORT MAP (
          clk_IN => clk_IN,
          en_IN => en_IN,
          rst_IN => rst_IN,
          threshold_OUT => threshold_OUT,
          pri_OUT => pri_OUT,
          count_OUT => count_OUT
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
      wait for 30 ns;
      rst_IN <= '0';     

      wait for 20 ns;

      en_IN <= '1';
      
      wait for 2 ms;
      
      rst_IN <= '1';
      
      wait for 10 ns;
      
      rst_IN <= '0';

      wait;
   end process;

END;
