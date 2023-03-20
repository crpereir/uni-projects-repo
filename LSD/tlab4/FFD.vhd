LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FFD IS
PORT(	SCLK : in std_logic;
		RESET : in STD_LOGIC;
		SET : in std_logic;
		Sin : IN STD_LOGIC;
		enable : IN STD_LOGIC;
		D : out std_logic
		);
END FFD;

ARCHITECTURE logicFunction OF FFD IS

BEGIN


D <= '0' when RESET = '1' else '1' when SET = '1' else Sin WHEN rising_edge(clk) and enable = '1';


END LogicFunction;