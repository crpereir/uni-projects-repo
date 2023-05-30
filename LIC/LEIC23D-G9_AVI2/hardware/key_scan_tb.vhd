-- Key_scan test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity Key_scan_tb is
end Key_scan_tb;

architecture arq of Key_scan_tb is

component Key_scan is port(
			kscan : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			L : in std_logic_vector(3 downto 0);
			K : out std_logic_vector(3 downto 0);
			C : out std_logic_vector(2 downto 0);
			kpress : out std_logic
);
end component;
	
constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;
	
signal kscan_tb, clk_tb, reset_tb, kpress_tb : std_logic;
signal L_tb, K_tb : std_logic_vector(3 downto 0);
signal C_tb : std_logic_vector(2	downto 0);
	
begin
UUT : key_scan	port map(
		kscan => kscan_tb,
		clk => clk_tb,
		reset => reset_tb,
		L => L_tb,
		K => K_tb,
		C => C_tb,
		kpress => kpress_tb
);
	
clk_gen : process
begin
clk_tb <= '0';
wait for MCLK_HALF_PERIOD;
clk_tb <= '1';
wait for MCLK_HALF_PERIOD;
end process;
	
	
stimulus : process
begin
wait for MCLK_PERIOD;
reset_tb <= '1';	
		
wait for MCLK_PERIOD;
reset_tb <= '0';	
kscan_tb <= '1';
		
wait for MCLK_PERIOD;	
L_tb <= "1111";  -- valor forçado - todas as linhas desligadas
kscan_tb <= '1';
		
wait for MCLK_PERIOD;	
L_tb <= "1101";  -- valor forçado - 3 linha 3 coluna premida
kscan_tb <= '1'; -- para parar a contagem 	
		
wait;
		
end process;

end arq;
