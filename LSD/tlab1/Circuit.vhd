LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Circuit is

port(I : in STD_LOGIC_VECTOR(3 downto 0);
sel : in STD_LOGIC_VECTOR(1 downto 0);
R : out STD_LOGIC
);
end Circuit;

architecture arq_circuit of Circuit is


component Dt
port (A : in STD_LOGIC_VECTOR(3 downto 0);
D : out STD_LOGIC_VECTOR(3 downto 0)
);
end component;


component Verify
port(D : in STD_LOGIC_VECTOR(3 downto 0);
S : in std_logic_VECTOR(1 downto 0);
O : out STD_LOGIC
);
end component;


SIGNAL Da : STD_LOGIC_VECTOR(3 downto 0);
BEGIN
UDt: Dt port map (
A => I,
D => Da
);
 
UVerify: Verify port map (
D => Da,
S => sel,
O => R
);
end arq_Circuit;