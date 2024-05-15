LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity SDC_tb is
end SDC_tb;

architecture arq of SDC_tb is

component SDC is port (
      SDX : in std_logic;
      SCLK : in std_logic;
      MCLK : in std_logic;
      reset : in std_logic;
      not_SS : in std_logic;
		onoff : out std_logic;
      V : out std_logic_vector (3 downto 0); 
      open_close : out std_logic;
		sopen:in std_logic;
		sclose : in std_logic;
		psensor: in std_logic;
		busy: out std_logic
);

end component;


constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;

signal not_SS_tb, SCLK_tb, SDX_tb, sopen_tb, sclose_tb, psensor_tb, onoff_tb, busy_tb, open_close_tb : std_logic;
signal reset_tb, MCLK_tb : std_logic;
signal V_tb : std_logic_vector (3 downto 0);


begin
UUT : SDC
port map(

      SDX        => SDX_tb,
      SCLK       => SCLK_tb,
      MCLK       => MCLK_tb,
      reset      => reset_tb,
      not_SS     => not_SS_tb,
		onoff      => onoff_tb,
      V          => V_tb,
      open_close => open_close_tb,
		sopen      => sopen_tb,
		sclose     => sclose_tb,
		psensor    => psensor_tb,
		busy       => busy_tb
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

reset_tb  <= '1';
sclose_tb <= '0';
sopen_tb  <= '0';
psensor_tb<= '0';
not_SS_tb <= '1';
SDX_tb    <= '0';
SCLK_tb   <= '0';
wait for MCLK_PERIOD;

reset_tb  <= '0';
wait for MCLK_PERIOD;


---Abertura
not_SS_tb <= '0';
wait for 5*MCLK_PERIOD;


SDX_tb    <= '1';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;


SDX_tb    <= '0';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;


SDX_tb    <= '1';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;


SDX_tb    <= '0';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;


SDX_tb    <= '1';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;

not_SS_tb <= '1';
wait for 10*MCLK_PERIOD;

sopen_tb  <= '1';
wait for 10*MCLK_PERIOD;



---Fecho sem pessoa
not_SS_tb <= '0';
SDX_tb    <= '0';
wait for 5*MCLK_PERIOD;


SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SDX_tb    <= '1';
SCLK_tb   <= '0';
wait for MCLK_PERIOD;


SDX_tb    <= '0';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;


SDX_tb    <= '1';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;


SDX_tb    <= '0';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;


SDX_tb    <= '0';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;

not_SS_tb <='1';
wait for 10*MCLK_PERIOD;


sclose_tb <= '1';
wait for 10*MCLK_PERIOD; 




wait;
end process;

end arq;