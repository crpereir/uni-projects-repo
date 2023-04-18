-- adder test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity adder_tb is
end adder_tb;

architecture arq of adder_tb is

component adder 
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector(3 downto 0);
		Cout : out std_logic
);
end component;

--Inputs	
signal Cin : std_logic ;
signal A : std_logic_vector(3 downto 0);
signal B : std_logic_vector(3 downto 0);

--Outputs
signal S    : std_logic_vector(3	downto 0);
signal Cout : std_logic;
	
begin
UUT : adder	port map(
		A    => A,
		B 	  => B,
		Cin  => Cin,
		S    => S,
		Cout => Cout
		);
	
	
stimulus : process
begin
wait for 100 ns; 	
		
A   <= "1111";
B   <= "0000";
Cin <= '0';
wait for 10 ns;

A   <= "0000";
B   <= "1111";
Cin <= '0';
wait for 10 ns;

A   <= "1111";
B   <= "1111";
Cin <= '0';
wait for 10 ns;

A   <= "0000";
B   <= "0000";
Cin <= '1';
wait for 10 ns;

A   <= "1111";
B   <= "0000";
Cin <= '1';
wait for 10 ns;

A   <= "0000";
B   <= "1111";
Cin <= '1';
wait for 10 ns;

A   <= "1111";
B   <= "1111";
Cin <= '1';
wait for 10 ns;

end process;

end arq;
