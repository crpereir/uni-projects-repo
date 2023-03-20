LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Circuit is

port(AY,B : in STD_LOGIC_VECTOR(3 downto 0);
Opalu : in STD_LOGIC;
R: out STD_LOGIC_VECTOR (3 downto 0);
CB, OV: out STD_LOGIC
);
end Circuit;

architecture arq_circuit of Circuit is



component Somador
port(A, B: in STD_LOGIC_VECTOR (3 downto 0);
Cin: in STD_LOGIC;
R: out STD_LOGIC_VECTOR (3 downto 0);
Cout: out STD_LOGIC
);
end component;

component Flags1
port(A, B, C, OP, R : in STD_LOGIC;
Overflow, CyBw: out std_logic
);
end component;

SIGNAL Cout, Cin, C, CyBw  : STD_LOGIC;
signal Rx, Bx : STD_LOGIC_VECTOR (3 downto 0);


BEGIN

R <= Rx;

Bx(0) <= B(0) xor Opalu;
Bx(1) <= B(1) xor Opalu;
Bx(2) <= B(2) xor Opalu;
Bx(3) <= B(3) xor Opalu;



USomador: Somador port map (
A => AY,
B => Bx,
Cin => Opalu,
Cout => Cout,
R => Rx
);
 
UFlags1: Flags1 port map (
A => AY(3),
B => Bx(3),
C => Cout,
OP => Opalu,
R => Rx(3),
Overflow => OV,
CyBw => CB
);
end arq_Circuit;
