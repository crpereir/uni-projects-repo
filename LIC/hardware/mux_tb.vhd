-- adder test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity mux_tb is
end mux_tb;

architecture arq of mux_tb is

component mux 
	port (
		A : in std_logic_vector(3 downto 0);
		S : in std_logic_vector(1 downto 0);
		Y : out std_logic
);
end component;

--Inputs	
signal A : std_logic_vector(3 downto 0);
signal S : std_logic_vector(1 downto 0);

--Outputs
signal Y : std_logic;
	
begin
UUT : mux	port map(
		A    => A,
		S 	  => S,
		Y => Y
		);
		
	
stimulus : process
begin
wait for 100 ns; 	
		
A   <= "1111";
S   <= "00";

wait for 10 ns;

A   <= "1110";
S   <= "00";

wait for 10 ns;

A   <= "1111";
S   <= "10";

wait for 10 ns;

A   <= "1101";
S   <= "01";

wait for 10 ns;

A   <= "1111";
S   <= "11";
wait for 10 ns;


end process;

end arq;