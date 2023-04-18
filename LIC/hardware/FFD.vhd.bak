
-- Flip Flop D
-- tem a ver com o registos 



LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity FFD is port (
		clk : in std_logic;
		reset : in std_logic;
		set : in std_logic;
		D : in std_logic;
		EN : in std_logic;
		Q : out std_logic
	);
end FFD;

architecture arq of FFD is

begin
	Q <= '0' when reset = '1' else
		  '1' when set = '1' else
		   D when rising_edge(clk) AND EN = '1';
end arq;