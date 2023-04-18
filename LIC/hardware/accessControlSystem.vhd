-- bloco access control system

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;

entity accessControlSystem is
	port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);    -- colunas
		  rs: out std_logic;
		  en: out std_logic;
		  data: out std_logic_vector (7 downto 4);
		  D: out std_logic_vector (3 downto 0); 
		  V: out std_logic_vector (3 downto 0);
		  leds: out std_logic_vector (5 downto 0);
		  sopen : in std_logic;
		  sclose : in std_logic;
		  psensor : in std_logic;
		  openclose : out std_logic;
		  onoff : out std_logic
		  
    );
	 
end accessControlSystem;
	
architecture arq of accessControlSystem is

component keyboard_reader is 
    port ( 
        Mclk : in std_logic;
		  reset : in std_logic;
        Kack : in std_logic;
		  Lines : in std_logic_vector (3 downto 0);     -- linhas
        Columns : out std_logic_vector (2 downto 0);   -- colunas
        Q : out std_logic_vector (3 downto 0);
		  Dval: out std_logic
		  
    );	  
end component;



component SLCDC is port ( 
      SDX : in std_logic;
      SCLK : in std_logic;
      MCLK : in std_logic;
      reset : in std_logic;
      not_SS : in std_logic;
		E : out std_logic;
      D : out std_logic_vector (3 downto 0); 
      RS : out std_logic
);
	 
end component;



component UsbPort is port (
		inputPort:  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		outputPort :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end component;



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
		psensor: in std_logic
);
end component;



signal Kack_s, Dval_s, accept_s, d_s: std_logic;
signal rt_s, wr_s: std_logic;
signal SDX_s,SCLK_s,not_SS_s : std_logic;
signal rs_s, e_s, open_close_s : std_logic;
signal Q_s : std_logic_vector(3 downto 0);
signal di_s, oi_s: std_logic_vector (3 downto 0);
signal dd_s, vv_s : std_logic_vector (3 downto 0);
--signal onoff_s: std_logic;
signal openclose_s : std_logic;

begin

u_keyboard_reader: keyboard_reader port map( 
		Kack => Kack_s,
		Lines => Lines,
		Columns => Columns,
		reset => reset,
		Mclk => Mclk,
		Q => Q_s,
		Dval =>  Dval_s
);
		
u_SLCDC:SLCDC port map(
		SDX => SDX_s,
      SCLK => SCLK_s,
      MCLK => Mclk,
      reset => reset,
      not_SS => not_SS_s,
      D => dd_s,
		RS => rs_s,
		E => e_s
);

u_UsbPort: UsbPort port map(
		inputPort(0) => Dval_s,
		inputPort(4 downto 1) => Q_s, 
		inputPort(5) => '0',
		inputPort(6) => '0',
		inputPort(7) => '0',
		outputPort(0) => Kack_s,
		outputPort(1) => SDX_s,
		outputPort(2) => not_SS_s,
		outputPort(3) => SCLK_s,
		outputPort(4) => data(4)
);	
	
u_SDC: SDC port map(
		SDX => SDX_s,
      SCLK => SCLK_s,
      MCLK => Mclk,
      reset => reset,
      not_SS => not_SS_s,
		onoff => onoff,
      V => vv_s ,
      open_close => open_close_s,
		sopen => sopen,
		sclose => sclose,
		psensor => psensor
);
	
	
	
 D <= dd_s;
 RS <= rs_s;
 en <= e_s;
 V <= vv_s;
 --onoff <= onoff_s;
 openclose <= open_close_s;
 leds(3 downto 0) <= dd_s;
 leds(4) <= rs_s;
 leds(5) <= e_s; 
 
 
end arq;