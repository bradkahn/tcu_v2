library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity pri_generator is
    Port ( clk_IN : in  STD_LOGIC;
           en_IN : in  STD_LOGIC;
           rst_IN : in  STD_LOGIC;
           threshold_OUT : out  STD_LOGIC;
           pri_OUT : out  STD_LOGIC;
           count_OUT : out  STD_LOGIC_VECTOR(16 downto 0)
          );
end pri_generator;

architecture Structural of pri_generator is

	COMPONENT c_counter_binary_v11_0
	PORT(
		clk : IN std_logic;
		ce : IN std_logic;
		sclr : IN std_logic;          
		thresh0 : OUT std_logic;
		q : OUT std_logic_vector(16 downto 0)
		);
	END COMPONENT;

    
    signal threshold: std_logic := '0';
    signal pri: std_logic := '0';
    signal count : std_logic_vector (16 downto 0) := (others=>'0');
    signal count_int : integer range 0 to 100000 := 0;
    
begin

	Inst_c_counter_binary_v11_0: c_counter_binary_v11_0 
    PORT MAP(
		clk => clk_IN,
		ce => en_IN,
        sclr => rst_IN,
		thresh0 => threshold,
		q => count
	);
    
    count_int <= to_integer(unsigned(count));
    count_OUT <= count;
    threshold_OUT <= threshold;
    pri_OUT <= pri;
    
    process(clk_IN, rst_IN, count_int)
    begin
        if rising_edge(clk_IN) then
            if rst_IN = '1' then
                pri <= '0';
            else
                case (count_int) is
                    when 0 to 2999 => pri <= '0';
                    when 3000 to 5299 => pri <= '1';
                    when others => pri <= '0';
                end case;
            end if;
        end if;
    end process;

end Structural;
