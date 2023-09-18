LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity FLAGS is
port(CB, Overflow: in STD_LOGIC;
F: in STD_LOGIC_VECTOR (3 downto 0);
CyBw, OV, Z, P, GE: out STD_LOGIC

);
end FLAGS;


architecture arq_FLAGS of FLAGS is
begin
OV <= Overflow;
CyBw <= CB;
P <= (F(0) xor F(1) xor F(2) xor F(3));
Z <= (not (F(3) or F(2) or F(1) or F(0)));
GE <= not (F(3) xor Overflow);
end arq_FLAGS;