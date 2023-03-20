LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Dt is
port(A: in std_logic_VECTOR(3 downto 0);
D: out std_logic_VECTOR(3 downto 0)
);
end Dt;

architecture arq_dt of Dt is
begin
D(0) <= (A(1) and A(3)) or (A(0) and A(2) and not A(3)) or (not A(0) and not A(1) and not A(2) and not A(3));
D(1) <= (A(0) and not A(2)) or (not A(1) and A(2) and A(3)) or (A(1) and not A(2) and A(3));
D(2) <= (A(1) and not A(2) and not A(3)) or (not A(0) and not A(1) and A(2)) or (not A(0) and A(2) and not A(3)) or (A(0) and not A(1) and not A(2) and A(3));
D(3) <= (not A(0) and not A(1) and not A(2)) or (not A(0) and not A(1) and not A(3)) or (not A(0) and A(1) and A(2) and A(3));

end arq_dt;