-------------------------------------------------------------------------------
-- NAME:        tcu_core.vhd
-- DESCRIPTION:
-- AUTHOR:      Brad Kahn
-- DATE:        29/11/2017
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY tcu IS
GENERIC (
    WB_DATA_BUS_WIDTH    : POSITIVE := 16;
    WB_ADDRESS_BUS_WIDTH : NATURAL := 8
    );
PORT (
    -- ------------------------------------------------------------------------
    -- USER-DEFINED PORTS
    -- ------------------------------------------------------------------------
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

    THISISALWAYSON  : out   std_logic;

    -- ------------------------------------------------------------------------
    -- WISHBONE PORTS - DO NOT MODIFY
    -- ------------------------------------------------------------------------
    CLK_I           : IN    STD_LOGIC;
    RST_I           : IN    STD_LOGIC;
    STB_I           : IN    STD_LOGIC;
    WE_I            : IN    STD_LOGIC;
    DAT_I           : IN    STD_LOGIC_VECTOR(WB_DATA_BUS_WIDTH - 1 DOWNTO 0);
    ADR_I           : IN    STD_LOGIC_VECTOR(WB_ADDRESS_BUS_WIDTH - 1 DOWNTO 0);
    ACK_O           : OUT   STD_LOGIC;
    DAT_O           : OUT   STD_LOGIC_VECTOR(WB_DATA_BUS_WIDTH - 1 DOWNTO 0)
    );
END tcu;

architecture rtl of tcu is

    ---------------------------------------------------------------------------
    -- REGISTER DECLARTIONS
    ---------------------------------------------------------------------------

    --     NAME       BITS       ADDR
    -- +----------+----------+----------+
    -- |version   |    16    |0x08000000|
    -- +--------------------------------+
    -- |status    |    16    |0x08000002|
    -- +--------------------------------+
    -- |reg_led   |    16    |0x08000004|
    -- +--------------------------------+
    -- |reg_fmc   |    16    |0x08000006|
    -- +--------------------------------+
    -- |reg_pulses|  32x96   |0x08000008|
    -- +--------------------------------+
    -- |m         |    32    |0x08000188|
    -- +--------------------------------+
    -- |n         |    16    |0x0800018A|
    -- +--------------------------------+

    -- register start and end addresses, based off their size
    constant VERSION_REG_BASE : natural := 0;
    constant VERSION_REG_END  : natural := 0;
    constant STATUS_REG_BASE  : natural := 1;
    constant STATUS_REG_END   : natural := 1;
    constant LED_REG_BASE     : natural := 2;
    constant LED_REG_END      : natural := 2;
    constant FMC_REG_BASE     : natural := 3;
    constant FMC_REG_END      : natural := 3;
    constant PULSES_REG_BASE  : integer := 4;
    constant PULSES_REG_END   : integer := 195;
    constant M_REG_BASE       : natural := 196;
    constant M_REG_END        : natural := 197;
    constant N_REG_BASE       : natural := 198;
    constant N_REG_END        : natural := 198;

    type array_type is array (integer range <>) of std_logic_vector(15 downto 0);

    SIGNAL reg_VERSION  : array_type(0 to (VERSION_REG_END - VERSION_REG_BASE)) := (0 => x"0002");
    SIGNAL reg_status   : array_type(0 to (STATUS_REG_END - STATUS_REG_BASE))   := (others => (OTHERS => '0')); -- status_reg(0) used to indicate that all pulse repeats for experiment are completed
    SIGNAL reg_led      : array_type(0 to (LED_REG_END - LED_REG_BASE))         := (others => (OTHERS => '0')); -- triggers(0) 'soft on' / arming bit from register
    SIGNAL reg_fmc      : array_type(0 to (FMC_REG_END - FMC_REG_BASE))         := (others => (OTHERS => '0'));
    SIGNAL reg_pulses   : array_type(0 to (PULSES_REG_END - PULSES_REG_BASE))   := (others => (OTHERS => '0'));
    SIGNAL reg_M        : array_type(0 to (M_REG_END - M_REG_BASE))             := (others => (OTHERS => '0'));
    SIGNAL reg_N        : array_type(0 to (N_REG_END - N_REG_BASE))             := (0 => x"0001");

    SIGNAL dat_o_sig    : STD_LOGIC_VECTOR(WB_DATA_BUS_WIDTH - 1 DOWNTO 0) := (OTHERS => 'Z');

    ---------------------------------------------------------------------------
    -- IP CORE SPECIFIC SIGNALS
    ---------------------------------------------------------------------------
    signal ready_flag   : std_logic;                            -- indicates that experiment is ready to start, asserted when trigger(0) and gpioIn(0) are high
    signal MB_flag      : std_logic;                            -- indicates when Main Bang offset has been reached, mapped to GPIO output pin 2, 8
    signal DIG_flag     : std_logic;                            -- indicates when Digitisation offset has been reached, mapped to GPIO output pin 3, 9
    signal PRI_flag     : std_logic;                            -- indicates when Next PRI offset has been reached, mapped to GPIO output pin 4, 10

    signal M_counter    : unsigned(31 downto 0) := x"00000000"; -- Number of repeats that have already ocurred

    signal MB           : unsigned(15 downto 0) := x"0000";     -- Main bang offset extracted from pulses reg
    signal MB_counter   : unsigned(15 downto 0) := x"0000";     -- Main bang counter compared to Main bang offset
    signal DIG          : unsigned(15 downto 0) := x"0000";     -- Digitisation offset extracted from pulses reg
    signal DIG_counter  : unsigned(15 downto 0) := x"0000";     -- Digitisation counter compared to Digitisation offset
    signal PRI          : unsigned(31 downto 0) := x"00000000"; -- PRI offset extracted from pulses reg
    signal PRI_counter  : unsigned(31 downto 0) := x"00000000"; -- PRI counter compared to PRI offset

    signal PC           : integer range 0 to 181 := 0;          -- Program Counter keeps track of current pulse
    signal dataout      : std_logic_vector(95 downto 0);        -- Contains all pulse parameters for current pulse

    -- Amplifiers and switches
    signal l_band_amp_on: std_logic;                            -- gpio(13) <= l_band_amp_on;
    signal x_band_amp_on: std_logic;                            -- gpio(12) <= x_band_amp_on;

    ---------------------------------------------------------------------------
    --	Ethernet Signal declaration section
    ---------------------------------------------------------------------------

    signal sys_rst_i        : std_logic := '0';
    signal send_packet      : std_logic := '0';
    signal REX_status       : std_logic_vector(15 downto 0) := (others => '0');
    signal REX_status_confirmed : std_logic := '0';

    -- Transmit settings to REX = 00;
    -- Ask REX for status msg	 = 01;
    --	signal eth_msg_type	:	std_logic_vector(1 downto 0) := "00";

    signal eth_in_len       : std_logic_vector(15 downto 0);
    signal eth_in_type      : std_logic_vector(15 downto 0);
    signal eth_in_status    : std_logic_vector(15 downto 0);
    signal eth_in_addr      : std_logic_vector(15 downto 0);
    signal eth_in_id        : std_logic_vector(15 downto 0);
    signal eth_in_msg       : std_logic_vector(87 downto 0);

    attribute S     : string;
    attribute keep  : string;

    attribute S of GIGE_RXD   : signal is "TRUE";
    attribute S of GIGE_RX_DV : signal is "TRUE";
    attribute S of GIGE_RX_ER : signal is "TRUE";

    -- define constants
    constant UDP_TX_DATA_BYTE_LENGTH    : integer := 16;		--not SET TO MINIMUM LENGTH
    constant UDP_RX_DATA_BYTE_LENGTH    : integer := 37;
    constant TX_DELAY                   : integer := 100;

    -- system control
    signal clk_125mhz           : std_logic;
    signal clk_100mhz           : std_logic;
    signal clk_25mhz            : std_logic;
    signal sys_reset            : std_logic;
    signal sysclk_locked        : std_logic;

    -- MAC signals
    signal udp_tx_pkt_data      : std_logic_vector (8 * UDP_TX_DATA_BYTE_LENGTH - 1 downto 0);
    signal udp_tx_pkt_vld       : std_logic;
    signal udp_tx_pkt_sent      : std_logic;
    signal udp_tx_pkt_vld_r     : std_logic;
    signal udp_tx_rdy           : std_logic;

    signal udp_rx_pkt_data      : std_logic_vector(8 * UDP_RX_DATA_BYTE_LENGTH - 1 downto 0);
    signal udp_rx_pkt_data_r    : std_logic_vector(8 * UDP_RX_DATA_BYTE_LENGTH - 1 downto 0);
    signal udp_rx_pkt_req       : std_logic;
    signal udp_rx_rdy           : std_logic;
    signal udp_rx_rdy_r         : std_logic;

    signal dst_mac_addr         : std_logic_vector(47 downto 0);
    --	signal tx_state			: std_logic_vector(2 downto 0) := "000";
    signal rx_state             : std_logic_vector(1 downto 0) := "00";
    signal locked               : std_logic;
    signal mac_init_done        : std_logic;
    signal GIGE_GTX_CLK_r       : std_logic;
    signal GIGE_MDC_r           : std_logic;

    signal tx_delay_cnt         : integer := 0;

    signal udp_send_packet      : std_logic;
    signal udp_send_flag        : std_logic;
    signal udp_receive_packet   : std_logic_vector(1 downto 0) := "00";
    --	signal udp_receive_flag	: std_logic  := '0';
    signal udp_packet           : std_logic_vector (8 * UDP_TX_DATA_BYTE_LENGTH - 1 downto 0);
    signal rex_set              : std_logic;

    signal l_band_freq          : std_logic_vector(15 downto 0) := x"1405";
    signal x_band_freq          : std_logic_vector(15 downto 0) := x"3421";
    signal pol                  : std_logic_vector(15 downto 0) := x"0000";
    signal pol_mode             : std_logic_vector(2 downto 0);

    ---------------------------------------------------------------------------
    --	Ethernet Component declaration section
    ---------------------------------------------------------------------------
    component clk_manager is
    port(
        --External Control
        dcm_100mhz_in   : in  std_logic;
        --		SYS_CLK_P_i  : in  std_logic;
        --		SYS_CLK_N_i  : in  std_logic;
        SYS_RST_i       : in  std_logic;

        -- Clock out ports
        clk_125mhz      : out std_logic;
        clk_100mhz      : out std_logic;
        clk_25mhz       : out std_logic;

        -- Status and control signals
        RESET           : out std_logic;
        sysclk_locked   : out std_logic
    );
    end component clk_manager;

    component UDP_1GbE is
    generic(
        UDP_TX_DATA_BYTE_LENGTH : natural := 1;
        UDP_RX_DATA_BYTE_LENGTH : natural := 1
    );
    port(
        -- user logic interface
        own_ip_addr     : in    std_logic_vector(31 downto 0);
        own_mac_addr    : in    std_logic_vector(47 downto 0);
        dst_ip_addr     : in    std_logic_vector(31 downto 0);
        dst_mac_addr    : in    std_logic_vector(47 downto 0);

        udp_src_port    : in    std_logic_vector(15 downto 0);
        udp_dst_port    : in    std_logic_vector(15 downto 0);

        udp_tx_pkt_data : in    std_logic_vector(8 * UDP_TX_DATA_BYTE_LENGTH - 1 downto 0);
        udp_tx_pkt_vld  : in    std_logic;
        udp_tx_rdy      : out   std_logic;

        udp_rx_pkt_data : out   std_logic_vector(8 * UDP_RX_DATA_BYTE_LENGTH - 1 downto 0);
        udp_rx_pkt_req  : in    std_logic;
        udp_rx_rdy      : out   std_logic;

        mac_init_done   : out   std_logic;

        -- MAC interface
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

        -- system control
        clk_125mhz      : in    std_logic;
        clk_100mhz      : in    std_logic;
        sys_rst_i       : in    std_logic;
        sysclk_locked   : in    std_logic
    );
    end component UDP_1GbE;
begin
    -- ------------------------------------------------------------------------
	-- WISHBONE FSM - DO NOT MODIFY
	-- ------------------------------------------------------------------------

    process (CLK_I, ADR_I)
        VARIABLE address_int : INTEGER := 0; -- TODO: could define a range, or leave as 32bits...
    begin
        address_int := TO_INTEGER(UNSIGNED(ADR_I));
        if RISING_EDGE(CLK_I) then
            if RST_I = '1' then
                reg_status  <= (OTHERS => (OTHERS => '0'));
                reg_led     <= (OTHERS => (OTHERS => '0'));
                reg_fmc     <= (OTHERS => (OTHERS => '0'));
                reg_M       <= (OTHERS => (OTHERS => '0'));
                reg_N       <= (OTHERS => (OTHERS => '0'));
            elsif STB_I = '1' then
                case address_int is
                    -- --------------------------------------------------------
                    -- REG: "VERSION" SIZE: 2 bytes PERMISSIONS: r
                    -- --------------------------------------------------------
                    when VERSION_REG_BASE to VERSION_REG_END =>
                        if WE_I = '1' then
                            null; -- read only
                        else
                            dat_o_sig <= reg_version(address_int - VERSION_REG_BASE);
                        end if;
                    -- --------------------------------------------------------
                    -- REG: "led" SIZE: 2 bytes PERMISSIONS: r/w
                    -- --------------------------------------------------------
                    when LED_REG_BASE to LED_REG_END =>
                        if WE_I = '1' then
                            reg_led(address_int - LED_REG_BASE) <= DAT_I;
                        else
                            dat_o_sig <= reg_led(address_int - LED_REG_BASE);
                        end if;
                    -- --------------------------------------------------------
                    -- REG: "fmc" SIZE: 2 bytes PERMISSIONS: r/w
                    -- --------------------------------------------------------
                    when FMC_REG_BASE to FMC_REG_END =>
                        if WE_I = '1' then
                            reg_fmc(address_int - FMC_REG_BASE) <= DAT_I;
                        else
                            dat_o_sig <= reg_fmc(address_int - FMC_REG_BASE);
                        end if;
                    -- --------------------------------------------------------
                    -- REG: "pulses" SIZE: 384 bytes PERMISSIONS: r/w
                    -- NOTE: reg_pulses is inferred as BRAM after removing
                    --       "reg_pulses <= (others => (others => '0'))" from
                    --       the RST_I = '1' block and also removing
                    --       "reg_pulses <= reg_pulses" from the else block.
                    -- --------------------------------------------------------
                    when PULSES_REG_BASE to PULSES_REG_END =>
                        if WE_I = '1' then
                            reg_pulses(address_int - PULSES_REG_BASE) <= DAT_I;
                        else
                            dat_o_sig <= reg_pulses(address_int - PULSES_REG_BASE);
                         end if;
                    -- --------------------------------------------------------
                    -- REG: "M" SIZE: 4 bytes PERMISSIONS: r/w
                    -- --------------------------------------------------------
                    when M_REG_BASE to M_REG_END =>
                        if WE_I = '1' then
                            reg_m(address_int - M_REG_BASE) <= DAT_I;
                        else
                            dat_o_sig <= reg_m(address_int - M_REG_BASE);
                        end if;
                    -- --------------------------------------------------------
                    -- REG: "N" SIZE: 2 bytes PERMISSIONS: r/w
                    -- --------------------------------------------------------
                    when N_REG_BASE to N_REG_END =>
                        if WE_I = '1' then
                            reg_n(address_int - N_REG_BASE) <= DAT_I;
                        else
                            dat_o_sig <= reg_n(address_int - N_REG_BASE);
                        end if;
                when others =>
                    null;
                end case;
            else
                reg_status  <= reg_status;
                reg_led     <= reg_led;
                reg_fmc     <= reg_fmc;
                reg_M       <= reg_M;
                reg_N       <= reg_N;
            end if;
        END IF;
    end process;

    DAT_O <= dat_o_sig when STB_I = '1' else (others => 'Z');
    ACK_O <= '1' when STB_I = '1' else 'Z';

    ---------------------------------------------------------------------------
    -- IP CORE SPECIFIC LOGIC
    ---------------------------------------------------------------------------
    -- TODO: declare your logic here
    -- (do something useful with the registers...)
end architecture;
