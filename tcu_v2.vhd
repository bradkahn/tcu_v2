-------------------------------------------------------------------------------
-- NAME:        tcu_v2.vhd
-- DESCRIPTION: Top-level entity of 2nd iteration of the timing control unit
-- AUTHOR:      Brad Kahn
-- DATE:        30/11/2017
-------------------------------------------------------------------------------

-- +------------------------------------------------------------------------------------------------------------+
-- |                                                        +---------------------+                             |
-- |                                                        |     *todo*          |                             |
-- |                                                        | chpscpe ICON & ILAs |                             |
-- |                                                        |                     |                             |
-- |                                                        +---------------------+                             |
-- |                                                         ^                                                  |
-- |                             gpmc_wb                     |                 tcu                              |
-- |                      +-------------------+              |         +--------------------+                   |
-- |    gpmc_a            |                   |   debug      |         |                    |                   |
-- |    +----------------->                   +--------------+         |                    |                   |
-- |    gpmc_d            |                   |                        |                    |                   |
-- |    <----------------->                   |                        |                    |                   |
-- |    gpmc_clk_i        |                   |CLK                CLK_I|                    |                   |
-- |    +------------------                   ------------------------->                    |                   |
-- |    gpmc_n_cs         |                   |RST                RST_I|                    |    leds           |
-- |    +----------------->                   +------------------------>                    +---------------->  |
-- |    gpmc_n_we         |                   |ADR_O              ADR_I|                    |                   |
-- |    +----------------->                   +------------------------>                    |    gpio           |
-- |    gpmc_n_oe         |                   |ACK_I              ACK_O|                    +---------------->  |
-- |    +----------------->                   <------------------------+                    |                   |
-- |    gpmc_n_adv_ale    |                   |DAT_I              DAT_O|                    |    fmc            |
-- |    +----------------->                   <------------------------+                    +---------------->  |
-- |                      |                   |DAT_O              DAT_I|                    |                   |
-- |                      |                   +------------------------>                    |                   |
-- |                      |                   |STB_O              STB_I|                    |                   |
-- |    sys_clk_P         +                   +------------------------>                    |                   |
-- |    +----------------->                   |WE_O                WE_I|                    |    ethernet       |
-- |    sys_clk_N         |                   +------------------------>                    +---------------->  |
-- |    +----------------->                   |    sys_clk_100MHz      |                    |                   |
-- |                      |                   +------------------------>                    |                   |
-- |                      +-------------------+                        +--------------------+                   |
-- |                                                                                                            |
-- +------------------------------------------------------------------------------------------------------------+

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity tcu_top is
port
(
    -- FPGA-processor interface pins
    gpmc_a          : in    std_logic_vector(10 downto 1);
    gpmc_d          : inout std_logic_vector(15 downto 0);
    gpmc_clk_i      : in    std_logic;
    gpmc_n_cs       : in    std_logic_vector(6 downto 0);
    gpmc_n_we       : in    std_logic;
    gpmc_n_oe       : in    std_logic;
    gpmc_n_adv_ale  : in    std_logic;
    gpmc_n_wp       : in    std_logic;
    gpmc_busy_0     : out   std_logic;
    gpmc_busy_1     : out   std_logic;

    -- GPIO, LED and CLOCK pins
    gpio            : out   std_logic_vector(15 downto 2);
    gpioIn          : in    std_logic_vector(1 downto 0);
    led             : out   std_logic_vector(7 downto 0);
    sys_clk_P       : in    std_logic; -- 100MHz system clock
    sys_clk_N       : in    std_logic; -- 100MHz system clock
    sys_clk_ext     : in    std_logic; -- External Clock

    -- BCD pins
    bcd             : out   std_logic_vector(31 downto 0);

    -- Ethernet ports
    GIGE_COL        : in    std_logic;
    GIGE_CRS        : in    std_logic;
    GIGE_MDC        : out   std_logic;
    GIGE_MDIO       : inout std_logic;
    GIGE_TX_CLK     : in    std_logic;
    GIGE_nRESET     : out   std_logic;
    GIGE_RXD        : in    std_logic_vector(7 downto 0);
    GIGE_RX_CLK     : in    std_logic;
    GIGE_RX_DV      : in    std_logic;
    GIGE_RX_ER      : in    std_logic;
    GIGE_TXD        : out   std_logic_vector(7 downto 0);
    GIGE_GTX_CLK    : out   std_logic;
    GIGE_TX_EN      : out   std_logic;
    GIGE_TX_ER      : out   std_logic;

    THISISALWAYSON  : out   std_logic
);
end tcu_top;

architecture structural of tcu_top is

    -- ------------------------------------------------------------------------
    -- COMPONENT DECLARATIONS
    -- ------------------------------------------------------------------------

    COMPONENT gpmc_wb
    PORT(
        gpmc_a : IN std_logic_vector(10 downto 1);
        gpmc_clk_i : IN std_logic;
        gpmc_n_cs : IN std_logic_vector(6 downto 0);
        gpmc_n_we : IN std_logic;
        gpmc_n_oe : IN std_logic;
        gpmc_n_adv_ale : IN std_logic;
        sys_clk_P : IN std_logic;
        sys_clk_N : IN std_logic;
        ACK_I : IN std_logic;
        DAT_I : IN std_logic_vector(15 downto 0);
        gpmc_d : INOUT std_logic_vector(15 downto 0);
        CLK_400MHz : OUT std_logic;
        CLK_100MHz : OUT std_logic;
        gpmc_clk : OUT std_logic;
        debug_port : OUT std_logic_vector(52 downto 0);
        CLK : OUT std_logic;
        RST : OUT std_logic;
        ADR_O : OUT std_logic_vector(7 downto 0);
        DAT_O : OUT std_logic_vector(15 downto 0);
        WE_O : OUT std_logic;
        tcu_sel : OUT std_logic
        );
    END COMPONENT;

    COMPONENT tcu
    PORT(
        gpioIn : IN std_logic_vector(1 downto 0);
        sys_clk_100MHz : IN std_logic;
        sys_clk_ext : IN std_logic;
        GIGE_COL : IN std_logic;
        GIGE_CRS : IN std_logic;
        GIGE_TX_CLK : IN std_logic;
        GIGE_RXD : IN std_logic_vector(7 downto 0);
        GIGE_RX_CLK : IN std_logic;
        GIGE_RX_DV : IN std_logic;
        GIGE_RX_ER : IN std_logic;
        CLK_I : IN std_logic;
        RST_I : IN std_logic;
        STB_I : IN std_logic;
        WE_I : IN std_logic;
        DAT_I : IN std_logic_vector(15 downto 0);
        ADR_I : IN std_logic_vector(7 downto 0);
        GIGE_MDIO : INOUT std_logic;
        gpio : OUT std_logic_vector(15 downto 2);
        led : OUT std_logic_vector(7 downto 0);
        bcd : OUT std_logic_vector(31 downto 0);
        GIGE_MDC : OUT std_logic;
        GIGE_nRESET : OUT std_logic;
        GIGE_TXD : OUT std_logic_vector(7 downto 0);
        GIGE_GTX_CLK : OUT std_logic;
        GIGE_TX_EN : OUT std_logic;
        GIGE_TX_ER : OUT std_logic;
        THISISALWAYSON : OUT std_logic;
        ACK_O : OUT std_logic;
        DAT_O : OUT std_logic_vector(15 downto 0)
        );
    END COMPONENT;

    -- ------------------------------------------------------------------------
    -- SIGNAL DECLARATIONS
    -- ------------------------------------------------------------------------

    signal s_clk        : std_logic := '0';
    signal s_rst        : std_logic := '0';
    signal s_ack        : std_logic := '0';
    signal s_adr        : std_logic_vector(7 downto 0) := (others => '0');
    signal s_dat_ms     : std_logic_vector(15 downto 0) := (others => '0');
    signal s_dat_sm     : std_logic_vector(15 downto 0) := (others => '0');
    signal s_we         : std_logic := '0';
    signal s_sel        : std_logic := '0';
    signal s_clk_100MHz : std_logic := '0';

begin

    -- ------------------------------------------------------------------------
    -- COMPONENT INSTANTIATION
    -- ------------------------------------------------------------------------

    Inst_gpmc_wb: gpmc_wb PORT MAP(
        gpmc_a => gpmc_a,
        gpmc_d => gpmc_d,
        gpmc_clk_i => gpmc_clk_i,
        gpmc_n_cs => gpmc_n_cs,
        gpmc_n_we => gpmc_n_we,
        gpmc_n_oe => gpmc_n_oe,
        gpmc_n_adv_ale => gpmc_n_adv_ale,
        sys_clk_P => sys_clk_P,
        sys_clk_N => sys_clk_N,
        CLK_400MHz => open,
        CLK_100MHz => s_clk_100MHz,
        gpmc_clk => open,
        debug_port => open,
        CLK => s_clk,
        RST => s_rst,
        ACK_I => s_ack,
        ADR_O => s_adr,
        DAT_I => s_dat_sm,
        DAT_O => s_dat_ms,
        WE_O => s_we,
        tcu_sel => s_sel
    );

    Inst_tcu: tcu PORT MAP(
        gpio => gpio,
        gpioIn => gpioIn,
        led => led,
        sys_clk_100MHz => s_clk_100MHz,
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
        THISISALWAYSON => open,
        CLK_I => s_clk,
        RST_I => s_rst,
        STB_I => s_sel,
        WE_I => s_we,
        DAT_I => s_dat_ms,
        ADR_I => s_adr,
        ACK_O => s_ack,
        DAT_O => s_dat_sm
    );
end structural;
