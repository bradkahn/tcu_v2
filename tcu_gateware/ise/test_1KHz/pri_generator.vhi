
-- VHDL Instantiation Created from source file pri_generator.vhd -- 13:02:47 02/23/2018
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_pri_generator: pri_generator PORT MAP(
		clk_IN => ,
		en_IN => ,
		rst_IN => ,
		threshold_OUT => ,
		pri_OUT => ,
		count_OUT => 
	);


