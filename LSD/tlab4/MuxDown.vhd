LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity MuxDown is
	port( D : in STD_LOGIC_VECTOR(3 downto 0);
			S : in STD_LOGIC_VECTOR(3 downto 0);
			PL : in std_logic;
			M : out STD_LOGIC_VECTOR(3 downto 0)
	);
end MuxDown;

architecture arq_muxdown of MuxDown is

begin
M(0) <= (PL and D(0)) or (not PL and S(0));
M(1) <= (PL and D(1)) or (not PL and S(1));
M(2) <= (PL and D(2)) or (not PL and S(2));
M(3) <= (PL and D(3)) or (not PL and S(3));
end arq_muxdown;