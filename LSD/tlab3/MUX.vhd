LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity MUX is
port(R, Q : in std_logic_VECTOR (3 downto 0);
S : in std_logic;
F : out std_logic_vector (3 downto 0)
);
end MUX;

architecture arq_MUX of MUX is
begin
F(0) <= ((R(0) and S) or (Q(0) and (not S)));
F(1) <= ((R(1) and S) or (Q(1) and (not S)));
F(2) <= ((R(2) and S) or (Q(2) and (not S)));
F(3) <= ((R(3) and S) or (Q(3) and (not S)));
end arq_MUX;