LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Somador is

port(A, B: in STD_LOGIC_VECTOR (3 downto 0);
Cin: in STD_LOGIC;
R: out STD_LOGIC_VECTOR (3 downto 0);
Cout: out STD_LOGIC
);
end Somador;

architecture arq_somador of Somador is


component FULLADDER
port (A, B: in STD_LOGIC;
Cin: in STD_LOGIC;
R: out STD_LOGIC;
Cout: out STD_LOGIC
);
end component;


SIGNAL  C1, C2, C3: STD_LOGIC;
BEGIN
UFULLADDER: FULLADDER port map (
A => A(0),
B => B(0),
Cin => Cin,
Cout => C1,
R => R(0)
);

UFULLADDER1: FULLADDER port map (
A => A(1),
B => B(1),
Cin => C1,
Cout => C2,
R => R(1)
);

UFULLADDER2: FULLADDER port map (
A => A(2),
B => B(2),
Cin => C2,
Cout => C3,
R => R(2)
);

UFULLADDER3: FULLADDER port map (
A => A(3),
B => B(3),
Cin => C3,
Cout => Cout,
R => R(3)

);
end arq_Somador;