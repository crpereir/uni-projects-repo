LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity Key_decode_tb is
end Key_decode_tb;

architecture arq of Key_decode_tb is

component key_decode is 
    port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
        Kack : out std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);    -- colunas
        K : out std_logic_vector (3 downto 0);
		  Kval: out std_logic
    );
end component;
	
constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;
	
signal Mclk_tb, reset_tb, kack_tb, kval_tb : std_logic;
signal Lines_tb, K_tb: std_logic_vector (3 downto 0);
signal Columns_tb: std_logic_vector (2 downto 0);
	
	
	
begin
UUT : key_decode	port map(
		reset => reset_tb,
		Mclk => Mclk_tb,
		Kack => kack_tb,
		Lines => Lines_tb,
		Columns => Columns_tb,
		K => K_tb,
		Kval => Kval_tb
		
);


clk_gen : process
begin
Mclk_tb <= '0';
wait for MCLK_HALF_PERIOD;
Mclk_tb <= '1';
wait for MCLK_HALF_PERIOD;
end process;
	

	
stimulus : process
begin
wait for MCLK_PERIOD*2;
kack_tb <= '0';
reset_tb <= '1';	
Lines_tb <= "1111";

		
wait for MCLK_PERIOD;
reset_tb <= '0';	


wait for MCLK_PERIOD;
Lines_tb <= "0101";	



wait for MCLK_PERIOD;
kack_tb <= '1';	
Lines_tb <= "1111";

wait for MCLK_PERIOD;
kack_tb <= '0';	


wait;

end process;

end arq;
