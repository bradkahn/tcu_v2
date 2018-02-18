library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity amp_controller is
  port (
    clk_IN  : in std_logic;
    rst_IN  : in std_logic;
    en_IN  : in std_logic; -- link to 'run'
    count_IN  : in std_logic_vector(16 downto 0); -- from pri_generator
    mode_IN  : in std_logic_vector(2 downto 0); -- mode pulse param
    x_amp_on_duration_IN  : in std_logic_vector(15 downto 0); -- from registers (eventually)
    l_amp_on_duration_IN  : in std_logic_vector(15 downto 0); -- from registers (eventually)
    x_amp_OUT : out std_logic;
    l_amp_OUT : out std_logic
    -- todo: polarisation switches
  );
end entity;

architecture behave of amp_controller is

    signal x_amp : std_logic := '0';
    signal l_amp : std_logic := '0';
    signal count_int : integer range 0 to 100000 := 0;
    signal mode_int : integer range 0 to 5 := 0;
    signal x_amp_on_duration_int : integer range 0 to 65535 := 0;
    signal l_amp_on_duration_int : integer range 0 to 65535 := 0;

begin

    count_int <= to_integer(unsigned(count_IN));
    mode_int <= to_integer(unsigned(mode_IN));
    x_amp_on_duration_int <= to_integer(unsigned(x_amp_on_duration_IN));
    l_amp_on_duration_int <= to_integer(unsigned(l_amp_on_duration_IN));

    process(clk_IN, rst_IN, en_IN)

    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then
                x_amp <= '0';
                l_amp <= '0';
            elsif en_IN = '1' then
                case(mode_int) is
                    -- l amp
                    when 0 to 3 =>
                        if count_int >= 0 and count_int < l_amp_on_duration_int then
                            l_amp <= '1';
                        else
                            l_amp <= '0';
                        end if;
                    -- x amp
                    when 4 to 5 =>
                        if count_int >= 0 and count_int < x_amp_on_duration_int then
                            x_amp <= '1';
                        else
                            x_amp <= '0';
                        end if;
                    when others =>
                        x_amp <= '0';
                        l_amp <= '0';
                end case;
            else
                x_amp <= '0';
                l_amp <= '0';
            end if;
        end if;
    end process;

    x_amp_OUT <= x_amp;
    l_amp_OUT <= l_amp;

end architecture;
