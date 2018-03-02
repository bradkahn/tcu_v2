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

    -- GPIO, LED and CLOCK pins
    gpio            : out   std_logic_vector(15 downto 2);
    gpioIn          : in    std_logic_vector(1 downto 0);
    -- gpio_fmc        : out   std_logic_vector(15 downto 0);
    led             : out   std_logic_vector(7 downto 0);
    -- led_fmc         : out   std_logic_vector(3 downto 0);
    -- sys_clk_P       : in    std_logic; -- 100MHz system clock
    -- sys_clk_N       : in    std_logic; -- 100MHz system clock
    sys_clk_ext     : in    std_logic -- External Clock
    -- sys_clk_ext_GND     : out    std_logic -- External Clock

    -- BCD pins
    -- bcd             : out   std_logic_vector(31 downto 0);

    -- Ethernet ports
    -- GIGE_COL        : in    std_logic;
    -- GIGE_CRS        : in    std_logic;
    -- GIGE_MDC        : out   std_logic;
    -- GIGE_MDIO       : inout std_logic;
    -- GIGE_TX_CLK     : in    std_logic;
    -- GIGE_nRESET     : out   std_logic;
    -- GIGE_RXD        : in    std_logic_vector(7 downto 0);
    -- GIGE_RX_CLK     : in    std_logic;
    -- GIGE_RX_DV      : in    std_logic;
    -- GIGE_RX_ER      : in    std_logic;
    -- GIGE_TXD        : out   std_logic_vector(7 downto 0);
    -- GIGE_GTX_CLK    : out   std_logic;
    -- GIGE_TX_EN      : out   std_logic;
    -- GIGE_TX_ER      : out   std_logic;
    --
    -- THISISALWAYSON  : out   std_logic
);
end tcu_top;

-------------------------------------------------------------------------------
-- Architecture of tcu_top
-------------------------------------------------------------------------------

architecture rtl of tcu_top is
    ---------------------------------------------------------------------------
    -- Declare types
    ---------------------------------------------------------------------------

    type ram_type       is array (255 downto 0) of std_logic_vector(15 downto 0);
    type word32_type    is array (1 downto 0)   of std_logic_vector(15 downto 0);

    ---------------------------------------------------------------------------
    -- Declare signals
    ---------------------------------------------------------------------------

    -- Define signals for the gpmc bus
    signal gpmc_clk_i_b         : std_logic;                                        -- buffered gpmc_clk_i
    signal gpmc_address         : std_logic_vector(25 downto 0):=(others => '0');   -- Full de-multiplexed address bus (ref. 16 bits)
    signal gpmc_data_o          : std_logic_vector(15 downto 0):=(others => '0');   -- Register for output bus value
    signal gpmc_data_i          : std_logic_vector(15 downto 0):=(others => '0');   -- Register for input bus value

    --Clocks
    -- signal sys_clk_100MHz_int   : std_logic;                                        -- internal 100MHz clock
    -- signal sys_clk_100MHz_ext   : std_logic;                                        -- external 100MHz clock coming in from FMC0 J1 P1
    -- signal clk_sel              : std_logic;                                        -- driven by one of the above clock sources using jumper on GPIO[1] pin
    signal sys_clk_100MHz       : std_logic;                                        -- driven by one of the above signal

    -- TCU registers available to BORPH
    -- TODO: rename and change address of registers, using Harpoon framework
    --     NAME        BITS       ADDR
    -- +----------+----------+----------+
    -- |VERSION   |    16    |0x08000000|  <-- TODO
    -- +--------------------------------+
    -- |status    |    16    |0x08000000|
    -- +--------------------------------+
    -- |reg_led   |    16    |0x08800000|
    -- +--------------------------------+
    -- |reg_fmc   |    16    |0x09000000|
    -- +--------------------------------+
    -- |reg_pulses|  32x96   |0x09800000|
    -- +--------------------------------+
    -- |m         |    32    |0x0A000000|
    -- +--------------------------------+
    -- |n         |    16    |0x0A800000|
    -- +--------------------------------+

    constant VERSION        : std_logic_vector(7 downto 0) := "00000010";       -- TODO: add VERSION register to symbol file to identify which TCU version is installed
    signal reg_bank         : ram_type := (others => "1111111111111111");       -- pulses reg, stores pulse parameters
    signal led_reg          : std_logic_vector(15 downto 0) := (others => '0'); -- lower 8 bits mapped to RHINO's LEDs for status indication
    signal bcd_int          : word32_type := (x"0000",x"0000");
    signal M_reg            : word32_type := (x"0000",x"0000");                 -- number of times each pulse must be cycled in an experiment
    signal M_reg_cmp        : std_logic_vector(31 downto 0);                    -- M_reg_cmp <= M_reg(1) & M_reg(0)
    signal N_reg            : std_logic_vector(15 downto 0) := x"0000";         -- number of unique pulses (N)

    signal ready            : std_logic;                                        -- indicates that experiment is ready to start, asserted when trigger(0) and gpioIn(0) are high

    signal MBsig            : std_logic;                                        -- indicates when Main Bang offset has been reached, mapped to GPIO output pin 2, 8
    signal Dsig             : std_logic;                                        -- indicates when Digitisation offset has been reached, mapped to GPIO output pin 3, 9
    signal Psig             : std_logic;                                        -- indicates when Next PRI offset has been reached, mapped to GPIO output pin 4, 10

    signal M_counter        : unsigned(31 downto 0) := x"00000000";             -- Number of repeats that have already ocurred

    signal MBoffset         : unsigned(15 downto 0) := x"0000";                 -- Main bang offset extracted from pulses reg
    signal MBcounter        : unsigned(15 downto 0) := x"0000";                 -- Main bang counter compared to Main bang offset
    signal DIGoffset        : unsigned(15 downto 0) := x"0000";                 -- Digitisation offset extracted from pulses reg
    signal DIGcounter       : unsigned(15 downto 0) := x"0000";                 -- Digitisation counter compared to Digitisation offset
    signal PRIoffset        : unsigned(31 downto 0) := x"00000000";             -- PRI offset extracted from pulses reg
    signal PRIcounter       : unsigned(31 downto 0) := x"00000000";             -- PRI counter compared to PRI offset

    signal triggers         : std_logic_vector(15 downto 0) := (others => '0'); -- triggers(0) 'soft on' / arming bit from register
    signal status_reg       : std_logic_vector(15 downto 0) := (others => '0'); -- status_reg(0) used to indicate that all pulse repeats for experiment are completed

    signal pulse_index      : unsigned(7 downto 0)  := x"00";                   -- Program Counter keeps track of current pulse
    signal dataout          : std_logic_vector(95 downto 0);                    -- Contains all pulse parameters for current pulse

    -- signal l_band_amp_on    : std_logic;                                        -- Amplifiers and switches
    -- signal x_band_amp_on    : std_logic;

    -- ALIASES
    -- Support 64 memory banks, each with a maximum of 2MW
     ALIAS reg_bank_address : std_logic_vector(3 downto 0) IS gpmc_address(25 downto 22);
     -- Currently each register is 64 x 16
     ALIAS reg_file_address : std_logic_vector(7 downto 0) IS gpmc_address(7 downto 0);
    ---------------------------------------------------------------------------
    --    Ethernet Signal declaration section
    ---------------------------------------------------------------------------
  --
  --   signal sys_rst_i        : std_logic := '0';
  --   signal send_packet      : std_logic := '0';
  --   signal REX_status       : std_logic_vector(15 downto 0) := (others => '0');
  --   signal REX_status_confirmed : std_logic := '0';
  --
    -- -- Transmit settings to REX = 00;
    -- -- Ask REX for status msg     = 01;
  --   --    signal eth_msg_type    :    std_logic_vector(1 downto 0) := "00";
  --
  --   signal eth_in_len       : std_logic_vector(15 downto 0);
  --   signal eth_in_type      : std_logic_vector(15 downto 0);
  --   signal eth_in_status    : std_logic_vector(15 downto 0);
  --   signal eth_in_addr      : std_logic_vector(15 downto 0);
  --   signal eth_in_id        : std_logic_vector(15 downto 0);
  --   signal eth_in_msg       : std_logic_vector(87 downto 0);



    -- attribute S     : string;
    -- attribute keep  : string;
    --
    -- attribute S of GIGE_RXD   : signal is "TRUE";
    -- attribute S of GIGE_RX_DV : signal is "TRUE";
    -- attribute S of GIGE_RX_ER : signal is "TRUE";
    --
    -- -- define constants
    -- constant UDP_TX_DATA_BYTE_LENGTH    : integer := 16;        --not SET TO MINIMUM LENGTH
    -- constant UDP_RX_DATA_BYTE_LENGTH    : integer := 37;
    -- constant TX_DELAY                   : integer := 100;
    --
    -- -- system control
    -- signal clk_125mhz           : std_logic;
    -- signal clk_100mhz           : std_logic;
    -- signal clk_25mhz            : std_logic;
    -- signal sys_reset            : std_logic;
    -- signal sysclk_locked        : std_logic;
    --
    -- -- MAC signals
    -- signal udp_tx_pkt_data      : std_logic_vector (8 * UDP_TX_DATA_BYTE_LENGTH - 1 downto 0);
    -- signal udp_tx_pkt_vld       : std_logic;
    -- signal udp_tx_pkt_sent      : std_logic;
    -- signal udp_tx_pkt_vld_r     : std_logic;
    -- signal udp_tx_rdy           : std_logic;
    --
    -- signal udp_rx_pkt_data      : std_logic_vector(8 * UDP_RX_DATA_BYTE_LENGTH - 1 downto 0);
    -- signal udp_rx_pkt_data_r    : std_logic_vector(8 * UDP_RX_DATA_BYTE_LENGTH - 1 downto 0);
    -- signal udp_rx_pkt_req       : std_logic;
    -- signal udp_rx_rdy           : std_logic;
    -- signal udp_rx_rdy_r         : std_logic;
    --
    -- signal dst_mac_addr         : std_logic_vector(47 downto 0);
    -- --    signal tx_state            : std_logic_vector(2 downto 0) := "000";
    -- signal rx_state             : std_logic_vector(1 downto 0) := "00";
    -- signal locked               : std_logic;
    -- signal mac_init_done        : std_logic;
    -- signal GIGE_GTX_CLK_r       : std_logic;
    -- signal GIGE_MDC_r           : std_logic;
    --
    -- signal tx_delay_cnt         : integer := 0;
    --
    -- signal udp_send_packet      : std_logic;
    -- signal udp_send_flag        : std_logic;
    -- signal udp_receive_packet   : std_logic_vector(1 downto 0) := "00";
    -- --    signal udp_receive_flag    : std_logic  := '0';
    -- signal udp_packet           : std_logic_vector (8 * UDP_TX_DATA_BYTE_LENGTH - 1 downto 0);
    -- signal rex_set              : std_logic;

    -- signal l_band_freq          : std_logic_vector(15 downto 0) := x"1405";
    -- signal x_band_freq          : std_logic_vector(15 downto 0) := x"3421";
    -- signal pol                  : std_logic_vector(15 downto 0) := x"0000";
    -- signal pol_mode             : std_logic_vector(2 downto 0);
    --
    -- type state_type is (IDLE, ARMED, PRE_PULSE, MAIN_BANG, DIGITIZE, DONE, FAULT);
    -- signal state                : state_type := IDLE;
    -- type state_type is (IDLE, ARMED, PRE_PULSE, MAIN_BANG, DIGITIZE, DONE, FAULT);
    type pri_state_type is (IDLE, RUNNING);
    signal pri_state                : pri_state_type := IDLE;
    -- signal next_state           : state_type := IDLE;
    --
    -- -- TODO: CHECK HOW X BAND POLARISATION TX SWITCH IS WIRED UP AND CHANGE THESE ACCORDINGLY
    -- constant X_POL_TX_HORIZONTAL: std_logic := '0';
    -- constant X_POL_TX_VERTICAL  : std_logic := not X_POL_TX_HORIZONTAL;
    --
    -- -- TODO: CHECK HOW L BAND POLARISATION TX SWITCH IS WIRED UP AND CHANGE THESE ACCORDINGLY
    -- constant L_POL_TX_HORIZONTAL: std_logic := '0';
    -- constant L_POL_TX_VERTICAL  : std_logic := not L_POL_TX_HORIZONTAL;
    --
    -- -- TODO: CHECK HOW L BAND POLARISATION RX SWITCH IS WIRED UP AND CHANGE THESE ACCORDINGLY
    -- constant L_POL_RX_HORIZONTAL: std_logic := '0';
    -- constant L_POL_RX_VERTICAL  : std_logic := not L_POL_RX_HORIZONTAL;
    --
    -- -- change these depending on the logic level interface to the amps
    -- constant X_AMP_ON           : std_logic := '0';
    -- constant X_AMP_OFF          : std_logic := not X_AMP_ON;
    -- constant L_AMP_ON           : std_logic := '1';
    -- constant L_AMP_OFF          : std_logic := not L_AMP_ON;

    signal soft_arm             : std_logic := '0';             -- from internal TCU register
    signal trigger              : std_logic := '0';             -- from GPSDO

    signal pri_heartbeat        : std_logic := '0';             -- to Pentek

    -- signal x_amp_switch         : std_logic := X_AMP_OFF;       -- to HPAs
    -- signal l_amp_switch         : std_logic := L_AMP_OFF;
    --
    -- signal x_pol_tx             : std_logic := '0';             -- to polarisation switches
    -- signal l_pol_tx             : std_logic := '0';
    -- signal l_pol_rx             : std_logic := '0';
    --
    -- signal clk_0_5Hz            : std_logic := '0';             -- slow clocks for LEDs
    -- signal clk_1Hz              : std_logic := '0';
    -- signal clk_2Hz              : std_logic := '0';
    -- signal clk_5Hz              : std_logic := '0';
    -- signal clk_1KHz              : std_logic := '0';

    ---------------------------------------------------------------------------
    --    Ethernet Component declaration section
    ---------------------------------------------------------------------------
    -- component clk_manager is
    -- port(
    --     --External Control
    --     dcm_100mhz_in   : in  std_logic;
    --     SYS_RST_i       : in  std_logic;
    --
    --     -- Clock out ports
    --     clk_125mhz      : out std_logic;
    --     clk_100mhz      : out std_logic;
    --     clk_25mhz       : out std_logic;
    --
    --     -- Status and control signals
    --     RESET           : out std_logic;
    --     sysclk_locked   : out std_logic
    -- );
    -- end component clk_manager;

    -- component UDP_1GbE is
    -- generic(
    --     UDP_TX_DATA_BYTE_LENGTH : natural := 1;
    --     UDP_RX_DATA_BYTE_LENGTH : natural := 1
    -- );
    -- port(
    --     -- user logic interface
    --     own_ip_addr     : in    std_logic_vector(31 downto 0);
    --     own_mac_addr    : in    std_logic_vector(47 downto 0);
    --     dst_ip_addr     : in    std_logic_vector(31 downto 0);
    --     dst_mac_addr    : in    std_logic_vector(47 downto 0);
    --
    --     udp_src_port    : in    std_logic_vector(15 downto 0);
    --     udp_dst_port    : in    std_logic_vector(15 downto 0);
    --
    --     udp_tx_pkt_data : in    std_logic_vector(8 * UDP_TX_DATA_BYTE_LENGTH - 1 downto 0);
    --     udp_tx_pkt_vld  : in    std_logic;
    --     udp_tx_rdy      : out   std_logic;
    --
    --     udp_rx_pkt_data : out   std_logic_vector(8 * UDP_RX_DATA_BYTE_LENGTH - 1 downto 0);
    --     udp_rx_pkt_req  : in    std_logic;
    --     udp_rx_rdy      : out   std_logic;
    --
    --     mac_init_done   : out   std_logic;
    --
    --     -- MAC interface
    --     GIGE_COL        : in    std_logic;
    --     GIGE_CRS        : in    std_logic;
    --     GIGE_MDC        : out   std_logic;
    --     GIGE_MDIO       : inout std_logic;
    --     GIGE_TX_CLK     : in    std_logic;
    --     GIGE_nRESET     : out   std_logic;
    --     GIGE_RXD        : in    std_logic_vector(7 downto 0);
    --     GIGE_RX_CLK     : in    std_logic;
    --     GIGE_RX_DV      : in    std_logic;
    --     GIGE_RX_ER      : in    std_logic;
    --     GIGE_TXD        : out   std_logic_vector(7 downto 0);
    --     GIGE_GTX_CLK    : out   std_logic;
    --     GIGE_TX_EN      : out   std_logic;
    --     GIGE_TX_ER      : out   std_logic;
    --
    --     -- system control
    --     clk_125mhz      : in    std_logic;
    --     clk_100mhz      : in    std_logic;
    --     sys_rst_i       : in    std_logic;
    --     sysclk_locked   : in    std_logic
    -- );
    -- end component UDP_1GbE;

    COMPONENT clk_wiz_v3_6
    PORT(
        CLK_IN : IN std_logic;
        CLK_400MHz_OUT : OUT std_logic;
        CLK_100MHz_OUT : OUT std_logic;
        CLK_10MHz_OUT : OUT std_logic
        );
    END COMPONENT;

    signal pri_trigger : std_logic := '0';
    signal counter : unsigned(31 downto 0) := (others=>'0');
    signal pri_duration : unsigned(31 downto 0) := (others=>'0');
    signal pri_duration_half : unsigned(31 downto 0) := (others=>'0');
    -- signal counter : natural range 0 to 50_000 := 0;

    signal go_pri: std_logic := '0';
    signal pulse_index_int : integer range 0 to 255 := 0;

    signal sys_clk_10MHz : std_logic := '0';
    signal sys_clk_400MHz: std_logic := '0';
    signal clk_out: std_logic := '0';

    ---------------------------------------------------------------------------
    -- CHIPSCOPE DEBUG CORES DECLARARATION
    ---------------------------------------------------------------------------
    COMPONENT chipscope_icon
    PORT(
        CONTROL0 : INOUT std_logic_vector(35 downto 0);
        CONTROL1 : INOUT std_logic_vector(35 downto 0);
        CONTROL2 : INOUT std_logic_vector(35 downto 0)
        );
    END COMPONENT;

    COMPONENT vio_reg_bank
    PORT(
        ASYNC_IN : IN std_logic_vector(95 downto 0);
        CONTROL : INOUT std_logic_vector(35 downto 0)
        );
    END COMPONENT;

    COMPONENT ila_pri_counter
    PORT(
        CLK : IN std_logic;
        TRIG0 : IN std_logic_vector(32 downto 0);
        CONTROL : INOUT std_logic_vector(35 downto 0)
        );
    END COMPONENT;

    COMPONENT ila_tcu_outputs
    PORT(
        CLK : IN std_logic;
        TRIG0 : IN std_logic_vector(5 downto 0);
        CONTROL : INOUT std_logic_vector(35 downto 0)
        );
    END COMPONENT;

    signal control_0_sig : std_logic_vector(35 downto 0);
    signal control_1_sig : std_logic_vector(35 downto 0);
    signal control_2_sig : std_logic_vector(35 downto 0);
    signal pulse_1_params: std_logic_vector(95 downto 0);
    signal ila_pri_counter_trig: std_logic_vector(32 downto 0);
    signal ila_tcu_outputs_trig: std_logic_vector(5 downto 0);
    signal prescaler : unsigned(31 downto 0) := (others=>'0');
--==========================
begin --architecture RTL
--==========================
    ---------------------------------------------------------------------------
    -- CHIPSCOPE DEBUG CORES INSTANTIATION
    ---------------------------------------------------------------------------

    Inst_chipscope_icon: chipscope_icon
    PORT MAP(
        CONTROL0 => control_0_sig,
        CONTROL1 => control_1_sig,
        CONTROL2 => control_2_sig
    );
    -- pulse_1_params <= reg_bank(0) & reg_bank(1) & reg_bank(2) & reg_bank(3) & reg_bank(4) & reg_bank(5);
    Inst_vio_reg_bank: vio_reg_bank
    PORT MAP(
        CONTROL => control_0_sig,
        -- ASYNC_IN => pulse_1_params
        ASYNC_IN => dataout
    );

    Inst_ila_pri_counter: ila_pri_counter
    PORT MAP(
        CONTROL => control_1_sig,
        CLK => sys_clk_400MHz,
        TRIG0 => ila_pri_counter_trig
    );

    ila_pri_counter_trig(32) <= pri_heartbeat;
    ila_pri_counter_trig(31 downto 0) <= std_logic_vector(counter);

    Inst_ila_tcu_outputs: ila_tcu_outputs
    PORT MAP(
        CONTROL => control_2_sig,
        CLK => sys_clk_400MHz,
        TRIG0 => ila_tcu_outputs_trig
    );

    ila_tcu_outputs_trig(5) <= pri_heartbeat;
    ila_tcu_outputs_trig(4 downto 0) <= "00000";

    ---------------------------------------------------------------------------
    --    Ethernet components
    ---------------------------------------------------------------------------

      -- UDP_1GbE_inst : UDP_1GbE
      -- generic map(
      --     UDP_TX_DATA_BYTE_LENGTH => UDP_TX_DATA_BYTE_LENGTH,
      --     UDP_RX_DATA_BYTE_LENGTH => UDP_RX_DATA_BYTE_LENGTH
      -- )
      -- port map(
      --     -- user logic interface
      --     own_ip_addr     => x"c0a86b1c",    -- 192.168.107.28
      --     own_mac_addr    => x"0e0e0e0e0e0b",
      --     dst_ip_addr     => x"c0a86b1d",    -- 192.168.107.29
      --     dst_mac_addr    => x"0e0e0e0e0e0c",
      --
      --     -- mac's MAC is x"406c8f0012cd"
      --     -- REx's MAC is x"0e0e0e0e0e0c"
      --
      --     udp_src_port    => x"1f40", --8000
      --     udp_dst_port    => x"1f43", --8003
      --
      --     udp_tx_pkt_data => udp_tx_pkt_data,
      --     udp_tx_pkt_vld  => udp_tx_pkt_vld,
      --     udp_tx_rdy      => udp_tx_rdy,
      --
      --     udp_rx_pkt_data => udp_rx_pkt_data,
      --     udp_rx_pkt_req  => udp_rx_pkt_req,
      --     udp_rx_rdy      => udp_rx_rdy,
      --
      --     mac_init_done   => mac_init_done,
      --
      --     -- MAC interface
      --     GIGE_COL        => GIGE_COL,
      --     GIGE_CRS        => GIGE_CRS,
      --     GIGE_MDC        => GIGE_MDC,
      --     GIGE_MDIO       => GIGE_MDIO,
      --     GIGE_TX_CLK     => GIGE_TX_CLK,
      --     GIGE_nRESET     => GIGE_nRESET,
      --     GIGE_RXD        => GIGE_RXD,
      --     GIGE_RX_CLK     => GIGE_RX_CLK,
      --     GIGE_RX_DV      => GIGE_RX_DV,
      --     GIGE_RX_ER      => GIGE_RX_ER,
      --     GIGE_TXD        => GIGE_TXD,
      --     GIGE_GTX_CLK    => GIGE_GTX_CLK,
      --     GIGE_TX_EN      => GIGE_TX_EN,
      --     GIGE_TX_ER      => GIGE_TX_ER,
      --
      --     -- system control
      --     clk_125mhz      => clk_125mhz,
      --     clk_100mhz      => clk_100mhz,
      --     sys_rst_i       => sys_reset,
      --     sysclk_locked   => sysclk_locked
      -- );

    -- clk_manager_inst : clk_manager
    -- port map(
    --     --External Control
    --     dcm_100mhz_in   => sys_clk_100MHz_int,
    --     --            SYS_CLK_P_i  => sys_clk_p,
    --     --            SYS_CLK_N_i  => sys_clk_n,
    --     SYS_RST_i       => sys_rst_i,
    --
    --     -- Clock out ports
    --     clk_125mhz      => clk_125mhz,
    --     clk_100mhz      => clk_100mhz,
    --     clk_25mhz       => clk_25mhz,
    --
    --     -- Status and control signals
    --     RESET           => sys_reset,
    --     sysclk_locked   => sysclk_locked
    -- );

    ---------------------------------------------------------------------------
    -- Instantiate input buffer for FPGA_PROC_BUS_CLK
    ---------------------------------------------------------------------------

    IBUFG_gpmc_clk_i : IBUFG
    generic map
    (
        IBUF_LOW_PWR => FALSE,
        IOSTANDARD   => "DEFAULT"
    )
    port map
    (
        I => gpmc_clk_i,
        O => gpmc_clk_i_b
    );

    ---------------------------------------------------------------------------
    -- Diff input clockl buffer, for 100MHz clock (for UART and Ethernet)
    ---------------------------------------------------------------------------

    -- IBUFGDS_sys_clk: IBUFGDS
    -- generic map
    -- (
    --     IOSTANDARD   => "LVDS_25",
    --     DIFF_TERM    => TRUE,
    --     IBUF_LOW_PWR => FALSE
    -- )
    -- port map
    -- (
    --     I  => sys_clk_P,
    --     IB => sys_clk_N,
    --     O  => sys_clk_100MHz_int
    -- );

    ---------------------------------------------------------------------------
    -- Input clock buffer, for EXTERNAL 100MHz clock
    ---------------------------------------------------------------------------
    -- IBUFG_tcu_clk : IBUFG
    -- generic map
    -- (
    --     IBUF_LOW_PWR => FALSE
    --     --    IOSTANDARD => "LVCMOS25"
    -- )
    -- port map
    -- (
    --     I => sys_clk_ext,
    --     O => sys_clk_100MHz_ext
    -- );

    Inst_clk_wiz_v3_6: clk_wiz_v3_6 PORT MAP(
        CLK_IN => sys_clk_ext,
        CLK_400MHz_OUT => sys_clk_400MHz,
        CLK_100MHz_OUT => sys_clk_100MHz,
        CLK_10MHz_OUT => sys_clk_10MHz
    );

    ---------------------------------------------------------------------------
    -- Misc signal wiring
    ---------------------------------------------------------------------------

    led <= led_reg(7 downto 0);

    --=====================================--
    -- GPMC interface
    --=====================================--

    -- Interface between the ARM processor and the FPGA
    gpmc_interface : process (gpmc_clk_i_b,gpmc_n_cs,gpmc_n_oe,gpmc_n_we,gpmc_n_adv_ale,gpmc_d,gpmc_a)
    begin
        if (gpmc_n_cs /= "1111111")  then             -- CS 1
            if gpmc_clk_i_b'event and gpmc_clk_i_b = '1' then
                --First cycle of the bus transaction record the address
                if (gpmc_n_adv_ale = '0') then
                    gpmc_address <= gpmc_a & gpmc_d;   -- Address of 16 bit word
                --Second cycle of the bus is read or write
                --Check for read
                --Write data on the output port of gpmc for the ARM to read
                elsif (gpmc_n_oe = '0') then
                    case to_integer(unsigned(reg_bank_address)) is
                        when 0 => gpmc_data_o <= status_reg;
                        when 1 => gpmc_data_o <= triggers;
                        when 2 => gpmc_data_o <= (others => '0');
                        when 3 => gpmc_data_o <= reg_bank(to_integer(unsigned(reg_file_address)));
                        when 4 => gpmc_data_o <= M_reg(to_integer(unsigned(reg_file_address)));
                        when 5 => gpmc_data_o <= N_reg;
                        when others => gpmc_data_o <= (others => '0');
                end case;
                --Check for write
                --Read data from the input port
                elsif (gpmc_n_we = '0') then
                    case to_integer(unsigned(reg_bank_address)) is
                        when 1 => triggers <= gpmc_data_i;
                        when 2 => bcd_int(to_integer(unsigned(reg_file_address))) <= gpmc_data_i;
                        when 3 => reg_bank(to_integer(unsigned(reg_file_address))) <= gpmc_data_i;
                        when 4 => M_reg(to_integer(unsigned(reg_file_address))) <= gpmc_data_i;
                        when 5 => N_reg <= gpmc_data_i;
                        when others => null;
                    end case;
                end if;
            end if;
        end if;
    end process gpmc_interface;

    ---------------------------------------------------------------------------
    -- Manage the tri-state bus
    ---------------------------------------------------------------------------
    gpmc_d      <= gpmc_data_o when (gpmc_n_oe = '0') else (others => 'Z');
    gpmc_data_i <= gpmc_d;
    --
    -- bcd(15 downto 0)    <= bcd_int(0);
    -- bcd(31 downto 16)   <= bcd_int(1);

    -- -- M_reg_cmp is used when comparing with the counter
    M_reg_cmp(31 downto 16) <= M_reg(1);
    M_reg_cmp(15 downto 0)  <=  M_reg(0);

    ------------------------------------------------------------------------------
    --  TCU STATE MACHINE
    -------------------------------------------------------------------------------
    -- -- populate dataout from regbank based on Program Counter (pulse_index)
    dataout     <= reg_bank(pulse_index_int) & reg_bank(pulse_index_int+1) & reg_bank(pulse_index_int+2) & reg_bank(pulse_index_int+3) & reg_bank(pulse_index_int+4) & reg_bank(pulse_index_int+5);
    MBoffset    <= unsigned(reg_bank(pulse_index_int));
    DIGoffset   <= unsigned(reg_bank(pulse_index_int+1));
    PRIoffset   <= unsigned(reg_bank(pulse_index_int+2)) & unsigned(reg_bank(pulse_index_int+5));
    -- pol_mode    <= reg_bank(pulse_index_int+4)(2 downto 0);
    pulse_index_int <= to_integer(unsigned(pulse_index));
    -- single synchronous process implementation
    -- tcu_fsm : process(sys_clk_100MHz)
    --     variable pulse_index_int : integer range 0 to 255 := 0;
    -- begin
    --     pulse_index_int := to_integer(unsigned(pulse_index));
    --     if rising_edge(sys_clk_100MHz) then

            -- -- populate dataout from regbank based on Program Counter (pulse_index)
            -- dataout     <= reg_bank(pulse_index_int) & reg_bank(pulse_index_int+1) & reg_bank(pulse_index_int+2) & reg_bank(pulse_index_int+3) & reg_bank(pulse_index_int+4) & reg_bank(pulse_index_int+5);
            -- MBoffset    <= unsigned(reg_bank(pulse_index_int));
            -- DIGoffset   <= unsigned(reg_bank(pulse_index_int+1));
            -- PRIoffset   <= unsigned(reg_bank(pulse_index_int+2)) & unsigned(reg_bank(pulse_index_int+5));
            -- pol_mode    <= reg_bank(pulse_index_int+4)(2 downto 0);

            -- case(state) is
            --
            --     when IDLE =>
            --         M_counter   <= (others => '0');
            --         MBcounter   <= (others => '0');
            --         DIGcounter  <= (others => '0');
            --         PRIcounter  <= (others => '0');
            --         if soft_arm = '1' then
            --             state <= ARMED;
            --         else
            --             state <= IDLE;
            --         end if;
            --
            --     when ARMED =>
            --         if trigger = '1' then
            --             state <= PRE_PULSE;
            --         else
            --             state <= ARMED;
            --         end if;
            --
            --     when PRE_PULSE =>
            --         -- turn on appropriate amp
            --         -- set pol switches
            --         if M_counter < unsigned(M_reg_cmp) then -- needed this because it was executing one pulse extra at the end
            --             if MBcounter >= MBoffset then
            --                 state <= MAIN_BANG;
            --                 MBcounter <= x"0000";
            --             else
            --                 state <= PRE_PULSE;
            --                 MBcounter <= MBcounter + 1;
            --             end if;
            --
            --             --       POLARISATION MODES
            --             -- +------+-----+-------+-------+
            --             -- | Mode |Band | TxPol | RxPol |
            --             -- +----------------------------+
            --             -- | 000  |  L  |   V   |   V   |
            --             -- | 001  |  L  |   V   |   H   |
            --             -- | 010  |  L  |   H   |   V   |
            --             -- | 011  |  L  |   H   |   H   |
            --             -- | 100  |  X  |   H   |  V,H  |
            --             -- | 101  |  X  |   V   |  V,H  |
            --             -- +------+-----+-------+-------+
            --
            --             if MBcounter > 0 then   -- needed this to remove the 10ns lag between pointing to the next pulse and getting the new pol_mode.
            --                                     -- doesnt affect system as the amps need to be on just before MB
            --                 -- this is an X-band pulse
            --                 if pol_mode(2) = '1' then
            --                     x_amp_switch <= X_AMP_ON;
            --                     l_amp_switch <= L_AMP_OFF;
            --
            --                     if pol_mode(0) = '0' then
            --                         x_pol_tx <= X_POL_TX_HORIZONTAL;
            --                     else
            --                         x_pol_tx <= X_POL_TX_VERTICAL;
            --                     end if;
            --
            --                 -- this is an L-band pulse
            --                 else
            --                     l_amp_switch <= L_AMP_ON;
            --                     x_amp_switch <= X_AMP_OFF;
            --
            --                     if pol_mode(1) = '1' then
            --                         l_pol_tx <= L_POL_TX_HORIZONTAL;
            --                     else
            --                         l_pol_tx <= L_POL_TX_VERTICAL;
            --                     end if;
            --                     if pol_mode(0) = '1' then
            --                         l_pol_rx <= L_POL_RX_HORIZONTAL;
            --                     else
            --                         l_pol_rx <= L_POL_RX_VERTICAL;
            --                     end if;
            --                 end if;
            --             end if;
            --             -- -- taken directly from original TCU code, need to test
            --             -- if(MBcounter <= 2) then
            --             --   udp_send_packet <= '1';
            --             -- else
            --             --   udp_send_packet <= '0';
            --             -- end if;
            --         else
            --             state <= DONE;
            --             -- turn off amps
            --         end if;
            --
            --
            --     when MAIN_BANG =>
            --         -- pri_heartbeat   <= '1';
            --         pri_trigger <= '1';
            --         if DIGcounter>= DIGoffset then
            --             state       <= DIGITIZE;
            --             DIGcounter  <= x"0000";
            --         else
            --             state       <= MAIN_BANG;
            --             DIGcounter  <= DIGcounter + 1;
            --         end if;
            --
            --     when DIGITIZE =>
            --         -- turn off amps
            --         x_amp_switch    <= X_AMP_OFF;
            --         l_amp_switch    <= L_AMP_OFF;
            --         -- pri_heartbeat   <= '0';
            --         pri_trigger <= '0';
            --
            --
            --         if PRIcounter >= PRIoffset then
            --             -- pri_heartbeat   <= '0';
            --             pulse_index <= pulse_index + 6;
            --             if (pulse_index/6)+1 >= unsigned(N_reg) then
            --                 M_counter   <= M_counter + 1;
            --                 pulse_index <= x"00";
            --             end if;
            --
            --             if M_counter >= unsigned(M_reg_cmp) then
            --                 state   <= DONE;
            --                 M_counter <= x"00000000";
            --             else
            --                 state   <= PRE_PULSE;
            --             end if;
            --             PRIcounter  <= x"00000000";
            --         else
            --             state       <= DIGITIZE;
            --             PRIcounter  <= PRIcounter + 1;
            --         end if;
            --
            --     when DONE =>
            --         x_amp_switch    <= X_AMP_OFF;
            --         l_amp_switch    <= L_AMP_OFF;
            --         if soft_arm = '0' then
            --             state       <= IDLE;
            --         else
            --             state       <= DONE;
            --         end if;
            --
            --     when others =>
            --         -- turn off amps
            --         x_amp_switch    <= X_AMP_OFF;
            --         l_amp_switch    <= L_AMP_OFF;
            --         state           <= FAULT;
            -- end case;

            -- ----------------------------------------------------------------
            -- Extracting waveform frequency for REX
            -- ----------------------------------------------------------------
            -- case(pol_mode) is
            --   when "000" =>
            --     l_band_freq <=  reg_bank(pulse_index_int+3);
            --     x_band_freq <=  x_band_freq;
            --   when "001" =>
            --     l_band_freq <=  reg_bank(pulse_index_int+3);
            --     x_band_freq <=  x_band_freq;
            --   when "010" =>
            --     l_band_freq <=  reg_bank(pulse_index_int+3);
            --     x_band_freq <=  x_band_freq;
            --   when "011" =>
            --     l_band_freq <=  reg_bank(pulse_index_int+3);
            --     x_band_freq <=  x_band_freq;
            --   when "100" =>
            --     l_band_freq <=  l_band_freq;
            --     x_band_freq <=  reg_bank(pulse_index_int+3);
            --   when "101" =>
            --     l_band_freq <=  l_band_freq;
            --     x_band_freq <=  reg_bank(pulse_index_int+3);
            --   when others =>
            --     l_band_freq <=  l_band_freq;
            --     x_band_freq <=  x_band_freq;
            -- end case;
    --     end if;
    -- end process;


pri_duration <= (MBoffset + DIGoffset + PRIoffset);
pri_duration_half <= shift_right(pri_duration, 1);
CounterWithTriggerPulse : process (sys_clk_100MHz) is
begin
    -- if rising_edge(sys_clk_10MHz) then
    --     if pri_trigger = '1' then
    --       go_pri <= '1';
    --     end if;
    --     if go_pri = '1' then
    --       if counter > x"00000000" then
    --           counter <= counter - 1;
    --           if counter >= (pri_duration_half)/10 then
    --             pri_heartbeat <= '1';
    --           else
    --             pri_heartbeat <= '0';
    --           end if;
    --       else
    --           counter <= pri_duration/10;
    --       end if;
    --     end if;
    -- end if; -- clock

    if rising_edge(sys_clk_100MHz) then
       if go_pri = '1' then
          if counter = pri_duration_half then
          -- if counter = 50000 then
              pri_heartbeat <= not pri_heartbeat;
              counter<=(others=>'0');
          else
            counter<=counter+x"00000001";
          end if;
       end if;
    end if;

end process CounterWithTriggerPulse;
led_reg(0) <= '1' when pri_duration_half = x"0000c350" else '0';
pri_fsm : process(sys_clk_100MHz)
begin
  if rising_edge(sys_clk_100MHz) then
    case( pri_state ) is

      when IDLE =>
        if pri_trigger = '1' then
          pri_state <= RUNNING;
        else
          pri_state <= IDLE;
        end if;

      when RUNNING =>
        go_pri <= '1';
        -- TODO: get an 'end' signal to stop the counter,
        -- have another counter being clocked by the pri_heartbeat signal,
        -- compare that value to mxn?
        pri_state <= RUNNING;

      when OTHERS =>
        pri_state <= IDLE;
    end case;
  end if;
end process;

-- num_transfers_counter : process(pri_heartbeat)
-- begin
--   if rising_edge(pri_heartbeat) then
--     -- increment ctr
--     -- check ctr == mxn
--   end if;
-- end process;
    soft_arm    <= triggers(0); -- from internal TCU register
    -- led_reg(0)  <= trigger;
    -- led_reg(1)  <= pri_heartbeat;
    -- led_reg(2)  <= x_amp_switch;
    -- led_reg(3)  <= l_amp_switch;
    -- led_reg(4)  <= '1' when state = ARMED       else '0';
    -- led_reg(5)  <= '1' when state = PRE_PULSE   else '0';
    -- led_reg(6)  <= '1' when state = DIGITIZE    else '0';
    -- led_reg(7)  <= '1' when state = DONE        else '0';
    -- led_reg(0)  <= '0';
    led_reg(1)  <= '0';
    led_reg(2)  <= '0';
    led_reg(3)  <= '0';
    led_reg(4)  <= '0';
    led_reg(5)  <= '0';
    led_reg(6)  <= '0';
    -- led_reg(7)  <= '0';

    -- GPIO SIGNAL <--> PORT CONNECTIONS

    -- +-------------------------------+
    -- |          RHINO GPIO           |
    -- |             [P 2]             |
    -- |          +----+----+          |
    -- |      2v5 | 1  | 2  | 2v5      |
    -- |          +---------+          |
    -- |   GPIO_0 | 3  | 4  | GPIO_1   |
    -- |          +---------+          |
    -- |   GPIO_2 | 5  | 6  | GPIO_3   |
    -- |          +---------+          |
    -- |   GPIO_4 | 7  | 8  | GPIO_5   |
    -- |          +---------+          |
    -- |   GPIO_6 | 9  | 10 | GPIO_7   |
    -- |          +---------+          |
    -- |   GPIO_8 | 11 | 12 | GPIO_9   |
    -- |          +---------+          |
    -- |  GPIO_10 | 13 | 14 | GPIO_11  |
    -- |          +---------+          |
    -- |  GPIO_12 | 15 | 16 | GPIO_13  |
    -- |          +---------+          |
    -- |  GPIO_14 | 17 | 18 | GPIO_15  |
    -- |          +---------+          |
    -- |      GND | 19 | 20 | GND      |
    -- |          +---------+          |
    -- +-------------------------------+

    -- trigger     <= gpioIn(0);         -- from GPSDO
    -- clk_sel     <= gpioIn(1);         -- clock select line to select between internal / external 100MHz
    -- gpio(2)     <= trigger;           -- from GPSDO
    -- gpio(3)     <= not pri_heartbeat; -- to Pentek (active low)
    -- gpio(4)     <= x_amp_switch;      -- to HPAs
    -- gpio(5)     <= x_pol_tx;          -- to polarisation switches
    -- gpio(6)     <= l_amp_switch;
    -- gpio(7)     <= l_pol_tx;
    -- gpio(8)     <= l_pol_rx;
    -- gpio(9)     <= pri_heartbeat;
    -- gpio(10)    <= pri_heartbeat;
    -- gpio(11)    <= pri_heartbeat;
    -- gpio(12)    <= pri_heartbeat;
    -- gpio(13)    <= pri_heartbeat;
    -- gpio(14)    <= clk_1KHz;
    -- gpio(15)    <= pri_heartbeat;
    pri_trigger <= trigger;
    trigger     <= gpioIn(0);
    -- clk_sel     <= '0';
    gpio(2)     <= '0';
    gpio(3)     <= '0';
    gpio(4)     <= '0';
    gpio(5)     <= '0';
    gpio(6)     <= '0';
    gpio(7)     <= '0';
    gpio(8)     <= '0';
    gpio(9)     <= '0';
    gpio(10)    <= '0';
    gpio(11)    <= '0';
    gpio(12)    <= '0';
    gpio(13)    <= '0';
    -- gpio(14)    <= '0';
    gpio(15)    <= pri_heartbeat;

    -- sys_clk_100MHz  <= sys_clk_100MHz_int when clk_sel = '1' else sys_clk_100MHz_ext;
    -- NET "gpio_fmc[0]"   LOC = V11;  # FMC0_LA_P24
    -- NET "gpio_fmc[1]"   LOC = V10;  # FMC0_LA_N24
    -- NET "gpio_fmc[2]"   LOC = AA9;  # FMC0_LA_P25
    -- NET "gpio_fmc[3]"   LOC = AB9;  # FMC0_LA_N25
    -- NET "gpio_fmc[4]"   LOC = AA10; # FMC0_LA_P26
    -- NET "gpio_fmc[5]"   LOC = AB11; # FMC0_LA_N26
    -- NET "gpio_fmc[6]"   LOC = AD6;  # FMC0_LA_P27
    -- NET "gpio_fmc[7]"   LOC = AF6;  # FMC0_LA_N27
    -- NET "gpio_fmc[8]"   LOC = W10;  # FMC0_LA_P28
    -- NET "gpio_fmc[9]"   LOC = W9;   # FMC0_LA_N28
    -- NET "gpio_fmc[10]"  LOC = AE5;  # FMC0_LA_P29
    -- NET "gpio_fmc[11]"  LOC = AF5;  # FMC0_LA_N29
    -- NET "gpio_fmc[12]"  LOC = Y9;   # FMC0_LA_P30
    -- NET "gpio_fmc[13]"  LOC = AA8;  # FMC0_LA_N30
    -- NET "gpio_fmc[14]"  LOC = AB7;  # FMC0_LA_P31
    -- NET "gpio_fmc[15]"  LOC = AC6;  # FMC0_LA_N31
    -- MIRROR IO pins to 3v3 FMC GPIO pins
    -- trigger         <= gpio_fmc(0);         -- from GPSDO
    -- clk_sel         <= gpio_fmc(1);         -- clock select line to select between internal / external 100MHz
    -- gpio_fmc(2)     <= trigger;           -- from GPSDO
    -- gpio_fmc(3)     <= not pri_heartbeat; -- to Pentek (active low)
    -- gpio_fmc(4)     <= x_amp_switch;      -- to HPAs
    -- gpio_fmc(5)     <= x_pol_tx;          -- to polarisation switches
    -- gpio_fmc(6)     <= l_amp_switch;
    -- gpio_fmc(7)     <= l_pol_tx;
    -- gpio_fmc(8)     <= l_pol_rx;
    -- gpio_fmc(9)     <= '1' when state = ARMED     else '0';
    -- gpio_fmc(10)    <= '1' when state = PRE_PULSE else '0';
    -- gpio_fmc(11)    <= '1' when state = MAIN_BANG else '0';
    -- gpio_fmc(12)    <= '1' when state = DIGITIZE  else '0';
    -- gpio_fmc(13)    <= '1' when state = DONE      else '0';
    -- gpio_fmc(14)    <= '1' when state = FAULT     else '0';
    -- gpio_fmc(15)    <= pri_heartbeat;
    -- gpio_fmc <= pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat & pri_heartbeat;
    -- with state select led_fmc <=
    --       clk_0_5Hz&"000"                 when IDLE,
    --       clk_2Hz&(not clk_2Hz)&"00"      when ARMED,
    --       clk_5Hz&clk_5Hz&clk_5Hz&clk_5Hz when PRE_PULSE,
    --       clk_5Hz&clk_5Hz&clk_5Hz&clk_5Hz when MAIN_BANG,
    --       clk_5Hz&clk_5Hz&clk_5Hz&clk_5Hz when DIGITIZE,
    --       "1111"                          when DONE,
    --       "0001"                          when OTHERS;
    --
    -- -- slow clock to drive LEDs
    -- process (sys_clk_100MHz)
    -- variable prescaler_0_5Hz    : integer := 0;
    -- variable prescaler_1Hz      : integer := 0;
    -- variable prescaler_2Hz      : integer := 0;
    -- variable prescaler_5Hz      : integer := 0;
    -- variable prescaler_1KHz      : integer := 0;
    -- begin
    --
    --     if rising_edge(sys_clk_100MHz) then
    --         if prescaler_0_5Hz = 100_000_000 then
    --             clk_0_5Hz <= not clk_0_5Hz;
    --             prescaler_0_5Hz := 0;
    --         else
    --             prescaler_0_5Hz := prescaler_0_5Hz + 1;
    --         end if;
    --         if prescaler_1Hz = 50_000_000 then
    --             clk_1Hz <= not clk_1Hz;
    --             prescaler_1Hz := 0;
    --         else
    --             prescaler_1Hz := prescaler_1Hz + 1;
    --         end if;
    --         if prescaler_2Hz = 25_000_000 then
    --             clk_2Hz <= not clk_2Hz;
    --             prescaler_2Hz := 0;
    --         else
    --             prescaler_2Hz := prescaler_2Hz + 1;
    --         end if;
    --         if prescaler_5Hz = 10_000_000 then
    --             clk_5Hz <= not clk_5Hz;
    --             prescaler_5Hz := 0;
    --         else
    --             prescaler_5Hz := prescaler_5Hz + 1;
    --         end if;
    --         if prescaler_1KHz = 50_000 then
    --             clk_1KHz <= not clk_1KHz;
    --             prescaler_1KHz := 0;
    --         else
    --             prescaler_1KHz := prescaler_1KHz + 1;
    --         end if;
    --     end if;
    -- end process;

    ---------------------------------------------------------------------------
    -- UDP TRANSMISSION SECTION
    ---------------------------------------------------------------------------
    -- --udp_packet <= x"0d000000000004000300" & l_band_freq & x_band_freq & pol;
    -- udp_tx : process(udp_send_packet, sys_clk_100MHz_int)
    --     begin
    --     if(rising_edge(sys_clk_100MHz_int)) then
    --         if(udp_send_packet = '1' and udp_send_flag <= '0') then
    --             udp_send_flag    <= '1';
    --             udp_tx_pkt_vld_r <= '0';
    --         elsif(udp_tx_rdy = '1' and udp_send_flag = '1') then
    --             if(tx_delay_cnt = TX_DELAY) then
    --                 tx_delay_cnt     <= 0;
    --                 udp_tx_pkt_vld_r <= '1';    -- LAUNCH
    --                 udp_tx_pkt_data  <= x"0d000000000004000300" & l_band_freq & x_band_freq & pol;     --x"0d000000000004000300140534210000";
    --                 udp_send_flag    <= '0';
    --             else
    --                 udp_tx_pkt_vld_r <= '0';
    --                 tx_delay_cnt     <= tx_delay_cnt + 1;
    --             end if;
    --         else
    --             udp_tx_pkt_vld_r <= '0';    -- ARM
    --         end if;
    --     end if;
    -- end process udp_tx;
    --
    -- udp_tx_pkt_vld <= udp_tx_pkt_vld_r;
      process (sys_clk_100MHz)

      begin
          if rising_edge(sys_clk_100MHz) then
              if prescaler = x"0000c350" then
                  clk_out <= not clk_out;
                  prescaler<=(others=>'0');
              else
              prescaler<=prescaler+x"00000001";
              end if;
          end if;
      end process;
      gpio(14)<=clk_out;
end rtl;