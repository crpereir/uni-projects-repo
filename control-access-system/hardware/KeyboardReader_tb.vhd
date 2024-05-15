LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity KeyboardReader_tb is
end KeyboardReader_tb;

architecture arq of KeyboardReader_tb is

component keyboard_reader is 
   	port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
		  Kack : out std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);    -- colunas
        Q : out std_logic_vector (3 downto 0);
		  Dval: out std_logic
    );
end component;
	
constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;
	
signal Mclk_tb, reset_tb, Dval_tb, Kack_tb : std_logic;
signal Lines_tb, Q_tb: std_logic_vector (3 downto 0);
signal Columns_tb: std_logic_vector (2 downto 0);
	
	
	
begin
UUT : keyboard_reader	port map(
		reset => reset_tb,
		Mclk => Mclk_tb,
		Kack => Kack_tb,
		Lines => Lines_tb,
		Columns => Columns_tb,
		Q => Q_tb,
		Dval => Dval_tb
		
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
reset_tb <= '1';
Kack_tb  <= '0';	
Lines_tb <= "1111";

		
wait for MCLK_PERIOD;
reset_tb <= '0';	


wait for MCLK_PERIOD;
Lines_tb <= "0101";	



wait for MCLK_PERIOD;	
Lines_tb <= "1111";

wait for MCLK_PERIOD;	


wait;

end process;

end arq;
