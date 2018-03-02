LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tcu_v2_top_tb IS
END tcu_v2_top_tb;

ARCHITECTURE behavior OF tcu_v2_top_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT tcu_top
    PORT(
         gpmc_a         : IN    std_logic_vector(10 downto 1);
         gpmc_d         : INOUT std_logic_vector(15 downto 0);
         gpmc_clk_i     : IN    std_logic;
         gpmc_n_cs      : IN    std_logic_vector(6 downto 0);
         gpmc_n_we      : IN    std_logic;
         gpmc_n_oe      : IN    std_logic;
         gpmc_n_adv_ale : IN    std_logic;
         gpio           : OUT   std_logic_vector(15 downto 2);
         gpioIn         : IN    std_logic_vector(1 downto 0);
         led            : OUT   std_logic_vector(7 downto 0);
         sys_clk_P      : IN    std_logic;
         sys_clk_N      : IN    std_logic;
         sys_clk_ext    : IN    std_logic;
         bcd            : OUT   std_logic_vector(31 downto 0);
         GIGE_COL       : IN    std_logic;
         GIGE_CRS       : IN    std_logic;
         GIGE_MDC       : OUT   std_logic;
         GIGE_MDIO      : INOUT std_logic;
         GIGE_TX_CLK    : IN    std_logic;
         GIGE_nRESET    : OUT   std_logic;
         GIGE_RXD       : IN    std_logic_vector(7 downto 0);
         GIGE_RX_CLK    : IN    std_logic;
         GIGE_RX_DV     : IN    std_logic;
         GIGE_RX_ER     : IN    std_logic;
         GIGE_TXD       : OUT   std_logic_vector(7 downto 0);
         GIGE_GTX_CLK   : OUT   std_logic;
         GIGE_TX_EN     : OUT   std_logic;
         GIGE_TX_ER     : OUT   std_logic;
         THISISALWAYSON : OUT   std_logic
        );
    END COMPONENT;

    --Inputs
    signal gpmc_a         : std_logic_vector(10 downto 1) := (others => '0');
    signal gpmc_clk_i     : std_logic := '0';
    signal gpmc_n_cs      : std_logic_vector(6 downto 0) := (others => '0');
    signal gpmc_n_we      : std_logic := '0';
    signal gpmc_n_oe      : std_logic := '0';
    signal gpmc_n_adv_ale : std_logic := '0';
    signal gpioIn         : std_logic_vector(1 downto 0) := (others => '0');
    signal sys_clk_P      : std_logic := '0';
    signal sys_clk_N      : std_logic := '0';
    signal sys_clk_ext    : std_logic := '0';
    signal GIGE_COL       : std_logic := '0';
    signal GIGE_CRS       : std_logic := '0';
    signal GIGE_TX_CLK    : std_logic := '0';
    signal GIGE_RXD       : std_logic_vector(7 downto 0) := (others => '0');
    signal GIGE_RX_CLK    : std_logic := '0';
    signal GIGE_RX_DV     : std_logic := '0';
    signal GIGE_RX_ER     : std_logic := '0';
    signal gpmc_fclk      : std_logic := '0';

    --BiDirs
    signal gpmc_d         : std_logic_vector(15 downto 0);
    signal GIGE_MDIO      : std_logic;

    	--Outputs
    signal gpio           : std_logic_vector(15 downto 2);
    signal led            : std_logic_vector(7 downto 0);
    signal bcd            : std_logic_vector(31 downto 0);
    signal GIGE_MDC       : std_logic;
    signal GIGE_nRESET    : std_logic;
    signal GIGE_TXD       : std_logic_vector(7 downto 0);
    signal GIGE_GTX_CLK   : std_logic;
    signal GIGE_TX_EN     : std_logic;
    signal GIGE_TX_ER     : std_logic;
    signal THISISALWAYSON : std_logic;

    -- Clock period definitions
    constant GIGE_TX_CLK_period   : time := 10 ns;  -- TODO: set correct period
    constant GIGE_RX_CLK_period   : time := 10 ns;  -- TODO: set correct period
    constant GIGE_GTX_CLK_period  : time := 10 ns;  -- TODO: set correct period
    constant sys_clk_period       : time := 10 ns;
    constant sys_clk_ext_period   : time := 10 ns;
    constant gpmc_fclk_period     : time := 6 ns; -- gpmc_fclk is 2x gpmc clock (83Mhz = 12ns)

    -- Symbol file base address constants

    -- status      3 0x08000000 0x02    <-
    -- reg_led     3 0x08800000 0x02    <-
    -- reg_fmc     3 0x09000000 0x02    <- for BCD to REx (alternative to ethernet)
    -- reg_pulses  3 0x09800000 0x180   <- pulse parameters for n pulses
    -- m           3 0x0A000000 0x04    <- # of times all pulses will be cycled through
    -- n           3 0x0A800000 0x02    <- # of pulses
    -- pri         1 0x0B000000 0x04    <- debug register

    -- NOTE: check why this syntax doesnt work
    -- https://www.doulos.com/knowhow/vhdl_designers_guide/vhdl_2008/vhdl_200x_ease/
    -- constant STATUS_REG_BASE :   std_logic_vector(25 downto 0) := (25 downto 22 => "0000", others => '0');
    -- constant LED_REG_BASE    :   std_logic_vector(25 downto 0) := (25 downto 22 => "0010", others => '0');
    -- constant REG_FMC_BASE    :   std_logic_vector(25 downto 0) := (25 downto 22 => "0100", others => '0');
    -- constant PULSES_REG_BASE :   std_logic_vector(25 downto 0) := (25 downto 22 => "0110", others => '0');
    -- constant M_REG_BASE      :   std_logic_vector(25 downto 0) := (25 downto 22 => "0100", others => '0');
    -- constant N_REG_BASE      :   std_logic_vector(25 downto 0) := (25 downto 22 => "0101", others => '0');
    -- constant PRI_REG_BASE    :   std_logic_vector(25 downto 0) := (25 downto 22 => "1100", others => '0');

    constant STATUS_REG_BASE :   std_logic_vector(25 downto 0) := "0000" & "0000000000000000000000";
    constant LED_REG_BASE    :   std_logic_vector(25 downto 0) := "0001" & "0000000000000000000000";
    constant REG_FMC_BASE    :   std_logic_vector(25 downto 0) := "0010" & "0000000000000000000000";
    constant PULSES_REG_BASE :   std_logic_vector(25 downto 0) := "0011" & "0000000000000000000000";
    constant M_REG_BASE      :   std_logic_vector(25 downto 0) := "0100" & "0000000000000000000000";
    constant N_REG_BASE      :   std_logic_vector(25 downto 0) := "0101" & "0000000000000000000000";
    constant PRI_REG_BASE    :   std_logic_vector(25 downto 0) := "0110" & "0000000000000000000000";

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: tcu_top PORT MAP (
        gpmc_a        => gpmc_a,
        gpmc_d        => gpmc_d,
        gpmc_clk_i    => gpmc_clk_i,
        gpmc_n_cs     => gpmc_n_cs,
        gpmc_n_we     => gpmc_n_we,
        gpmc_n_oe     => gpmc_n_oe,
        gpmc_n_adv_ale=> gpmc_n_adv_ale,
        gpio          => gpio,
        gpioIn        => gpioIn,
        led           => led,
        sys_clk_P     => sys_clk_P,
        sys_clk_N     => sys_clk_N,
        sys_clk_ext   => sys_clk_ext,
        bcd           => bcd,
        GIGE_COL      => GIGE_COL,
        GIGE_CRS      => GIGE_CRS,
        GIGE_MDC      => GIGE_MDC,
        GIGE_MDIO     => GIGE_MDIO,
        GIGE_TX_CLK   => GIGE_TX_CLK,
        GIGE_nRESET   => GIGE_nRESET,
        GIGE_RXD      => GIGE_RXD,
        GIGE_RX_CLK   => GIGE_RX_CLK,
        GIGE_RX_DV    => GIGE_RX_DV,
        GIGE_RX_ER    => GIGE_RX_ER,
        GIGE_TXD      => GIGE_TXD,
        GIGE_GTX_CLK  => GIGE_GTX_CLK,
        GIGE_TX_EN    => GIGE_TX_EN,
        GIGE_TX_ER    => GIGE_TX_ER,
        THISISALWAYSON=> THISISALWAYSON
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
        sys_clk_N <= '1';
        wait for sys_clk_period/2;
        sys_clk_P <= '1';
        sys_clk_N <= '0';
        wait for sys_clk_period/2;
    end process;

    GPMC_FCLK_CLK_process :process
    begin
        gpmc_fclk <= '0';
        wait for gpmc_fclk_period/2;
        gpmc_fclk <= '1';
        wait for gpmc_fclk_period/2;
    end process;

    SYS_CLK_EXT_process : process
    begin
        sys_clk_ext <= '0';
        wait for sys_clk_ext_period/2;
        sys_clk_ext <= '1';
        wait for sys_clk_ext_period/2;
    end process;

    -- TODO:    MODIFY THIS TO SIMULATE WHAT THE GPMC LINES REALLY DO UNDER BORPH!
    --          TAKE A LOOK AT THE SCREENSHOTS!

    -- Stimulus process
    stim_proc: process

        procedure register_write(   address : in STD_LOGIC_VECTOR(25 downto 0);
                                    data    : in STD_LOGIC_VECTOR(15 downto 0)
                                )   is
        begin
            ------------------------------------------------------------------------
            -- WRITE OPERATION
            -- BASED ON OBSERVED WAVEFORMS:
            -- TAKES 10 GPMC_FCLK CYCLES
            -- GPMC_FCLK IS AN INTERNAL CLK THAT RUNS AT TWICE THE RATE OF GPMC_CLK
            -- See -> gpmc_timing_diagram.pdf
            ------------------------------------------------------------------------

            -- TODO:    clean up code for periods where no signal changes happen

            wait until gpmc_fclk = '1';

            -- time 0
            gpmc_clk_i      <= '0';
            gpmc_n_cs       <= "1111110";
            gpmc_n_we       <= '1';
            gpmc_n_oe       <= '1';
            gpmc_n_adv_ale  <= '0';
            gpmc_a          <= address(25 downto 16);
            gpmc_d          <= address(15 downto 0);
            wait for gpmc_fclk_period/2;

            -- time 1
            wait for gpmc_fclk_period/2;

            -- time 2
            wait for gpmc_fclk_period/2;

            -- time 3
            wait for gpmc_fclk_period/2;

            -- time 4
            wait for gpmc_fclk_period/2;

            -- time 5
            gpmc_clk_i <= '1';
            wait for gpmc_fclk_period/2;

            -- time 6
            wait for gpmc_fclk_period/2;

            -- time 7
            gpmc_a          <= (others => 'X');
            gpmc_d          <= data;
            gpmc_n_adv_ale  <= '1';
            gpmc_n_we       <= '0';
            gpmc_clk_i      <= '0';
            wait for gpmc_fclk_period/2;

            -- time 8

            wait for gpmc_fclk_period/2;

            -- time 9

            wait for gpmc_fclk_period/2;

            -- time 10
            gpmc_clk_i       <= '1';
            wait for gpmc_fclk_period/2;

            -- time 11
            wait for gpmc_fclk_period/2;

            -- time 12
            gpmc_clk_i       <= '0';
            wait for gpmc_fclk_period/2;

            -- time 13
            wait for gpmc_fclk_period/2;

            -- time 14
            wait for gpmc_fclk_period/2;

            -- time 15
            gpmc_clk_i       <= '1';
            wait for gpmc_fclk_period/2;

            -- time 16
            wait for gpmc_fclk_period/2;

            -- time 17
            gpmc_n_cs       <= (others => '1');
            gpmc_d          <= (others => 'X');
            gpmc_n_we       <= '1';
            gpmc_clk_i      <= '0';

            -- time 18
            wait for gpmc_fclk_period/2;

            -- time 19
            wait for gpmc_fclk_period/2;

            -- time 20
            gpmc_n_adv_ale  <= '0';
            wait for gpmc_fclk_period/2;
        end register_write;

        procedure register_read (    address     : in STD_LOGIC_VECTOR(25 downto 0)
                                ) is
        begin
            ------------------------------------------------------------------------
            -- READ OPERATION
            -- BASED ON OBSERVED WAVEFORMS:
            -- TAKES 32 GPMC_FCLK CYCLES
            ------------------------------------------------------------------------

            wait until gpmc_fclk = '1';

            -- time 0
            gpmc_n_cs       <= "1111110";
            gpmc_a          <= address(25 downto 16);
            gpmc_d          <= address(15 downto 0);
            wait for gpmc_fclk_period/2;

            -- time 1
            wait for gpmc_fclk_period/2;

            -- time 2
            wait for gpmc_fclk_period/2;

            -- time 3
            wait for gpmc_fclk_period/2;

            -- time 4
            gpmc_clk_i      <= '1';
            wait for gpmc_fclk_period/2;

            -- time 5
            wait for gpmc_fclk_period/2;

            -- time 6
            gpmc_n_adv_ale  <= '1';
            gpmc_n_oe       <= '0';
            gpmc_clk_i      <= '0';
            wait for gpmc_fclk_period/2;

            -- time 7
            gpmc_a          <= (others => 'X');
            gpmc_d          <= (others => 'Z');
            wait for gpmc_fclk_period/2;

            -- time 8
            -- ***NOTE: DATA READ FROM REG SHOULD BE AVAILABLE HERE***
            report "data DATA READ FROM REG SHOULD BE AVAILABLE HERE" severity note;
            gpmc_clk_i      <= '1';
            wait for gpmc_fclk_period/2;

            -- time 9
            wait for gpmc_fclk_period/2;

            -- time 10
            gpmc_clk_i      <= '0';
            wait for gpmc_fclk_period/2;

            -- time 11
            wait for gpmc_fclk_period/2;

            -- loop starts at time 12, must end at time 27
            for i in 0 to 8 loop
                gpmc_clk_i      <= '1';
                wait for gpmc_fclk_period/2;
                wait for gpmc_fclk_period/2;
                gpmc_clk_i      <= '0';
                wait for gpmc_fclk_period/2;
                wait for gpmc_fclk_period/2;
            end loop;

            -- time 28
            gpmc_clk_i      <= '1';
            wait for gpmc_fclk_period/2;

            -- time 29
            wait for gpmc_fclk_period/2;

            -- time 30
            gpmc_n_cs       <= "1111111";
            gpmc_n_oe       <= '1';
            gpmc_clk_i      <= '0';
            wait for gpmc_fclk_period/2;

            -- time 31
            wait for gpmc_fclk_period/2;

            -- time 32
            gpmc_n_adv_ale  <= '0';
            wait for gpmc_fclk_period/2;

        end register_read;

    begin
        -- insert stimulus here
        wait for 100 ns;


        -- status      3 0x08000000 0x02    <-
        -- reg_led     3 0x08800000 0x02    <-
        -- reg_fmc     3 0x09000000 0x02    <- for BCD to REx (alternative to ethernet)
        -- reg_pulses  3 0x09800000 0x180   <- pulse parameters for n pulses
        -- m           3 0x0A000000 0x04    <- # of times all pulses will be cycled through
        -- n           3 0x0A800000 0x02    <- # of pulses
        -- pri         1 0x0B000000 0x04    <- debug register

        -- Set up a signal that triggers every 1 ms (1Khz), has a main bang and
        -- digitisation offset of 500ns, a band frequency of 1300 MHz and
        -- operating at L-band, you would write the following command.

        -- NB: values echoed in are little endian

        -- echo -e -n "\x01\x00" > /proc/671/hw/ioreg/n
        register_write(address => N_REG_BASE, data=>x"0006");
        -- echo -e -n "\x00\x0b\x00\x00" > /proc/671/hw/ioreg/m
        register_write(address => M_REG_BASE, data=>x"0002");
        register_write(address => (M_REG_BASE(25 downto 1) & "1"), data=>x"0000");
        -- pulse 0 (pulse_index = 0)
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"0"), data=>x"0032");    -- MBoffset
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"1"), data=>x"0032");    -- DIGoffset
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"2"), data=>x"0000");    -- PRI_upper
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"3"), data=>x"0514");    -- Frequency
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"4"), data=>x"0000");    -- Mode
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"5"), data=>x"00a0");    -- PRI_lower
        -- pulse 1 (pulse_index = 6)
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"6"), data=>x"0032");    -- MBoffset
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"7"), data=>x"0032");    -- DIGoffset
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"8"), data=>x"0000");    -- PRI_upper
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"9"), data=>x"0514");    -- Frequency
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"a"), data=>x"0001");    -- Mode
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"b"), data=>x"00a0");    -- PRI_lower
        -- pulse 2 (pulse_index = 12)
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"c"), data=>x"0032");    -- MBoffset
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"d"), data=>x"0032");    -- DIGoffset
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"e"), data=>x"0000");    -- PRI_upper
        register_write(address => (PULSES_REG_BASE(25 downto 4) & x"f"), data=>x"0514");    -- Frequency
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"10"), data=>x"0002");   -- Mode
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"11"), data=>x"00a0");   -- PRI_lower
        -- pulse 3 (pulse_index = 18)
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"12"), data=>x"0032");   -- MBoffset
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"13"), data=>x"0032");   -- DIGoffset
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"14"), data=>x"0000");   -- PRI_upper
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"15"), data=>x"0514");   -- Frequency
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"16"), data=>x"0003");   -- Mode
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"17"), data=>x"00a0");   -- PRI_lower
        -- pulse 4 (pulse_index = 24)
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"18"), data=>x"0032");   -- MBoffset
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"19"), data=>x"0032");   -- DIGoffset
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"1a"), data=>x"0000");   -- PRI_upper
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"1b"), data=>x"0514");   -- Frequency
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"1c"), data=>x"0004");   -- Mode
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"1d"), data=>x"00a0");   -- PRI_lower
        -- pulse 5 (pulse_index = 30)
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"1e"), data=>x"0032");   -- MBoffset
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"1f"), data=>x"0032");   -- DIGoffset
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"20"), data=>x"0000");   -- PRI_upper
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"21"), data=>x"0514");   -- Frequency
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"22"), data=>x"0005");   -- Mode
        register_write(address => (PULSES_REG_BASE(25 downto 8) & x"23"), data=>x"00a0");   -- PRI_lower
        -- echo -e -n "\x00\x00" > /proc/671/hw/ioreg/reg_led
        register_write(address => LED_REG_BASE, data=>x"0000");
        -- echo -e -n "\x01\x00" > /proc/671/hw/ioreg/reg_led
        register_write(address => LED_REG_BASE, data=>x"0001");


        wait for 100ns;

        -- FIRE!
        gpioIn  <= "01";


        wait;
    end process;

END;