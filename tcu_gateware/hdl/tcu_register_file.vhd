-- tcu_reg_file.vhd
-- Platform independent module containing the config/control registers for
-- the Timing Control Unit

-- TODO:
--      modify num of pulses

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tcu_reg_file is
port(
        clk_IN                  : in  std_logic;
        rst_IN                  : in  std_logic;

        pulse_index_IN          : in  std_logic_vector(4 downto 0);

        -- reg inputs
        status_IN               : in  std_logic_vector(15 downto 0);
        instruction_IN          : in  std_logic_vector(15 downto 0);
        num_pulses_IN           : in  std_logic_vector(15 downto 0);
        num_repeats_IN          : in  std_logic_vector(31 downto 0);
        x_amp_delay_IN          : in  std_logic_vector(15 downto 0);
        l_amp_delay_IN          : in  std_logic_vector(15 downto 0);
        pri_pulse_width_IN      : in  std_logic_vector(31 downto 0);
        pulse_0_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_1_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_2_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_3_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_4_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_5_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_6_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_7_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_8_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_9_params_IN       : in  std_logic_vector(95 downto 0);
        pulse_10_params_IN      : in  std_logic_vector(95 downto 0);
        pulse_11_params_IN      : in  std_logic_vector(95 downto 0);
        pulse_12_params_IN      : in  std_logic_vector(95 downto 0);
        pulse_13_params_IN      : in  std_logic_vector(95 downto 0);
        pulse_14_params_IN      : in  std_logic_vector(95 downto 0);
        pulse_15_params_IN      : in  std_logic_vector(95 downto 0);

        -- reg outputs
        status_OUT              : out std_logic_vector(15 downto 0);
        instruction_OUT         : out std_logic_vector(15 downto 0);
        num_pulses_OUT          : out std_logic_vector(15 downto 0);
        num_repeats_OUT         : out std_logic_vector(31 downto 0);
        x_amp_delay_OUT         : out std_logic_vector(15 downto 0);
        l_amp_delay_OUT         : out std_logic_vector(15 downto 0);
        pri_pulse_width_OUT     : out std_logic_vector(31 downto 0);
        pulse_params_OUT        : out std_logic_vector(95 downto 0)

    );
end entity;

architecture behave of tcu_reg_file is

    signal pulse_index          : std_logic_vector(4 downto 0) := (others => '0');

    -- 256 x 16 pulse_params storage
    -- type   ram_type is array (255 downto 0) of std_logic_vector(15 downto 0);
    type   ram_type is array (31 downto 0) of std_logic_vector(95 downto 0);
    signal pulse_params_ram     : ram_type                      := (others => (others => '1'));
    -- signal selected_pulse       : std_logic_vector(95 downto 0) := (others => '0');

    signal status               : std_logic_vector(15 downto 0) := (others => '0');
    signal instruction          : std_logic_vector(15 downto 0) := (others => '0');
    signal num_pulses           : std_logic_vector(15 downto 0) := (others => '0');
    signal num_repeats          : std_logic_vector(31 downto 0) := (others => '0');
    signal x_amp_delay          : std_logic_vector(15 downto 0) := (others => '0');
    signal l_amp_delay          : std_logic_vector(15 downto 0) := (others => '0');
    signal pri_pulse_width      : std_logic_vector(31 downto 0) := (others => '0');


begin

    reg_io : process(clk_IN, rst_IN)
    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then
                pulse_index             <= (others => '0');
                -- selected_pulse          <= (others => '0');
                status                  <= (others => '0');
                instruction             <= (others => '0');
                num_pulses              <= (others => '0');
                num_repeats             <= (others => '0');
                x_amp_delay             <= (others => '0');
                l_amp_delay             <= (others => '0');
                pri_pulse_width         <= (others => '0');

            else

                pulse_index             <= pulse_index_IN;
                -- selected_pulse          <= pulse_params_ram(to_integer(unsigned(pulse_index)));
                -- pulse_params_OUT        <= pulse_params_ram(to_integer(unsigned(pulse_index)));
                status                  <= status_IN;
                instruction             <= instruction_IN;
                num_pulses              <= num_pulses_IN;
                num_repeats             <= num_repeats_IN;
                x_amp_delay             <= x_amp_delay_IN;
                l_amp_delay             <= l_amp_delay_IN;
                pri_pulse_width         <= pri_pulse_width_IN;
                pulse_params_ram(0)     <= pulse_0_params_IN;
                -- pulse_params_ram(1)     <= pulse_1_params_IN;
                -- pulse_params_ram(2)     <= pulse_2_params_IN;
                -- pulse_params_ram(3)     <= pulse_3_params_IN;
                -- pulse_params_ram(4)     <= pulse_4_params_IN;
                -- pulse_params_ram(5)     <= pulse_5_params_IN;
                -- pulse_params_ram(6)     <= pulse_6_params_IN;
                -- pulse_params_ram(7)     <= pulse_7_params_IN;
                -- pulse_params_ram(8)     <= pulse_8_params_IN;
                -- pulse_params_ram(9)     <= pulse_9_params_IN;
                -- pulse_params_ram(10)    <= pulse_10_params_IN;
                -- pulse_params_ram(11)    <= pulse_11_params_IN;
                -- pulse_params_ram(12)    <= pulse_12_params_IN;
                -- pulse_params_ram(13)    <= pulse_13_params_IN;
                -- pulse_params_ram(14)    <= pulse_14_params_IN;
                -- pulse_params_ram(15)    <= pulse_15_params_IN;
            end if;
            -- status_OUT                  <= status;
            instruction_OUT             <= instruction;
            num_pulses_OUT              <= num_pulses;
            num_repeats_OUT             <= num_repeats;
            x_amp_delay_OUT             <= x_amp_delay;
            l_amp_delay_OUT             <= l_amp_delay;
            pri_pulse_width_OUT         <= pri_pulse_width;
            pulse_params_OUT            <= pulse_params_ram(to_integer(unsigned(pulse_index)));
            -- pulse_params_OUT        <=  pulse_params_ram(to_integer(unsigned(pulse_index)))     &
            --                             pulse_params_ram(to_integer(unsigned(pulse_index))+1)   &
            --                             pulse_params_ram(to_integer(unsigned(pulse_index))+2)   &
            --                             pulse_params_ram(to_integer(unsigned(pulse_index))+3)   &
            --                             pulse_params_ram(to_integer(unsigned(pulse_index))+4)   &
            --                             pulse_params_ram(to_integer(unsigned(pulse_index))+5);
        end if;
    end process;

    pulse_param_ram : process(clk_IN, rst_IN, pulse_index_IN)
    begin
        if rising_edge(clk_IN) then

        end if;
    end process;



end architecture;
