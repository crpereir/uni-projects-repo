LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity RegistoDown is
	port( CLK: in std_logic;
	      CE : in STD_LOGIC;
			M : in STD_LOGIC_vector(3 downto 0);
			Q : out std_logic_vector(3 downto 0);
			reset: in std_logic
	);
end RegistoDown;

architecture arq_registodown of RegistoDown is

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
      EN  => CE,
		RESET => reset,
		SET => '0',
	   CLK => CLK,
		D => M(0),
		Q => Q(0));
		
UFFD1: FFD port map(
      EN  => CE,
		RESET => reset,
		SET => '0',
	   CLK => CLK,
		D => M(1),
		Q => Q(1));
		
UFFD2: FFD port map(
      EN  => CE,
		RESET => reset,
		SET => '0',
	   CLK => CLK,
		D => M(2),
		Q => Q(2));
		
UFFD3: FFD port map(
      EN  => CE,
		RESET => reset,
		SET => '0',
	   CLK => CLK,
		D => M(3),
		Q => Q(3));

end arq_registodown;