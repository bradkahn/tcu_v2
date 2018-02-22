library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity tcu_top is
port
(
    -- FPGA-processor interface pins
    gpmc_a                      : in    std_logic_vector(10 downto 1);
    gpmc_d                      : inout std_logic_vector(15 downto 0);
    gpmc_clk_i                  : in    std_logic;
    gpmc_n_cs                   : in    std_logic_vector(6 downto 0);
    gpmc_n_we                   : in    std_logic;
    gpmc_n_oe                   : in    std_logic;
    gpmc_n_adv_ale              : in    std_logic;

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
    -- GPMC bus
    ---------------------------------------------------------------------------

    signal gpmc_address         : std_logic_vector(25 downto 0):=(others => '0');   -- Full de-multiplexed address bus (ref. 16 bits)
    signal gpmc_clk_i_b         : std_logic;                                        -- buffered gpmc_clk_i
    signal gpmc_data_o          : std_logic_vector(15 downto 0):=(others => '0');   -- Register for output bus value
    signal gpmc_data_i          : std_logic_vector(15 downto 0):=(others => '0');   -- Register for input bus value

    ---------------------------------------------------------------------------
    -- Memory type declarations
    ---------------------------------------------------------------------------

    type ram_type       is array (255 downto 0) of std_logic_vector(15 downto 0);
    type word32_type    is array (1 downto 0)   of std_logic_vector(15 downto 0);
    -- Support 64 memory banks, each with a maximum of 2MW
    ALIAS reg_bank_address : std_logic_vector(3 downto 0) IS gpmc_address(25 downto 22);
    -- Currently each register is 64 x 16
    ALIAS reg_file_address : std_logic_vector(7 downto 0) IS gpmc_address(7 downto 0);

    ---------------------------------------------------------------------------
    -- BORPH registers
    ---------------------------------------------------------------------------

    constant VERSION        : std_logic_vector(7 downto 0) := "00000010";       -- TODO: add VERSION register to symbol file to identify which TCU version is installed
    signal reg_bank         : ram_type := (others => "1111111111111111");       -- pulses reg, stores pulse parameters
    signal led_reg          : std_logic_vector(15 downto 0) := (others => '0'); -- lower 8 bits mapped to RHINO's LEDs for status indication
    signal bcd_int          : word32_type := (x"0000",x"0000");
    signal M_reg            : word32_type := (x"0000",x"0000");                 -- number of times each pulse must be cycled in an experiment
    signal M_reg_cmp        : std_logic_vector(31 downto 0);                    -- M_reg_cmp <= M_reg(1) & M_reg(0)
    signal N_reg            : std_logic_vector(15 downto 0) := x"0000";         -- number of unique pulses (N)
    signal status_reg       : std_logic_vector(15 downto 0) := (others => '0'); -- status_reg(0) used to indicate that all pulse repeats for experiment are completed

    ---------------------------------------------------------------------------
    -- Status signals
    ---------------------------------------------------------------------------

    signal ready            : std_logic;                                        -- indicates that experiment is ready to start, asserted when trigger(0) and gpioIn(0) are high
    signal MBsig            : std_logic;                                        -- indicates when Main Bang offset has been reached
    signal Dsig             : std_logic;                                        -- indicates when Digitisation offset has been reached
    signal Psig             : std_logic;                                        -- indicates when Next PRI offset has been reached

    ---------------------------------------------------------------------------
    -- Counters and offsets
    ---------------------------------------------------------------------------

    signal M_counter        : unsigned(31 downto 0) := x"00000000";             -- Number of repeats that have already ocurred
    signal MBoffset         : unsigned(15 downto 0) := x"0000";                 -- Main bang offset extracted from pulses reg
    signal MBcounter        : unsigned(15 downto 0) := x"0000";                 -- Main bang counter compared to Main bang offset
    signal DIGoffset        : unsigned(15 downto 0) := x"0000";                 -- Digitisation offset extracted from pulses reg
    signal DIGcounter       : unsigned(15 downto 0) := x"0000";                 -- Digitisation counter compared to Digitisation offset
    signal PRIoffset        : unsigned(31 downto 0) := x"00000000";             -- PRI offset extracted from pulses reg
    signal PRIcounter       : unsigned(31 downto 0) := x"00000000";             -- PRI counter compared to PRI offset

    signal triggers         : std_logic_vector(15 downto 0) := (others => '0'); -- triggers(0) 'soft on' / arming bit from register

    signal pulse_index      : unsigned(7 downto 0)  := x"00";                   -- Program Counter keeps track of current pulse
    signal dataout          : std_logic_vector(95 downto 0);                    -- Contains all pulse parameters for current pulse

    ---------------------------------------------------------------------------
    -- TCU interface constants
    ---------------------------------------------------------------------------

    -- change these depending on the logic level interface (active HIGH/LOW) the components:

    -- X band polarisation tx switch
    constant X_POL_TX_HORIZONTAL: std_logic := '0';
    constant X_POL_TX_VERTICAL  : std_logic := not X_POL_TX_HORIZONTAL;

    -- L band polarisation tx switch
    constant L_POL_TX_HORIZONTAL: std_logic := '0';
    constant L_POL_TX_VERTICAL  : std_logic := not L_POL_TX_HORIZONTAL;

    -- L band polarisation rx switch
    constant L_POL_RX_HORIZONTAL: std_logic := '0';
    constant L_POL_RX_VERTICAL  : std_logic := not L_POL_RX_HORIZONTAL;

    -- HPA switches
    constant X_AMP_ON           : std_logic := '0';
    constant X_AMP_OFF          : std_logic := not X_AMP_ON;
    constant L_AMP_ON           : std_logic := '1';
    constant L_AMP_OFF          : std_logic := not L_AMP_ON;

    ---------------------------------------------------------------------------
    -- TCU interface signals
    ---------------------------------------------------------------------------

    -- form GPSDO
    signal trigger_in          : std_logic := '0';
   -- PRI signal to Pentek
   signal pri_out              : std_logic := '0';
--
--    -- HPA switches
--    signal x_amp_switch         : std_logic := X_AMP_OFF;
--    signal l_amp_switch         : std_logic := L_AMP_OFF;
--
--    -- Polarisation switches
--    signal x_pol_tx             : std_logic := '0';
--    signal l_pol_tx             : std_logic := '0';
--    signal l_pol_rx             : std_logic := '0';

    ---------------------------------------------------------------------------
    -- TCU FSM Signal declaration section
    ---------------------------------------------------------------------------

    type state_type is (IDLE, ARMED, PRE_PULSE, MAIN_BANG, DIGITIZE, DONE, FAULT);
    signal state    : state_type := IDLE;

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
    signal sys_clk              : std_logic := '0';                             -- 100MHz
    signal status_clk           : std_logic := '0';                             -- 10MHz


    ---------------------------------------------------------------------------
    -- OTHER signals
    ---------------------------------------------------------------------------
    signal rst                  : std_logic := '0';
    signal run                  : std_logic := '1';
    signal threshold_out        : std_logic := '0';
    signal done_out             : std_logic := '0';
    signal x_amp_out            : std_logic := '0';
    signal l_amp_out            : std_logic := '0';
    signal global_counter       : std_logic_vector(16 downto 0) := (others=>'0');
    signal pulses_counter       : std_logic_vector(31 downto 0) := (others=>'0');

    signal control              : std_logic_vector(35 downto 0) := (others=>'0');


    ---------------------------------------------------------------------------
    -- TCU component declarations
    ---------------------------------------------------------------------------

    COMPONENT pri_generator
    PORT(
        clk_IN : IN std_logic;
        en_IN : IN std_logic;
        rst_IN : IN std_logic;
        threshold_OUT : OUT std_logic;
        pri_OUT : OUT std_logic;
        count_OUT : OUT std_logic_vector(16 downto 0)
      );
    END COMPONENT;

    COMPONENT amp_controller
    PORT(
        clk_IN : IN std_logic;
        rst_IN : IN std_logic;
        en_IN : IN std_logic;
        count_IN : IN std_logic_vector(16 downto 0);
        mode_IN : IN std_logic_vector(2 downto 0);
        x_amp_on_duration_IN : IN std_logic_vector(15 downto 0);
        l_amp_on_duration_IN : IN std_logic_vector(15 downto 0);
        x_amp_OUT : OUT std_logic;
        l_amp_OUT : OUT std_logic
      );
    END COMPONENT;

    COMPONENT pulse_counter
    PORT(
        clk_IN : IN std_logic;
        pulse_IN : IN std_logic;
        rst_IN : IN std_logic;
        en_IN : IN std_logic;
        num_transfers_IN : IN std_logic_vector(31 downto 0);
        count_OUT : OUT std_logic_vector(31 downto 0);
        done_OUT : OUT std_logic
      );
    END COMPONENT;

    ---------------------------------------------------------------------------
    -- Clocking component declaration
    ---------------------------------------------------------------------------

    COMPONENT clk_wiz_v3_6
    PORT(
        CLK_IN : IN std_logic;
        CLK_400MHz_OUT : OUT std_logic;
        CLK_100MHz_OUT : OUT std_logic;
        CLK_10MHz_OUT : OUT std_logic;
        LOCKED : OUT std_logic
    );
    END COMPONENT;

    ---------------------------------------------------------------------------
    -- TODO: chipscope debug cores declararation
    ---------------------------------------------------------------------------
    COMPONENT chipscope_ila
    PORT(
        CLK : IN std_logic;
        TRIG0 : IN std_logic_vector(52 downto 0);
        CONTROL : INOUT std_logic_vector(35 downto 0)
    );
    END COMPONENT;

    COMPONENT chipscope_icon
    PORT(
        CONTROL0 : INOUT std_logic_vector(35 downto 0)
    );
    END COMPONENT;
    ---------------------------------------------------------------------------
    -- TODO: Ethernet Signal declaration section
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- TODO: Ethernet Component declaration section
    ---------------------------------------------------------------------------
begin

  ---------------------------------------------------------------------------
  -- TCU components instantiation
  ---------------------------------------------------------------------------

    Inst_pri_generator: pri_generator
    PORT MAP(
        clk_IN => status_clk,
        en_IN => run,
        rst_IN => rst,
        threshold_OUT => threshold_out,
        pri_OUT => pri_out,
        count_OUT => global_counter
    );

    gpio_OUT(13) <= threshold_out;
    gpio_OUT(15) <= pri_out;

    Inst_amp_controller: amp_controller
    PORT MAP(
        clk_IN => status_clk,
        rst_IN => rst,
        en_IN => run,
        count_IN => global_counter,
        mode_IN => "000",
        x_amp_on_duration_IN => x"01EA", -- based on PW = 10u
        l_amp_on_duration_IN => x"0A8C",
        x_amp_OUT => x_amp_out,
        l_amp_OUT => l_amp_out
    );

    gpio_OUT(14) <= x_amp_out;
    gpio_OUT(12) <= l_amp_out;


    Inst_pulse_counter: pulse_counter
    PORT MAP(
        clk_IN => status_clk,
        pulse_IN => pri_out,
        rst_IN => rst,
        en_IN => run,
        num_transfers_IN => x"ffffffff",
        count_OUT => pulses_counter,
        done_OUT => done_out
    );

    gpio_OUT(11) <= done_out;
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

    -- 100MHz clock multiplexer
    -- BUFGMUX_inst : BUFGMUX
    -- generic map (
    --    CLK_SEL_TYPE => "SYNC"  -- Glitchles ("SYNC") or fast ("ASYNC") clock switch-over
    -- )
    -- port map (
    --    O => sys_clk_100MHz,         -- 1-bit output: Clock buffer output
    --    I0 => sys_clk_100MHz_ext,    -- 1-bit input: Clock buffer input (S=0)
    --    I1 => sys_clk_100MHz_int,    -- 1-bit input: Clock buffer input (S=1)
    --    S => clk_sel                 -- 1-bit input: Clock buffer select
    -- );

    sys_clk_100MHz <= sys_clk_100MHz_ext when clk_sel = '0' else sys_clk_100MHz_int;

    Inst_clk_wiz_v3_6: clk_wiz_v3_6
    PORT MAP(
        CLK_IN => sys_clk_100MHz,
        CLK_400MHz_OUT => chipscope_clk,
        CLK_100MHz_OUT => sys_clk,
        CLK_10MHz_OUT => status_clk,
        LOCKED => clk_locked
    );

    ---------------------------------------------------------------------------
    -- GPMC Interface
    ---------------------------------------------------------------------------

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
                    case to_integer(unsigned(reg_bank_address)) is
                        when 0 => gpmc_data_o <= status_reg;
                        when 1 => gpmc_data_o <= triggers;
                        when 2 => gpmc_data_o <= (others => '0');
                        when 3 => gpmc_data_o <= reg_bank(to_integer(unsigned(reg_file_address)));
                        when 4 => gpmc_data_o <= M_reg(to_integer(unsigned(reg_file_address)));
                        when 5 => gpmc_data_o <= N_reg;
                        when others => gpmc_data_o <= (others => '0');
                end case;
                --Check for write
                --Read data from the input port
                elsif (gpmc_n_we = '0') then
                    case to_integer(unsigned(reg_bank_address)) is
                        when 1 => triggers <= gpmc_data_i;
                        when 2 => bcd_int(to_integer(unsigned(reg_file_address))) <= gpmc_data_i;
                        when 3 => reg_bank(to_integer(unsigned(reg_file_address))) <= gpmc_data_i;
                        when 4 => M_reg(to_integer(unsigned(reg_file_address))) <= gpmc_data_i;
                        when 5 => N_reg <= gpmc_data_i;
                        when others => null;
                    end case;
                end if;
            end if;
        end if;
    end process gpmc_interface;

    -- Manage the tri-state bus
    gpmc_d      <= gpmc_data_o when (gpmc_n_oe = '0') else (others => 'Z');
    gpmc_data_i <= gpmc_d;

    ---------------------------------------------------------------------------
    -- GPIO
    ---------------------------------------------------------------------------

    trigger_in <= gpio_IN(0);
    clk_sel <= gpio_IN(1);
    gpio_OUT(2) <= '0';
    gpio_OUT(3) <= '0';
    gpio_OUT(4) <= '0';
    gpio_OUT(5) <= '0';
    gpio_OUT(6) <= '0';
    gpio_OUT(7) <= '0';
    gpio_OUT(8) <= '0';
    gpio_OUT(9) <= '0';
    gpio_OUT(10) <= '0';

    led_OUT(0) <= '0';
    led_OUT(1) <= '0';
    led_OUT(2) <= '0';
    led_OUT(3) <= '0';
    led_OUT(4) <= '0';
    led_OUT(5) <= '0';
    led_OUT(6) <= '0';
    led_OUT(7) <= '0';


    ---------------------------------------------------------------------------
    -- Chipscope core instantiation
    ---------------------------------------------------------------------------

    Inst_chipscope_icon: chipscope_icon PORT MAP(
        CONTROL0 => control
    );

    Inst_chipscope_ila: chipscope_ila PORT MAP(
        CONTROL => control,
        CLK => sys_clk,
        TRIG0 => threshold_out & global_counter & x"00000000" & "000"
    );
end rtl;
