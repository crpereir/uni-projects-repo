

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity serial_control_tb is
end serial_control_tb;

architecture arq of serial_control_tb is

component serial_control is port ( 
      enRx : in std_logic;
	   accept : in std_logic;
	   eq5 : in std_logic;
	   clr : out std_logic;
		wr : out std_logic;
		DXval : out std_logic;
		reset : in std_logic;
		clk : in std_logic
);
end component;

constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;

signal enRx_tb, accept_tb, eq5_tb, clr_tb, wr_tb : std_logic;
signal reset_tb, clk_tb : std_logic;
signal DXval_tb: std_logic;



begin
UUT : serial_control
port map(
	enRx => enRx_tb,
	accept => accept_tb,
	eq5 => eq5_tb,
	clr => clr_tb,
	reset => reset_tb,
	clk => clk_tb,
	wr => wr_tb,
	DXval => DXval_tb	
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


reset_tb <= '0';
wait for MCLK_PERIOD;

enRx_tb <= '1';
wait for MCLK_PERIOD;


enRx_tb <= '0';
wait for MCLK_PERIOD;


enRx_tb <= '0';
wait for MCLK_PERIOD;


enRx_tb <= '1';
eq5_tb <= '0';
wait for MCLK_PERIOD;


enRx_tb <= '1';
eq5_tb <= '1';
wait for MCLK_PERIOD;


eq5_tb <= '0';
wait for MCLK_PERIOD;


accept_tb <= '0';
wait for MCLK_PERIOD;

accept_tb <= '1';
wait for MCLK_PERIOD;

reset_tb <= '1';
wait for MCLK_PERIOD;

wait;
end process;

end arq;