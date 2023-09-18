
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity counter_tb is
end counter_tb;

architecture arq of counter_tb is

component counter is port (
	ce : in std_logic;
	clk : in std_logic;
	Q : out std_logic_vector(3 downto 0);
	reset : in std_logic
);
end component;

constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;


signal ce_tb, clk_tb, reset_tb : std_logic;
signal q_tb : std_logic_vector;

begin
UUT : counter port map(
		ce => ce_tb,
		clk => clk_tb,
		Q => q_tb,
		reset => reset_tb
	);

clk_gen : process begin
clk_tb <= '0';
wait for MCLK_HALF_PERIOD;
clk_tb <= '1';
wait for MCLK_HALF_PERIOD;
end process;

stimulus : process begin
wait for MCLK_PERIOD;

ce_tb <= '0';
wait for MCLK_PERIOD * 5;

wait;
end process;

end arq;