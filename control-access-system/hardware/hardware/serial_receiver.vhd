
--serial receiver

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity serial_receiver is port ( 
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
	 
end serial_receiver;
	
architecture arq of serial_receiver is

component shift_register is port ( 
		data: in std_logic;
		clk : in std_logic;
		enable : in std_logic;
		D: out std_logic_vector (4 downto 0);
		reset : in std_logic
		  
);
end component;



component counter is port (
		reset : in std_logic;
		ce : in std_logic;
		clk : in std_logic;
		Q : out std_logic_vector (3 downto 0)
	
);
end component;



component serial_control is port (
	   enRx : in std_logic;
	   accept : in std_logic;
	   eq5 : in std_logic;
	   clr : out std_logic;
		wr : out std_logic;
		DXval : out std_logic;
		reset : in std_logic;
		clk : in std_logic;
		busy : out std_logic
	);
end component;

component FFD is port (
		clk : in std_logic;
		reset : in std_logic;
		set : in std_logic;
		D : in std_logic;
		EN : in std_logic;
		Q : out std_logic
);
end component;	


signal s_wr, s_clr, c5_s, enRx, SCLK_s  : std_logic;
signal d_s: std_logic_vector (3 downto 0);



begin
u_counter : counter port map (
		clk => SCLK,
		ce => '1',
		reset => s_clr,
		Q(3) => d_s(3),
		Q(2) => d_s(2),
		Q(1) => d_s(1),
		Q(0) => d_s(0)
);
	

u_shift_register: shift_register port map(
		data => SDX,
		clk => SCLK,
		enable => s_wr,
		D => D,
		reset => reset
);	
	
	
	
u_serial_control: serial_control port map (
		enRx => not_SS,
		accept => accept,
		clr => s_clr,
		wr => s_wr,
		eq5 => c5_s,
		DXval => DXval,
		clk => MCLK,
		reset => reset,
		busy => busy
);


c5_s <= (d_s(0) and not d_s(1) and d_s(2));


end arq;	