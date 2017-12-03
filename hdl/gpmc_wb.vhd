-------------------------------------------------------------------------------
-- NAME:        gpmc_wb.vhd
-- DESCRIPTION: interace between RHINO's ARM CPU and Spartan FPGA
-- AUTHOR:      Brad Kahn
-- DATE:        30/11/2017
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

ENTITY gpmc_wb IS
GENERIC	(
    WB_DATA_BUS_WIDTH    : POSITIVE    := 16;
    WB_ADDRESS_BUS_WIDTH : NATURAL     := 8;
    WB_NUMBER_OF_SLAVES  : POSITIVE    := 1
    );
PORT (
    -- ------------------------------------------------------------------------
    -- GPMC PORTS
    -- ------------------------------------------------------------------------
    gpmc_a          : IN    STD_LOGIC_VECTOR(10 DOWNTO 1);
    gpmc_d          : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    gpmc_clk_i      : IN    STD_LOGIC;
    gpmc_n_cs       : IN    STD_LOGIC_VECTOR(6 DOWNTO 0);
    gpmc_n_we       : IN    STD_LOGIC;
    gpmc_n_oe       : IN    STD_LOGIC;
    gpmc_n_adv_ale  : IN    STD_LOGIC;

    -- ------------------------------------------------------------------------
    -- Clock PORTS
    -- ------------------------------------------------------------------------
    sys_clk_P       : IN    STD_LOGIC;
    sys_clk_N       : IN    STD_LOGIC;
    CLK_400MHz      : OUT   STD_LOGIC;
    CLK_100MHz      : OUT   STD_LOGIC;
    gpmc_clk        : OUT   STD_LOGIC;

    -- ------------------------------------------------------------------------
    -- DEBUG PORTS
    -- ------------------------------------------------------------------------
    debug_port      : OUT   STD_LOGIC_VECTOR((68 + WB_NUMBER_OF_SLAVES) - 1 DOWNTO 0);

    -- ------------------------------------------------------------------------
    -- WISHBONE SYSCON PORTS
    -- ------------------------------------------------------------------------
    CLK             : OUT   STD_LOGIC;
    RST             : OUT   STD_LOGIC;

    -- ------------------------------------------------------------------------
    -- WISHBONE MASTER INTERFACE PORTS
    -- ------------------------------------------------------------------------
    ACK_I           : IN    STD_LOGIC;
    ADR_O           : OUT   STD_LOGIC_VECTOR(WB_ADDRESS_BUS_WIDTH - 1 DOWNTO 0);
    DAT_I           : IN    STD_LOGIC_VECTOR(WB_DATA_BUS_WIDTH - 1 DOWNTO 0);
    DAT_O           : OUT   STD_LOGIC_VECTOR(WB_DATA_BUS_WIDTH - 1 DOWNTO 0);
    WE_O            : OUT   STD_LOGIC;

    -- ------------------------------------------------------------------------
    -- SLAVE SELECT PORTS
    -- ------------------------------------------------------------------------
    tcu_sel      : OUT   STD_LOGIC
    );
END gpmc_wb;

ARCHITECTURE behavioral OF gpmc_wb IS

-- ----------------------------------------------------------------------------
-- SLAVE SELECT ADDRESS CONSTANTS
-- ----------------------------------------------------------------------------
    -- tcu
    CONSTANT SLAVE_0_START      : INTEGER := 0;
    CONSTANT SLAVE_0_END        : INTEGER := 199;

-- ----------------------------------------------------------------------------
-- SIGNAL DECLARATIONS
-- ----------------------------------------------------------------------------
    -- GPMC bus
    SIGNAL gpmc_clk_i_b         : STD_LOGIC := '0';
    SIGNAL gpmc_address         : STD_LOGIC_VECTOR(25 DOWNTO 0) := (OTHERS => '0');
    SIGNAL gpmc_data_o          : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL gpmc_data_i          : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');

    -- Clocks
    SIGNAL sys_clk_100MHz       : STD_LOGIC := '0';
    SIGNAL fast_clk_400MHz      : STD_LOGIC := '0';
    SIGNAL clk_200MHz           : STD_LOGIC := '0';

    -- Genaral purpose input/output
    SIGNAL gpio_signal          : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');

    -- WISHBONE syscon
    SIGNAL wb_rst_sig           : STD_LOGIC := '0';
    SIGNAL wb_clk_sig           : STD_LOGIC := '0';
    SIGNAL wb_clk_en            : STD_LOGIC := '0';

    -- WISHBONE state machine flags
    SIGNAL wb_write_req         : STD_LOGIC := '0';
    SIGNAL wb_write             : STD_LOGIC := '0';
    SIGNAL wb_write_end         : STD_LOGIC := '0';
    SIGNAL wb_read_req          : STD_LOGIC := '0';
    SIGNAL wb_read              : STD_LOGIC := '0';
    SIGNAL wb_read_end          : STD_LOGIC := '0';

    -- WISHBONE master/slave
    SIGNAL slave_select_sig     : STD_LOGIC_VECTOR(WB_NUMBER_OF_SLAVES - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL reg_adr_o_sig        : STD_LOGIC_VECTOR(32 - 1 DOWNTO 0) := (OTHERS => '0');

    SIGNAL wb_stb_o_sig         : STD_LOGIC := '0';
    SIGNAL we_o_sig             : STD_LOGIC := '0';
    SIGNAL adr_o_sig            : STD_LOGIC_VECTOR(25 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dat_o_sig            : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dat_i_sig            : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ack_i_sig            : STD_LOGIC := '0';

-- ----------------------------------------------------------------------------
-- STATE TYPES DECLARATION FOR WB FSM
-- ----------------------------------------------------------------------------

TYPE state_type IS (IDLE_STATE, WB_WRITE_STATE, WB_READ_STATE);
SIGNAL state : state_type := IDLE_STATE; -- Initialize state to IDLE_STATE

-- ----------------------------------------------------------------------------
-- Declare clocking wizard
-- ----------------------------------------------------------------------------
    -- note:    using clocking wizard component found in signal generator example
    --          this differs from the one generated by gpmc_wb generator, which
    --          has clock feedback lines
    COMPONENT clk_wiz_v3_6_gpmc_wb
    PORT(
        CLK_IN1 : IN std_logic;
        CLK_OUT1 : OUT std_logic;
        CLK_OUT2 : OUT std_logic
        );
    END COMPONENT;

BEGIN

------------------------------------------------------------------------------------
  -- Instantiate clocking wizard to generate 400MHz
  -----------------------------------------------------------------------------------

  Inst_clk_wiz_v3_6_gpmc_wb: clk_wiz_v3_6_gpmc_wb PORT MAP(
  	CLK_IN1 	=> sys_clk_100MHz,
  	CLK_OUT1	=> fast_clk_400MHz,
    CLK_OUT2	=> clk_200MHz
  );

    CLK_400MHz <= fast_clk_400MHz;
  ------------------------------------------------------------------------------------
  -- Instantiate input buffer for FPGA_PROC_BUS_CLK
  ------------------------------------------------------------------------------------

  IBUFG_gpmc_clk_i : IBUFG
  generic map
  (
  	IBUF_LOW_PWR 	=> FALSE,
  	IOSTANDARD 		=> "DEFAULT"
  )
  port map
  (
  	I => gpmc_clk_i,
  	O => gpmc_clk_i_b
  );

-- ----------------------------------------------------------------------------
-- Instantiate differential input clockl buffer, for 100MHz clock
-- ----------------------------------------------------------------------------

    IBUFGDS_sys_clk: IBUFGDS
    generic map
    (
    IOSTANDARD => "LVDS_25",
    DIFF_TERM => TRUE,
    IBUF_LOW_PWR => FALSE
    )
    port map
    (
    I => sys_clk_P,
    IB => sys_clk_N,
    O => sys_clk_100MHz
    );

    CLK_100MHz <= sys_clk_100MHz; -- clock to the clk divider, needed this because can only have sys_clk_P & sys_clk_N drive 1 IBUFGDS in the project.
    wb_clk_sig <= clk_200MHz; -- WISHBONE CLK is fed by clk_200MHz ( >> faster than gpmc_clk (~80MHz))
    wb_rst_sig <= '0';

-- ----------------------------------------------------------------------------
-- GPMC FSM
-- ----------------------------------------------------------------------------

    process (gpmc_clk_i_b,gpmc_n_cs,gpmc_n_oe,gpmc_n_we,gpmc_n_adv_ale,gpmc_d,gpmc_a)
    begin
    if (gpmc_n_cs /= "1111111")  then
    if gpmc_clk_i_b'event and gpmc_clk_i_b = '1' then
    --First cycle of the bus transaction record the address
    --RECORD THE ADDRESS
    if (gpmc_n_adv_ale = '0') then
    adr_o_sig 		<= gpmc_a & gpmc_d;
    wb_write_req 	<= '0';
    wb_read_req  	<= '0';
    --Second cycle of the bus is read or write
    --CHECK FOR READ
    elsif (gpmc_n_oe = '0') then
    wb_read_req		<= '1';
    wb_write_req 	<= '0';
    --CHECK FOR WRITE
    elsif (gpmc_n_we = '0') then
    wb_write_req 	<= '1';
    wb_read_req  	<= '0';
    --OTHER CONDITION
    else
    wb_write_req <= '0';
    wb_read_req <= '0';
    end if;
    end if;
    else
    wb_write_req <= '0';
    wb_read_req <= '0';
    end if;
    end process;

-- ----------------------------------------------------------------------------
-- WISHBONE FSM
-- ----------------------------------------------------------------------------

    process(wb_clk_sig)
    variable cycle_counter : unsigned (2 downto 0) := "000";
    begin
        if rising_edge ( wb_clk_sig ) then
            case( state ) is
                -- TODO: Make use of the ACK_I signal
                when IDLE_STATE =>
                    wb_clk_en <= '0';
                    cycle_counter := "000";
                    if wb_write = '1' then
                    	state <= WB_WRITE_STATE;
                    elsif wb_read = '1' then
                    	state <= WB_READ_STATE;
                    else
                    	state <= IDLE_STATE;
                    end if;
                    dat_o_sig       <= (others => 'Z');
                    wb_stb_o_sig    <= '0';
                    we_o_sig        <= '0';
                    if wb_write_req = '0' then
                    	wb_write_end   <= '0';
                    end if;
                    if wb_read_req = '0' then
                    	wb_read_end	   <= '0';
                    end if;

                when WB_WRITE_STATE =>
                    wb_clk_en       <= '1';
                    dat_o_sig       <= gpmc_data_i;
                    wb_stb_o_sig    <= '1';
                    we_o_sig        <= '1';
                    if cycle_counter < 2 then
                    	state <= WB_WRITE_STATE;
                    else
                    	state <= IDLE_STATE;
                    	wb_write_end   <= '1';
                    end if;
                    	cycle_counter  := cycle_counter + 1;

                when WB_READ_STATE =>
                    wb_clk_en       <= '1';
                    gpmc_data_o     <= dat_i_sig;
                    wb_stb_o_sig    <= '1';
                    we_o_sig        <= '0';
                    if cycle_counter < 2 then
                    	state  <= WB_READ_STATE;
                    else
                    	state  <= IDLE_STATE;
                    	wb_read_end <= '1';
                    end if;
                    	cycle_counter := cycle_counter + 1;

                when others =>
                    wb_clk_en <= '0';
                    state <= IDLE_STATE;

            end case;
        end if;
    end process;

    RST		<= wb_rst_sig;
    --    wb_clk_en <='1';


    -- BUFGCE: Global Clock Buffer with Clock Enable
    BUFGCE_inst : BUFGCE
    port map (
        O => CLK,             -- 1-bit output: Clock buffer output
        CE => wb_clk_en,      -- 1-bit input: Clock buffer select
        I => wb_clk_sig       -- 1-bit input: Clock buffer input (S=0)
    );


--	CLK		<= wb_clk_sig 	when wb_clk_en = '1' else '0';

    WE_O 	<= we_o_sig;
    DAT_O <= dat_o_sig;
    ADR_O <= reg_adr_o_sig(WB_ADDRESS_BUS_WIDTH - 1 downto 0);
    dat_i_sig <= DAT_I;
    -- These signals are used to ensure that a WB write/read occurs only once.
    -- The _req lines are driven in the slower GPMC 'FSM', while the _end lines
    -- are driven in the faster WB 'FSM'
    wb_write	<= wb_write_req	and (not wb_write_end);
    wb_read		<= wb_read_req 	and (not wb_read_end);

-- ----------------------------------------------------------------------------
-- SLAVE SELECT DECODING
-- ----------------------------------------------------------------------------

    slave_select_decoding : process (adr_o_sig, wb_stb_o_sig)
        variable address_int : integer := 0;
    begin
        address_int := to_integer(unsigned(adr_o_sig));
        if wb_stb_o_sig = '1' then
            case(address_int) is
                when SLAVE_0_START to SLAVE_0_END =>
                    slave_select_sig    <= "1";
                    reg_adr_o_sig       <= std_logic_vector(to_unsigned((address_int - SLAVE_0_START), 32));
                when others =>
                    slave_select_sig    <= (others => '0');
                    reg_adr_o_sig       <= (others => '0');
            end case;
        else
            slave_select_sig <= (others => '0');
        end if;
    end process;

    tcu_sel        <= slave_select_sig(0);

-- ----------------------------------------------------------------------------
-- Manage the tri-state bus
-- ----------------------------------------------------------------------------

    gpmc_d <= gpmc_data_o when (gpmc_n_oe = '0') else (others => 'Z');
    gpmc_data_i <= gpmc_d;
    gpmc_clk <= gpmc_clk_i_b;
    debug_port <=  DAT_I & (wb_clk_sig and wb_clk_en) & wb_rst_sig & we_o_sig & dat_o_sig & wb_write_req & wb_write & wb_write_end & wb_read_req & wb_read & wb_read_end & slave_select_sig & wb_stb_o_sig & adr_o_sig(25 downto 0);
    --debug_port <= (others => '0');
END behavioral;
