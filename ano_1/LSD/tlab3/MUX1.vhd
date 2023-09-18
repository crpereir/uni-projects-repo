LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity MUX1 is
port(Tempo, two : in std_logic_VECTOR (3 downto 0);
S : in std_logic;
Q : out std_logic_vector (3 downto 0)
);
end MUX1;

architecture arq_MUX1 of MUX1 is
begin
Q(0) <= ((Tempo(0) and S) or (two(0) and (not S)));
Q(1) <= ((Tempo(1) and S) or (two(1) and (not S)));
Q(2) <= ((Tempo(2) and S) or (two(2) and (not S)));
Q(3) <= ((Tempo(3) and S) or (two(3) and (not S)));
end arq_MUX1;