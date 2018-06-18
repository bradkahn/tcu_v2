library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

entity tcu_fc_reg is
    GENERIC (
        WB_DATA_BUS_WIDTH    : POSITIVE := 16;
        WB_ADDRESS_BUS_WIDTH : NATURAL := 8
    );
  port (

      -- ------------------------------------------------------------------------------------------------
      -- USER-DEFINED PORTS
      -- ------------------------------------------------------------------------------------------------
      clk_IN          : in    STD_LOGIC;
      rst_IN          : in    STD_LOGIC;
      trigger_IN      : in  std_logic;
      status_OUT      : out std_logic_vector(15 downto 0);
      bias_x_OUT      : out std_logic;
      bias_l_OUT      : out std_logic;
      pol_tx_x_OUT    : out std_logic;
      pol_tx_l_OUT    : out std_logic;
      pol_rx_l_OUT    : out std_logic;
      pri_OUT         : out std_logic;

    -- ------------------------------------------------------------------------------------------------
    -- DEBUG PORT
    -- ------------------------------------------------------------------------------------------------
    control_INOUT : inout std_logic_vector(35 downto 0);
      -- ------------------------------------------------------------------------------------------------
      -- WISHBONE PORTS - DO NOT MODIFY
      -- ------------------------------------------------------------------------------------------------
      CLK_I           : IN    STD_LOGIC;
      RST_I           : IN    STD_LOGIC;
      STB_I           : IN    STD_LOGIC;
      WE_I            : IN    STD_LOGIC;
      DAT_I           : IN    STD_LOGIC_VECTOR(WB_DATA_BUS_WIDTH - 1 DOWNTO 0);
      ADR_I           : IN    STD_LOGIC_VECTOR(WB_ADDRESS_BUS_WIDTH - 1 DOWNTO 0);
      ACK_O           : OUT   STD_LOGIC;
      DAT_O           : OUT   STD_LOGIC_VECTOR(WB_DATA_BUS_WIDTH - 1 DOWNTO 0)
  );
end entity;

architecture structural of tcu_fc_reg is

    signal pulse_index      : std_logic_vector (4 downto 0);
    signal status           : std_logic_vector (15 downto 0);
    signal instruction      : std_logic_vector (15 downto 0);
    signal pre_pulse        : std_logic_vector (15 downto 0);
    signal num_pulses       : std_logic_vector (15 downto 0);
    signal num_repeats      : std_logic_vector (31 downto 0);
    signal x_amp_delay      : std_logic_vector (15 downto 0);
    signal l_amp_delay      : std_logic_vector (15 downto 0);
    signal pri_pulse_width  : std_logic_vector (31 downto 0);
    signal pulse_params     : std_logic_vector (79 downto 0);

    signal clk_in_b         : std_logic;


    COMPONENT tcu_registers
    PORT(
        control_INOUT : inout std_logic_vector(35 downto 0);
        clk_IN : IN std_logic;
        rst_IN : IN std_logic;
        pulse_index_IN : IN std_logic_vector(4 downto 0);
        status_IN : IN std_logic_vector(15 downto 0);
        CLK_I : IN std_logic;
        RST_I : IN std_logic;
        STB_I : IN std_logic;
        WE_I : IN std_logic;
        DAT_I : IN std_logic_vector(15 downto 0);
        ADR_I : IN std_logic_vector(7 downto 0);
        status_OUT : OUT std_logic_vector(15 downto 0);
        instruction_OUT : OUT std_logic_vector(15 downto 0);
        num_pulses_OUT : OUT std_logic_vector(15 downto 0);
        num_repeats_OUT : OUT std_logic_vector(31 downto 0);
        x_amp_delay_OUT : OUT std_logic_vector(15 downto 0);
        l_amp_delay_OUT : OUT std_logic_vector(15 downto 0);
        pri_pulse_width_OUT : OUT std_logic_vector(31 downto 0);
        pulse_params_OUT : OUT std_logic_vector(79 downto 0);
        pre_pulse_OUT         : out   STD_LOGIC_VECTOR(15 DOWNTO 0);
        ACK_O : OUT std_logic;
        DAT_O : OUT std_logic_vector(15 downto 0)
        );
    END COMPONENT;

    COMPONENT tcu_fc
    PORT(
        clk_IN : IN std_logic;
        rst_IN : IN std_logic;
        trigger_IN : IN std_logic;
        instruction_IN : IN std_logic_vector(15 downto 0);
        num_pulses_IN : IN std_logic_vector(15 downto 0);
        num_repeats_IN : IN std_logic_vector(31 downto 0);
        x_amp_delay_IN : IN std_logic_vector(15 downto 0);
        l_amp_delay_IN : IN std_logic_vector(15 downto 0);
        pri_pulse_width_IN : IN std_logic_vector(31 downto 0);
        pulse_params_IN : IN std_logic_vector(79 downto 0);
        pulse_index_OUT : OUT std_logic_vector(4 downto 0);
        pre_pulse_IN   : in   STD_LOGIC_VECTOR(15 DOWNTO 0);
        status_OUT : OUT std_logic_vector(15 downto 0);
        bias_x_OUT : OUT std_logic;
        bias_l_OUT : OUT std_logic;
        pol_tx_x_OUT : OUT std_logic;
        pol_tx_l_OUT : OUT std_logic;
        pol_rx_l_OUT : OUT std_logic;
        pri_OUT : OUT std_logic
        );
    END COMPONENT;

begin
    Inst_tcu_registers: tcu_registers PORT MAP(
        control_INOUT => control_INOUT,
        clk_IN => clk_IN,
        rst_IN => rst_IN,
        pulse_index_IN => pulse_index,
        status_IN => status,
        status_OUT => status_OUT,
        instruction_OUT => instruction,
        num_pulses_OUT => num_pulses,
        num_repeats_OUT => num_repeats,
        x_amp_delay_OUT => x_amp_delay,
        l_amp_delay_OUT => l_amp_delay,
        pri_pulse_width_OUT => pri_pulse_width,
        pulse_params_OUT => pulse_params,
        pre_pulse_OUT => pre_pulse,
        CLK_I => CLK_I,
        RST_I => RST_I,
        STB_I => STB_I,
        WE_I => WE_I,
        DAT_I => DAT_I,
        ADR_I => ADR_I,
        ACK_O => ACK_O,
        DAT_O => DAT_O
    );

    Inst_tcu_fc: tcu_fc PORT MAP(
        clk_IN => clk_IN,
        rst_IN => rst_IN,
        trigger_IN => trigger_IN,
        instruction_IN => instruction,
        num_pulses_IN => num_pulses,
        num_repeats_IN => num_repeats,
        x_amp_delay_IN => x_amp_delay,
        l_amp_delay_IN => l_amp_delay,
        pri_pulse_width_IN => pri_pulse_width,
        pulse_params_IN => pulse_params,
        pulse_index_OUT => pulse_index,
        pre_pulse_IN => pre_pulse,
        status_OUT => status,
        bias_x_OUT => bias_x_OUT,
        bias_l_OUT => bias_l_OUT,
        pol_tx_x_OUT => pol_tx_x_OUT,
        pol_tx_l_OUT => pol_tx_l_OUT,
        pol_rx_l_OUT => pol_rx_l_OUT,
        pri_OUT => pri_OUT
    );

end architecture;
