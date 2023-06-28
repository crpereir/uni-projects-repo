LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity reg_tb is
end reg_tb;

architecture behavorial	of reg_tb is

component reg is
port (
		F : in std_logic_vector(3 downto 0);
		CE, reset : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector(3 downto 0)
		);
end component;

-- UUT signals
constant MCLK_PERIOD : time := 20 ns;
constant MCLK_HALF_PERIOD : time := MLCK_PERIOD / 2;

signal      F_tb :  std_logic_vector(3 downto 0);
signal		CE_tb :  std_logic; 
signal      reset_tb :  std_logic;
signal		clk_tb :  std_logic;
signal		Q_tb : std_logic_vector(3 downto 0);

begin

--Unit Under Test
UUT: reg
	port map(F     => F_tb,
				CE    => CE_tb,
				reset => reset_tb,
				clk   => clk_tb,
				Q     => Q_tb);
				
				
				
				
clk_gen : process
begin
		clk_tb <= '0';
		wait for MCLK_HALF_PERIOD;
		clk_tb <= '1';
		wait for MCLK_HALF_PERIOD;
		end process;

stimulus: process
begin
	--reset
	reset_tb <= '1';
	CE_tb    <= '1';

	wait for MCLK_PERIOD*1;

	reset_tb <= '0';
	F_tb     <= "0001";
	
	wait for MCLK_PERIOD*2;

	CE_tb 	<= '0';
	F_tb 		<= "0010";

	wait for MCLK_PERIOD*2;

	wait;
end process;
end behavorial;