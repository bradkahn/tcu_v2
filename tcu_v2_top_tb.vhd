LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tcu_v2_top_tb IS
END tcu_v2_top_tb;

ARCHITECTURE behavior OF tcu_v2_top_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT tcu_top
    PORT(
         gpmc_a : IN  std_logic_vector(10 downto 1);
         gpmc_d : INOUT  std_logic_vector(15 downto 0);
         gpmc_clk_i : IN  std_logic;
         gpmc_n_cs : IN  std_logic_vector(6 downto 0);
         gpmc_n_we : IN  std_logic;
         gpmc_n_oe : IN  std_logic;
         gpmc_n_adv_ale : IN  std_logic;
         gpmc_n_wp : IN  std_logic;
         gpmc_busy_0 : OUT  std_logic;
         gpmc_busy_1 : OUT  std_logic;
         gpio : OUT  std_logic_vector(15 downto 2);
         gpioIn : IN  std_logic_vector(1 downto 0);
         led : OUT  std_logic_vector(7 downto 0);
         sys_clk_P : IN  std_logic;
         sys_clk_N : IN  std_logic;
         sys_clk_ext : IN  std_logic;
         bcd : OUT  std_logic_vector(31 downto 0);
         GIGE_COL : IN  std_logic;
         GIGE_CRS : IN  std_logic;
         GIGE_MDC : OUT  std_logic;
         GIGE_MDIO : INOUT  std_logic;
         GIGE_TX_CLK : IN  std_logic;
         GIGE_nRESET : OUT  std_logic;
         GIGE_RXD : IN  std_logic_vector(7 downto 0);
         GIGE_RX_CLK : IN  std_logic;
         GIGE_RX_DV : IN  std_logic;
         GIGE_RX_ER : IN  std_logic;
         GIGE_TXD : OUT  std_logic_vector(7 downto 0);
         GIGE_GTX_CLK : OUT  std_logic;
         GIGE_TX_EN : OUT  std_logic;
         GIGE_TX_ER : OUT  std_logic;
         THISISALWAYSON : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal gpmc_a : std_logic_vector(10 downto 1) := (others => '0');
   signal gpmc_clk_i : std_logic := '0';
   signal gpmc_n_cs : std_logic_vector(6 downto 0) := (others => '0');
   signal gpmc_n_we : std_logic := '0';
   signal gpmc_n_oe : std_logic := '0';
   signal gpmc_n_adv_ale : std_logic := '0';
   signal gpmc_n_wp : std_logic := '0';
   signal gpioIn : std_logic_vector(1 downto 0) := (others => '0');
   signal sys_clk_P : std_logic := '0';
   signal sys_clk_N : std_logic := '0';
   signal sys_clk_ext : std_logic := '0';
   signal GIGE_COL : std_logic := '0';
   signal GIGE_CRS : std_logic := '0';
   signal GIGE_TX_CLK : std_logic := '0';
   signal GIGE_RXD : std_logic_vector(7 downto 0) := (others => '0');
   signal GIGE_RX_CLK : std_logic := '0';
   signal GIGE_RX_DV : std_logic := '0';
   signal GIGE_RX_ER : std_logic := '0';

	--BiDirs
   signal gpmc_d : std_logic_vector(15 downto 0);
   signal GIGE_MDIO : std_logic;

 	--Outputs
   signal gpmc_busy_0 : std_logic;
   signal gpmc_busy_1 : std_logic;
   signal gpio : std_logic_vector(15 downto 2);
   signal led : std_logic_vector(7 downto 0);
   signal bcd : std_logic_vector(31 downto 0);
   signal GIGE_MDC : std_logic;
   signal GIGE_nRESET : std_logic;
   signal GIGE_TXD : std_logic_vector(7 downto 0);
   signal GIGE_GTX_CLK : std_logic;
   signal GIGE_TX_EN : std_logic;
   signal GIGE_TX_ER : std_logic;
   signal THISISALWAYSON : std_logic;

   -- Clock period definitions
   constant GIGE_TX_CLK_period : time := 10 ns;
   constant GIGE_RX_CLK_period : time := 10 ns;
   constant GIGE_GTX_CLK_period : time := 10 ns;
   constant sys_clk_period :  time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: tcu_top PORT MAP (
          gpmc_a => gpmc_a,
          gpmc_d => gpmc_d,
          gpmc_clk_i => gpmc_clk_i,
          gpmc_n_cs => gpmc_n_cs,
          gpmc_n_we => gpmc_n_we,
          gpmc_n_oe => gpmc_n_oe,
          gpmc_n_adv_ale => gpmc_n_adv_ale,
          gpmc_n_wp => gpmc_n_wp,
          gpmc_busy_0 => gpmc_busy_0,
          gpmc_busy_1 => gpmc_busy_1,
          gpio => gpio,
          gpioIn => gpioIn,
          led => led,
          sys_clk_P => sys_clk_P,
          sys_clk_N => sys_clk_N,
          sys_clk_ext => sys_clk_ext,
          bcd => bcd,
          GIGE_COL => GIGE_COL,
          GIGE_CRS => GIGE_CRS,
          GIGE_MDC => GIGE_MDC,
          GIGE_MDIO => GIGE_MDIO,
          GIGE_TX_CLK => GIGE_TX_CLK,
          GIGE_nRESET => GIGE_nRESET,
          GIGE_RXD => GIGE_RXD,
          GIGE_RX_CLK => GIGE_RX_CLK,
          GIGE_RX_DV => GIGE_RX_DV,
          GIGE_RX_ER => GIGE_RX_ER,
          GIGE_TXD => GIGE_TXD,
          GIGE_GTX_CLK => GIGE_GTX_CLK,
          GIGE_TX_EN => GIGE_TX_EN,
          GIGE_TX_ER => GIGE_TX_ER,
          THISISALWAYSON => THISISALWAYSON
        );

   -- Clock process definitions
   GIGE_TX_CLK_process :process
   begin
		GIGE_TX_CLK <= '0';
		wait for GIGE_TX_CLK_period/2;
		GIGE_TX_CLK <= '1';
		wait for GIGE_TX_CLK_period/2;
   end process;

   GIGE_RX_CLK_process :process
   begin
		GIGE_RX_CLK <= '0';
		wait for GIGE_RX_CLK_period/2;
		GIGE_RX_CLK <= '1';
		wait for GIGE_RX_CLK_period/2;
   end process;

   GIGE_GTX_CLK_process :process
   begin
		GIGE_GTX_CLK <= '0';
		wait for GIGE_GTX_CLK_period/2;
		GIGE_GTX_CLK <= '1';
		wait for GIGE_GTX_CLK_period/2;
   end process;

   SYS_CLK_process :process
   begin
		sys_clk_P <= '0';
		sys_clk_P <= '1';
		wait for sys_clk_period/2;
		sys_clk_P <= '1';
		sys_clk_P <= '0';
		wait for sys_clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for GIGE_TX_CLK_period*10;

      -- insert stimulus here

      wait;
   end process;

END;
