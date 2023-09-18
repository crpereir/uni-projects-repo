
-- mux_MAC

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity mux_MAC is 
	port (
        S : in std_logic;
        A : in std_logic_vector(2 downto 0);
		  B : in std_logic_vector(2 downto 0);
        Y : out std_logic_vector(2 downto 0)
);
end mux_MAC;



architecture arq of mux_MAC is
begin
	
Y(0) <= ((not S and B(0)) or (S and A(0)));
Y(1) <= ((not S and B(1)) or (S and A(1)));
Y(2) <= ((not S and B(2)) or (S and A(2)));
	
end arq;