LIBRARY IEEE;
use IEEE.std_logic_1164.all;
entity FULLADDER is
port(A, B, Cin: in std_logic;
R, Cout : out std_logic
);
end FULLADDER;

architecture arq_FULLADDER of FULLADDER is
begin
R <= A xor B xor Cin;
Cout <= (A and B) or (Cin and (A xor B));

end arq_FULLADDER;