LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity Output_Buffer_tb is
end Output_Buffer_tb;

architecture arq of Output_Buffer_tb is

component outputbuffer is port (
      Load	 : in std_logic;
	   ACK	 : in std_logic;
		D		 : in std_logic_vector  (3 downto 0);
	   Q      : out std_logic_vector (3 downto 0);
		OBfree : out std_logic;
		Dval	 : out std_logic;
		clk	 : in std_logic;
		reset  : in std_logic
);

end component;


constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;

signal Load_tb, ACK_tb, Wreg_tb, OBfree_tb, Dval_tb : std_logic;
signal reset_tb, clk_tb : std_logic;
signal D_tb, Q_tb : std_logic_vector (3 downto 0);


begin
UUT : outputbuffer
port map(

    	Load	 => Load_tb,
	   ACK	 => ACK_tb,
		OBfree => OBfree_tb,
		Dval	 => Dval_tb,
		clk	 => clk_tb,
		reset	 => reset_tb,
		D      => D_tb,
		Q      => Q_tb
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


reset_tb  <= '1';
Load_tb   <= '0';
ACK_tb    <= '1';
D_tb      <= "0000";
wait for MCLK_PERIOD;

reset_tb <= '0';
wait for MCLK_PERIOD;


Load_tb   <= '1';
wait for 5*MCLK_PERIOD;

-------------dúvida-------------------

D_tb      <= "1111";
wait for MCLK_PERIOD;

D_tb      <= "0000";
wait for MCLK_PERIOD;

D_tb      <= "1111";
wait for MCLK_PERIOD;

D_tb      <= "0000";
wait for MCLK_PERIOD;

--------------------------------------

Load_tb  <= '0';
wait for 5*MCLK_PERIOD;

ACK_tb   <= '1';
wait for 5*MCLK_PERIOD;

ACK_tb   <= '0';
wait for 5*MCLK_PERIOD;

wait;
end process;

end arq;