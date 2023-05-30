LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity Ring_Buffer_tb is
end Ring_Buffer_tb;

architecture arq of Ring_Buffer_tb is

component ringbuffer is port (
		D : in std_logic_vector (3 downto 0);
		DAV : in std_logic;
		CTS : in std_logic;
		Q : out std_logic_vector (3 downto 0);
		Wreg : out std_logic;
		DAC : out std_logic;
		clk: in std_logic;
		reset: in std_logic
);

end component;


constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;

signal DAV_tb, CTS_tb, Wreg_tb, DAC_tb, clk_tb : std_logic;
signal reset_tb, MCLK_tb : std_logic;
signal D_tb, Q_tb : std_logic_vector (3 downto 0);


begin
UUT : ringbuffer
port map(

      DAV        => DAV_tb,
      CTS        => CTS_tb,
      reset      => reset_tb,
      Wreg       => Wreg_tb,
      D          => D_tb,
		DAC        => DAC_tb,
		Q          => Q_tb,
		clk        => clk_tb
);



clk_gen : process
begin
MCLK_tb <= '0';
wait for MCLK_HALF_PERIOD;
MCLK_tb <= '1';
wait for MCLK_HALF_PERIOD;
end process;

stimulus : process
begin

D_tb      <= "00000";
DAV_tb    <= '0';
reset_tb  <= '1';
clk_tb    <= '0';
wait for 5*MCLK_PERIOD;

reset_tb  <= '0';
wait for 5*MCLK_PERIOD;


DAV_tb    <= '1';
wait for 5*MCLK_PERIOD;

--------------------------------

D_tb      <= "1111";
wait for MCLK_PERIOD;

D_tb      <= "0000";
wait for MCLK_PERIOD;

D_tb      <= "1111";
wait for MCLK_PERIOD;

D_tb      <= "0000";
wait for MCLK_PERIOD;

---------------------------------

DAV_tb    <= '0';
wait for 5*MCLK_PERIOD;


CTS_tb    <= '0';
wait for 5*MCLK_PERIOD;

CTS_tb    <= '1';
wait for 5*MCLK_PERIOD;


wait;
end process;

end arq;