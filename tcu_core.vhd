-------------------------------------------------------------------------------
-- NAME:        tcu_core.vhd
-- DESCRIPTION:
-- AUTHOR:      Brad Kahn
-- DATE:        29/11/2017
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

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
    sys_clk_100MHz  : in    std_logic; -- 100MHz system clock (from gpmc_wb)
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
    -- |reg_fmc   |    32    |0x08000006|
    -- +--------------------------------+
    -- |reg_pulses|  32x96   |0x0800000A|
    -- +--------------------------------+
    -- |m         |    32    |0x0800018A|
    -- +--------------------------------+
    -- |n         |    16    |0x0800018E|
    -- +--------------------------------+

    -- register start and end addresses, based off their size
    constant VERSION_REG_BASE : natural := 0;
    constant VERSION_REG_END  : natural := 0;
    constant STATUS_REG_BASE  : natural := 1;
    constant STATUS_REG_END   : natural := 1;
    constant LED_REG_BASE     : natural := 2;
    constant LED_REG_END      : natural := 2;
    constant FMC_REG_BASE     : natural := 3;
    constant FMC_REG_END      : natural := 4;
    constant PULSES_REG_BASE  : integer := 5;
    constant PULSES_REG_END   : integer := 196;
    constant M_REG_BASE       : natural := 197;
    constant M_REG_END        : natural := 198;
    constant N_REG_BASE       : natural := 199;
    constant N_REG_END        : natural := 199;

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

    signal sys_clk_100MHz_ext   : std_logic;                    -- external 100MHz clock coming in from FMC0 J1 P1

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
                -- reg_status  <= (OTHERS => (OTHERS => '0'));
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
                    -- REG: "status" SIZE: 2 bytes PERMISSIONS: r
                    -- --------------------------------------------------------
                    when STATUS_REG_BASE to STATUS_REG_END =>
                        if WE_I = '1' then
                            null; -- read only
                        else
                            dat_o_sig <= reg_status(address_int - STATUS_REG_BASE);
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
    --	Ethernet components
    ---------------------------------------------------------------------------

    UDP_1GbE_inst : UDP_1GbE
    generic map(
        UDP_TX_DATA_BYTE_LENGTH => UDP_TX_DATA_BYTE_LENGTH,
        UDP_RX_DATA_BYTE_LENGTH => UDP_RX_DATA_BYTE_LENGTH
    )
    port map(
        -- user logic interface
        own_ip_addr     => x"c0a86b1c",	-- 192.168.107.28
        own_mac_addr    => x"0e0e0e0e0e0b",
        dst_ip_addr     => x"c0a86b1d",	-- 192.168.107.29
        dst_mac_addr    => x"0e0e0e0e0e0c",

        -- mac's MAC is x"406c8f0012cd"
        -- REx's MAC is x"0e0e0e0e0e0c"

        udp_src_port    => x"1f40", --8000
        udp_dst_port    => x"1f43", --8003

        udp_tx_pkt_data => udp_tx_pkt_data,
        udp_tx_pkt_vld  => udp_tx_pkt_vld,
        udp_tx_rdy      => udp_tx_rdy,

        udp_rx_pkt_data => udp_rx_pkt_data,
        udp_rx_pkt_req  => udp_rx_pkt_req,
        udp_rx_rdy      => udp_rx_rdy,

        mac_init_done   => mac_init_done,

        -- MAC interface
        GIGE_COL        => GIGE_COL,
        GIGE_CRS        => GIGE_CRS,
        GIGE_MDC        => GIGE_MDC,
        GIGE_MDIO       => GIGE_MDIO,
        GIGE_TX_CLK     => GIGE_TX_CLK,
        GIGE_nRESET     => GIGE_nRESET,
        GIGE_RXD        => GIGE_RXD,
        GIGE_RX_CLK     => GIGE_RX_CLK,
        GIGE_RX_DV      => GIGE_RX_DV,
        GIGE_RX_ER      => GIGE_RX_ER,
        GIGE_TXD        => GIGE_TXD,
        GIGE_GTX_CLK    => GIGE_GTX_CLK,
        GIGE_TX_EN      => GIGE_TX_EN,
        GIGE_TX_ER      => GIGE_TX_ER,

        -- system control
        clk_125mhz      => clk_125mhz,
        clk_100mhz      => clk_100mhz,
        sys_rst_i       => sys_reset,
        sysclk_locked   => sysclk_locked
    );

    clk_manager_inst : clk_manager
    port map(
        --External Control
        dcm_100mhz_in   => sys_clk_100mhz,
        --			SYS_CLK_P_i  => sys_clk_p,
        --			SYS_CLK_N_i  => sys_clk_n,
        SYS_RST_i       => sys_rst_i,

        -- Clock out ports
        clk_125mhz      => clk_125mhz,
        clk_100mhz      => clk_100mhz,
        clk_25mhz       => clk_25mhz,

        -- Status and control signals
        RESET           => sys_reset,
        sysclk_locked   => sysclk_locked
    );

    IBUFGDS_tcu_clk : IBUFG
    generic map
    (
        IBUF_LOW_PWR => FALSE
        --    IOSTANDARD => "LVCMOS25"
    )
    port map
    (
        I => sys_clk_ext,
        O => sys_clk_100MHz_ext
    );


    ---------------------------------------------------------------------------
    -- Misc signal wiring
    ---------------------------------------------------------------------------

    led <= reg_led(0)(7 downto 0);

    ---------------------------------------------------------------------------
    -- ?????????
    ---------------------------------------------------------------------------
    --reg_led(0)
    --reg_led(1) <= when M_counter= M_reg
    --reg_led(2) <= MB_flag;
    reg_led(0)(3)  <= DIG_flag;
    reg_led(0)(4)  <= PRI_flag;
    reg_led(0)(5)  <= (MB_flag and DIG_flag and PRI_flag);
    --reg_led(6) <= when M_counter= M_reg
    reg_led(0)(6)  <= '1';
    reg_led(0)(7)  <= gpioIn(1);

    bcd(15 downto 0)    <= reg_fmc(0);
    bcd(31 downto 16)   <= reg_fmc(1);

    -- Remember to uncomment this
    -- It includes a new status bit that indicates when an experiment is happening
    --status_reg(1) <= ready and not(status_reg(0)) and triggers(0);

    gpio(2) <= MB_flag;		-- Indicates when Main Bang offset has been reached
    gpio(8) <= MB_flag;
    gpio(3) <= DIG_flag;		-- Indicates when Digitisation offset has been reached
    gpio(9) <= DIG_flag;
    gpio(4) <= PRI_flag;		-- Indicates when Next PRI offset has been reached
    gpio(10)<= PRI_flag;
    gpio(5) <= (MB_flag and DIG_flag and PRI_flag);

    gpio(7) <= gpioIn(1);

    -- gpioIn(0) <= sys_clk_100MHz;
    -- gpioIn(1) <= '0';
    gpio(6) <= '1';
    gpio(11)<= '0';
    -- gpio(12)		--	X band HPA
    -- gpio(13)		-- L band HPA
    -- gpio(14)		-- L band polarisation
    -- gpio(15)		-- L band polarisation

    --=====================================--
    -- The actual TCU processes happen here
    --=====================================--
    tcu : process(sys_clk_100MHz_ext)
        variable l_band_freq_var    : std_logic_vector (15 downto 0) := x"1405";
        variable x_band_freq_var    : std_logic_vector (15 downto 0) := x"3421";
    begin
        if rising_edge(sys_clk_100MHz_ext) then
            -- populate dataout from regbank based on Program Counter (PC)
            dataout  <= reg_pulses(PC) & reg_pulses(PC+1) & reg_pulses(PC+2) & reg_pulses(PC+3) & reg_pulses(PC+4) & reg_pulses(PC+5);
            MB       <= unsigned(reg_pulses(PC));
            DIG      <= unsigned(reg_pulses(PC+1));
            PRI      <= unsigned(reg_pulses(PC+2)) & unsigned(reg_pulses(PC+5));
            --PRI(1) <= P(31 downto 16);
            --PRI(0) <= P(15 downto 0);
            pol_mode <= reg_pulses(PC+4)(10 downto 8);
        -- setup certain ports depending on the mode of operation
        case pol_mode is
            when "000" =>		--	L band Tx=V Rx=V
                x_band_freq     <= x_band_freq_var;
                l_band_freq     <= reg_pulses(PC+3);
                pol             <= x"0000";	--	set REx polarisation
                gpio(14)        <= '0';			--	L band Rx switch
                gpio(15)        <= '1';			--	L band Rx switch
                l_band_amp_on   <= '1';
                x_band_amp_on   <= '0';
            when "001" => 		--	L band Tx=V Rx=H
                x_band_freq     <= x_band_freq_var;
                l_band_freq     <= reg_pulses(PC+3);
                pol             <= x"0000";
                gpio(14)        <= '1';
                gpio(15)        <= '0';
                l_band_amp_on   <= '1';
                x_band_amp_on   <= '0';
            when "010" => 		--	L band Tx=H Rx=H
                x_band_freq     <= x_band_freq_var;
                l_band_freq     <= reg_pulses(PC+3);
                pol             <= x"0000";
                gpio(14)        <= '1';
                gpio(15)        <= '0';
                l_band_amp_on   <= '1';
                x_band_amp_on   <= '0';
            when "011" => 		--	L band Tx=V Rx=V
                x_band_freq     <= x_band_freq_var;
                l_band_freq     <= reg_pulses(PC+3);
                pol             <= x"0000";
                gpio(14)        <= '0';
                gpio(15)        <= '1';
                l_band_amp_on   <= '1';
                x_band_amp_on   <= '0';
            when "100" => 		--	X band Tx=V Rx=V,H
                l_band_freq     <= l_band_freq_var;
                x_band_freq     <= reg_pulses(PC+3);
                pol             <= x"0100";
                gpio(14)        <= '0';
                gpio(15)        <= '0';
                l_band_amp_on   <= '0';
                x_band_amp_on   <= '1';
            when "101" => 		--	X band Tx=H Rx=V,H
                l_band_freq     <= l_band_freq_var;
                x_band_freq     <= reg_pulses(PC+3);
                pol             <= x"0100";
                gpio(14)        <= '0';
                gpio(15)        <= '0';
                l_band_amp_on   <= '0';
                x_band_amp_on   <= '1';
            when others => null;
        end case;

        -----------------------------------------------------------------------
        -- Time critical process
        -----------------------------------------------------------------------
        if(reg_led(0)(0) = '1' and gpioIn(0) = '1') then
            ready_flag <= '1';
        elsif(reg_led(0)(0) = '0') then
            ready_flag <= '0';
        end if;

        -- The experiment commences when triggered by the ready signal above, as long as it isnt the end of the experiment and as long as it is still "soft on" (kept on by the triggers register).
        if(ready_flag = '1' and reg_status(0)(0) = '0' and reg_led(0)(0) = '1') then

            sys_rst_i <= '0';		-- turn ethernet on

            if ((MB_flag and DIG_flag and PRI_flag) = '1') then
                -- reset all counters at the end of Interval
                MB_counter  <= (others => '0');
                DIG_counter <= (others => '0');
                PRI_counter <= (others => '0');
                MB_flag     <= '0';
                DIG_flag    <= '0';
                PRI_flag    <= '0';
                -- increments PC or resets PC to zero. enables stop register if it has completed the last instruction
                if(PC = unsigned(reg_N(0)(7 downto 0))*6) then
                    PC  <= 0;
                    if(M_counter = unsigned(reg_M(0))) then
                        reg_status(0)(0) <= '1';
                    else
                        M_counter <= M_counter+ 1;
                    end if;
                else
                    PC <= PC + 6 ;
                end if;
                -- increments P if MB and D are active
                elsif((MB_flag and DIG_flag) = '1') then
                    if(PRI_counter = PRI) then
                        PRI_flag <= '1';
                    else
                        PRI_counter <= PRI_counter + 1;
                        PRI_flag <= '0';
                    end if;
                    -- turn amplifiers off
                    gpio(13) <= '0';
                    gpio(12) <= '0';
                -- increments D if MB is active
                elsif(MB_flag = '1') then
                    if(DIG_counter = DIG) then
                        DIG_flag <= '1';
                    else
                        DIG_counter <= DIG_counter + 1;
                        DIG_flag <= '0';
                    end if;
                else
                    if(MB_counter = MB) then
                        MB_flag <= '1';
                    else
                        MB_flag <= '0';
                        MB_counter <= MB_counter + 1;
                        -- send Ethernet packet at the very start
                        if(MB_counter <= 2) then
                            udp_send_packet <= '1';
                        else
                            udp_send_packet <= '0';
                        end if;
                        -- turn on appropriate amplifier (X or L) depending on pol_mode
                        gpio(13) <= l_band_amp_on;
                        gpio(12) <= x_band_amp_on;
                    end if;
                end if;
            --===========--
            -- off state --
            --===========--
            elsif(reg_led(0)(0) = '0') then
                PC              <= 0;
                M_counter       <= (others => '0');
                reg_status(0)(0)<= '0';
                sys_rst_i       <= '0';				-- turn ethernet on (was off)
                udp_send_packet <= '0';
                --	set counters to zero
                MB_counter      <= (others => '0');
                DIG_counter     <= (others => '0');
                PRI_counter     <= (others => '0');
                -- turn amplifiers off
                gpio(13)        <= '0';
                gpio(12)        <= '0';
                -- turn off MB, D and P signals
                MB_flag         <= '0';
                DIG_flag        <= '0';
                PRI_flag        <= '0';
            else
                udp_send_packet <= '0';
            end if;
        end if;
    end process tcu;

    ---------------------------------------------------------------------------
    -- UDP TRANSMISSION SECTION
    ---------------------------------------------------------------------------
    --udp_packet <= x"0d000000000004000300" & l_band_freq & x_band_freq & pol;
    udp_tx : process(udp_send_packet, sys_clk_100mhz)
        begin
        if(rising_edge(sys_clk_100mhz)) then
            if(udp_send_packet = '1' and udp_send_flag <= '0') then
                udp_send_flag    <= '1';
                udp_tx_pkt_vld_r <= '0';
            elsif(udp_tx_rdy = '1' and udp_send_flag = '1') then
                if(tx_delay_cnt = TX_DELAY) then
                    tx_delay_cnt     <= 0;
                    udp_tx_pkt_vld_r <= '1';    -- LAUNCH
                    udp_tx_pkt_data  <= x"0d000000000004000300" & l_band_freq & x_band_freq & pol;	 --x"0d000000000004000300140534210000";
                    udp_send_flag    <= '0';
                else
                    udp_tx_pkt_vld_r <= '0';
                    tx_delay_cnt     <= tx_delay_cnt + 1;
                end if;
            else
                udp_tx_pkt_vld_r <= '0';    -- ARM
            end if;
        end if;
    end process udp_tx;

    udp_tx_pkt_vld <= udp_tx_pkt_vld_r;
end architecture;
