-- Key_control test bench

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity Key_control_tb is
end Key_control_tb;

architecture arq of Key_control_tb is

component key_control is 
    port ( 
        clk : in std_logic;
		  reset : in std_logic;
        Kack : in std_logic;     
        Kpress : in std_logic;
        Kval : out std_logic;   
        Kscan : out std_logic
    );
end component;
	
constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;
	
signal clk_tb, reset_tb, kpress_tb, kack_tb, kval_tb, kscan_tb : std_logic;
	
begin
UUT : key_control	port map(
		clk => clk_tb,
		reset => reset_tb,
		Kack => kack_tb,
		Kpress => kpress_tb,
		Kval => kval_tb,
		Kscan => kscan_tb
		
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


wait for MCLK_PERIOD;
kpress_tb <= '0';	


wait for MCLK_PERIOD;
kpress_tb <= '1';	


wait for MCLK_PERIOD;
kack_tb <= '1';	


wait for MCLK_PERIOD;
kpress_tb <= '0';	


wait for MCLK_PERIOD;
kpress_tb <= '1';	


wait for MCLK_PERIOD;
kack_tb <= '1';	


wait for MCLK_PERIOD;
kpress_tb <= '0';	
wait;

end process;

end arq;












