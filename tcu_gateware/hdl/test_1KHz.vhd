library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity tcu_top is
port
(
    -- GPIO, LED and CLOCK pins
    gpio_IN                     : in    std_logic_vector(1 downto 0);
    gpio_OUT                    : out   std_logic_vector(15 downto 2);
    led_OUT                     : out   std_logic_vector(7 downto 0);
    sys_clk_100MHz_ext_IN       : in    std_logic;
    sys_clk_100MHz_int_p_IN     : in    std_logic;
    sys_clk_100MHz_int_n_IN     : in    std_logic

    -- TODO: ethernet, fmc pins

);
end tcu_top;

-------------------------------------------------------------------------------
-- Architecture of tcu_top
-------------------------------------------------------------------------------

architecture rtl of tcu_top is

    ---------------------------------------------------------------------------
    -- Clock signals
    ---------------------------------------------------------------------------

    signal sys_clk_100MHz_int   : std_logic := '0';                             -- internal 100MHz clock
    signal sys_clk_100MHz_ext   : std_logic := '0';                             -- external 100MHz clock coming in from FMC0 J1 P1
    signal clk_sel              : std_logic := '0';                             -- used to switch between internal and external 100MHz clocks
    signal sys_clk_100MHz       : std_logic := '0';                             -- driven by one of the above signal
    signal clk_locked           : std_logic := '0';                             -- clock locked indicator

    -- synthesized clocks
    signal chipscope_clk        : std_logic := '0';                             -- 400MHz
    signal clk_100MHz              : std_logic := '0';                             -- 100MHz
    signal clk_10MHz           : std_logic := '0';                             -- 10MHz
    signal clk_4MHz           : std_logic := '0';


    signal pri_out_100MHz           : std_logic := '0';
    signal pri_out_10MHz           : std_logic := '0';
    signal pri_out_4MHz           : std_logic := '0';
    signal trigger_in           : std_logic := '0';

    signal count_100MHz : unsigned(31 downto 0) := (others=>'0');
    signal count_10MHz : unsigned(31 downto 0) := (others=>'0');
    signal count_4MHz : unsigned(31 downto 0) := (others=>'0');


    ---------------------------------------------------------------------------
    -- Clocking component declaration
    ---------------------------------------------------------------------------

    COMPONENT clk_wiz_v3_6
	PORT(
		CLK_IN : IN std_logic;
		CLK_400MHz_OUT : OUT std_logic;
		CLK_100MHz_OUT : OUT std_logic;
		CLK_10MHz_OUT : OUT std_logic;
		CLK_4MHz_OUT : OUT std_logic;
		LOCKED : OUT std_logic
		);
	END COMPONENT;

begin


    ---------------------------------------------------------------------------
    -- Clocking components instantiation
    ---------------------------------------------------------------------------

    -- internal 100MHz Clock
    IBUFGDS_inst : IBUFGDS
    generic map (
        IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
        IOSTANDARD => "DEFAULT")
    port map (
        O => sys_clk_100MHz_int,        -- Clock buffer output
        I => sys_clk_100MHz_int_p_IN,   -- Diff_p clock buffer input
        IB => sys_clk_100MHz_int_n_IN   -- Diff_n clock buffer input
    );

    -- external 100MHz Clock
    IBUFG_inst : IBUFG
    generic map (
        IBUF_LOW_PWR => FALSE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
        IOSTANDARD => "DEFAULT")
    port map (
        O => sys_clk_100MHz_ext,    -- Clock buffer output
        I => sys_clk_100MHz_ext_IN  -- Clock buffer input (connect directly to top-level port)
    );


    -- sys_clk_100MHz <= sys_clk_100MHz_ext when clk_sel = '0' else sys_clk_100MHz_int;
    sys_clk_100MHz <=  sys_clk_100MHz_int;

    Inst_clk_wiz_v3_6: clk_wiz_v3_6
    PORT MAP(
        CLK_IN => sys_clk_100MHz,
        CLK_400MHz_OUT => chipscope_clk,
        CLK_100MHz_OUT => clk_100MHz,
        CLK_10MHz_OUT => clk_10MHz,
        CLK_4MHz_OUT => clk_4MHz,
        LOCKED => clk_locked
    );

    sig_1KHz_100MHz : process(clk_100MHz)
    begin
        if rising_edge(clk_100MHz) then
            if count_100MHz = x"c34f" then  -- 50000 ticks
                pri_out_100MHz <= not pri_out_100MHz;
                count_100MHz <= (others=>'0');
            else
                count_100MHz <= count_100MHz + x"00000001";
            end if;
        end if;
    end process;

    sig_1KHz_10MHz : process(clk_10MHz)
    begin
        if rising_edge(clk_10MHz) then
            if count_10MHz = x"1387" then  -- 5000 ticks
                pri_out_10MHz <= not pri_out_10MHz;
                count_10MHz <= (others=>'0');
            else
                count_10MHz <= count_10MHz + x"00000001";
            end if;
        end if;
    end process;

    sig_1KHz_4MHz : process(clk_4MHz)
    begin
        if rising_edge(clk_4MHz) then
            if count_4MHz = x"07cf" then  -- 2000 ticks
                pri_out_4MHz <= not pri_out_4MHz;
                count_4MHz <= (others=>'0');
            else
                count_4MHz <= count_4MHz + x"00000001";
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- GPIO
    ---------------------------------------------------------------------------

    trigger_in <= gpio_IN(0);
    clk_sel <= gpio_IN(1);
    gpio_OUT(2) <= pri_out_100MHz;
    gpio_OUT(3) <= pri_out_10MHz;
    gpio_OUT(4) <= pri_out_4MHz;
    gpio_OUT(5) <= '0';
    gpio_OUT(6) <= '0';
    gpio_OUT(7) <= '0';
    gpio_OUT(8) <= '0';
    gpio_OUT(9) <= '0';
    gpio_OUT(10) <= '0';
    gpio_OUT(11) <= '0';
    gpio_OUT(12) <= '0';
    gpio_OUT(13) <= '0';
    gpio_OUT(14) <= '0';
    gpio_OUT(15) <= '0';

    led_OUT(0) <= clk_locked;
    led_OUT(1) <= clk_sel;
    led_OUT(2) <= '0';
    led_OUT(3) <= '0';
    led_OUT(4) <= '0';
    led_OUT(5) <= '0';
    led_OUT(6) <= '0';
    led_OUT(7) <= '0';

end rtl;
