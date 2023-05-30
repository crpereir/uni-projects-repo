
--counter 


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity mac_counter is 
	port (
		incGet : in std_logic;
		ce : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		Q : out std_logic_vector(3 downto 0)
);
end mac_counter;

architecture arq of mac_counter is

component reg 
	port (
		F : in std_logic_vector(3 downto 0);
		CE : in std_logic;
		CLK : in std_logic;
		reset : in std_logic;
		Q : out std_logic_vector(3 downto 0)
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

component MUX2x1 
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		S : in std_logic;
		Y : out std_logic_vector(3 downto 0)
		
		
);
end component;



signal s_counter, s_add : std_logic_vector(3 downto 0);
signal b_s : std_logic_vector (3 downto 0);
--signal s_add: std_logic_vector (2 downto 0);

	
begin

u_reg : reg port map(
		F => s_add,
		--F(0) => s_add(0),
		--F(1) => s_add(1),
		--F(2) => s_add(2),
		--F(3) => '0',
		clk => clk,
		CE => ce,
		Q => s_counter,
		reset => reset
);


u_adder : adder port map(
		A => s_counter,
		B => b_s,
		Cin => '0',
		Cout => open,
		S => s_add
);
u_mux : MUX2x1 port map(
		A => "1111",
		B => "0001",
		S => incGet,
		Y => b_s
);

Q <= s_counter;

end arq;