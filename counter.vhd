library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity counter_top is
port
(
    -- FPGA-processor interface pins
    gpmc_a          : in    std_logic_vector(10 downto 1);
    gpmc_d          : inout std_logic_vector(15 downto 0);
    gpmc_clk_i      : in    std_logic;
    gpmc_n_cs       : in    std_logic_vector(6 downto 0);
    gpmc_n_we       : in    std_logic;
    gpmc_n_oe       : in    std_logic;
    gpmc_n_adv_ale  : in    std_logic;

    -- GPIO, LED and CLOCK pins
    gpio            : out   std_logic_vector(15 downto 2);
    gpioIn          : in    std_logic_vector(1 downto 0);
    -- gpio_fmc        : out   std_logic_vector(15 downto 0);
    led             : out   std_logic_vector(7 downto 0);
    -- led_fmc         : out   std_logic_vector(3 downto 0);
    -- sys_clk_P       : in    std_logic; -- 100MHz system clock
    -- sys_clk_N       : in    std_logic; -- 100MHz system clock
    sys_clk_ext     : in    std_logic -- External Clock
);
end counter_top;

-------------------------------------------------------------------------------
-- Architecture of counter
-------------------------------------------------------------------------------

architecture rtl of counter_top is
    ---------------------------------------------------------------------------
    -- Declare types
    ---------------------------------------------------------------------------

    type ram_type       is array (255 downto 0) of std_logic_vector(15 downto 0);
    type word32_type    is array (1 downto 0)   of std_logic_vector(15 downto 0);

    ---------------------------------------------------------------------------
    -- Declare signals
    ---------------------------------------------------------------------------

    -- Define signals for the gpmc bus
    signal gpmc_clk_i_b         : std_logic;                                        -- buffered gpmc_clk_i
    signal gpmc_address         : std_logic_vector(25 downto 0):=(others => '0');   -- Full de-multiplexed address bus (ref. 16 bits)
    signal gpmc_data_o          : std_logic_vector(15 downto 0):=(others => '0');   -- Register for output bus value
    signal gpmc_data_i          : std_logic_vector(15 downto 0):=(others => '0');   -- Register for input bus value

    signal sys_clk_100MHz       : std_logic;                                        -- driven by one of the above signal

    constant VERSION        : std_logic_vector(7 downto 0) := "00000010";       -- TODO: add VERSION register to symbol file to identify which TCU version is installed
    signal reg_bank         : ram_type := (others => "1111111111111111");       -- pulses reg, stores pulse parameters
    signal led_reg          : std_logic_vector(15 downto 0) := (others => '0'); -- lower 8 bits mapped to RHINO's LEDs for status indication
    signal bcd_int          : word32_type := (x"0000",x"0000");
    signal M_reg            : word32_type := (x"0000",x"0000");                 -- number of times each pulse must be cycled in an experiment
    signal M_reg_cmp        : std_logic_vector(31 downto 0);                    -- M_reg_cmp <= M_reg(1) & M_reg(0)
    signal N_reg            : std_logic_vector(15 downto 0) := x"0000";         -- number of unique pulses (N)

    signal ready            : std_logic;                                        -- indicates that experiment is ready to start, asserted when trigger(0) and gpioIn(0) are high

    signal MBsig            : std_logic;                                        -- indicates when Main Bang offset has been reached, mapped to GPIO output pin 2, 8
    signal Dsig             : std_logic;                                        -- indicates when Digitisation offset has been reached, mapped to GPIO output pin 3, 9
    signal Psig             : std_logic;                                        -- indicates when Next PRI offset has been reached, mapped to GPIO output pin 4, 10

    signal M_counter        : unsigned(31 downto 0) := x"00000000";             -- Number of repeats that have already ocurred

    signal MBoffset         : unsigned(15 downto 0) := x"0000";                 -- Main bang offset extracted from pulses reg
    signal MBcounter        : unsigned(15 downto 0) := x"0000";                 -- Main bang counter compared to Main bang offset
    signal DIGoffset        : unsigned(15 downto 0) := x"0000";                 -- Digitisation offset extracted from pulses reg
    signal DIGcounter       : unsigned(15 downto 0) := x"0000";                 -- Digitisation counter compared to Digitisation offset
    signal PRIoffset        : unsigned(31 downto 0) := x"00000000";             -- PRI offset extracted from pulses reg
    signal PRIcounter       : unsigned(31 downto 0) := x"00000000";             -- PRI counter compared to PRI offset

    signal triggers         : std_logic_vector(15 downto 0) := (others => '0'); -- triggers(0) 'soft on' / arming bit from register
    signal status_reg       : std_logic_vector(15 downto 0) := (others => '0'); -- status_reg(0) used to indicate that all pulse repeats for experiment are completed

    signal pulse_index      : unsigned(7 downto 0)  := x"00";                   -- Program Counter keeps track of current pulse
    signal dataout          : std_logic_vector(95 downto 0);                    -- Contains all pulse parameters for current pulse

    -- ALIASES
    -- Support 64 memory banks, each with a maximum of 2MW
     ALIAS reg_bank_address : std_logic_vector(3 downto 0) IS gpmc_address(25 downto 22);
     -- Currently each register is 64 x 16
     ALIAS reg_file_address : std_logic_vector(7 downto 0) IS gpmc_address(7 downto 0);

    type pri_state_type is (IDLE, RUNNING);
    signal pri_state                : pri_state_type := IDLE;

    signal soft_arm             : std_logic := '0';             -- from internal TCU register
    signal trigger              : std_logic := '0';             -- from GPSDO

    signal pri_heartbeat        : std_logic := '0';             -- to Pentek

    -- COMPONENT clk_wiz_v3_6
    -- PORT(
    --     CLK_IN : IN std_logic;
    --     CLK_400MHz_OUT : OUT std_logic;
    --     CLK_100MHz_OUT : OUT std_logic;
    --     CLK_10MHz_OUT : OUT std_logic
    --     );
    -- END COMPONENT;

    signal pri_trigger : std_logic := '0';
    signal counter : unsigned(31 downto 0) := (others=>'0');
    signal pri_duration : unsigned(31 downto 0) := (others=>'0');
    signal pri_duration_half : unsigned(31 downto 0) := (others=>'0');
    -- signal counter : natural range 0 to 50_000 := 0;

    signal go_pri: std_logic := '0';
    signal pulse_index_int : integer range 0 to 255 := 0;

    signal sys_clk_10MHz : std_logic := '0';
    signal sys_clk_400MHz: std_logic := '0';
    signal clk_out: std_logic := '0';
    signal count_sel: std_logic := '0';

    signal prescaler : unsigned(31 downto 0) := (others=>'0');
--==========================
begin --architecture RTL
--==========================

    ---------------------------------------------------------------------------
    -- Instantiate input buffer for FPGA_PROC_BUS_CLK
    ---------------------------------------------------------------------------

    IBUFG_gpmc_clk_i : IBUFG
    generic map
    (
        IBUF_LOW_PWR => FALSE,
        IOSTANDARD   => "DEFAULT"
    )
    port map
    (
        I => gpmc_clk_i,
        O => gpmc_clk_i_b
    );

    ---------------------------------------------------------------------------
    -- Diff input clockl buffer, for 100MHz clock (for UART and Ethernet)
    ---------------------------------------------------------------------------

    -- IBUFGDS_sys_clk: IBUFGDS
    -- generic map
    -- (
    --     IOSTANDARD   => "LVDS_25",
    --     DIFF_TERM    => TRUE,
    --     IBUF_LOW_PWR => FALSE
    -- )
    -- port map
    -- (
    --     I  => sys_clk_P,
    --     IB => sys_clk_N,
    --     O  => sys_clk_100MHz_int
    -- );

    ---------------------------------------------------------------------------
    -- Input clock buffer, for EXTERNAL 100MHz clock
    ---------------------------------------------------------------------------
    IBUFG_tcu_clk : IBUFG
    generic map
    (
        IBUF_LOW_PWR => FALSE
        --    IOSTANDARD => "LVCMOS25"
    )
    port map
    (
        I => sys_clk_ext,
        O => sys_clk_100MHz
    );

    -- Inst_clk_wiz_v3_6: clk_wiz_v3_6 PORT MAP(
    --     CLK_IN => sys_clk_ext,
    --     CLK_400MHz_OUT => sys_clk_400MHz,
    --     CLK_100MHz_OUT => sys_clk_100MHz,
    --     CLK_10MHz_OUT => sys_clk_10MHz
    -- );

    ---------------------------------------------------------------------------
    -- Misc signal wiring
    ---------------------------------------------------------------------------

    led <= led_reg(7 downto 0);

    --=====================================--
    -- GPMC interface
    --=====================================--

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

    ---------------------------------------------------------------------------
    -- Manage the tri-state bus
    ---------------------------------------------------------------------------
    gpmc_d      <= gpmc_data_o when (gpmc_n_oe = '0') else (others => 'Z');
    gpmc_data_i <= gpmc_d;

    -- -- M_reg_cmp is used when comparing with the counter
    M_reg_cmp(31 downto 16) <= M_reg(1);
    M_reg_cmp(15 downto 0)  <=  M_reg(0);

    ------------------------------------------------------------------------------
    --  TCU STATE MACHINE
    -------------------------------------------------------------------------------
    -- -- populate dataout from regbank based on Program Counter (pulse_index)
    dataout     <= reg_bank(pulse_index_int) & reg_bank(pulse_index_int+1) & reg_bank(pulse_index_int+2) & reg_bank(pulse_index_int+3) & reg_bank(pulse_index_int+4) & reg_bank(pulse_index_int+5);
    MBoffset    <= unsigned(reg_bank(pulse_index_int));
    DIGoffset   <= unsigned(reg_bank(pulse_index_int+1));
    PRIoffset   <= unsigned(reg_bank(pulse_index_int+2)) & unsigned(reg_bank(pulse_index_int+5));
    -- pol_mode    <= reg_bank(pulse_index_int+4)(2 downto 0);
    pulse_index_int <= to_integer(unsigned(pulse_index));



  pri_duration <= (MBoffset + DIGoffset + PRIoffset);
  pri_duration_half <= shift_right(pri_duration, 1);
--   CounterWithTriggerPulse : process (sys_clk_100MHz) is
--     begin
--
--     if rising_edge(sys_clk_100MHz) then
--        if go_pri = '1' then
--           if counter = pri_duration_half then
--           -- if counter = 50000 then
--               pri_heartbeat <= not pri_heartbeat;
--               counter<=(others=>'0');
--           else
--             counter<=counter+x"00000001";
--           end if;
--        end if;
--     end if;
--
-- end process CounterWithTriggerPulse;

NCO : process(sys_clk_100MHz)
begin
  if go_pri = '1' then
    if rising_edge(sys_clk_100MHz) then
      if count_sel = '0' then
        counter <= counter + x"0000a7c6";
      else
        counter <= counter + x"00014f8b";
      end if;
    end if;
  end if;
end process;
pri_heartbeat <= counter(counter'left);



led_reg(0) <= '1' when pri_duration_half = x"0000c350" else '0';

pri_fsm : process(sys_clk_100MHz)
begin
  if rising_edge(sys_clk_100MHz) then
    case( pri_state ) is

      when IDLE =>
        if pri_trigger = '1' then
          pri_state <= RUNNING;
        else
          pri_state <= IDLE;
        end if;

      when RUNNING =>
        go_pri <= '1';
        -- TODO: get an 'end' signal to stop the counter,
        -- have another counter being clocked by the pri_heartbeat signal,
        -- compare that value to mxn?
        pri_state <= RUNNING;

      when OTHERS =>
        pri_state <= IDLE;
    end case;
  end if;
end process;

    soft_arm    <= triggers(0); -- from internal TCU register

    led_reg(1)  <= '1' when count_sel = '1' else '0';
    led_reg(2)  <= '1';
    led_reg(3)  <= '1';
    led_reg(4)  <= '0';
    led_reg(5)  <= '0';
    led_reg(6)  <= '0';
    -- led_reg(7)  <= '0';


    pri_trigger <= trigger;
    trigger     <= gpioIn(0);
    count_sel<= '1' when gpioIn(1) = '1' else '0';
    -- clk_sel     <= '0';
    gpio(2)     <= pri_heartbeat;
    gpio(3)     <= pri_heartbeat;
    gpio(4)     <= pri_heartbeat;
    gpio(5)     <= pri_heartbeat;
    gpio(6)     <= pri_heartbeat;
    gpio(7)     <= pri_heartbeat;
    gpio(8)     <= pri_heartbeat;
    gpio(9)     <= pri_heartbeat;
    gpio(10)    <= pri_heartbeat;
    gpio(11)    <= pri_heartbeat;
    gpio(12)    <= pri_heartbeat;
    gpio(13)    <= pri_heartbeat;
    -- gpio(14)    <= '0';
    gpio(15)    <= pri_heartbeat;

      process (sys_clk_100MHz)

      begin
          if rising_edge(sys_clk_100MHz) then
              if prescaler = x"0000c350" then
                  clk_out <= not clk_out;
                  prescaler<=(others=>'0');
              else
              prescaler<=prescaler+x"00000001";
              end if;
          end if;
      end process;
      gpio(14)<=clk_out;
end rtl;
