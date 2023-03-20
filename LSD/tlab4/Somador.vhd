LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity Somador is
	port (A : in STD_LOGIC_VECTOR(6 downto 0);
			B : in STD_LOGIC_VECTOR(6 downto 0);
			Cin: in STD_LOGIC;
			S : out STD_LOGIC_VECTOR(6 downto 0);
			Cout: out STD_LOGIC
	);
end Somador;

architecture arq_somador of Somador is

component FULLADDER
	port (A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin: in STD_LOGIC;
			S : out STD_LOGIC;
			Cout: out STD_LOGIC
);
end component;
SIGNAL C1, C2, C3, C4, C5, C6: std_logic;

begin

UFULLADDER0: FULLADDER port map (
		A => A(0),
		B => B(0),
		Cin => Cin,
		S => S(0),
		Cout => C1
);
		
UFULLADDER1: FULLADDER port map (
		A => A(1),
		B => B(1),
		Cin => C1,
		S => S(1),
		Cout => C2 
);
		
UFULLADDER2: FULLADDER port map (
		A => A(2),
		B => B(2),
		Cin => C2,
		S => S(2),
		Cout => C3
);
		
UFULLADDER3: FULLADDER port map (
		A => A(3),
		B => B(3),
		Cin => C3,
		S => S(3),
		Cout => C4 );
		
UFULLADDER4: FULLADDER port map (
		A => A(4),
		B => B(4),
		Cin => C4,
		S => S(4),
		Cout => C5 
);
		
UFULLADDER5: FULLADDER port map (
		A => A(5),
		B => B(5),
		Cin => C5,
		S => S(5),
		Cout => C6 
);
		
UFULLADDER6: FULLADDER port map (
		A => A(6),
		B => B(6),
		Cin => C6,
		S => S(6),
		Cout => Cout 
);
		
end arq_somador;