library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity pulse_counter is
  port (
    clk_IN              : in  std_logic;
    pulse_IN            : in  std_logic;
    rst_IN              : in  std_logic;
    en_IN               : in  std_logic;
    num_transfers_IN    : in  std_logic_vector(31 downto 0);
    count_OUT           : out  std_logic_vector(31 downto 0);
    done_OUT            : out std_logic
  );
end entity;

architecture behave of pulse_counter is

    signal pulse_count : unsigned(31 downto 0) := (others=>'0');

begin

    pulse_couting : process(clk_IN, rst_IN, en_IN, pulse_IN)
    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then
                pulse_count <= (others => '0');
            elsif en_IN = '1' then
                if pulse_IN = '1' then
                    pulse_count <= pulse_count + x"00000001";
                else
                    pulse_count <= pulse_count;
                end if;
            else
                pulse_count <= pulse_count;
            end if;
        end if;
    end process;

    count_OUT <= std_logic_vector(pulse_count);
    done_OUT <= '1' when pulse_count >= unsigned(num_transfers_IN) else '0';
end architecture;
