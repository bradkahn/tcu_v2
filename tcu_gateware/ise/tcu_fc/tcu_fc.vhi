
-- VHDL Instantiation Created from source file tcu_fc.vhd -- 09:43:22 03/05/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT tcu_fc
	PORT(
		clk_IN : IN std_logic;
		rst_IN : IN std_logic;
		trigger_IN : IN std_logic;
		instruction_IN : IN std_logic_vector(15 downto 0);
		num_pulses_IN : IN std_logic_vector(15 downto 0);
		num_repeats_IN : IN std_logic_vector(31 downto 0);
		x_amp_delay_IN : IN std_logic_vector(15 downto 0);
		l_amp_delay_IN : IN std_logic_vector(15 downto 0);
		pri_pulse_width_IN : IN std_logic_vector(31 downto 0);
		pulse_params_IN : IN std_logic_vector(95 downto 0);          
		pulse_index_OUT : OUT std_logic_vector(4 downto 0);
		status_OUT : OUT std_logic_vector(15 downto 0);
		bias_x_OUT : OUT std_logic;
		bias_l_OUT : OUT std_logic;
		pol_tx_x_OUT : OUT std_logic;
		pol_tx_l_OUT : OUT std_logic;
		pol_rx_l_OUT : OUT std_logic;
		pri_OUT : OUT std_logic
		);
	END COMPONENT;

	Inst_tcu_fc: tcu_fc PORT MAP(
		clk_IN => ,
		rst_IN => ,
		trigger_IN => ,
		instruction_IN => ,
		num_pulses_IN => ,
		num_repeats_IN => ,
		x_amp_delay_IN => ,
		l_amp_delay_IN => ,
		pri_pulse_width_IN => ,
		pulse_params_IN => ,
		pulse_index_OUT => ,
		status_OUT => ,
		bias_x_OUT => ,
		bias_l_OUT => ,
		pol_tx_x_OUT => ,
		pol_tx_l_OUT => ,
		pol_rx_l_OUT => ,
		pri_OUT => 
	);


