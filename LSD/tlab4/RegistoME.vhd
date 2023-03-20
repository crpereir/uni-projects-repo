LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity RegistoME is
	port( D : in STD_LOGIC_vector(1 downto 0);	
			CLK : in STD_LOGIC;
			Reset : in STD_LOGIC;
			Q : out STD_LOGIC_vector(1 downto 0)
	);
end RegistoME;

architecture arq_registome of RegistoME is

component FFD
	port (CLK : in std_logic;
		RESET : in STD_LOGIC;
		SET : in std_logic;
		D : IN STD_LOGIC;
		EN : IN STD_LOGIC;
		Q : out std_logic
	);
end component;

begin

UFFD0: FFD port map(
	   RESET => Reset,
		CLK => CLK,
		SET => '0',
		EN => '1',
		D => D(0),
		Q => Q(0));
		
		
UFFD1: FFD port map(
	   RESET => Reset,
		CLK => CLK,
		SET => '0',
		EN => '1',
		D => D(1),
		Q => Q(1));
		
end arq_registome;