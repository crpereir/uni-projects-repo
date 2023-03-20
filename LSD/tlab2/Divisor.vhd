LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Divisor is
port(W: in std_logic_vector (3 downto 0);
OP1: in std_logic;
AX: out std_logic_vector (3 downto 0)
);
end Divisor;

architecture arq_Divisor of Divisor is
begin 
AX(0) <= ((W(1) and OP1) or (W(0) and not OP1));
AX(1) <= ((W(2) and OP1) or (W(1) and not OP1));
AX(2) <= ((W(3) and OP1) or (W(2) and not OP1));
AX(3) <= ((W(3) and OP1) or (W(3) and not OP1));

end arq_Divisor;