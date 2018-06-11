-- tcu_fc.vhd
-- TIMING CONTROL UNIT FSM + i/o Controller
-- Platform independent version

-- TODO:
--      fix generics, either give all or nothing
--      drive pulse_index_OUT

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tcu_fc is
generic(
        PULSE_PARAMS_WIDTH      : natural := 80;
        PULSE_PARAMS_ADDR_WIDTH : natural := 5;
        CONTROLLER_PARAMS_WIDTH : natural := 16;
        INSTRUCTION_WIDTH       : natural := 16;
        STATUS_WIDTH            : natural := 16
    );
port(
        clk_IN                  : in  std_logic;
        rst_IN                  : in  std_logic;
        trigger_IN              : in  std_logic;

        -- instruction and data registers
        instruction_IN          : in  std_logic_vector(INSTRUCTION_WIDTH-1        downto 0);
        -- controller_params_IN    : in  std_logic_vector(CONTROLLER_PARAMS_WIDTH-1  downto 0);
        num_pulses_IN           : in  std_logic_vector(15 downto 0);
        num_repeats_IN          : in  std_logic_vector(31 downto 0);
        x_amp_delay_IN          : in  std_logic_vector(15 downto 0);
        l_amp_delay_IN          : in  std_logic_vector(15 downto 0);
        pre_pulse_IN            : in  std_logic_vector(15 downto 0);
        pri_pulse_width_IN      : in  std_logic_vector(31 downto 0);
        pulse_params_IN         : in  std_logic_vector(PULSE_PARAMS_WIDTH-1       downto 0);
        pulse_index_OUT         : out std_logic_vector(PULSE_PARAMS_ADDR_WIDTH-1  downto 0);
        status_OUT              : out std_logic_vector(STATUS_WIDTH-1             downto 0);

        -- amp bias and polarization switches
        bias_x_OUT              : out std_logic;
        bias_l_OUT              : out std_logic;
        pol_tx_x_OUT            : out std_logic;
        pol_tx_l_OUT            : out std_logic;
        pol_rx_l_OUT            : out std_logic;
        pri_OUT                 : out std_logic

        -- TODO: ethernet ports for frequency setting to REX
    );
end tcu_fc;

architecture behave of tcu_fc is

    -- tcu fsm signals
    type state_type is (IDLE, ARMED, PRE_PULSE, MAIN_BANG, DIGITIZE, DONE, FAULT);
    signal state                    : state_type := IDLE;

    -- amplifier signals
    signal start_amp_flag           : std_logic                     := '0';
    signal amp_on_duration          : unsigned(15 downto 0)         := (others => '0');
    signal amp_on_counter           : unsigned(15 downto 0)         := (others => '0');
    signal amp_on                   : std_logic                     := '0';
    signal sw_off_delay             : unsigned(15 downto 0)         := (others => '0');

    -- amplifier active high/low constants, change if needed
    constant X_POL_TX_HORIZONTAL    : std_logic := '0';
    constant X_POL_TX_VERTICAL      : std_logic := not X_POL_TX_HORIZONTAL;
    constant L_POL_TX_HORIZONTAL    : std_logic := '0';
    constant L_POL_TX_VERTICAL      : std_logic := not L_POL_TX_HORIZONTAL;
    constant L_POL_RX_HORIZONTAL    : std_logic := '0';
    constant L_POL_RX_VERTICAL      : std_logic := not L_POL_RX_HORIZONTAL;
    constant X_AMP_ON               : std_logic := '0';
    constant X_AMP_OFF              : std_logic := not X_AMP_ON;
    constant L_AMP_ON               : std_logic := '1';
    constant L_AMP_OFF              : std_logic := not L_AMP_ON;

    -- pri signals
    signal start_pri_flag           : std_logic                     := '0';
    signal pri_on_duration          : unsigned(31 downto 0)         := (others => '0');
    signal pri_on_counter           : unsigned(31 downto 0)         := (others => '0');
    signal pri_on                   : std_logic                     := '0';

    -- pulse parameters signals
    signal pre_pulse_duration       : unsigned(15 downto 0)         := (others => '0');
    signal main_bang_duration       : unsigned(15 downto 0)         := (others => '0');
    signal digitization_duration    : unsigned(31 downto 0)         := (others => '0');
    signal pol_mode                 : std_logic_vector(2 downto 0)  := (others => '0');

    -- other signals
    signal pulse_index              : unsigned(4 downto 0)          := (others => '0');
    alias  soft_arm                 : std_logic is instruction_IN(0);
    signal pre_pulse_counter        : unsigned(15 downto 0)         := (others => '0');
    signal main_bang_counter        : unsigned(15 downto 0)         := (others => '0');
    signal digitize_counter         : unsigned(31 downto 0)         := (others => '0');
    signal block_counter            : unsigned(31 downto 0)         := (others => '0');

begin

    -- pulse parameter decoding
    pre_pulse_duration      <= unsigned(pre_pulse_IN); -- = 30us
    main_bang_duration      <= unsigned(pulse_params_IN(15 downto 0));
    digitization_duration   <= unsigned(pulse_params_IN(47 downto 32) & pulse_params_IN(31 downto 16));-- =
    pol_mode                <= pulse_params_IN(50 downto 48);
    -- TODO: frequency to Pentek

    -- TCU FSM
    fsm : process(clk_IN, rst_IN, trigger_IN)
    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then
                pre_pulse_counter   <= (others => '0');
                main_bang_counter   <= (others => '0');
                digitize_counter    <= (others => '0');
                block_counter       <= (others => '0');
                state               <= IDLE;
                start_amp_flag      <= '0';
                start_pri_flag      <= '0';
            else

                case(state) is

                    when IDLE =>
                        status_OUT(2 downto 0) <= "000";
                        if soft_arm = '1' then
                            state <= ARMED;
                        else
                            state <= IDLE;
                        end if;

                    when ARMED =>
                        status_OUT(2 downto 0) <= "001";
                        if soft_arm = '0' then
                            state <= IDLE;
                        elsif trigger_IN = '1' then
                            state <= PRE_PULSE;
                        else
                            state <= ARMED;
                        end if;

                    when PRE_PULSE =>
                        status_OUT(2 downto 0) <= "010";
                        start_amp_flag <= '1';
                        pre_pulse_counter <= pre_pulse_counter + x"0001";
                        if pre_pulse_counter = (pre_pulse_duration-1) then
                            start_amp_flag <= '0';
                            start_pri_flag <= '1';
                            state <= MAIN_BANG;
                            pre_pulse_counter <= (others => '0');
                        else
                            state <= PRE_PULSE;
                        end if;

                    when MAIN_BANG =>
                        status_OUT(2 downto 0) <= "011";
                        start_pri_flag <= '0';
                        main_bang_counter <= main_bang_counter + x"0001";
                        if main_bang_counter = (main_bang_duration-1) then
                            state <= DIGITIZE;
                            main_bang_counter <= (others => '0');
                        else
                            state <= MAIN_BANG;
                        end if;

                    when DIGITIZE =>
                        status_OUT(2 downto 0) <= "100";
                        digitize_counter <= digitize_counter + x"00000001";

                        if digitize_counter = (digitization_duration-1)  then
                            pulse_index <= pulse_index + "00001";
                            digitize_counter <= (others => '0');

                            if block_counter = (unsigned(num_repeats_IN)) then
                                block_counter <= (others => '0');
                                state <= DONE;
                            else
                                if pulse_index = (unsigned(num_pulses_IN)-1) then
                                    block_counter <= block_counter + x"00000001";
                                    pulse_index <= (others => '0');
                                end if;

                                state <= PRE_PULSE;
                            end if;
                        else
                            state <= DIGITIZE;
                        end if;

                    when DONE =>
                        status_OUT(2 downto 0) <= "101";
                        state <= DONE;

                    when OTHERS =>
                        status_OUT(2 downto 0) <= "110";
                        state <= FAULT;
                end case;

            end if;
        end if;
    end process;

    pulse_index_OUT <= std_logic_vector(pulse_index);

    amplifiers : process(clk_IN, rst_IN, start_amp_flag)
    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then
                amp_on <= '0';
                amp_on_counter <= (others => '0');
            else
                if start_amp_flag = '1' then
                    amp_on <= '1';
                end if;
                if amp_on = '1' then
                    amp_on_counter <= amp_on_counter + x"0001";
                    if amp_on_counter = (amp_on_duration-3) then -- -3 to compensate for 2 cycle lag
                        amp_on <= '0';
                        amp_on_counter <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

    sw_off_delay    <= unsigned(l_amp_delay_IN) when pol_mode(2) = '0' else unsigned(x_amp_delay_IN);
    amp_on_duration <= pre_pulse_duration + main_bang_duration - sw_off_delay;
    bias_L_OUT  <= '1' when amp_on = '1' and pol_mode(2) = '0' else '0';
    bias_X_OUT  <= '1' when amp_on = '1' and pol_mode(2) = '1' else '0';

    pri : process(clk_IN, rst_IN, start_pri_flag)
    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then
                pri_on <= '0';
                pri_on_counter <= (others => '0');
            else
                if start_pri_flag = '1' then
                    pri_on <= '1';
                end if;
                if pri_on = '1' then
                    pri_on_counter <= pri_on_counter + x"000001";
                    if pri_on_counter = (pri_on_duration-1) then
                        pri_on <= '0';
                        pri_on_counter <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

    pri_on_duration <= unsigned(pri_pulse_width_IN);
    pri_OUT <= pri_on;

    amp_pol_switches : process(clk_IN, rst_IN, state)
    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then
                pol_rx_l_OUT <= '0';
                pol_tx_l_OUT <= '0';
                pol_tx_x_OUT <= '0';
            else
                --  X-band pulse
                if pol_mode(2) = '1' then
                    if pol_mode(0) = '0' then
                        pol_tx_x_OUT <= X_POL_TX_HORIZONTAL;
                    else
                        pol_tx_x_OUT <= X_POL_TX_VERTICAL;
                    end if;

                -- L-band pulse
                else
                    if pol_mode(1) = '1' then
                        pol_tx_l_OUT <= L_POL_TX_HORIZONTAL;
                    else
                        pol_tx_l_OUT <= L_POL_TX_VERTICAL;
                    end if;
                    if pol_mode(0) = '1' then
                        pol_rx_l_OUT <= L_POL_RX_HORIZONTAL;
                    else
                        pol_rx_l_OUT <= L_POL_RX_VERTICAL;
                    end if;
                end if;
            end if;
        end if;
    end process;

end behave;
