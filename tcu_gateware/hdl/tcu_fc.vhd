-- tcu_fc.vhd
-- TIMING CONTROL UNIT FSM + Controller
-- Platform independent version


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tcu_fc is
generic(
        PULSE_PARAMS_WIDTH      : natural := 96;
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
        pri_pulse_width_IN      : in  std_logic_vector(31 downto 0);
        pulse_params_IN         : in  std_logic_vector(PULSE_PARAMS_WIDTH-1       downto 0);
        pulse_index_OUT         : out std_logic_vector(PULSE_PARAMS_ADDR_WIDTH-1  downto 0);
        status_OUT              : out std_logic_vector(STATUS_WIDTH-1             downto 0);

        -- amp bias and polarization switches
        bias_X_OUT              : out std_logic;
        bias_L_OUT              : out std_logic;
        pol_tx_X_OUT            : out std_logic;
        bias_tx_L_OUT           : out std_logic;
        bias_rx_L_OUT           : out std_logic;
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
    pre_pulse_duration      <= unsigned(pulse_params_IN(15 downto 0)); -- = 30us
    main_bang_duration      <= unsigned(pulse_params_IN(31 downto 16));-- = rf_pulse_width
    digitization_duration   <= unsigned(pulse_params_IN(47 downto 32) & pulse_params_IN(95 downto 80));-- =
    pol_mode                <= pulse_params_IN(66 downto 64);

    -- TCU FSM
    fsm : process(clk_IN, rst_IN, trigger_IN)
    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then

            else

                case(state) is

                    when IDLE =>
                        if soft_arm = '1' then
                            state <= ARMED;
                        else
                            state <= IDLE;
                        end if;

                    when ARMED =>
                        if soft_arm = '0' then
                            state <= IDLE;
                        elsif trigger_IN = '1' then
                            state <= PRE_PULSE;
                        else
                            state <= ARMED;
                        end if;

                    when PRE_PULSE =>
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
                        start_pri_flag <= '0';
                        main_bang_counter <= main_bang_counter + x"0001";
                        if main_bang_counter = (main_bang_duration-1) then
                            state <= DIGITIZE;
                            main_bang_counter <= (others => '0');
                        else
                            state <= MAIN_BANG;
                        end if;

                    when DIGITIZE =>
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




                        if pulse_index = unsigned(num_repeats_IN) then

                        end if;

                    when DONE =>
                        state <= DONE;

                    when OTHERS =>
                        state <= FAULT;
                end case;

            end if;
        end if;
    end process;

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
                    if amp_on_counter = (amp_on_duration-1) then
                        amp_on <= '0';
                        amp_on_counter <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

    sw_off_delay    <= unsigned(l_amp_delay_IN) when pol_mode(2) = '0' else unsigned(x_amp_delay_IN);
    amp_on_duration <= pre_pulse_duration + main_bang_duration - sw_off_delay;

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

end behave;
