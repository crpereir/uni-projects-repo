	
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity Door_Controller_tb is
end Door_Controller_tb;

architecture arq of Door_Controller_tb is

component door_controller is port (
	   dval : in std_logic;
		din: in std_logic_vector (4 downto 0);
		sopen:in std_logic;
		sclose : in std_logic;
		psensor: in std_logic;
		onoff: out std_logic;
		dout : out std_logic_vector (4 downto 0);
		done : out std_logic;
		reset : in std_logic;
		clk : in std_logic
);

end component;


constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;

signal dval_tb, sopen_tb, sclose_tb, psensor_tb, onoff_tb, done_tb : std_logic;
signal reset_tb, clk_tb : std_logic;
signal din_tb, dout_tb : std_logic_vector (4 downto 0);


begin
UUT : door_controller
port map(

      dval    => dval_tb,
		din     => din_tb,
		sopen   => sopen_tb,
		sclose  => sclose_tb,
		psensor => psensor_tb,
		onoff   => onoff_tb,
		dout    => dout_tb,
		done    => done_tb,
		reset   => reset_tb,
		clk     => clk_tb
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
dval_tb   <= '0';
din_tb    <= "00000";
sclose_tb <= '0';
sopen_tb  <= '0';
psensor_tb<= '0';
wait for MCLK_PERIOD;

reset_tb <= '0';
wait for MCLK_PERIOD;


---Abertura
dval_tb   <= '1';
din_tb    <= "11111";
wait for 20*MCLK_PERIOD;

sopen_tb  <= '1';
wait for 5*MCLK_PERIOD;

dval_tb   <= '0';
wait for 5*MCLK_PERIOD;


---Fecho sem pessoa
dval_tb   <= '1';
din_tb    <= "00000";
wait for 20*MCLK_PERIOD;

sclose_tb <= '1';
wait for 5*MCLK_PERIOD; 

dval_tb   <= '0';
wait for 5*MCLK_PERIOD;


---Fecho com pessoa
dval_tb   <= '1';
din_tb    <= "00000";
sclose_tb <= '0';
wait for 20*MCLK_PERIOD;

psensor_tb<= '1';
sopen_tb  <= '0';
wait for 20*MCLK_PERIOD;

sopen_tb  <= '1';
psensor_tb<= '0';
wait for 5*MCLK_PERIOD;

sclose_tb <= '1';
wait for 20*MCLK_PERIOD;

dval_tb   <='0';
wait for 5*MCLK_PERIOD;

wait;
end process;

end arq;