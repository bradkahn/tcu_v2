library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;
-- TODO:  remove this library and convert assoc signals to unsigned/integer
use IEEE.STD_LOGIC_ARITH.ALL;  -- not a standard library

library UNISIM;
use UNISIM.VComponents.all;

-------------------------------------------------------------------------------
-- Declare input and output pins for rhino_proc_intrfc_top
-------------------------------------------------------------------------------

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


-------------------------------------------------------------------------------
-- Architecture of rhino_proc_intrfc_top
-------------------------------------------------------------------------------

architecture rtl of tcu_top is
    ---------------------------------------------------------------------------
    -- Declare types
    ---------------------------------------------------------------------------

    type ram_type       is array (255 downto 0) of std_logic_vector(15 downto 0);
    type word32_type    is array (1 downto 0)   of std_logic_vector(15 downto 0);
    type word64_type    is array (3 downto 0)   of std_logic_vector(15 downto 0);

    ---------------------------------------------------------------------------
    -- Declare signals
    ---------------------------------------------------------------------------

    -- Define signals for the gpmc bus
    signal gpmc_clk_i_b     : std_logic;  --buffered  gpmc_clk_i
    signal gpmc_address     : std_logic_vector(25 downto 0):=(others => '0');         -- Full de-multiplexed address bus (ref. 16 bits)
    signal gpmc_data_o      : std_logic_vector(15 downto 0):="0000000000000000";      -- Register for output bus value
    signal gpmc_data_i      : std_logic_vector(15 downto 0):="0000000000000000";      -- Register for input bus value

    --Other signals
    signal heartbeat        : std_logic;
    signal dcm_locked       : std_logic;
    signal rd_cs_en         : std_logic:='0';
    signal we_cs_en         : std_logic:='0';

    --Clocks
    signal sys_clk_100MHz   : std_logic;
    signal sys_clk_100MHz_ext   : std_logic;

    -- Debug signals
    constant VERSION        : std_logic_vector(7 downto 0) := "00000001";
    constant ID             : std_logic_vector(7 downto 0) := "01010001";
    signal reg_bank         : ram_type := (others => "1111111111111111");
    signal led_reg          : std_logic_vector(15 downto 0) := "0000000000000000";
    signal bcd_int          : word32_type := (x"0000",x"0000");
    signal M_reg            : word32_type := (x"f000",x"f000");
    signal M_reg_cmp        : std_logic_vector(31 downto 0);
    signal N_reg            : std_logic_vector(15 downto 0) := x"0002";

    -- Dominic's Debug signals
    --	signal reg_32_bit : word32_type := (x"1200",x"0045");
    --	signal reg_read	: word32_type := (x"0000",x"0000");
    --	signal PRI 			: word32_type := (x"1234",x"0045");

    -- Used for processing (Skippy)
    	-- indicates that experiment is ready to start.
    	-- triggered by trigger(0) and gpioIn(0)
    signal ready            :	std_logic;

    --signal    NM			: std_logic;
    signal nextload         : std_logic;
    signal MBsig            : std_logic;
    signal Dsig             : std_logic;
    signal Psig             : std_logic;

    --signal N					 	integer range 0 to 32;
    signal M                : std_logic_vector(31 downto 0) := (others => '0');

    signal MB               : integer range 0 to 65535 := 0;
    signal MBcounter        : integer range 0 to 65535 := 0;
    signal D                : integer range 0 to 65535 := 0;
    signal Dcounter         : integer range 0 to 65535 := 0;
    --signal P					 	integer range 0 to 65535 := 0;
    --signal Pcounter		:	integer range 0 to 65535 := 0;
    -- 32 bit versions of P and P counter
    signal P                : std_logic_vector(31 downto 0) := x"00000000";
    signal Pcounter         : std_logic_vector(31 downto 0) := x"00000000";
    signal one              : std_logic_vector(31 downto 0) := x"00000001";

    signal triggers         : std_logic_vector(15 downto 0) := x"0000";
    signal status_reg       : std_logic_vector(15 downto 0) := x"0000";

    signal PC               : integer range 0 to 255 := 0;
    signal dataout          : std_logic_vector(95 downto 0);

    -- Ethernet
    signal sys_rst_i        : std_logic := '0';
    signal send_packet      : std_logic := '0';
    signal REX_status       : std_logic_vector(15 downto 0) := x"0000";
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

    -- ALIASES
    -- Support 64 memory banks, each with a maximum of 2MW
     ALIAS reg_bank_address : std_logic_vector(3 downto 0) IS gpmc_address(25 downto 22);
     -- Currently each register is 64 x 16
     ALIAS reg_file_address : std_logic_vector(7 downto 0) IS gpmc_address(7 downto 0);

    ---------------------------------------------------------------------------
    --	Ethernet Signal declaration section
    ---------------------------------------------------------------------------

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

    -- Amplifiers and switches

    signal l_band_amp_on        : std_logic;
    signal x_band_amp_on        : std_logic;

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

--==========================
begin --architecture RTL
--==========================

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

    IBUFGDS_sys_clk: IBUFGDS
    generic map
    (
        IOSTANDARD   => "LVDS_25",
        DIFF_TERM    => TRUE,
        IBUF_LOW_PWR => FALSE
    )
    port map
    (
        I  => sys_clk_P,
        IB => sys_clk_N,
        O  => sys_clk_100MHz
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

    -- Map important processor bus pins to GPIO header
    led         <= led_reg(7 downto 0);

    -- Set other outputs low
    --gpio    <= gpmc_clk_i_b & gpmc_n_cs(1) & gpmc_n_we & gpmc_n_oe & gpmc_a(4 downto 1) & gpmc_d(7 downto 0);
    gpmc_busy_0 <= '0';
    gpmc_busy_1 <= '0';

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
                    case conv_integer(reg_bank_address) is
                        when 0 => gpmc_data_o <= status_reg;
                        when 1 => gpmc_data_o <= triggers;
                        when 2 => gpmc_data_o <= (others => '0');
                        when 3 => gpmc_data_o <= reg_bank(conv_integer(reg_file_address));
                        when 4 => gpmc_data_o <= M_reg(conv_integer(reg_file_address));
                        when 5 => gpmc_data_o <= N_reg;
                        --when 6 => gpmc_data_o <= PRI(conv_integer(reg_file_address));
                        --when 7 => gpmc_data_o <= reg_read(conv_integer(reg_file_address));
                        when others => gpmc_data_o <= (others => '0');
                end case;
                --Check for write
                --Read data from the input port
                elsif (gpmc_n_we = '0') then
                    case conv_integer(reg_bank_address) is
                        when 1 => triggers <= gpmc_data_i;
                        when 2 => bcd_int(conv_integer(reg_file_address)) <= gpmc_data_i;
                        when 3 => reg_bank(conv_integer(reg_file_address)) <= gpmc_data_i;
                        when 4 => M_reg(conv_integer(reg_file_address)) <= gpmc_data_i;
                        when 5 => N_reg <= gpmc_data_i;
                        --when 6 =>
                        --	reg_32_bit(conv_integer(reg_file_address)) <= gpmc_data_i;
                        --reg_read <= reg_32_bit;
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

    ---------------------------------------------------------------------------
    -- ?????????
    ---------------------------------------------------------------------------
    nextload    <= (MBsig and Dsig and Psig);
    --led_reg(0)
    --led_reg(1) <= when M = M_reg
    --led_reg(2) <= MBsig;
    led_reg(3)  <= Dsig;
    led_reg(4)  <= Psig;
    led_reg(5)  <= nextload;
    --led_reg(6) <= when M = M_reg
    led_reg(6)  <= '1';
    led_reg(7)  <= gpioIn(1);

    bcd(15 downto 0)    <= bcd_int(0);
    bcd(31 downto 16)   <= bcd_int(1);

    -- Remember to uncomment this
    -- It includes a new status bit that indicates when an experiment is happening
    --status_reg(1) <= ready and not(status_reg(0)) and triggers(0);

    -- M_reg_cmp is used when comparing with the counter
    M_reg_cmp(31 downto 16) <= M_reg(1);
    M_reg_cmp(15 downto 0) <=  M_reg(0);

    gpio(2) <= MBsig;		-- Indicates when Main Bang offset has been reached
    gpio(8) <= MBsig;
    gpio(3) <= Dsig;		-- Indicates when Digitisation offset has been reached
    gpio(9) <= Dsig;
    gpio(4) <= Psig;		-- Indicates when Next PRI offset has been reached
    gpio(10)<= Psig;
    gpio(5) <= nextload;

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
            dataout  <= reg_bank(PC) & reg_bank(PC+1) & reg_bank(PC+2) & reg_bank(PC+3) & reg_bank(PC+4) & reg_bank(PC+5);
            MB       <= conv_integer(reg_bank(PC));
            D        <= conv_integer(reg_bank(PC+1));
            P        <= reg_bank(PC+2) & reg_bank(PC+5);
            --PRI(1) <= P(31 downto 16);
            --PRI(0) <= P(15 downto 0);
            pol_mode <= reg_bank(PC+4)(10 downto 8);
        -- setup certain ports depending on the mode of operation
        case pol_mode is
            when "000" =>		--	L band Tx=V Rx=V
                x_band_freq     <= x_band_freq_var;
                l_band_freq     <= reg_bank(PC+3);
                pol             <= x"0000";	--	set REx polarisation
                gpio(14)        <= '0';			--	L band Rx switch
                gpio(15)        <= '1';			--	L band Rx switch
                l_band_amp_on   <= '1';
                x_band_amp_on   <= '0';
            when "001" => 		--	L band Tx=V Rx=H
                x_band_freq     <= x_band_freq_var;
                l_band_freq     <= reg_bank(PC+3);
                pol             <= x"0000";
                gpio(14)        <= '1';
                gpio(15)        <= '0';
                l_band_amp_on   <= '1';
                x_band_amp_on   <= '0';
            when "010" => 		--	L band Tx=H Rx=H
                x_band_freq     <= x_band_freq_var;
                l_band_freq     <= reg_bank(PC+3);
                pol             <= x"0000";
                gpio(14)        <= '1';
                gpio(15)        <= '0';
                l_band_amp_on   <= '1';
                x_band_amp_on   <= '0';
            when "011" => 		--	L band Tx=V Rx=V
                x_band_freq     <= x_band_freq_var;
                l_band_freq     <= reg_bank(PC+3);
                pol             <= x"0000";
                gpio(14)        <= '0';
                gpio(15)        <= '1';
                l_band_amp_on   <= '1';
                x_band_amp_on   <= '0';
            when "100" => 		--	X band Tx=V Rx=V,H
                l_band_freq     <= l_band_freq_var;
                x_band_freq     <= reg_bank(PC+3);
                pol             <= x"0100";
                gpio(14)        <= '0';
                gpio(15)        <= '0';
                l_band_amp_on   <= '0';
                x_band_amp_on   <= '1';
            when "101" => 		--	X band Tx=H Rx=V,H
                l_band_freq     <= l_band_freq_var;
                x_band_freq     <= reg_bank(PC+3);
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
        if(triggers(0) = '1' and gpioIn(0) = '1') then
            ready <= '1';
        elsif(triggers(0) = '0') then
            ready <= '0';
        end if;

        -- The experiment commences when triggered by the ready signal above, as long as it isnt the end of the experiment and as long as it is still "soft on" (kept on by the triggers register).
        if(ready = '1' and status_reg(0) = '0' and triggers(0) = '1') then

            sys_rst_i <= '0';		-- turn ethernet on

            if ((MBsig and Dsig and Psig) = '1') then
                -- reset all counters at the end of Interval
                MBcounter <= 0;
                Dcounter  <= 0;
                --  Pcounter <= 0;
                Pcounter  <= x"00000000";
                MBsig     <= '0';
                Dsig      <= '0';
                Psig      <= '0';
                -- increments PC or resets PC to zero. enables stop register if it has completed the last instruction
                if(PC = conv_integer(N_reg(7 downto 0))*6) then
                    PC  <= 0;
                    if(M = M_reg_cmp) then
                        status_reg(0) <= '1';
                    else
                        M <= M + 1;
                    end if;
                else
                    PC <= PC + 6 ;
                end if;
                -- increments P if MB and D are active
                elsif((MBsig and Dsig) = '1') then
                    if(Pcounter = P) then
                        Psig <= '1';
                    else
                        Pcounter <= Pcounter + one;
                        Psig <= '0';
                    end if;
                    -- turn amplifiers off
                    gpio(13) <= '0';
                    gpio(12) <= '0';
                -- increments D if MB is active
                elsif(MBsig = '1') then
                    if(Dcounter = D) then
                        Dsig <= '1';
                    else
                        Dcounter <= Dcounter + 1;
                        Dsig <= '0';
                    end if;
                else
                    if(MBcounter = MB) then
                        MBsig <= '1';
                    else
                        MBsig <= '0';
                        MBcounter <= MBcounter + 1;
                        -- send Ethernet packet at the very start
                        if(MBcounter <= 2) then
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
            elsif(triggers(0) = '0') then
                PC              <= 0;
                M               <= (others => '0');
                status_reg(0)   <= '0';
                sys_rst_i       <= '0';				-- turn ethernet on (was off)
                udp_send_packet <= '0';
                --	set counters to zero
                MBcounter       <= 0;
                Dcounter        <= 0;
                --Pcounter <= 0;
                Pcounter        <= x"00000000";
                -- turn amplifiers off
                gpio(13)        <= '0';
                gpio(12)        <= '0';
                -- turn off MB, D and P signals
                MBsig           <= '0';
                Dsig            <= '0';
                Psig            <= '0';
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

end rtl;
