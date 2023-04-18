

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity SLCDC is port ( 
      SDX : in std_logic;
      SCLK : in std_logic;
      MCLK : in std_logic;
      reset : in std_logic;
      not_SS : in std_logic;
		E : out std_logic;
      D : out std_logic_vector (3 downto 0); 
      RS : out std_logic
);

end SLCDC;

architecture arq of SLCDC is


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

component dispatcher is port (
		 dval : in std_logic;
	    din : in std_logic_vector (4 downto 0);
	    wrl : out std_logic;
	    dout : out std_logic_vector(4 downto 0);
		 done : out std_logic; 
		 clk : in std_logic;
		 reset : in std_logic
);

end component;


signal done_s, dval_s : std_logic;
signal d_s : std_logic_vector (3 downto 0);
signal din_s : std_logic_vector (4 downto 0);
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
		  busy => open
);

u_dispatcher: dispatcher port map (
		dval => dval_s,
		din => din_s,
		wrl => E,
		dout(0) => RS,
		dout(4) => D(3),
		dout(3) => D(2),
		dout(2) => D(1),
		dout(1) => D(0),
		done => done_s,
		clk => clk,
		reset => reset
);

u_clkdiv: clkdiv generic map (1000) port map (
	clk_in => MCLK,
	clk_out => clk
);
end arq;