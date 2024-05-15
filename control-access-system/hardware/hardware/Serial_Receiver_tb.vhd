LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity Serial_Receiver_tb is
end Serial_Receiver_tb;

architecture arq of Serial_Receiver_tb is

component serial_receiver is port (
		SDX : in std_logic;
      SCLK : in std_logic;
		MCLK : in std_logic;
		reset : in std_logic;
		not_SS : in std_logic;
		accept : in std_logic;
      D : out std_logic_vector (4 downto 0); 
      DXval : out std_logic;
		busy : out std_logic
);

end component;


constant MCLK_PERIOD : TIME := 20 ns;
constant MCLK_HALF_PERIOD : TIME := MCLK_PERIOD / 2;

signal not_SS_tb, SCLK_tb, SDX_tb, busy_tb, accept_tb, DXval_tb : std_logic;
signal reset_tb, MCLK_tb : std_logic;
signal D_tb : std_logic_vector (4 downto 0);


begin
UUT : serial_receiver
port map(

      SDX        => SDX_tb,
      SCLK       => SCLK_tb,
      MCLK       => MCLK_tb,
      reset      => reset_tb,
      not_SS     => not_SS_tb,
      D          => D_tb,
		busy       => busy_tb,
		accept     => accept_tb,
		DXval      => DXval_tb
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
accept_tb <= '0';
not_SS_tb <= '1';
SDX_tb    <= '0';
SCLK_tb   <= '0';
wait for 5*MCLK_PERIOD;

reset_tb  <= '0';
wait for 5*MCLK_PERIOD;



---SDX a começar a 0 (CLOSE)

not_SS_tb <= '0';
wait for 5*MCLK_PERIOD;


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


SDX_tb    <= '0';
SCLK_tb   <= '1';
wait for MCLK_PERIOD;

SCLK_tb   <= '0';
wait for MCLK_PERIOD;

not_SS_tb <='1';

accept_tb <= '1';
wait for 5*MCLK_PERIOD;

accept_tb <= '0';
wait for 5*MCLK_PERIOD;


---SDX a começar a 1 (OPEN)

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
wait for 5*MCLK_PERIOD;

accept_tb <= '1';
wait for 5*MCLK_PERIOD;

accept_tb <= '0';
wait for 5*MCLK_PERIOD;





wait;
end process;

end arq;