library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tcu_fc_reg_top is
  port (
        -- External clock source
        i_CLK_P         : in std_logic;
        i_CLK_N         : in std_logic;
        o_LOGIC_HIGH    : out std_logic;

        -- GPMC ports
        i_GPMC_A        : in    std_logic_vector(10 downto 1);
        io_GPMC_D       : inout std_logic_vector(15 downto 0);
        i_GPMC_CLK      : in    std_logic;
        i_GPMC_N_CS     : in    std_logic_vector(6  downto 0);
        i_GPMC_N_WE     : in    std_logic;
        i_GPMC_N_OE     : in    std_logic;
        i_GPMC_N_ADV_ALE: in    std_logic;

        -- Interface ports
        i_TRIGGER       : in  std_logic;
        o_BIAS_X        : out std_logic;
        o_BIAS_L        : out std_logic;
        o_POL_TX_X      : out std_logic;
        o_POL_TX_L      : out std_logic;
        o_POL_RX_L      : out std_logic;
        o_PRI           : out std_logic;

        -- LED indicator ports
        o_LED_RHINO     : out   std_logic_vector(7 downto 0);
        o_LED_FMC       : out   std_logic_vector(3 downto 0)

        -- TODO: 1Gbps ethernet ports
  );
end entity;

architecture structural of tcu_fc_reg_top is
    COMPONENT gpmc_wb
    PORT(
        gpmc_a          : IN    std_logic_vector(10 downto 1);
        gpmc_clk_i      : IN    std_logic;
        gpmc_n_cs       : IN    std_logic_vector(6 downto 0);
        gpmc_n_we       : IN    std_logic;
        gpmc_n_oe       : IN    std_logic;
        gpmc_n_adv_ale  : IN    std_logic;
        sys_clk_P       : IN    std_logic;
        sys_clk_N       : IN    std_logic;
        ACK_I           : IN    std_logic;
        DAT_I           : IN    std_logic_vector(15 downto 0);
        ADR_O           : OUT   std_logic_vector(7 downto 0);
        gpmc_d          : INOUT std_logic_vector(15 downto 0);
        CLK_400MHz      : OUT   std_logic;
        CLK_100MHz      : OUT   std_logic;
        debug_port      : OUT   std_logic_vector(52 downto 0);
        CLK             : OUT   std_logic;
        RST             : OUT   std_logic;
        DAT_O           : OUT   std_logic_vector(15 downto 0);
        WE_O            : OUT   std_logic;
        slave_sel_OUT   : OUT   std_logic
        );
    END COMPONENT;

    -- Interconnecting signals


    signal s_clk_100    : std_logic;
    signal s_rst_sys    : std_logic;
    signal s_clk_wb     : std_logic;
    signal s_rst_wb     : std_logic;
    signal s_ack        : std_logic;
    signal s_dat_m2s    : std_logic_vector(15 downto 0);
    signal s_dat_s2m    : std_logic_vector(15 downto 0);
    signal s_adr        : std_logic_vector(7 downto 0);
    signal s_we         : std_logic;
    signal s_slave_sel  : std_logic;

    COMPONENT tcu_fc_reg
    PORT(
	     control_INOUT : inout std_logic_vector(35 downto 0);

        clk_IN          : IN    std_logic;
        rst_IN          : IN    std_logic;
        trigger_IN      : IN    std_logic;
        CLK_I           : IN    std_logic;
        RST_I           : IN    std_logic;
        STB_I           : IN    std_logic;
        WE_I            : IN    std_logic;
        DAT_I           : IN    std_logic_vector(15 downto 0);
        ADR_I           : IN    std_logic_vector(7 downto 0);
        status_OUT      : OUT   std_logic_vector(15 downto 0);
        bias_x_OUT      : OUT   std_logic;
        bias_l_OUT      : OUT   std_logic;
        pol_tx_x_OUT    : OUT   std_logic;
        pol_tx_l_OUT    : OUT   std_logic;
        pol_rx_l_OUT    : OUT   std_logic;
        pri_OUT         : OUT   std_logic;
        ACK_O           : OUT   std_logic;
        DAT_O           : OUT   std_logic_vector(15 downto 0)
        );
    END COMPONENT;
	 
	COMPONENT chipscope_icon
	PORT(       
		CONTROL0 : INOUT std_logic_vector(35 downto 0);
		CONTROL1 : INOUT std_logic_vector(35 downto 0)
		);
	END COMPONENT;

	signal s_control_0 : std_logic_vector(35 downto 0);
	signal s_control_1 : std_logic_vector(35 downto 0);
	signal s_gpmc_debug:	std_logic_vector(52 downto 0);
	signal s_clk_400MHz: std_logic;
	
		COMPONENT ila_wb
	PORT(
		CLK : IN std_logic;
		TRIG0 : IN std_logic_vector(52 downto 0);       
		CONTROL : INOUT std_logic_vector(35 downto 0)
		);
	END COMPONENT;
	
begin
	o_LOGIC_HIGH <= '1';
    Inst_gpmc_wb: gpmc_wb
    PORT MAP(
        gpmc_a          => i_GPMC_A,
        gpmc_d          => io_GPMC_D,
        gpmc_clk_i      => i_GPMC_CLK,
        gpmc_n_cs       => i_GPMC_N_CS,
        gpmc_n_we       => i_GPMC_N_WE,
        gpmc_n_oe       => i_GPMC_N_OE,
        gpmc_n_adv_ale  => i_GPMC_N_ADV_ALE,
        sys_clk_P       => i_CLK_P,
        sys_clk_N       => i_CLK_N,
        CLK_400MHz 		=> s_clk_400MHz,
        CLK_100MHz      => s_clk_100,
        debug_port 		=> s_gpmc_debug,
        CLK             => s_clk_wb,
        RST             => s_rst_wb,
        ACK_I           => s_ack,
        ADR_O           => s_adr,
        DAT_I           => s_dat_s2m,
        DAT_O           => s_dat_m2s,
        WE_O            => s_we,
        slave_sel_OUT   => s_slave_sel
    );

    Inst_tcu_fc_reg: tcu_fc_reg
    PORT MAP(
		control_INOUT => s_control_1,
        clk_IN          => s_clk_100,
        rst_IN          => s_rst_sys,
        trigger_IN      => i_TRIGGER,
        -- status_OUT(2 downto 0) => o_LED_RHINO(2 downto 0),
        bias_x_OUT      => o_BIAS_X,
        bias_l_OUT      => o_BIAS_L,
        pol_tx_x_OUT    => o_POL_TX_X,
        pol_tx_l_OUT    => o_POL_TX_L,
        pol_rx_l_OUT    => o_POL_RX_L,
        pri_OUT         => o_PRI,
        CLK_I           => s_clk_wb,
        RST_I           => s_rst_wb,
        STB_I           => s_slave_sel,
        WE_I            => s_we,
        DAT_I           => s_dat_m2s,
        ADR_I           => s_adr,
        ACK_O           => s_ack,
        DAT_O           => s_dat_s2m
    );

	Inst_chipscope_icon: chipscope_icon PORT MAP(
		CONTROL0 => s_control_0 ,
		CONTROL1 => s_control_1
	);
	
	Inst_ila_wb: ila_wb PORT MAP(
		CONTROL => s_control_0,
		CLK => s_clk_400MHz,
		TRIG0 => s_gpmc_debug
	);

end architecture;
