
-- mux 

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity mux is 
	port (
        S : in std_logic_vector(1 downto 0);
        A : in std_logic_vector(3 downto 0);
        Y : out std_logic
);
end mux;



architecture arq of mux is
begin
	
Y <= ((not S(0) and not S(1) and A(0)) or 
		(S(0) and not S(1) and A(1)) or 
		(not S(0) and S(1) and A(2)) or 
		(S(0) and S(1) and A(3)));
	
end arq;