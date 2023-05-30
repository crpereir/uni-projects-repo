LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity MUX2x1 is 
	port (
        S : in std_logic;
        A : in std_logic_vector(3 downto 0);
        B : in std_logic_vector(3 downto 0);
		  Y : out std_logic_vector(3 downto 0)
		 
);
end MUX2x1;



architecture arq_MUX2x1 of MUX2x1 is
begin
	
Y(0) <= ( S and A(0)) or (not S and B(0));
Y(1) <= ( S and A(1)) or (not S and B(1));
Y(2) <= ( S and A(2)) or (not S and B(2));
Y(3) <= ( S and A(3)) or (not S and B(3));

end arq_MUX2x1;