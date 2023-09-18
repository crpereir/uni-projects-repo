LIBRARY IEEE;
use IEEE.std_logic_1164.all;

entity FULLADDER is
	port (A : in STD_LOGIC;
			B : in STD_LOGIC;
			Cin: in STD_LOGIC;
			S : out STD_LOGIC;
			Cout: out STD_LOGIC
	);
end FULLADDER;

architecture arq_fullAdder of FULLADDER is

begin 

S <= A xor B xor Cin;
Cout <= (A and B) or (Cin and (A xor B));

end arq_fullAdder;