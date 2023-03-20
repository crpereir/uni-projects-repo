LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity ModuloLogica is
port(A, B : in std_logic_vector (3 downto 0);
OP0, OP1 : in std_logic;
Q : out std_logic_vector (3 downto 0)
);
end ModuloLogica;

architecture arq_ModuloLogica of ModuloLogica is
begin
Q(0) <= (((A(0) and B(0)) and ((not OP0) and  (not OP1))) or ((A(0) or B(0)) and (( OP0) and not OP1))or ((A(0) xor B(0))and (not OP0 and (OP1))) or ((not A(0)) and (OP0 and OP1)));
Q(1) <= (((A(1) and B(1)) and ((not OP0) and  (not OP1))) or ((A(1) or B(1)) and (( OP0) and  not OP1))or ((A(1) xor B(1))and ( not OP0 and (OP1))) or ((not A(1)) and (OP0 and OP1)));
Q(2) <= (((A(2) and B(2)) and ((not OP0) and  (not OP1))) or ((A(2) or B(2)) and (( OP0) and  not OP1))or ((A(2) xor B(2))and ( not OP0 and (OP1))) or ((not A(2)) and (OP0 and OP1)));
Q(3) <= (((A(3) and B(3)) and ((not OP0) and  (not OP1))) or ((A(3) or B(3)) and (( OP0) and  not OP1))or ((A(3) xor B(3))and ( not OP0 and (OP1))) or ((not A(3)) and (OP0 and OP1)));
end arq_ModuloLogica;