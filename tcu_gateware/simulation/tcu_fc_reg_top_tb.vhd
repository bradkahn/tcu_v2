--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   14:34:55 06/07/2018
-- Design Name:
-- Module Name:   /home/brad/tcu_v2/tcu_gateware/simulation/tcu_fc_reg_top_tb.vhd
-- Project Name:  tcu_fc
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: tcu_fc_reg_top
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

ENTITY tcu_fc_reg_top_tb IS
END tcu_fc_reg_top_tb;

ARCHITECTURE behavior OF tcu_fc_reg_top_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT tcu_fc_reg_top
    PORT(
         i_CLK_P : IN  std_logic;
         i_CLK_N : IN  std_logic;
         o_LOGIC_HIGH : OUT  std_logic;
         i_GPMC_A : IN  std_logic_vector(10 downto 1);
         io_GPMC_D : INOUT  std_logic_vector(15 downto 0);
         i_GPMC_CLK : IN  std_logic;
         i_GPMC_N_CS : IN  std_logic_vector(6 downto 0);
         i_GPMC_N_WE : IN  std_logic;
         i_GPMC_N_OE : IN  std_logic;
         i_GPMC_N_ADV_ALE : IN  std_logic;
         i_TRIGGER : IN  std_logic;
         o_BIAS_X : OUT  std_logic;
         o_BIAS_L : OUT  std_logic;
         o_POL_TX_X : OUT  std_logic;
         o_POL_TX_L : OUT  std_logic;
         o_POL_RX_L : OUT  std_logic;
         o_PRI : OUT  std_logic;
         o_LED_RHINO : OUT  std_logic_vector(7 downto 0);
         o_LED_FMC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal i_CLK_P : std_logic := '0';
   signal i_CLK_N : std_logic := '1';
   signal i_GPMC_A : std_logic_vector(10 downto 1) := (others => 'X');
   signal i_GPMC_CLK : std_logic := '0';
   signal i_GPMC_N_CS : std_logic_vector(6 downto 0) := (others => '1');
   signal i_GPMC_N_WE : std_logic := '1';
   signal i_GPMC_N_OE : std_logic := '1';
   signal i_GPMC_N_ADV_ALE : std_logic := '0';
   signal i_TRIGGER : std_logic := '0';

	--BiDirs
   signal io_GPMC_D : std_logic_vector(15 downto 0);

 	--Outputs
   signal o_LOGIC_HIGH : std_logic;
   signal o_BIAS_X : std_logic;
   signal o_BIAS_L : std_logic;
   signal o_POL_TX_X : std_logic;
   signal o_POL_TX_L : std_logic;
   signal o_POL_RX_L : std_logic;
   signal o_PRI : std_logic;
   signal o_LED_RHINO : std_logic_vector(7 downto 0);
   signal o_LED_FMC : std_logic_vector(3 downto 0);


   signal gpmc_fclk      : std_logic := '0';

   -- Clock period definitions
   constant sys_clk_period       : time := 10 ns;
   constant c_GPMC_FCLK_PERIOD     : time := 6 ns; -- gpmc_fclk is 2x gpmc clock (83Mhz = 12ns)

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: tcu_fc_reg_top PORT MAP (
          i_CLK_P => i_CLK_P,
          i_CLK_N => i_CLK_N,
          o_LOGIC_HIGH => o_LOGIC_HIGH,
          i_GPMC_A => i_GPMC_A,
          io_GPMC_D => io_GPMC_D,
          i_GPMC_CLK => i_GPMC_CLK,
          i_GPMC_N_CS => i_GPMC_N_CS,
          i_GPMC_N_WE => i_GPMC_N_WE,
          i_GPMC_N_OE => i_GPMC_N_OE,
          i_GPMC_N_ADV_ALE => i_GPMC_N_ADV_ALE,
          i_TRIGGER => i_TRIGGER,
          o_BIAS_X => o_BIAS_X,
          o_BIAS_L => o_BIAS_L,
          o_POL_TX_X => o_POL_TX_X,
          o_POL_TX_L => o_POL_TX_L,
          o_POL_RX_L => o_POL_RX_L,
          o_PRI => o_PRI,
          o_LED_RHINO => o_LED_RHINO,
          o_LED_FMC => o_LED_FMC
        );

   -- Clock process definitions
   SYS_CLK_process :process
   begin
       i_CLK_P <= '0';
       i_CLK_N <= '1';
       wait for sys_clk_period/2;
       i_CLK_P <= '1';
       i_CLK_N <= '0';
       wait for sys_clk_period/2;
   end process;

   GPMC_FCLK_CLK_process :process
   begin
       gpmc_fclk <= '0';
       wait for c_GPMC_FCLK_PERIOD/2;
       gpmc_fclk <= '1';
       wait for c_GPMC_FCLK_PERIOD/2;
   end process;


   -- Stimulus process
   stim_proc: process


   -- GPMC_WRITE PROCEDURE BASED ON SCOPED VALUES OF RUNNING BORPH APPLICATION
    procedure gpmc_write(address : in std_logic_vector(2 downto 0);
                 data    : in std_logic_vector(15 downto 0)) is
    begin
    report "PERFORMING GPMC WRITE OPERATION" severity NOTE;

    wait until gpmc_fclk = '1';

    report "time 0";
    i_GPMC_N_CS <= "1111110";
    i_GPMC_A <= "0001000000"; -- ??????
    io_GPMC_D <= "0000000000000" & address;
    wait for c_GPMC_FCLK_PERIOD*2;
    wait for c_GPMC_FCLK_PERIOD/2;

    report "time 5";
    i_GPMC_CLK <= '1';
    wait for c_GPMC_FCLK_PERIOD;

    report "time 7";
    i_GPMC_CLK <= '0';
    i_GPMC_N_WE <= '0';
    i_GPMC_N_ADV_ALE <= '1';
    i_GPMC_A <= (others => 'X');
    io_GPMC_D <= data;
    wait for c_GPMC_FCLK_PERIOD;
    wait for c_GPMC_FCLK_PERIOD/2;

    report "time 10";
    i_GPMC_CLK <= '1';
    wait for c_GPMC_FCLK_PERIOD;

    report "time 12";
    i_GPMC_CLK <= '0';
    wait for c_GPMC_FCLK_PERIOD;
    wait for c_GPMC_FCLK_PERIOD/2;

    report "time 15";
    i_GPMC_CLK <= '1';
    wait for c_GPMC_FCLK_PERIOD;

    report "time 17";
    i_GPMC_CLK <= '0';
    i_GPMC_N_CS <=  "1111111";
    i_GPMC_N_WE <= '1';
    io_GPMC_D <= (others => 'Z');
    wait for c_GPMC_FCLK_PERIOD;
    wait for c_GPMC_FCLK_PERIOD/2;

    report "time 20";
    i_GPMC_N_ADV_ALE <= '0';

    report "---------------------------------------------------------";
    wait for c_GPMC_FCLK_PERIOD;
    end gpmc_write;


    procedure gpmc_read(address : in std_logic_vector(2 downto 0)) is
    begin
    report "PERFORMING GPMC READ OPERATION" severity NOTE;

    wait until gpmc_fclk = '1';

    report "time 0";
    i_GPMC_N_CS <=  "1111110";
    i_GPMC_A <= "0001000000";
    io_GPMC_D <= "0000000000000" & address;
    wait for c_GPMC_FCLK_PERIOD*2;

    -- gpmc_clk pulse 0
    report "time 4";
    i_GPMC_CLK <= '1';
    wait for c_GPMC_FCLK_PERIOD;

    report "time 6";
    i_GPMC_CLK <= '0';
    i_GPMC_N_OE <= '0';
    i_GPMC_N_ADV_ALE <= '1';
    wait for c_GPMC_FCLK_PERIOD/2;

    report "time7";
    i_GPMC_A  <= (others => 'X');
    io_GPMC_D <= (others => 'Z');
    wait for c_GPMC_FCLK_PERIOD/2;


    -- extended gpmc_clk pulses 1 to 11
    for i in 0 to 9 loop
    report "time 8";
    i_GPMC_CLK <= '1';
    wait for c_GPMC_FCLK_PERIOD;

    report "time 10";
    i_GPMC_CLK <= '0';
    wait for c_GPMC_FCLK_PERIOD;
    end loop;

    report "time 28";
    i_GPMC_CLK <= '1';
    wait for c_GPMC_FCLK_PERIOD;

    report "time 30";
    i_GPMC_CLK <= '0';
    i_GPMC_N_OE <= '1';
    i_GPMC_N_CS <=  "1111111";
    wait for c_GPMC_FCLK_PERIOD;

    report "time 32";
    i_GPMC_N_ADV_ALE <= '0';
    wait for c_GPMC_FCLK_PERIOD;

    end gpmc_read;

   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for c_GPMC_FCLK_PERIOD*10;

      -- num_pulses = 1
      gpmc_write("000", x"0001");

      -- pri_pulse_width = 10us
      gpmc_write("101", x"03e8");

      wait for 100 ns;
      i_TRIGGER <= '1';

      wait;
   end process;

END;
