
--counter 


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity counter is 
	port (
		ce : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(3 downto 0);
		reset : in std_logic
);
end counter;

architecture arq of counter is

component reg 
	port (
		F : in std_logic_vector(3 downto 0);
		CE : in std_logic;
		CLK : in std_logic;
		Q : out std_logic_vector(3 downto 0);
		reset : in std_logic
);
end component;


component adder 
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector(3 downto 0);
		Cout : out std_logic
		
);
end component;


signal s_add, s_counter : std_logic_vector(3 downto 0);

	
begin

Q <= s_counter;

u_reg : reg port map(
		F => s_add,
		clk => clk,
		CE => ce,
		Q => s_counter,
		reset => reset
);


u_adder : adder port map(
		A => s_counter,
		B => "0000",
		Cin => '1',
		Cout => open,
		S => s_add
);

end arq;