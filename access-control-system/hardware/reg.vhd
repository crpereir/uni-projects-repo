
-- Register (4 bit)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity reg is
port (
		F : in std_logic_vector(3 downto 0);
		CE, reset : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(3 downto 0)
	);
end reg;

architecture arq of reg is

component FFD
	port (
	   clk, D, EN, set, reset : in std_logic;
		Q : out std_logic
	);
end component;




begin
u_FFD0 : FFD port map (
		D => F(0),
		EN => CE,
		clk => clk,
		Q => Q(0),
		set => '0',
		reset => reset
);

u_FFD1 : FFD port map(
		D => F(1),
		EN => CE,
		clk => clk,
		Q => Q(1),
		set => '0',
		reset => reset
);

u_FFD2 : FFD port map(
		D => F(2),
		EN => CE,
		clk => clk,
		Q => Q(2),
		set => '0',
		reset => reset
);

u_FFD3 : FFD port map(
		D => F(3),
		EN => CE,
		clk => clk,
		Q => Q(3),
		set => '0',
		reset => reset
);

end arq;