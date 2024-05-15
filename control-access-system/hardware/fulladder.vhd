


-- Full adder

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity fulladder is
	port (
		A : in std_logic;
		B : in std_logic;
		Cin : in std_logic; -- previous Cout
		S : out std_logic;
		Cout : out std_logic
	);
end fulladder;

architecture arq of fulladder is
begin
	S <= (A xor B) xor Cin;
	Cout <= (A and B) or (Cin and (A xor B));
end arq;