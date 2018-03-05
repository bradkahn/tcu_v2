
-- VHDL Instantiation Created from source file tcu_registers.vhd -- 09:43:14 03/05/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT tcu_registers
	PORT(
		clk_IN : IN std_logic;
		rst_IN : IN std_logic;
		pulse_index_IN : IN std_logic_vector(4 downto 0);
		status_IN : IN std_logic_vector(15 downto 0);
		CLK_I : IN std_logic;
		RST_I : IN std_logic;
		STB_I : IN std_logic;
		WE_I : IN std_logic;
		DAT_I : IN std_logic_vector(15 downto 0);
		ADR_I : IN std_logic_vector(7 downto 0);          
		status_OUT : OUT std_logic_vector(15 downto 0);
		instruction_OUT : OUT std_logic_vector(15 downto 0);
		num_pulses_OUT : OUT std_logic_vector(15 downto 0);
		num_repeats_OUT : OUT std_logic_vector(31 downto 0);
		x_amp_delay_OUT : OUT std_logic_vector(15 downto 0);
		l_amp_delay_OUT : OUT std_logic_vector(15 downto 0);
		pri_pulse_width_OUT : OUT std_logic_vector(31 downto 0);
		pulse_params_OUT : OUT std_logic_vector(95 downto 0);
		ACK_O : OUT std_logic;
		DAT_O : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;

	Inst_tcu_registers: tcu_registers PORT MAP(
		clk_IN => ,
		rst_IN => ,
		pulse_index_IN => ,
		status_IN => ,
		status_OUT => ,
		instruction_OUT => ,
		num_pulses_OUT => ,
		num_repeats_OUT => ,
		x_amp_delay_OUT => ,
		l_amp_delay_OUT => ,
		pri_pulse_width_OUT => ,
		pulse_params_OUT => ,
		CLK_I => ,
		RST_I => ,
		STB_I => ,
		WE_I => ,
		DAT_I => ,
		ADR_I => ,
		ACK_O => ,
		DAT_O => 
	);


