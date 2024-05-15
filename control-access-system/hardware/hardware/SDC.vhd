 
LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity SDC is port ( 
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

end SDC;

architecture arq of SDC is

component clkdiv is generic (div : natural := 25); 
	port (
		 clk_in : in std_logic;
		 clk_out : out std_logic
);
end component;

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



signal done_s, dval_s, on_off_s : std_logic;
signal d_s : std_logic_vector (3 downto 0);
signal din_s : std_logic_vector (4 downto 0);
signal busy_s : std_logic;
signal clk : std_logic;



begin
u_serial_receiver: serial_receiver port map(
        SDX => SDX,
        SCLK => SCLK,
        MCLK => MCLK,
        reset => reset,
        not_SS => not_SS,
        accept => done_s,
        D => din_s,
        DXval => dval_s,
		  busy => busy
);

u_door_controller: door_controller port map (
		dval => dval_s,
		din => din_s,
		dout(0) => open_close,
		dout(4) => V(3),
		dout(3) => V(2),
		dout(2) => V(1),
		dout(1) => V(0),
		done => done_s,
		reset => reset,
		sopen => sopen,
		sclose => sclose,
		psensor =>  psensor,
		clk => clk,
		onoff => onoff
);

u_clkdiv: clkdiv generic map (1000) port map (
	clk_in => MCLK,
	clk_out => clk
);


end arq;