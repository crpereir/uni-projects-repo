LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Flags1 is
port(A, B, C, OP, R : in STD_LOGIC;
Overflow, CyBw: out std_logic
);
end Flags1;


architecture arq_Flags1 of Flags1 is
begin
Overflow <= ((not A) and (not B) and R) or (A and B and not R);
CyBw <= OP xor C;
end arq_Flags1;