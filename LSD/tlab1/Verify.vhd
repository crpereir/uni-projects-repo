LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity Verify is
port(D: in std_logic_VECTOR(3 downto 0);
S : in std_logic_VECTOR(1 downto 0);
O : out STD_LOGIC
);
end Verify;
architecture arq_verify of verify is
begin
O <= (not S(0) and not S(1) and D(0)) or (S(0) and not S(1) and D(1)) or (not S(0) and S(1) and D(2)) or (S(0) and S(1) and D(3));
end arq_verify;