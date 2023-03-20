
-- decoder 

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity dec is 
	port (
		 S : in std_logic_vector(1 downto 0);
		 CL : out std_logic_vector(2 downto 0)
);
end dec;



architecture arq of dec is
begin

	CL(0) <= not S(0) and not S(1);
	CL(1) <= S(0) and not S(1);
	CL(2) <= not S(0) and S(1);
	
end arq;