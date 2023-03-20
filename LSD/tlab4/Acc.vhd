LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity Acc is
	port( CLK: in std_logic;
	      Eacc : in STD_LOGIC;
			D : in STD_LOGIC_vector(6 downto 0);
			Rst: in std_logic;
			Q : out std_logic_vector(6 downto 0)
	);
end Acc;

architecture arq_acc of Acc is

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
      EN  => Eacc,
		RESET => Rst,
		SET => '0',
	   CLK => CLK,
		D => D(0),
		Q => Q(0));
		
UFFD1: FFD port map(
      EN  => Eacc,
		RESET => Rst,
		SET => '0',
	   CLK => CLK,
		D => D(1),
		Q => Q(1));
		
UFFD2: FFD port map(
      EN  => Eacc,
		RESET => Rst,
		SET => '0',
	   CLK => CLK,
		D => D(2),
		Q => Q(2));
		
UFFD3: FFD port map(
      EN  => Eacc,
		RESET => Rst,
		SET => '0',
	   CLK => CLK,
		D => D(3),
		Q => Q(3));
		
UFFD4: FFD port map(
      EN  => eacc,
		RESET => Rst,
		SET => '0',
	   CLK => CLK,
		D => D(4),
		Q => Q(4));
		
UFFD5: FFD port map(
      EN  => Eacc,
		RESET => Rst,
		SET => '0',
	   CLK => CLK,
		D => D(5),
		Q => Q(5));
		
UFFD6: FFD port map(
      EN  => Eacc,
		RESET => Rst,
		SET => '0',
	   CLK => CLK,
		D => D(6),
		Q => Q(6));

end arq_acc;