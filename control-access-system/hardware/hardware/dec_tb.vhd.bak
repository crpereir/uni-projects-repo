-- adder test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity decoder_tb is
end decoder_tb;

architecture arq of decoder_tb is

component decoder 
	port (
		S : in std_logic_vector(1 downto 0);
		CL : out std_logic_vector(2 downto 0)
);	
end component;

--Inputs	
signal S    : std_logic_vector(1	downto 0);

--Outputs

signal CL    : std_logic_vector(2	downto 0);
	
begin
UUT : decoder port map(
		S   => S,
		CL  => CL
		);
	
	
stimulus : process
begin
wait for 100 ns; 	
		
S   <= "0011";

wait for 10 ns;

S   <= "0100";

wait for 10 ns;

S   <= "1011";

wait for 10 ns;

S   <= "1100";

wait for 10 ns;

S   <= "1111";

wait for 10 ns;



end process;

end arq;
