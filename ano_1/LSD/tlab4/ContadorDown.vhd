LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity ContadorDown is
	port( m : in STD_LOGIC_VECTOR(3 downto 0);
			PL : in STD_LOGIC;
			reset : in STD_LOGIC;
			CE : in std_logic;
			CLK : in STD_LOGIC;
			TC: out std_logic
	);
end ContadorDown;

architecture arq_contadordown of ContadorDown is

component RegistoDown
	port (CLK: in std_logic;
	      CE : in STD_LOGIC;
			M : in STD_LOGIC_vector(3 downto 0);
			Q : out std_logic_vector(3 downto 0);
			reset: in std_logic
	);
end component;

component SomadorDown
	port (A : in STD_LOGIC_VECTOR(3 downto 0);
			B : in STD_LOGIC_VECTOR(3 downto 0);
			Cin: in STD_LOGIC;
			S : out STD_LOGIC_VECTOR(3 downto 0);
			Cout: out STD_LOGIC
	);
end component;

component CLKDIV
	port (clk_in: in std_logic;
		 clk_out: out std_logic
	);
end component;

component MuxDown
	port (D : in STD_LOGIC_VECTOR(3 downto 0);
			S : in STD_LOGIC_VECTOR(3 downto 0);
			PL : in std_logic;
			M : out STD_LOGIC_VECTOR(3 downto 0)
	);
end component;

signal sSom, sM, sQ: std_logic_vector(3 downto 0);

begin


UMuxDown: MuxDown port map(
      D  => m,
	   S => sSom,
		PL => PL,
		M => sM);
		
URegisto: RegistoDown port map(
      CE  => CE,
	   CLK => CLK,
		M => sM,
		Q => sQ,
		reset => reset);
		
USomador: SomadorDown port map(
      A  => sQ,
		Cin => '0',
		Cout => open,
	   B => "1111",
		S => sSom);

TC <= not sQ(0) and not sQ(1) and not sQ(2) and not sQ(3);
		

end arq_contadordown;
